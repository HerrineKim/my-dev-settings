#!/usr/bin/env python3
"""Collect one day's Claude Code activity and GitHub activity as JSON.

Usage: collect.py [--date YYYY-MM-DD] [--since HH:MM] [--config PATH]

Window: 00:00 of --date (or --since, when appending to an existing note) up to the
moment the script runs. Re-running later the same day with --since set to the previous
run's time yields only the new activity, so the note can be appended without duplicates.

--since takes either HH:MM (all machines) or name=HH:MM,name=HH:MM (per machine); machines not
named start at 00:00. The git/GitHub window starts at the earliest of those.

Sources
  - Claude Code transcripts: ~/.claude/projects/**/*.jsonl (this machine)
  - Other machines' transcripts: <shared_dir>/<machine>/projects/**/*.jsonl, mirrored there by
    sync_transcripts.py running as a hook on each machine (iCloud Drive by default)
  - Local git: commits in every repo a Claude session on this machine ran in that day
  - GitHub: your public+private events (pushes, PRs, reviews, issues) via `gh`
Only the Python standard library is used, so it runs on any stock macOS.
"""
import argparse
import json
import subprocess
import sys
import time
from datetime import date, datetime, timedelta
from pathlib import Path

from daily_log_common import CLAUDE_DIR, load_config, machine_name, shared_dir

PROMPT_MAX = 400
SKIP_PREFIXES = ("<", "Base directory for this skill", "Caveat:", "[Request interrupted")


def run(cmd, cwd=None):
    try:
        out = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True, timeout=60)
        return out.stdout if out.returncode == 0 else None
    except (OSError, subprocess.TimeoutExpired):
        return None


def local_tz():
    return datetime.now().astimezone().tzinfo


def parse_ts(s):
    try:
        return datetime.fromisoformat(s.replace("Z", "+00:00")).astimezone(local_tz())
    except (AttributeError, ValueError):
        return None


def in_window(ts, window):
    return ts is not None and window[0] <= ts < window[1]


def user_text(entry):
    """Return the human-typed prompt in a user entry, or None for tool results / injected text."""
    if entry.get("isMeta") or entry.get("isSidechain"):
        return None
    content = (entry.get("message") or {}).get("content")
    if isinstance(content, str):
        parts = [content]
    elif isinstance(content, list):
        # The desktop app sends injected <system-reminder> blocks alongside the typed prompt.
        parts = [c.get("text", "") for c in content if isinstance(c, dict) and c.get("type") == "text"]
    else:
        return None
    parts = [p.strip() for p in parts if p.strip() and not p.strip().startswith(SKIP_PREFIXES)]
    return "\n".join(parts)[:PROMPT_MAX] or None


