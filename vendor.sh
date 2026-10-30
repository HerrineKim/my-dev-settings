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
fetch ui-ux-pro-max        nextlevelbuilder/ui-ux-pro-max-skill '*'
fetch frontend-design       anthropics/skills frontend-design
fetch web-design-guidelines vercel-labs/agent-skills web-design-guidelines
fetch clone-website         julianromli/ai-skills clone-website
fetch_built ai-slop-thresher Burntgogi/ai-slop-thresher
fetch make-interfaces-feel-better jakubkrehel/make-interfaces-feel-better make-interfaces-feel-better
rm -rf "$repo/plugins/make-interfaces-feel-better/skills/make-interfaces-feel-better/agents" # Codex-only
fetch karpathy-guidelines   multica-ai/andrej-karpathy-skills karpathy-guidelines
fetch antislop              miqdadbadjuber/anti-slop '*'
fetch marketingskills       coreyhaines31/marketingskills '*'
fetch k-skill               NomaDamas/k-skill '*'
fetch code-review-graph     tirth8205/code-review-graph '*'
fetch diagram-design        cathrynlavery/diagram-design diagram-design
fetch korean-law            chrisryugj/korean-law-mcp korean-law
fetch magnus-agent-skills   magnus919/agent-skills '*'
# android-reverse-engineering ships a prebuilt Claude plugin (skill + /decompile command) with no NOTICE file.
git clone -q --depth 1 https://github.com/SimoneAvogadro/android-reverse-engineering-skill.git "$tmp/src"
rm -rf "$repo/plugins/android-reverse-engineering/skills" "$repo/plugins/android-reverse-engineering/commands"
mkdir -p "$repo/plugins/android-reverse-engineering"
cp -R "$tmp/src/plugins/android-reverse-engineering/skills" "$tmp/src/plugins/android-reverse-engineering/commands" "$repo/plugins/android-reverse-engineering/"
cp "$tmp/src/LICENSE" "$tmp/src/THIRD_PARTY_NOTICES.md" "$repo/plugins/android-reverse-engineering/"
rm -rf "$tmp/src"
echo "updated plugins/android-reverse-engineering"
find "$repo/plugins" -name .DS_Store -delete

# cybersecurity ships a single prebuilt Claude plugin with 22 skills + a shared cyberskill/ package that two
# scripts import via Path(__file__).resolve().parents[3], so it must sit at the plugin root. We vendor skills
# and that package only; its tooling repo (tests/, Makefile, CI) and any scripts are copied verbatim, never run.
git clone -q --depth 1 https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill.git "$tmp/src"
rm -rf "$repo/plugins/cybersecurity/skills" "$repo/plugins/cybersecurity/cyberskill"
mkdir -p "$repo/plugins/cybersecurity"
cp -R "$tmp/src/skills" "$tmp/src/cyberskill" "$repo/plugins/cybersecurity/"
cp "$tmp/src/LICENSE" "$tmp/src/NOTICE" "$repo/plugins/cybersecurity/"
find "$repo/plugins/cybersecurity" -name __pycache__ -type d -prune -exec rm -rf {} + 2>/dev/null || true
rm -rf "$tmp/src"
echo "updated plugins/cybersecurity"
find "$repo/plugins" -name .DS_Store -delete

# ECC is a whole harness (agents, hooks, rules, commands); we vendor only its skills/ so it does not clash with oh-my-claudecode.
git clone -q --depth 1 https://github.com/affaan-m/ECC.git "$tmp/src"
rm -rf "$repo/plugins/ecc/skills"
mkdir -p "$repo/plugins/ecc"
cp -R "$tmp/src/skills" "$repo/plugins/ecc/"
cp "$tmp/src/LICENSE" "$repo/plugins/ecc/"
rm -rf "$tmp/src"
echo "updated plugins/ecc"
find "$repo/plugins" -name .DS_Store -delete

# Front-End-Checklist: 391 rule skills plus the global audit skill; the plugin's .mcp.json points at the hosted MCP.
git clone -q --depth 1 https://github.com/thedaviddias/Front-End-Checklist.git "$tmp/src"
rm -rf "$repo/plugins/front-end-checklist/skills"
mkdir -p "$repo/plugins/front-end-checklist"
cp -R "$tmp/src/skills" "$repo/plugins/front-end-checklist/"
cp "$tmp/src/LICENSE" "$tmp/src/plugins/front-end-checklist/.mcp.json" "$repo/plugins/front-end-checklist/"
rm -rf "$tmp/src"
echo "updated plugins/front-end-checklist"
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

# Upstream usage docs, copied verbatim into docs/upstream/<plugin>/ (linked from docs/skills/<plugin>.md).
upstream_docs() { # <plugin> <github-repo> <path>...
  local plugin="$1" src="$2"; shift 2
  git clone -q --depth 1 "https://github.com/$src.git" "$tmp/docs-src"
  rm -rf "$repo/docs/upstream/$plugin"; mkdir -p "$repo/docs/upstream/$plugin"
  for f in "$@"; do cp "$tmp/docs-src/$f" "$repo/docs/upstream/$plugin/"; done
  rm -rf "$tmp/docs-src"
  echo "updated docs/upstream/$plugin"
}
upstream_docs k-skill NomaDamas/k-skill k-skills-list.md docs/setup.md docs/install.md docs/security-and-secrets.md
upstream_docs code-review-graph tirth8205/code-review-graph docs/USAGE.md docs/COMMANDS.md docs/TROUBLESHOOTING.md
upstream_docs diagram-design cathrynlavery/diagram-design README.md docs/cookbook.md
upstream_docs korean-law chrisryugj/korean-law-mcp README.md
upstream_docs android-reverse-engineering SimoneAvogadro/android-reverse-engineering-skill README.md
upstream_docs marketingskills coreyhaines31/marketingskills README.md
upstream_docs ui-ux-pro-max nextlevelbuilder/ui-ux-pro-max-skill README.md
upstream_docs antislop miqdadbadjuber/anti-slop README.md
upstream_docs ai-slop-thresher Burntgogi/ai-slop-thresher README.md
upstream_docs magnus-agent-skills magnus919/agent-skills README.md LICENSE.md
upstream_docs ecc affaan-m/ECC README.md COMMANDS-QUICK-REF.md TROUBLESHOOTING.md
upstream_docs front-end-checklist thedaviddias/Front-End-Checklist README.md
upstream_docs cybersecurity Masriyan/Claude-Code-CyberSecurity-Skill README.md USAGE.md INSTALL.md SECURITY.md docs/QUALITY.md
python3 "$repo/scripts/gen-skill-docs.py"
