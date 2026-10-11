#!/usr/bin/env python3
"""Collect one day's Claude Code activity and GitHub activity as JSON.

Usage: collect.py [--date YYYY-MM-DD] [--since HH:MM] [--config PATH]

Window: 00:00 of --date (or --since, when appending to an existing note) up to the
moment the script runs. Re-running later the same day with --since set to the previous
run's time yields only the new activity, so the note can be appended without duplicates.

Sources
  - Claude Code transcripts: ~/.claude/projects/**/*.jsonl (this machine only)
  - Local git: commits in every repo a Claude session ran in that day
  - GitHub: your public+private events (pushes, PRs, reviews, issues) via `gh`
Only the Python standard library is used, so it runs on any stock macOS.
"""
import argparse
import json
import os
import socket
import subprocess
import sys
from datetime import date, datetime, timedelta, timezone
from pathlib import Path

HOME = Path.home()
CLAUDE_DIR = Path(os.environ.get("CLAUDE_CONFIG_DIR", HOME / ".claude"))
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


def collect_claude(window):
    sessions = {}
    titles = {}
    root = CLAUDE_DIR / "projects"
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
                "session_id": sid, "cwd": e.get("cwd"), "branch": e.get("gitBranch"),
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


def main():
    here = Path(__file__).resolve().parent.parent
    ap = argparse.ArgumentParser()
    ap.add_argument("--date", help="YYYY-MM-DD (default: today, local time)")
    ap.add_argument("--since", help="HH:MM — only activity after this time (for appending)")
    ap.add_argument("--config", default=str(here / "config.json"))
    args = ap.parse_args()
    day = date.fromisoformat(args.date) if args.date else date.today()
    tz = local_tz()
    now = datetime.now(tz)
    start = datetime.combine(day, datetime.min.time(), tz)
    if args.since:
        h, m = map(int, args.since.split(":"))
        start = start.replace(hour=h, minute=m)
    end = min(now, start.replace(hour=0, minute=0) + timedelta(days=1))
    window = (start, end)
    cfg = json.loads(Path(args.config).read_text()) if Path(args.config).exists() else {}

    claude = collect_claude(window)
    emails = set(cfg.get("git_emails", []))
    # Sessions often edit repos outside their cwd, so also look at the edited files' folders.
    dirs = {s["cwd"] for s in claude} | {str(Path(f).parent) for s in claude for f in s["files_changed"]}
    git_local = collect_local_git(window, dirs, emails)
    github = collect_github(window)
    json.dump({
        "date": day.isoformat(),
        "window": {"from": start.strftime("%H:%M"), "to": end.strftime("%H:%M")},
        "weekday_ko": "월화수목금토일"[day.weekday()],
        "machine": os.environ.get("DAILY_LOG_MACHINE") or cfg.get("machine_name") or socket.gethostname().split(".")[0],
        "claude_sessions": claude,
        "local_git": git_local,
        "github": github,
    }, sys.stdout, ensure_ascii=False, indent=1, default=str)


if __name__ == "__main__":
    main()
