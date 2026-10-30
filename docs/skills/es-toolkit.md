# es-toolkit

토스 es-toolkit 공식 스킬: 설치·import 가이드, 함수 추천, lodash 마이그레이션(이름에 es-toolkit- 접두어)

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (3개)

### `/es-toolkit-guide`

es-toolkit usage guide covering installation, import patterns, and setup for Node.js, Bun, Deno, and browsers. Use when the user asks how to install, import, or set up es-toolkit in their project.

- 호출: `/es-toolkit-guide [topic: install, import, setup, bundle, performance]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [toss/es-toolkit](https://github.com/toss/es-toolkit/tree/HEAD/es-toolkit-plugin/skills)
- 이 레포 사본: [`plugins/es-toolkit/skills/es-toolkit-guide/SKILL.md`](../../plugins/es-toolkit/skills/es-toolkit-guide/SKILL.md)

### `/es-toolkit-migrate`

Guide migrating lodash code to es-toolkit. Use when the user wants to migrate from lodash, replace lodash imports, reduce bundle size by switching to es-toolkit, or understand the difference between es-toolkit and es-toolkit/compat.

- 호출: `/es-toolkit-migrate <paste lodash code, function names, or ask about strict vs compat>` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [toss/es-toolkit](https://github.com/toss/es-toolkit/tree/HEAD/es-toolkit-plugin/skills)
- 이 레포 사본: [`plugins/es-toolkit/skills/es-toolkit-migrate/SKILL.md`](../../plugins/es-toolkit/skills/es-toolkit-migrate/SKILL.md)

### `/es-toolkit-recommend`

Analyze code or requirements and recommend the best es-toolkit functions. Use when the user asks which es-toolkit function to use, needs help finding a utility, or wants alternatives to manual implementations.

- 호출: `/es-toolkit-recommend <description of what you need or paste your code>` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [toss/es-toolkit](https://github.com/toss/es-toolkit/tree/HEAD/es-toolkit-plugin/skills)
- 이 레포 사본: [`plugins/es-toolkit/skills/es-toolkit-recommend/SKILL.md`](../../plugins/es-toolkit/skills/es-toolkit-recommend/SKILL.md)
