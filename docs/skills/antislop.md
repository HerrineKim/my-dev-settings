# antislop

생성 결과의 뻔한 AI 티를 걸러내는 필터(6개). 스타일을 정해 주지 않고 걸러내기만 한다. 출처: [miqdadbadjuber/anti-slop](https://github.com/miqdadbadjuber/anti-slop) (MIT). 원문 README: [`../upstream/antislop/README.md`](../upstream/antislop/README.md). 원조는 플러그인에 대비 검사 MCP 서버도 있지만 여기서는 스킬 폴더만 받는다

## 사용 예
- `/antislop`(핵심 규칙)을 기본으로 켜고, 작업에 따라 `/antislop-ui`, `/antislop-copywriting`, `/antislop-code`, `/antislop-human`, `/antislop-layoutmobile`을 함께 쓴다
- `/antislop-human`의 대비 계산 스크립트: 스킬 폴더 `scripts/` 참고

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (6개)

### `/antislop`

Anti Slop: Rules for AI Coding Agents. The core filter. Load always to stop generic AI slop.

- 호출: `/antislop` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [miqdadbadjuber/anti-slop](https://github.com/miqdadbadjuber/anti-slop/tree/HEAD/skills/antislop)
- 이 레포 사본: [`plugins/antislop/skills/antislop/SKILL.md`](../../plugins/antislop/skills/antislop/SKILL.md)

### `/antislop-code`

Code comment hygiene for AI coding agents: remove generic AI-slop comments, keep the valuable ones, never touch the code.

- 호출: `/antislop-code` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [miqdadbadjuber/anti-slop](https://github.com/miqdadbadjuber/anti-slop/tree/HEAD/skills/antislop-code)
- 이 레포 사본: [`plugins/antislop/skills/antislop-code/SKILL.md`](../../plugins/antislop/skills/antislop-code/SKILL.md)

### `/antislop-copywriting`

Copy and text skill for antislop. Use when writing or editing prose: headlines, tone, CTAs, and anti-AI-writing patterns. Load with the core.

- 호출: `/antislop-copywriting` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [miqdadbadjuber/anti-slop](https://github.com/miqdadbadjuber/anti-slop/tree/HEAD/skills/antislop-copywriting)
- 이 레포 사본: [`plugins/antislop/skills/antislop-copywriting/SKILL.md`](../../plugins/antislop/skills/antislop-copywriting/SKILL.md)

### `/antislop-human`

Human and accessibility skill for antislop. Contrast, keyboard, focus, states, and interaction affordances for real people. Includes the contrast checker.

- 호출: `/antislop-human` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [miqdadbadjuber/anti-slop](https://github.com/miqdadbadjuber/anti-slop/tree/HEAD/skills/antislop-human)
- 이 레포 사본: [`plugins/antislop/skills/antislop-human/SKILL.md`](../../plugins/antislop/skills/antislop-human/SKILL.md)

### `/antislop-layoutmobile`

Mobile layout skill for antislop. Use for layouts that reflow across screen sizes, phone to desktop: grids, overflow, tap targets. Load with the core.

- 호출: `/antislop-layoutmobile` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [miqdadbadjuber/anti-slop](https://github.com/miqdadbadjuber/anti-slop/tree/HEAD/skills/antislop-layoutmobile)
- 이 레포 사본: [`plugins/antislop/skills/antislop-layoutmobile/SKILL.md`](../../plugins/antislop/skills/antislop-layoutmobile/SKILL.md)

### `/antislop-ui`

UI and visual skill for antislop. Use when building or editing any interface: color, layout, components, motion, and page performance. Load with the core.

- 호출: `/antislop-ui` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [miqdadbadjuber/anti-slop](https://github.com/miqdadbadjuber/anti-slop/tree/HEAD/skills/antislop-ui)
- 이 레포 사본: [`plugins/antislop/skills/antislop-ui/SKILL.md`](../../plugins/antislop/skills/antislop-ui/SKILL.md)
