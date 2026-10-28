# clone-website

URL을 섹션별로 분석(CSS·에셋·인터랙션)해 Next.js + shadcn/ui + Tailwind로 픽셀 단위 복제한다. 출처: [julianromli/ai-skills](https://github.com/julianromli/ai-skills/tree/main/skills/clone-website)

## 준비
- 브라우저 MCP(Chrome 연동 등)
- 섹션별 빌더 에이전트를 worktree에서 병렬로 돌리므로 git 레포 안에서 실행

## 사용 예
- `/clone-website https://example.com`

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (1개)

### `/clone-website`

Reverse-engineer and clone one or more websites in one shot — extracts assets, CSS, and content section-by-section and proactively dispatches parallel builder agents in worktrees as it goes. Use this whenever the user wants to clone, replicate, rebuild, reverse-engineer, or copy any website. Also triggers on phrases like "make a copy of this site", "rebuild this page", "pixel-perfect clone". Provide one or more target URLs as arguments.

- 호출: `/clone-website <url1> [<url2> ...]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [julianromli/ai-skills](https://github.com/julianromli/ai-skills/tree/HEAD/skills/clone-website)
- 이 레포 사본: [`plugins/clone-website/skills/clone-website/SKILL.md`](../../plugins/clone-website/skills/clone-website/SKILL.md)
