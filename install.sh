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
if ! grep -q "<!-- MY-CLAUDE-SKILLS:START -->" "$claude_md"; then
  printf '\n<!-- MY-CLAUDE-SKILLS:START -->\n@%s/global-claude.md\n<!-- MY-CLAUDE-SKILLS:END -->\n' "$repo" >> "$claude_md"
  echo "added global-claude.md import to $claude_md"
fi

command -v gh >/dev/null || echo "! GitHub CLI 없음: brew install gh && gh auth login"
gh auth status >/dev/null 2>&1 || echo "! gh 로그인 필요: gh auth login"
echo "노션은 claude.ai 계정의 Notion 커넥터를 쓰므로 같은 계정으로 로그인하면 추가 설정이 없습니다."
