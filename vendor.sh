#!/usr/bin/env bash
# Re-fetch the third-party skills vendored under plugins/ from their upstream repos.
# Run, review `git diff`, then commit. Afterwards `install.sh` (or `git pull` on other Macs) picks them up.
set -euo pipefail
repo="$(cd "$(dirname "$0")" && pwd)"
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
fetch() { # <plugin> <package> <skill-list>
  ( cd "$tmp" && npx -y skills add "$2" -a claude-code -s "$3" -y --copy >/dev/null )
  for s in "$tmp"/.claude/skills/*/; do
    name="$(basename "$s")"
    rm -rf "$repo/plugins/$1/skills/$name"
    cp -R "$s" "$repo/plugins/$1/skills/$name"
    echo "updated plugins/$1/skills/$name"
  done
  rm -rf "$tmp/.claude" "$tmp/skills-lock.json"
}
fetch ui-ux-pro-max         nextlevelbuilder/ui-ux-pro-max-skill '*'
fetch frontend-design       anthropics/claude-code/plugins/frontend-design/skills/frontend-design '*'
fetch web-design-guidelines vercel-labs/agent-skills web-design-guidelines
fetch clone-website         julianromli/ai-skills clone-website
find "$repo/plugins" -name .DS_Store -delete
