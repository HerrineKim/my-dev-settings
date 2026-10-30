#!/usr/bin/env bash
# Link every skill in this repo into ~/.claude/skills so it runs as /<skill-name>.
# Safe to re-run; `git pull` afterwards updates all machines' skills in place.
set -euo pipefail
repo="$(cd "$(dirname "$0")" && pwd)"
claude_dir="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
dest="$claude_dir/skills"
mkdir -p "$dest"
# Plugins listed in skills-exclude stay in the repo but are not linked globally (their skill list costs context every session).
# A `!plugin/skill` line links just that skill of an excluded plugin anyway.
excluded=" $(sed 's/#.*//' "$repo/skills-exclude" 2>/dev/null | grep -v '^ *!' | xargs) "
kept=" $(sed 's/#.*//' "$repo/skills-exclude" 2>/dev/null | sed -n 's/^ *!//p' | xargs) "
for skill in "$repo"/plugins/*/skills/*/; do
  name="$(basename "$skill")"
  target="$dest/$name"
  plugin="${skill#"$repo"/plugins/}"; plugin="${plugin%%/*}"
  case "$excluded" in *" $plugin "*)
    case "$kept" in *" $plugin/$name "*) ;; *)
      if [ -L "$target" ] && [ "$(readlink "$target")" = "${skill%/}" ]; then rm "$target"; echo "unlinked excluded /$name"; fi
      continue;;
    esac;;
  esac
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "skip $name: $target exists and is not a symlink" >&2; continue
  fi
  ln -sfn "${skill%/}" "$target"
  echo "linked /$name -> ${skill%/}"
done
# Drop links to skills that were removed from this repo (only links pointing into it, so others are left alone).
for link in "$dest"/*; do
  [ -L "$link" ] && [ ! -e "$link" ] || continue
  case "$(readlink "$link")" in "$repo"/plugins/*) rm "$link"; echo "removed stale /$(basename "$link")";; esac
done

# MCP servers some vendored skills call (code-review-graph, korean-law, front-end-checklist), registered once at user scope.
if command -v claude >/dev/null; then
  claude mcp get code-review-graph >/dev/null 2>&1 || {
    command -v uvx >/dev/null || echo "! code-review-graph MCP는 uv가 필요: brew install uv"
    claude mcp add -s user code-review-graph -- uvx code-review-graph serve >/dev/null && echo "added MCP code-review-graph (user)"; }
  # 법제처 키 없이 공용 한도로 연결. 본인 키는 docs/skills/korean-law.md 참고. skills-exclude에 있으면 등록하지 않고 지움.
  case "$excluded" in
    *" korean-law "*) claude mcp get korean-law >/dev/null 2>&1 && \
      claude mcp remove -s user korean-law >/dev/null && echo "removed MCP korean-law (excluded)";;
    *) claude mcp get korean-law >/dev/null 2>&1 || {
      claude mcp add -s user --transport http korean-law https://mcp.gomdori.app/law >/dev/null && echo "added MCP korean-law (user)"; };;
  esac
  # /frontend-checklist-global이 규칙을 이 원격 MCP로 찾는다. 그 스킬을 전역 링크할 때만 등록하고, 아니면 지움.
  want_fec=yes
  case "$excluded" in *" front-end-checklist "*)
    case "$kept" in *" front-end-checklist/frontend-checklist-global "*) ;; *) want_fec=no;; esac;;
  esac
  if [ "$want_fec" = yes ]; then
    claude mcp get front-end-checklist >/dev/null 2>&1 || {
      claude mcp add -s user --transport http front-end-checklist https://mcp.frontendchecklist.io >/dev/null && echo "added MCP front-end-checklist (user)"; }
  else
    claude mcp get front-end-checklist >/dev/null 2>&1 && \
      claude mcp remove -s user front-end-checklist >/dev/null && echo "removed MCP front-end-checklist (excluded)"
  fi
else
  echo "! claude CLI 없음: code-review-graph·korean-law·front-end-checklist MCP 등록을 건너뜁니다."
fi

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
