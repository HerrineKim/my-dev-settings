#!/usr/bin/env bash
# Re-fetch the third-party skills vendored under plugins/ from their upstream repos.
# Run, review `git diff`, then commit. Afterwards `install.sh` (or `git pull` on other Macs) picks them up.
set -euo pipefail
repo="$(cd "$(dirname "$0")" && pwd)"
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
clone() { # <github-repo>: shallow clone into $tmp/src (replacing the previous one)
  rm -rf "$tmp/src"
  git clone -q --depth 1 "https://github.com/$1.git" "$tmp/src"
}
vendor_tree() { # <plugin> <github-repo> <dir>... [-- <file>...]: replace plugins/<plugin>/<basename of dir> and copy files to its root
  local plugin="$1" dest="$repo/plugins/$1"; clone "$2"; shift 2
  mkdir -p "$dest"
  while [ $# -gt 0 ] && [ "$1" != -- ]; do rm -rf "$dest/$(basename "$1")"; cp -R "$tmp/src/$1" "$dest/"; shift; done
  [ $# -gt 0 ] && shift
  for f in "$@"; do cp "$tmp/src/$f" "$dest/"; done
  echo "updated plugins/$plugin"
}
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
fetch_built() { # <plugin> <github-repo>: copy skills from the repo's prebuilt Claude plugin, minus Codex-only agents/
  clone "$2"
  for s in "$tmp/src/plugins/$1/skills"/*/; do
    name="$(basename "$s")"
    rm -rf "$repo/plugins/$1/skills/$name"
    cp -R "$s" "$repo/plugins/$1/skills/$name"
    rm -rf "$repo/plugins/$1/skills/$name/agents"
    echo "updated plugins/$1/skills/$name"
  done
  cp "$tmp/src/LICENSE" "$tmp/src/NOTICE" "$repo/plugins/$1/"
  rm -rf "$tmp/src" # fetch's npx runs in $tmp; keep it empty
}
fetch ui-ux-pro-max        nextlevelbuilder/ui-ux-pro-max-skill '*'
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
fetch jscpd                 kucherenko/jscpd '*'
# android-reverse-engineering ships a prebuilt Claude plugin (skill + /decompile command) with no NOTICE file.
vendor_tree android-reverse-engineering SimoneAvogadro/android-reverse-engineering-skill \
  plugins/android-reverse-engineering/skills plugins/android-reverse-engineering/commands -- LICENSE THIRD_PARTY_NOTICES.md

# cybersecurity ships a single prebuilt Claude plugin with 22 skills + a shared cyberskill/ package that two
# scripts import via Path(__file__).resolve().parents[3], so it must sit at the plugin root. We vendor skills
# and that package only; its tooling repo (tests/, Makefile, CI) and any scripts are copied verbatim, never run.
vendor_tree cybersecurity Masriyan/Claude-Code-CyberSecurity-Skill skills cyberskill -- LICENSE NOTICE
find "$repo/plugins/cybersecurity" -name __pycache__ -type d -prune -exec rm -rf {} + 2>/dev/null || true

# ECC is a whole harness (agents, hooks, rules, commands); we vendor only its skills/ so it does not clash with oh-my-claudecode.
vendor_tree ecc affaan-m/ECC skills -- LICENSE

# Front-End-Checklist: 391 rule skills plus the global audit skill; the plugin's .mcp.json points at the hosted MCP.
vendor_tree front-end-checklist thedaviddias/Front-End-Checklist skills -- LICENSE plugins/front-end-checklist/.mcp.json

# /note lives in the riverlog repo; vendor it and inject the "find the riverlog repo" preamble so it works from any project.
clone HerrineKim/riverlog
rm -rf "$repo/plugins/note/skills/note"
cp -R "$tmp/src/.claude/skills/note" "$repo/plugins/note/skills/note"
python3 - "$repo/plugins/note/skills/note/SKILL.md" "$repo/plugins/note/global-preamble.md" <<'PY'
import re, sys
skill, pre = (open(p, encoding="utf-8").read() for p in sys.argv[1:3])
skill = skill.replace("riverlog 지식 창고(content/knowledge)에", "어느 프로젝트에서든 riverlog 지식 창고(~/Projects/riverlog의 content/knowledge)에", 1)
head = re.match(r"^---\n.*?\n---\n\n#[^\n]*\n(?:\n[^#\n][^\n]*)*\n", skill, re.S)
skill = skill[: head.end()] + pre + skill[head.end():]
open(sys.argv[1], "w", encoding="utf-8").write(skill)
PY
echo "updated plugins/note/skills/note"

# notebooklm-wiki-pipeline ships /pdf-to-wiki as a command plus a routing helper; turn it into a skill with frontmatter
# and the "global paths" preamble. The NotebookLM MCP itself comes from `uv tool install notebooklm-mcp-cli` (install.sh).
clone capitalparser/notebooklm-wiki-pipeline
nwp="$repo/plugins/notebooklm-wiki-pipeline"
rm -rf "$nwp/skills/pdf-to-wiki"
mkdir -p "$nwp/skills/pdf-to-wiki/scripts" "$nwp/skills/pdf-to-wiki/config"
cp "$tmp/src/scripts/notebook_registry.py" "$nwp/skills/pdf-to-wiki/scripts/"
cp "$tmp/src/config/notebooks.example.json" "$nwp/skills/pdf-to-wiki/config/"
cp "$tmp/src/LICENSE" "$nwp/"
python3 - "$tmp/src/commands/pdf-to-wiki.md" "$nwp/global-preamble.md" "$nwp/skills/pdf-to-wiki/SKILL.md" <<'PY'
import sys
cmd, pre = (open(p, encoding="utf-8").read() for p in sys.argv[1:3])
cmd = cmd.replace("OUTPUT_DIR=~/vault/00_Wiki/AI_Generated", "OUTPUT_DIR=(위 '전역 실행'의 OUTPUT_DIR)")
cmd = cmd.replace("설치 후 위 경로를 본인 Obsidian vault의 저장 위치로 바꿔라.\n\n", "")
front = """---
name: pdf-to-wiki
description: Google Drive의 대용량 PDF를 Claude 컨텍스트에 넣지 않고 NotebookLM(MCP)이 읽게 한 뒤, 분석 결과만 받아 Obsidian Wiki 노트로 저장한다. 주제별 NotebookLM 노트북을 재사용하되 질의는 대상 PDF source 하나로 한정한다. "PDF를 위키 노트로", "드라이브 PDF 정리", "NotebookLM으로 요약해서 옵시디언에" 요청에 사용.
argument-hint: "<drive_url_or_file_id> [wiki_title] [--topic topic_id]"
---

"""
head, sep, rest = cmd.partition("\n\n")  # keep the "# /pdf-to-wiki" title, then insert the preamble
open(sys.argv[3], "w", encoding="utf-8").write(front + head + "\n" + pre + "\n" + rest)
PY
echo "updated plugins/notebooklm-wiki-pipeline/skills/pdf-to-wiki"

# financial-datasets MCP server (single-file FastMCP app). install.sh runs it with `uv --directory mcp/financial-datasets`.
clone financial-datasets/mcp-server
for f in server.py pyproject.toml uv.lock .python-version LICENSE .env.example; do cp "$tmp/src/$f" "$repo/mcp/financial-datasets/"; done
echo "updated mcp/financial-datasets"

# es-toolkit ships a Claude plugin whose skills are named guide/migrate/recommend; prefix them so the global
# /guide etc. names stay free, and point their cross-references at the new names.
clone toss/es-toolkit
rm -rf "$repo/plugins/es-toolkit/skills"; mkdir -p "$repo/plugins/es-toolkit/skills"
for s in "$tmp/src/es-toolkit-plugin/skills"/*/; do
  name="es-toolkit-$(basename "$s")"
  cp -R "$s" "$repo/plugins/es-toolkit/skills/$name"
  sed -i '' -e "s/^name: .*/name: $name/" -e 's#/es-toolkit:\([a-z]*\)#/es-toolkit-\1#g' "$repo/plugins/es-toolkit/skills/$name/SKILL.md"
  echo "updated plugins/es-toolkit/skills/$name"
done
cp "$tmp/src/LICENSE" "$repo/plugins/es-toolkit/"

# es-hangul has no agent skill; plugins/es-hangul/skills/es-hangul/SKILL.md is ours, and its references/api.md is
# rebuilt here from the upstream Korean API docs (frontmatter, imports and the Sandpack playground stripped).
clone toss/es-hangul
python3 - "$tmp/src/docs/src/pages/docs/api" "$repo/plugins/es-hangul/skills/es-hangul/references/api.md" "$(git -C "$tmp/src" rev-parse --short HEAD)" <<'PY2'
import re, sys
from pathlib import Path
src, out, rev = Path(sys.argv[1]), Path(sys.argv[2]), sys.argv[3]
parts = [f"# es-hangul API (한국어 문서 모음)\n\n원본: https://github.com/toss/es-hangul/tree/{rev}/docs/src/pages/docs/api\n"]
for group in sorted(p for p in src.iterdir() if p.is_dir()):
    parts.append(f"\n# {group.name}\n")
    for f in sorted(group.glob("*.ko.mdx")):
        t = f.read_text(encoding="utf-8")
        t = re.sub(r"^---\n.*?\n---\n", "", t, flags=re.S)
        t = re.sub(r"^import .*\n", "", t, flags=re.M)
        t = re.split(r"\n## 사용해보기", t)[0]
        t = re.sub(r"^(#+) ", r"#\1 ", t, flags=re.M).strip()
        parts.append("\n" + t + "\n")
out.parent.mkdir(parents=True, exist_ok=True)
out.write_text("".join(parts), encoding="utf-8")
PY2
cp "$tmp/src/LICENSE" "$repo/plugins/es-hangul/"
echo "updated plugins/es-hangul/skills/es-hangul/references/api.md"
find "$repo/plugins" -name .DS_Store -delete

# Upstream usage docs, copied verbatim into docs/upstream/<plugin>/ (linked from docs/skills/<plugin>.md).
upstream_docs() { # <plugin> <github-repo> <path>...
  local plugin="$1" src="$2"; shift 2
  clone "$src"
  rm -rf "$repo/docs/upstream/$plugin"; mkdir -p "$repo/docs/upstream/$plugin"
  for f in "$@"; do cp "$tmp/src/$f" "$repo/docs/upstream/$plugin/"; done
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
upstream_docs notebooklm-wiki-pipeline capitalparser/notebooklm-wiki-pipeline README.md README.ko.md docs/adr/0001-notebooklm-mcp-approach.md
upstream_docs jscpd kucherenko/jscpd README.md docs/ai-ready.md
upstream_docs magnus-agent-skills magnus919/agent-skills README.md LICENSE.md
upstream_docs ecc affaan-m/ECC README.md COMMANDS-QUICK-REF.md TROUBLESHOOTING.md
upstream_docs front-end-checklist thedaviddias/Front-End-Checklist README.md
upstream_docs cybersecurity Masriyan/Claude-Code-CyberSecurity-Skill README.md USAGE.md INSTALL.md SECURITY.md docs/QUALITY.md
python3 "$repo/scripts/gen-skill-docs.py"
