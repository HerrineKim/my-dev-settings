#!/usr/bin/env bash
# Link every skill in this repo into ~/.claude/skills so it runs as /<skill-name>.
# Safe to re-run; `git pull` afterwards updates all machines' skills in place.
set -euo pipefail
repo="$(cd "$(dirname "$0")" && pwd)"
dest="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills"
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

command -v gh >/dev/null || echo "! GitHub CLI 없음: brew install gh && gh auth login"
gh auth status >/dev/null 2>&1 || echo "! gh 로그인 필요: gh auth login"
echo "노션은 claude.ai 계정의 Notion 커넥터를 쓰므로 같은 계정으로 로그인하면 추가 설정이 없습니다."
