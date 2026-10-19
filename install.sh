#!/usr/bin/env bash
# Link every skill in this repo into ~/.claude/skills so it runs as /<skill-name>.
# Safe to re-run; `git pull` afterwards updates all machines' skills in place.
set -euo pipefail
repo="$(cd "$(dirname "$0")" && pwd)"
claude_dir="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
dest="$claude_dir/skills"
mkdir -p "$dest"
for skill in "$repo"/plugins/*/skills/*/; do
  name="$(basename "$skill")"
  target="$dest/$name"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "skip $name: $target exists and is not a symlink" >&2; continue
  fi
  ln -sfn "${skill%/}" "$target"
  echo "linked /$name -> ${skill%/}"
done

# Put this repo's commands (e.g. skills-ls) on PATH via ~/.local/bin.
bindir="$HOME/.local/bin"
mkdir -p "$bindir"
for cmd in "$repo"/bin/*; do
  ln -sfn "$cmd" "$bindir/$(basename "$cmd")"
  echo "linked $(basename "$cmd") -> $bindir"
done
case ":$PATH:" in *":$bindir:"*) ;; *) echo "! PATH에 $bindir 추가 필요: echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.zshrc";; esac

# Import this repo's shared global instructions into ~/.claude/CLAUDE.md (idempotent).
claude_md="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/CLAUDE.md"
touch "$claude_md"
# Drop the block written before the repo was renamed (my-claude-skills -> my-dev-settings), then add the current one.
if grep -q "<!-- MY-CLAUDE-SKILLS:START -->" "$claude_md"; then
  sed -i '' '/<!-- MY-CLAUDE-SKILLS:START -->/,/<!-- MY-CLAUDE-SKILLS:END -->/d' "$claude_md"
  echo "removed old my-claude-skills import from $claude_md"
fi
if ! grep -q "<!-- MY-DEV-SETTINGS:START -->" "$claude_md"; then
  printf '\n<!-- MY-DEV-SETTINGS:START -->\n@%s/global-claude.md\n<!-- MY-DEV-SETTINGS:END -->\n' "$repo" >> "$claude_md"
  echo "added global-claude.md import to $claude_md"
fi

# Repo renamed from my-claude-skills: point an old clone's remote at the new name.
if git -C "$repo" remote get-url origin 2>/dev/null | grep -q "my-claude-skills"; then
  git -C "$repo" remote set-url origin https://github.com/HerrineKim/my-dev-settings.git
  echo "updated git remote to HerrineKim/my-dev-settings"
fi

# daily-log: mirror this machine's transcripts to the shared folder so /daily-log on any Mac sees them.
# The folder lives in iCloud Drive by default (config.json "shared_dir"); each Mac writes under its own name.
sync_cmd="python3 \"\${CLAUDE_CONFIG_DIR:-\$HOME/.claude}/skills/daily-log/scripts/sync_transcripts.py\""
python3 - "$claude_dir/settings.json" "$sync_cmd" <<'PY'
import json, sys
from pathlib import Path
path, cmd = Path(sys.argv[1]), sys.argv[2]
try:
    settings = json.loads(path.read_text()) if path.exists() else {}
except ValueError as exc:
    sys.exit(f"! {path} 를 JSON으로 읽을 수 없어 훅을 등록하지 못했습니다 ({exc}). 파일을 고친 뒤 install.sh를 다시 실행하세요.")
hooks = settings.setdefault("hooks", {})
added = []
for event in ("Stop", "SessionEnd", "SessionStart"):
    groups = hooks.setdefault(event, [])
    # Match any registration of this script (an older path, or the plugin's hooks.json) so it never runs twice.
    if any("sync_transcripts.py" in str(h.get("command", "")) for g in groups for h in g.get("hooks", [])):
        continue
    groups.append({"hooks": [{"type": "command", "command": cmd, "timeout": 20}]})
    added.append(event)
if added:
    tmp = path.with_suffix(".json.tmp")
    tmp.write_text(json.dumps(settings, ensure_ascii=False, indent=2) + "\n")
    tmp.replace(path)
    print("daily-log sync hooks added to", path, "->", ", ".join(added))
else:
    print("daily-log sync hooks already present in", path)
PY
shared="$(python3 -c "
import json,os,sys; sys.path.insert(0, '$repo/plugins/daily-log/skills/daily-log/scripts')
from daily_log_common import load_config, shared_dir
print(shared_dir(load_config('$repo/plugins/daily-log/skills/daily-log/config.json')))")"
if [ -d "$(dirname "$(dirname "$shared")")" ]; then
  mkdir -p "$shared" && echo "shared transcript folder: $shared"
  echo '{}' | python3 "$repo/plugins/daily-log/skills/daily-log/scripts/sync_transcripts.py" && echo "initial transcript sync done"
else
  echo "! iCloud Drive 폴더가 없어 기기 간 기록 공유를 건너뜁니다. config.json의 shared_dir를 다른 공유 폴더로 바꾸고 다시 실행하세요."
fi

command -v gh >/dev/null || echo "! GitHub CLI 없음: brew install gh && gh auth login"
gh auth status >/dev/null 2>&1 || echo "! gh 로그인 필요: gh auth login"
echo "노션은 claude.ai 계정의 Notion 커넥터를 쓰므로 같은 계정으로 로그인하면 추가 설정이 없습니다."
echo "앱을 다른 맥과 맞추려면 apps-sync 를 실행하세요(apps/Brewfile 기준)."
