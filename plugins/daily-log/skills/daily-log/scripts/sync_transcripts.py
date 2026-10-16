#!/usr/bin/env python3
"""Mirror this machine's Claude Code transcripts into the shared folder, so daily-log on any
machine can see work done here.

Runs as a Claude Code hook (Stop, SessionEnd, SessionStart) and reads the hook JSON on stdin.
It copies the transcript named in `transcript_path` plus any other top-level transcript changed
in the last two days whose mirror copy is older — a catch-up sweep for sessions whose hooks
never fired. Layout: <shared_dir>/<machine>/projects/<project>/<session>.jsonl, same as ~/.claude.
Silent no-op when the shared folder does not exist.

Usage: sync_transcripts.py [--config PATH] [--sweep-days N]
"""
import argparse
import json
import os
import shutil
import sys
import time
from pathlib import Path

from daily_log_common import CLAUDE_DIR, load_config, machine_name, shared_dir


STOP_MIN_INTERVAL = 60  # Stop fires every turn; don't recopy a transcript mirrored within the last minute
KEEP_DAYS = 14          # mirrors older than this are pruned from this machine's folder


def read_hook_input():
    if sys.stdin.isatty():
        return {}
    try:
        data = json.loads(sys.stdin.buffer.read().decode("utf-8", errors="replace") or "{}")
    except ValueError:
        return {}
    return data if isinstance(data, dict) else {}


def mirror(src, dest_root, min_interval=0):
    """Copy src (…/projects/<project>/<session>.jsonl) under dest_root if the mirror is older.
    With min_interval, skip when the mirror was refreshed less than that many seconds ago."""
    try:
        rel = src.resolve().relative_to((CLAUDE_DIR / "projects").resolve())
    except ValueError:
        return False  # not a transcript under this config dir
    if len(rel.parts) != 2:
        return False  # subagent logs live deeper; the collector only reads top-level sessions
    dest = dest_root / "projects" / rel
    try:
        if dest.exists():
            d, s_ = dest.stat(), src.stat()
            if d.st_mtime >= s_.st_mtime and d.st_size == s_.st_size:
                return False
            if min_interval and time.time() - d.st_mtime < min_interval:
                return False
        dest.parent.mkdir(parents=True, exist_ok=True)
        tmp = dest.with_name(f".{dest.name}.{os.getpid()}.tmp")  # unique per run: hooks can overlap
        shutil.copy2(src, tmp)
        tmp.replace(dest)  # atomic, so a reader never sees a half-written file
        return True
    except OSError:
        return False


def prune(dest_root, keep_days):
    cutoff = time.time() - keep_days * 86400
    for path in dest_root.glob("projects/*/*"):
        try:
            if path.is_file() and path.stat().st_mtime < cutoff:
                path.unlink()
        except OSError:
            continue


def main():
    here = Path(__file__).resolve().parent.parent
    ap = argparse.ArgumentParser()
    ap.add_argument("--config", default=str(here / "config.json"))
    ap.add_argument("--sweep-days", type=int, default=2)
    args = ap.parse_args()
    cfg = load_config(args.config)
    root = shared_dir(cfg)
    if not root.is_dir():
        return  # shared folder not set up on this machine (install.sh creates it when iCloud Drive exists)
    dest_root = root / machine_name(cfg)
    hook = read_hook_input()
    min_interval = STOP_MIN_INTERVAL if hook.get("hook_event_name") == "Stop" else 0
    tp = hook.get("transcript_path")
    if isinstance(tp, str) and Path(tp).is_file():
        mirror(Path(tp), dest_root, min_interval)
    cutoff = time.time() - args.sweep_days * 86400
    for path in (CLAUDE_DIR / "projects").glob("*/*.jsonl"):
        try:
            if path.stat().st_mtime >= cutoff:
                mirror(path, dest_root, min_interval)
        except OSError:
            continue
    prune(dest_root, KEEP_DAYS)


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:  # a hook must never block Claude Code
        print(f"daily-log sync skipped: {exc}", file=sys.stderr)
