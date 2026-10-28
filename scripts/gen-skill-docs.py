#!/usr/bin/env python3
"""Regenerate the per-skill reference in docs/skills/<plugin>.md from each SKILL.md.

Everything above the GENERATED marker in a plugin doc is hand-written (setup, examples) and kept as is;
everything below it is rebuilt from the skills' frontmatter. docs/skills/README.md is rebuilt entirely.
Run after vendor.sh or after adding/editing a skill.
"""
import json
import re
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
DOCS = REPO / "docs" / "skills"
MARKER = "<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->"

# plugin -> (GitHub repo, path of a skill folder in it). {s} is the skill folder name.
# Plugins not listed here were written in this repo. Keep in sync with vendor.sh.
SOURCES = {
    "ui-ux-pro-max": ("nextlevelbuilder/ui-ux-pro-max-skill", ".claude/skills/{s}"),
    "frontend-design": ("anthropics/skills", "skills/{s}"),
    "web-design-guidelines": ("vercel-labs/agent-skills", "skills/{s}"),
    "clone-website": ("julianromli/ai-skills", "skills/{s}"),
    "make-interfaces-feel-better": ("jakubkrehel/make-interfaces-feel-better", "skills/{s}"),
    "ai-slop-thresher": ("Burntgogi/ai-slop-thresher", "plugins/ai-slop-thresher/skills/{s}"),
    "karpathy-guidelines": ("multica-ai/andrej-karpathy-skills", "skills/{s}"),
    "antislop": ("miqdadbadjuber/anti-slop", "skills/{s}"),
    "marketingskills": ("coreyhaines31/marketingskills", "skills/{s}"),
    "k-skill": ("NomaDamas/k-skill", "{s}"),
    "code-review-graph": ("tirth8205/code-review-graph", "skills/{s}"),
    "diagram-design": ("cathrynlavery/diagram-design", "skills/{s}"),
    "korean-law": ("chrisryugj/korean-law-mcp", "skills/{s}"),
    "android-reverse-engineering": ("SimoneAvogadro/android-reverse-engineering-skill",
                                    "plugins/android-reverse-engineering/skills/{s}"),
    "note": ("HerrineKim/riverlog", ".claude/skills/{s}"),
}
OWN = ("HerrineKim/my-dev-settings", "plugins/{p}/skills/{s}")


def source_url(plugin, skill):
    repo, path = SOURCES.get(plugin, OWN)
    return repo, f"https://github.com/{repo}/tree/HEAD/{path.format(p=plugin, s=skill)}"


def frontmatter(text):
    m = re.match(r"^---\n(.*?)\n---", text, re.S)
    if not m:
        return {}
    out, key, buf = {}, None, []

    def flush():
        if key is not None:
            out[key] = " ".join(s.strip() for s in buf if s.strip())

    for line in m.group(1).splitlines():
        top = re.match(r"^([A-Za-z_-]+):\s*(.*)$", line)
        if top:
            flush()
            key, val = top.group(1), top.group(2)
            buf = [] if val in (">", ">-", "|", "|-", "") else [val]
        elif key is not None and line.startswith((" ", "\t")):
            buf.append(line)
    flush()
    return {k: v.strip().strip("'\"") if len(v) > 1 and v[0] == v[-1] and v[0] in "'\"" else v for k, v in out.items()}


def skill_section(plugin, skill_dir):
    fm = frontmatter((skill_dir / "SKILL.md").read_text(encoding="utf-8"))
    name = fm.get("name") or skill_dir.name
    hint = fm.get("argument-hint", "").strip("'\"")
    lines = [f"### `/{name}`", "", fm.get("description", "(설명 없음)"), ""]
    lines.append(f"- 호출: `/{name}{' ' + hint if hint else ''}` 또는 설명에 맞는 요청을 하면 자동으로 쓰임")
    if fm.get("disable-model-invocation") == "true":
        lines[-1] = f"- 호출: `/{name}{' ' + hint if hint else ''}` (직접 불렀을 때만 동작)"
    extras = sorted(p.name for p in skill_dir.iterdir() if p.is_dir() and not p.name.startswith("."))
    if extras:
        lines.append("- 딸린 폴더: " + ", ".join(f"`{e}/`" for e in extras))
    repo, url = source_url(plugin, skill_dir.name)
    lines.append(f"- 원조 GitHub: [{repo}]({url})" + (" (이 레포에서 만듦)" if plugin not in SOURCES else ""))
    rel = (skill_dir / "SKILL.md").relative_to(REPO)
    lines += [f"- 이 레포 사본: [`{rel}`](../../{rel})", ""]
    return "\n".join(lines)


def main():
    market = {p["name"]: p.get("description", "") for p in
              json.loads((REPO / ".claude-plugin" / "marketplace.json").read_text(encoding="utf-8"))["plugins"]}
    DOCS.mkdir(parents=True, exist_ok=True)
    index = ["# 스킬 사용법", "",
             "플러그인별 문서. 각 문서 위쪽은 준비물·사용 예, 아래쪽은 스킬별 설명과 호출법(SKILL.md에서 자동 생성)입니다.",
             "외부 레포가 따로 둔 사용 문서는 [`../upstream/`](../upstream/)에 원문 그대로 복사해 두었습니다.", "",
             "| 플러그인 | 스킬 수 | 설명 |", "|---|---|---|"]
    for plugin_dir in sorted((REPO / "plugins").iterdir()):
        skills = sorted(d for d in (plugin_dir / "skills").glob("*/") if (d / "SKILL.md").exists())
        if not skills:
            continue
        plugin = plugin_dir.name
        doc = DOCS / f"{plugin}.md"
        head = doc.read_text(encoding="utf-8").split(MARKER)[0].rstrip() if doc.exists() else \
            f"# {plugin}\n\n{market.get(plugin, '')}"
        body = [head, "", MARKER, "", f"## 스킬 목록 ({len(skills)}개)", ""]
        body += [skill_section(plugin, s) for s in skills]
        doc.write_text("\n".join(body).rstrip() + "\n", encoding="utf-8")
        index.append(f"| [{plugin}]({plugin}.md) | {len(skills)} | {market.get(plugin, '')} |")
    (DOCS / "README.md").write_text("\n".join(index) + "\n", encoding="utf-8")
    print(f"wrote {DOCS.relative_to(REPO)}/")


if __name__ == "__main__":
    main()
