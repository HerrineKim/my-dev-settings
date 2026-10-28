# code-review-graph

Tree-sitter로 코드 구조를 그래프(SQLite)로 만들어 두고, 리뷰·디버깅·리팩터링 때 변경 영향 범위(blast radius)에 걸린 파일만 읽게 한다. 스킬 7개 + MCP 서버. 출처: [tirth8205/code-review-graph](https://github.com/tirth8205/code-review-graph) (MIT)

원문 문서: [USAGE](../upstream/code-review-graph/USAGE.md) · [COMMANDS](../upstream/code-review-graph/COMMANDS.md) · [TROUBLESHOOTING](../upstream/code-review-graph/TROUBLESHOOTING.md)

## 준비
- `brew install uv` (Brewfile에 있음)
- MCP 서버는 `install.sh`가 user 스코프로 등록한다: `claude mcp add -s user code-review-graph -- uvx code-review-graph serve`
- 프로젝트마다 처음 한 번 그래프를 만든다: `/build-graph` 또는 터미널에서 `uvx code-review-graph build`

업스트림의 `code-review-graph install`은 프로젝트에 `.mcp.json`·훅·pre-commit을 쓰므로 여기서는 쓰지 않는다. 커밋할 때마다 그래프를 자동 갱신하고 싶은 프로젝트에서만 `uvx code-review-graph install --platform claude-code`를 실행한다.

## 사용 예
- `/build-graph` → 그래프 생성·갱신
- `/review-delta` → 마지막 커밋 이후 변경만 리뷰
- `/review-pr 123` 또는 `/review-pr feature/login`
- `/debug-issue 결제 후 주문 상태가 안 바뀜`
- `/refactor-safely UserService.update 시그니처 변경`
- `/explore-codebase 인증 흐름`

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (7개)

### `/build-graph`

Build or update the code review knowledge graph. Run this first to initialize, or let hooks keep it updated automatically.

- 호출: `/build-graph [full]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [tirth8205/code-review-graph](https://github.com/tirth8205/code-review-graph/tree/HEAD/skills/build-graph)
- 이 레포 사본: [`plugins/code-review-graph/skills/build-graph/SKILL.md`](../../plugins/code-review-graph/skills/build-graph/SKILL.md)

### `/debug-issue`

Systematically debug issues using graph-powered code navigation

- 호출: `/debug-issue` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [tirth8205/code-review-graph](https://github.com/tirth8205/code-review-graph/tree/HEAD/skills/debug-issue)
- 이 레포 사본: [`plugins/code-review-graph/skills/debug-issue/SKILL.md`](../../plugins/code-review-graph/skills/debug-issue/SKILL.md)

### `/explore-codebase`

Navigate and understand codebase structure using the knowledge graph

- 호출: `/explore-codebase` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [tirth8205/code-review-graph](https://github.com/tirth8205/code-review-graph/tree/HEAD/skills/explore-codebase)
- 이 레포 사본: [`plugins/code-review-graph/skills/explore-codebase/SKILL.md`](../../plugins/code-review-graph/skills/explore-codebase/SKILL.md)

### `/refactor-safely`

Plan and execute safe refactoring using dependency analysis

- 호출: `/refactor-safely` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [tirth8205/code-review-graph](https://github.com/tirth8205/code-review-graph/tree/HEAD/skills/refactor-safely)
- 이 레포 사본: [`plugins/code-review-graph/skills/refactor-safely/SKILL.md`](../../plugins/code-review-graph/skills/refactor-safely/SKILL.md)

### `/review-changes`

Perform a structured code review using change detection and impact

- 호출: `/review-changes` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [tirth8205/code-review-graph](https://github.com/tirth8205/code-review-graph/tree/HEAD/skills/review-changes)
- 이 레포 사본: [`plugins/code-review-graph/skills/review-changes/SKILL.md`](../../plugins/code-review-graph/skills/review-changes/SKILL.md)

### `/review-delta`

Review only changes since last commit using impact analysis. Token-efficient delta review with automatic blast-radius detection.

- 호출: `/review-delta [file or function name]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [tirth8205/code-review-graph](https://github.com/tirth8205/code-review-graph/tree/HEAD/skills/review-delta)
- 이 레포 사본: [`plugins/code-review-graph/skills/review-delta/SKILL.md`](../../plugins/code-review-graph/skills/review-delta/SKILL.md)

### `/review-pr`

Review a PR or branch diff using the knowledge graph for full structural context. Outputs a structured review with blast-radius analysis.

- 호출: `/review-pr [PR number or branch name]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [tirth8205/code-review-graph](https://github.com/tirth8205/code-review-graph/tree/HEAD/skills/review-pr)
- 이 레포 사본: [`plugins/code-review-graph/skills/review-pr/SKILL.md`](../../plugins/code-review-graph/skills/review-pr/SKILL.md)