def collect_claude(window, root, machine):
    """Sessions under root/projects/<project>/<session>.jsonl that have activity in window, tagged with machine."""
    sessions = {}
    titles = {}
    root = root / "projects"
    if not root.exists():
        return []
    start = window[0]
    for path in root.glob("*/*.jsonl"):  # top-level sessions only; subagent logs live deeper
        try:
            if datetime.fromtimestamp(path.stat().st_mtime, local_tz()) < start:
                continue
            lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
        except OSError:
            continue
        for line in lines:
            try:
                e = json.loads(line)
            except json.JSONDecodeError:
                continue
            sid = e.get("sessionId") or path.stem
            if e.get("type") == "custom-title":
                titles[sid] = e.get("customTitle")
                continue
            if e.get("type") == "ai-title":
                titles.setdefault(sid, e.get("aiTitle"))
                continue
            ts = parse_ts(e.get("timestamp"))
            if not in_window(ts, window):
                continue
            s = sessions.setdefault(sid, {
                "session_id": sid, "machine": machine, "cwd": e.get("cwd"), "branch": e.get("gitBranch"),
                "entrypoint": e.get("entrypoint"), "start": ts, "end": ts,
                "prompts": [], "files_changed": set(), "tool_calls": 0, "last_reply": None,
            })
            s["start"], s["end"] = min(s["start"], ts), max(s["end"], ts)
            s["cwd"] = s["cwd"] or e.get("cwd")
            s["branch"] = e.get("gitBranch") or s["branch"]
            att = e.get("attachment") or {}
            if e.get("type") == "attachment" and att.get("type") == "queued_command" and att.get("humanTurn"):
                # Messages typed while Claude was mid-turn are stored as attachments, not user entries.
                t = att.get("prompt") if isinstance(att.get("prompt"), str) else None
                if t and not t.strip().startswith(SKIP_PREFIXES):
                    s["prompts"].append({"time": ts.strftime("%H:%M"), "text": t.strip()[:PROMPT_MAX]})
            elif e.get("type") == "user":
                t = user_text(e)
                if t:
                    s["prompts"].append({"time": ts.strftime("%H:%M"), "text": t})
            elif e.get("type") == "assistant" and not e.get("isSidechain"):
                for c in (e.get("message") or {}).get("content") or []:
                    if not isinstance(c, dict):
                        continue
                    if c.get("type") == "tool_use":
                        s["tool_calls"] += 1
                        fp = (c.get("input") or {}).get("file_path")
                        if fp and c.get("name") in ("Edit", "Write", "MultiEdit", "NotebookEdit"):
                            s["files_changed"].add(fp)
                    elif c.get("type") == "text" and c.get("text", "").strip():
                        s["last_reply"] = c["text"].strip()[:600]
    result = []
    for sid, s in sessions.items():
        if not s["prompts"]:
            continue  # sessions with no human prompt that day (e.g. only resumed) are noise
        s["title"] = titles.get(sid)
        s["start"], s["end"] = s["start"].strftime("%H:%M"), s["end"].strftime("%H:%M")
        s["files_changed"] = sorted(s["files_changed"])[:30]
        result.append(s)
    return sorted(result, key=lambda s: s["start"])


def parse_since(raw, day_start):
    """'HH:MM' -> {None: dt}; 'a=HH:MM,b=HH:MM' -> {'a': dt, 'b': dt}."""
    out = {}
    for part in filter(None, (raw or "").split(",")):
        name, _, hhmm = part.rpartition("=")
        h, m = map(int, hhmm.split(":"))
        out[name or None] = day_start.replace(hour=h, minute=m)
    return out


def safe_stat(path):
    try:
        return path.stat()
    except OSError:
        return None


def evicted_files(root):
    """Mirror files iCloud holds in the cloud only: legacy .name.icloud placeholders or dataless files (0 blocks)."""
    out = list(root.glob("projects/*/.*.icloud"))
    for p in root.glob("projects/*/*.jsonl"):
        st = safe_stat(p)
        if st and st.st_size > 0 and getattr(st, "st_blocks", 1) == 0:
            out.append(p)
    return out


def wait_for_icloud(evicted, seconds):
    """Ask iCloud to download evicted mirror files and wait briefly; return those still not local."""
    for f in evicted:
        run(["brctl", "download", str(f)])
    deadline = time.time() + seconds
    while time.time() < deadline and evicted_files_still(evicted):
        time.sleep(0.5)
    return evicted_files_still(evicted)


def evicted_files_still(files):
    out = []
    for f in files:
        st = safe_stat(f)
        if st and (f.name.endswith(".icloud") or getattr(st, "st_blocks", 1) == 0):
            out.append(f)
    return out


