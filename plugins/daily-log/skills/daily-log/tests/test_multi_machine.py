"""Run: python3 -m unittest discover -s tests  (from the daily-log skill folder)."""
import io
import json
import os
import subprocess
import sys
import tempfile
import unittest
from datetime import datetime, timedelta
from pathlib import Path

SKILL = Path(__file__).resolve().parent.parent
SCRIPTS = SKILL / "scripts"
sys.path.insert(0, str(SCRIPTS))


def entry(kind, text, ts, sid, cwd="/Users/x/Projects/demo"):
    return json.dumps({"type": kind, "sessionId": sid, "cwd": cwd, "gitBranch": "main",
                       "timestamp": ts.astimezone().isoformat(),
                       "message": {"role": kind, "content": text}})


def write_session(root, project, sid, lines):
    d = root / "projects" / project
    d.mkdir(parents=True, exist_ok=True)
    (d / f"{sid}.jsonl").write_text("\n".join(lines) + "\n")
    return d / f"{sid}.jsonl"


class MultiMachineCollect(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        base = Path(self.tmp.name)
        self.claude_dir, self.shared = base / "claude", base / "shared"
        self.config = base / "config.json"
        self.config.write_text(json.dumps({"machine_name": "local-mac", "shared_dir": str(self.shared)}))
        # Yesterday, so the 10:00 fixtures are never in the future whatever time the suite runs.
        self.today = (datetime.now().astimezone() - timedelta(days=1)).replace(hour=10, minute=0, second=0, microsecond=0)

    def tearDown(self):
        self.tmp.cleanup()

    def run_collect(self, *args):
        env = {**os.environ, "CLAUDE_CONFIG_DIR": str(self.claude_dir)}
        out = subprocess.run([sys.executable, str(SCRIPTS / "collect.py"), "--config", str(self.config),
                              "--no-github", "--no-git",
                              "--date", self.today.date().isoformat(), *args], capture_output=True, text=True, env=env)
        self.assertEqual(out.returncode, 0, out.stderr)
        return json.loads(out.stdout)

    def test_shouldTagLocalAndMirroredSessionsWithTheirMachine(self):
        write_session(self.claude_dir, "-Users-x-Projects-demo", "s-local",
                      [entry("user", "로컬 작업", self.today, "s-local")])
        write_session(self.shared / "other-mac", "-Users-x-Projects-demo", "s-other",
                      [entry("user", "다른 기기 작업", self.today + timedelta(minutes=5), "s-other")])
        data = self.run_collect()
        by_id = {s["session_id"]: s["machine"] for s in data["claude_sessions"]}
        self.assertEqual(by_id, {"s-local": "local-mac", "s-other": "other-mac"})
        self.assertEqual(sorted(m["name"] for m in data["machines"]), ["local-mac", "other-mac"])

    def test_shouldSkipMirrorOfTheLocalMachine(self):
        write_session(self.shared / "local-mac", "-Users-x-Projects-demo", "s-dup",
                      [entry("user", "복사본", self.today, "s-dup")])
        data = self.run_collect()
        self.assertEqual(data["claude_sessions"], [])

    def test_shouldApplySinceSeparatelyPerMachine(self):
        write_session(self.claude_dir, "-Users-x-Projects-demo", "s-local-early",
                      [entry("user", "일찍", self.today, "s-local-early")])
        write_session(self.shared / "other-mac", "-Users-x-Projects-demo", "s-other-early",
                      [entry("user", "일찍", self.today, "s-other-early")])
        data = self.run_collect("--since", "local-mac=11:00")
        ids = sorted(s["session_id"] for s in data["claude_sessions"])
        self.assertEqual(ids, ["s-other-early"])
        self.assertEqual(data["window"]["from"], "00:00")  # git/github window starts at the earliest since

    def test_shouldReportPerMachineUntilAsLatestEventSeen(self):
        write_session(self.shared / "other-mac", "-Users-x-Projects-demo", "s-other",
                      [entry("user", "a", self.today, "s-other"),
                       entry("user", "b", self.today + timedelta(minutes=30), "s-other")])
        data = self.run_collect()
        until = {m["name"]: m["until"] for m in data["machines"]}
        self.assertEqual(until["other-mac"], "10:30")
        self.assertEqual(until["local-mac"], data["window"]["to"])
        self.assertTrue(data["shared_dir_ok"])

    def test_shouldDropMirrorSessionsAlreadySeenLocally(self):
        lines = [entry("user", "같은 세션", self.today, "s-same")]
        write_session(self.claude_dir, "-Users-x-Projects-demo", "s-same", lines)
        write_session(self.shared / "old-name", "-Users-x-Projects-demo", "s-same", lines)
        data = self.run_collect()
        self.assertEqual([s["machine"] for s in data["claude_sessions"]], ["local-mac"])

    def test_shouldReportICloudPlaceholdersAsWarnings(self):
        d = self.shared / "other-mac" / "projects" / "-Users-x-Projects-demo"
        d.mkdir(parents=True)
        (d / ".s-evicted.jsonl.icloud").write_bytes(b"")
        data = self.run_collect()
        self.assertTrue(any("other-mac" in w for w in data["sync_warnings"]))


class SyncTranscripts(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        base = Path(self.tmp.name)
        self.claude_dir, self.shared = base / "claude", base / "shared"
        self.config = base / "config.json"
        self.config.write_text(json.dumps({"machine_name": "local-mac", "shared_dir": str(self.shared)}))

    def tearDown(self):
        self.tmp.cleanup()

    def run_sync(self, stdin_payload):
        env = {**os.environ, "CLAUDE_CONFIG_DIR": str(self.claude_dir)}
        out = subprocess.run([sys.executable, str(SCRIPTS / "sync_transcripts.py"), "--config", str(self.config)],
                             input=json.dumps(stdin_payload), capture_output=True, text=True, env=env)
        self.assertEqual(out.returncode, 0, out.stderr)

    def test_shouldMirrorRecentTranscriptsUnderMachineFolder(self):
        now = datetime.now().astimezone()
        p = write_session(self.claude_dir, "-Users-x-Projects-demo", "s1", [entry("user", "hi", now, "s1")])
        self.shared.mkdir()
        self.run_sync({"transcript_path": str(p), "hook_event_name": "Stop"})
        mirrored = self.shared / "local-mac" / "projects" / "-Users-x-Projects-demo" / "s1.jsonl"
        self.assertEqual(mirrored.read_text(), p.read_text())

    def test_shouldSurviveGarbageOnStdin(self):
        self.shared.mkdir()
        env = {**os.environ, "CLAUDE_CONFIG_DIR": str(self.claude_dir)}
        for payload in ("null", "[1,2]", "not json", ""):
            out = subprocess.run([sys.executable, str(SCRIPTS / "sync_transcripts.py"), "--config", str(self.config)],
                                 input=payload, capture_output=True, text=True, env=env)
            self.assertEqual(out.returncode, 0, out.stderr)

    def test_shouldDoNothingWhenSharedRootIsMissing(self):
        now = datetime.now().astimezone()
        p = write_session(self.claude_dir, "-Users-x-Projects-demo", "s1", [entry("user", "hi", now, "s1")])
        self.run_sync({"transcript_path": str(p)})
        self.assertFalse(self.shared.exists())


if __name__ == "__main__":
    unittest.main()
