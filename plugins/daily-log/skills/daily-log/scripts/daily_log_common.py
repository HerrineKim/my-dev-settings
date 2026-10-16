"""Shared helpers for collect.py and sync_transcripts.py (standard library only)."""
import json
import os
import socket
import subprocess
from pathlib import Path

HOME = Path.home()
CLAUDE_DIR = Path(os.environ.get("CLAUDE_CONFIG_DIR", HOME / ".claude"))
DEFAULT_SHARED_DIR = "~/Library/Mobile Documents/com~apple~CloudDocs/claude-daily-log/transcripts"


def load_config(path):
    p = Path(path)
    return json.loads(p.read_text()) if p.exists() else {}


def machine_name(cfg):
    """DAILY_LOG_MACHINE env → config machine_name → macOS LocalHostName (stable; gethostname can follow DHCP) → hostname."""
    name = os.environ.get("DAILY_LOG_MACHINE") or cfg.get("machine_name")
    if name:
        return name
    try:
        out = subprocess.run(["scutil", "--get", "LocalHostName"], capture_output=True, text=True, timeout=5)
        if out.returncode == 0 and out.stdout.strip():
            return out.stdout.strip()
    except (OSError, subprocess.TimeoutExpired):
        pass
    return socket.gethostname().split(".")[0]


def shared_dir(cfg):
    """Folder shared between machines (iCloud Drive by default); each machine mirrors into <shared>/<machine>/."""
    return Path(os.path.expanduser(cfg.get("shared_dir") or DEFAULT_SHARED_DIR))