def collect_all_machines(day_start, end, since, local):
    """Return (sessions, machines, warnings) across this machine and every mirrored one."""
    roots = {local: CLAUDE_DIR}  # each root has the ~/.claude layout: <root>/projects/<project>/<session>.jsonl
    shared = shared_dir(CFG)
    if shared.is_dir():
        for d in sorted(shared.iterdir()):
            if d.is_dir() and not d.name.startswith(".") and d.name != local:
                roots[d.name] = d
    sessions, machines, warnings, seen = [], [], [], set()
    for name, root in roots.items():
        start = since.get(name) or since.get(None) or day_start
        # A batch of mirror files can take ~40s to come down; config.icloud_wait_seconds overrides the default.
        pending = wait_for_icloud(evicted_files(root), CFG.get("icloud_wait_seconds", 60)) if name != local else []
        if pending:
            warnings.append(f"{name}: {len(pending)} transcript(s) still in iCloud only (not downloaded yet)")
        # A renamed machine leaves its old mirror folder behind; drop sessions already collected under another name.
        found = [s for s in collect_claude((start, end), root, name) if s["session_id"] not in seen]
        seen |= {s["session_id"] for s in found}
        sessions += found
        mtimes = [st.st_mtime for st in map(safe_stat, root.glob("projects/*/*.jsonl")) if st]
        # `until` is how far this machine's data has actually been seen; the next run's --since for it.
        # A mirror may lag behind real time, so for mirrors it is the latest event seen, not "now".
        until = end if name == local else max((s["end"] for s in found), default=start.strftime("%H:%M"))
        machines.append({
            "name": name, "source": "local" if name == local else "mirror",
            "since": start.strftime("%H:%M"), "until": until if isinstance(until, str) else until.strftime("%H:%M"),
            "sessions": len(found),
            "last_synced": datetime.fromtimestamp(max(mtimes), local_tz()).strftime("%m-%d %H:%M") if mtimes else None,
        })
    return sorted(sessions, key=lambda s: s["start"]), machines, warnings


def collect_local_git(window, cwds, emails):
    repos = {}
    for cwd in cwds:
        while cwd and not Path(cwd).is_dir():  # file may have been moved; walk up
            cwd = str(Path(cwd).parent) if Path(cwd).parent != Path(cwd) else None
        if not cwd:
            continue
        top = run(["git", "rev-parse", "--show-toplevel"], cwd=cwd)
        if top:
            repos[top.strip()] = None
    since, until = (w.isoformat(timespec="seconds") for w in window)
    out = []
    for repo in repos:
        cmd = ["git", "log", "--all", "--no-merges", f"--since={since}", f"--until={until}",
               "--date=format:%H:%M", "--pretty=format:%h\t%ad\t%ae\t%D\t%s"]
        log = run(cmd, cwd=repo)
        if not log:
            continue
        mine = set(emails)
        cfg = run(["git", "config", "user.email"], cwd=repo)
        if cfg:
            mine.add(cfg.strip())
        commits = []
        for row in log.splitlines():
            sha, t, email, refs, subject = (row.split("\t", 4) + [""] * 5)[:5]
            if mine and email not in mine:
                continue
            commits.append({"sha": sha, "time": t, "refs": refs, "subject": subject})
        if commits:
            remote = run(["git", "remote", "get-url", "origin"], cwd=repo)
            out.append({"repo": repo, "remote": remote.strip() if remote else None, "commits": commits})
    return out


