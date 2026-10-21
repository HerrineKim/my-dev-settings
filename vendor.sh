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
fetch_built() { # <plugin> <github-repo> — copy skills from the repo's prebuilt Claude plugin, minus Codex-only agents/
  git clone -q --depth 1 "https://github.com/$2.git" "$tmp/src"
  for s in "$tmp/src/plugins/$1/skills"/*/; do
    name="$(basename "$s")"
    rm -rf "$repo/plugins/$1/skills/$name"
    cp -R "$s" "$repo/plugins/$1/skills/$name"
    rm -rf "$repo/plugins/$1/skills/$name/agents"
    echo "updated plugins/$1/skills/$name"
  done
  cp "$tmp/src/LICENSE" "$tmp/src/NOTICE" "$repo/plugins/$1/"
  rm -rf "$tmp/src"
}
fetch_private() { # <plugin> <github-repo> — copy skills/<plugin> from a private repo (needs gh auth)
  gh repo clone "$2" "$tmp/src" -- -q --depth 1
  rm -rf "$repo/plugins/$1/skills/$1"
  cp -R "$tmp/src/skills/$1" "$repo/plugins/$1/skills/$1"
  echo "updated plugins/$1/skills/$1"
  rm -rf "$tmp/src"
}
fetch ui-ux-pro-max        nextlevelbuilder/ui-ux-pro-max-skill '*'
fetch frontend-design       anthropics/claude-code/plugins/frontend-design/skills/frontend-design '*'
fetch web-design-guidelines vercel-labs/agent-skills web-design-guidelines
fetch clone-website         julianromli/ai-skills clone-website
fetch_built ai-slop-thresher Burntgogi/ai-slop-thresher
fetch make-interfaces-feel-better jakubkrehel/make-interfaces-feel-better make-interfaces-feel-better
rm -rf "$repo/plugins/make-interfaces-feel-better/skills/make-interfaces-feel-better/agents" # Codex-only
fetch marketingskills       coreyhaines31/marketingskills '*'
fetch_private error-message-ko         HerrineKim/claude-skills
fetch_private supabase-db-optimization HerrineKim/claude-skills
find "$repo/plugins" -name .DS_Store -delete

# /note lives in the riverlog repo; vendor it and inject the "find the riverlog repo" preamble so it works from any project.
git clone -q --depth 1 https://github.com/HerrineKim/riverlog.git "$tmp/riverlog"
rm -rf "$repo/plugins/note/skills/note"
cp -R "$tmp/riverlog/.claude/skills/note" "$repo/plugins/note/skills/note"
python3 - "$repo/plugins/note/skills/note/SKILL.md" "$repo/plugins/note/global-preamble.md" <<'PY'
import re, sys
skill, pre = (open(p, encoding="utf-8").read() for p in sys.argv[1:3])
skill = skill.replace("riverlog 지식 창고(content/knowledge)에", "어느 프로젝트에서든 riverlog 지식 창고(~/Projects/riverlog의 content/knowledge)에", 1)
head = re.match(r"^---\n.*?\n---\n\n#[^\n]*\n(?:\n[^#\n][^\n]*)*\n", skill, re.S)
skill = skill[: head.end()] + pre + skill[head.end():]
open(sys.argv[1], "w", encoding="utf-8").write(skill)
PY
echo "updated plugins/note/skills/note"
find "$repo/plugins" -name .DS_Store -delete