def collect_github(window):
    day = window[0].date()
    if not run(["gh", "auth", "status"]):
        return {"error": "gh not authenticated — run `gh auth login`"}
    login = (run(["gh", "api", "user", "--jq", ".login"]) or "").strip()
    events = []
    for page in (1, 2, 3):
        raw = run(["gh", "api", f"users/{login}/events?per_page=100&page={page}"])
        if not raw:
            break
        batch = json.loads(raw)
        events += batch
        if not batch or (parse_ts(batch[-1]["created_at"]) and parse_ts(batch[-1]["created_at"]).date() < day):
            break
    pushes, prs, reviews, issues, other = [], [], [], [], []
    for ev in events:
        ts = parse_ts(ev.get("created_at"))
        if not in_window(ts, window):
            continue
        repo, p, kind = ev["repo"]["name"], ev.get("payload", {}), ev["type"]
        t = ts.strftime("%H:%M")
        if kind == "PushEvent":
            pushes.append({"time": t, "repo": repo, "branch": (p.get("ref") or "").replace("refs/heads/", ""),
                           "commits": [c["message"].splitlines()[0] for c in p.get("commits", [])],
                           "head": (p.get("head") or "")[:7]})
        elif kind == "PullRequestEvent":
            pr = p.get("pull_request", {})
            action = "merged" if p.get("action") == "closed" and pr.get("merged") else p.get("action")
            prs.append({"time": t, "repo": repo, "action": action, "number": pr.get("number"),
                        "title": pr.get("title"), "url": pr.get("html_url")})
        elif kind in ("PullRequestReviewEvent", "PullRequestReviewCommentEvent"):
            pr = p.get("pull_request", {})
            reviews.append({"time": t, "repo": repo, "number": pr.get("number"), "title": pr.get("title"),
                            "url": pr.get("html_url")})
        elif kind in ("IssuesEvent", "IssueCommentEvent"):
            iss = p.get("issue", {})
            issues.append({"time": t, "repo": repo, "action": p.get("action"), "number": iss.get("number"),
                           "title": iss.get("title"), "url": iss.get("html_url")})
        elif kind in ("CreateEvent", "ReleaseEvent", "DeleteEvent"):
            other.append({"time": t, "repo": repo, "type": kind, "ref": p.get("ref"), "ref_type": p.get("ref_type")})
    # Events API omits PR titles in some payloads; fill them from search.
    raw = run(["gh", "search", "prs", "--author=@me", f"--updated={day.isoformat()}", "--limit=50",
               "--json", "number,title,url,state,repository,isDraft,updatedAt"])
    touched_prs = [pr for pr in (json.loads(raw) if raw else []) if in_window(parse_ts(pr.get("updatedAt")), window)]
    return {"login": login, "pushes": pushes, "pull_requests": prs, "reviews": reviews,
            "issues": issues, "other": other, "prs_updated_today": touched_prs}


CFG = {}


def main():
    global CFG
    here = Path(__file__).resolve().parent.parent
    ap = argparse.ArgumentParser()
    ap.add_argument("--date", help="YYYY-MM-DD (default: today, local time)")
    ap.add_argument("--since", help="HH:MM, or machine=HH:MM,machine=HH:MM — only activity after (for appending)")
    ap.add_argument("--config", default=str(here / "config.json"))
    ap.add_argument("--no-git", action="store_true", help="skip local git log")
    ap.add_argument("--no-github", action="store_true", help="skip GitHub events")
    args = ap.parse_args()
    CFG = load_config(args.config)
    day = date.fromisoformat(args.date) if args.date else date.today()
    tz = local_tz()
    now = datetime.now(tz)
    day_start = datetime.combine(day, datetime.min.time(), tz)
    end = min(now, day_start + timedelta(days=1))
    since = parse_since(args.since, day_start)
    local = machine_name(CFG)

    claude, machines, warnings = collect_all_machines(day_start, end, since, local)
    start = min(datetime.strptime(m["since"], "%H:%M").replace(year=day.year, month=day.month, day=day.day, tzinfo=tz)
                for m in machines)
    window = (start, end)
    emails = set(CFG.get("git_emails", []))
    # Sessions often edit repos outside their cwd, so also look at the edited files' folders.
    mine = [s for s in claude if s["machine"] == local]
    dirs = {s["cwd"] for s in mine} | {str(Path(f).parent) for s in mine for f in s["files_changed"]}
    git_local = [] if args.no_git else collect_local_git(window, dirs, emails)
    github = {"skipped": True} if args.no_github else collect_github(window)
    json.dump({
        "date": day.isoformat(),
        "window": {"from": start.strftime("%H:%M"), "to": end.strftime("%H:%M")},
        "weekday_ko": "월화수목금토일"[day.weekday()],
        "machine": local,
        "shared_dir_ok": shared_dir(CFG).is_dir(),
        "machines": machines,
        "sync_warnings": warnings,
        "claude_sessions": claude,
        "local_git": git_local,
        "github": github,
    }, sys.stdout, ensure_ascii=False, indent=1, default=str)


if __name__ == "__main__":
    main()
