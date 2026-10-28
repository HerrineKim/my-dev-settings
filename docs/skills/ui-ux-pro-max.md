# ui-ux-pro-max

UI/UX 디자인 스킬 묶음(7개). 스타일·팔레트·폰트 조합·UX 가이드·차트·스택별 구현 데이터를 검색해 판단 근거로 쓴다. 출처: [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill). 원문 README: [`../upstream/ui-ux-pro-max/README.md`](../upstream/ui-ux-pro-max/README.md)

## 준비
- Python 3(검색 스크립트)

## 사용 예
- `/ui-ux-pro-max 핀테크 대시보드 랜딩 페이지`
- `/design-system` 으로 토큰 구조 잡기, `/ui-styling` 으로 shadcn/ui 구현
- `/slides 분기 실적 발표 10장`

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (7개)

### `/banner-design`

Design banners for social media, ads, website heroes, creative assets, and print. Multiple art direction options with optional generated or supplied visuals. Actions: design, create, generate banner. Platforms: Facebook, Twitter/X, LinkedIn, YouTube, Instagram, Google Display, website hero, print. Styles: minimalist, gradient, bold typography, photo-based, illustrated, geometric, retro, glassmorphism, 3D, neon, duotone, editorial, collage.

- 호출: `/banner-design [platform] [style] [dimensions]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/tree/HEAD/.claude/skills/banner-design)
- 이 레포 사본: [`plugins/ui-ux-pro-max/skills/banner-design/SKILL.md`](../../plugins/ui-ux-pro-max/skills/banner-design/SKILL.md)

### `/brand`

Brand voice, visual identity, messaging frameworks, asset management, brand consistency. Activate for branded content, tone of voice, marketing assets, brand compliance, style guides.

- 호출: `/brand [update|review|create] [args]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`, `scripts/`, `templates/`
- 원조 GitHub: [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/tree/HEAD/.claude/skills/brand)
- 이 레포 사본: [`plugins/ui-ux-pro-max/skills/brand/SKILL.md`](../../plugins/ui-ux-pro-max/skills/brand/SKILL.md)

### `/design`

Comprehensive design skill: brand identity, design tokens, UI styling, logo generation (55 styles, Gemini, Atlas Cloud, or MuAPI AI), corporate identity program (50 deliverables, CIP mockups), HTML presentations (Chart.js), banner design (22 styles, social/ads/web/print), icon design (15 styles, SVG, Gemini 3.1 Pro), social photos (HTML→screenshot, multi-platform). Actions: design logo, create CIP, generate mockups, build slides, design banner, generate icon, create social photos, social media images, brand identity, design system. Platforms: Facebook, Twitter, LinkedIn, YouTube, Instagram, Pinterest, TikTok, Threads, Google Ads.

- 호출: `/design [design-type] [context]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `data/`, `references/`, `scripts/`
- 원조 GitHub: [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/tree/HEAD/.claude/skills/design)
- 이 레포 사본: [`plugins/ui-ux-pro-max/skills/design/SKILL.md`](../../plugins/ui-ux-pro-max/skills/design/SKILL.md)

### `/design-system`

Token architecture, component specifications, and slide generation. Three-layer tokens (primitive→semantic→component), CSS variables, spacing/typography scales, component specs, strategic slide creation. Use for design tokens, systematic design, brand-compliant presentations.

- 호출: `/design-system [component or token]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `data/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/tree/HEAD/.claude/skills/design-system)
- 이 레포 사본: [`plugins/ui-ux-pro-max/skills/design-system/SKILL.md`](../../plugins/ui-ux-pro-max/skills/design-system/SKILL.md)

### `/slides`

Create strategic HTML presentations with Chart.js, design tokens, responsive layouts, copywriting formulas, and contextual slide strategies.

- 호출: `/slides [topic] [slide-count]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/tree/HEAD/.claude/skills/slides)
- 이 레포 사본: [`plugins/ui-ux-pro-max/skills/slides/SKILL.md`](../../plugins/ui-ux-pro-max/skills/slides/SKILL.md)

### `/ui-styling`

Create beautiful, accessible user interfaces with shadcn/ui components (built on Radix UI + Tailwind), Tailwind CSS utility-first styling, and canvas-based visual designs. Use when building user interfaces, implementing design systems, creating responsive layouts, adding accessible components (dialogs, dropdowns, forms, tables), customizing themes and colors, implementing dark mode, generating visual designs and posters, or establishing consistent styling patterns across applications.

- 호출: `/ui-styling [component or layout]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `canvas-fonts/`, `references/`, `scripts/`
- 원조 GitHub: [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/tree/HEAD/.claude/skills/ui-styling)
- 이 레포 사본: [`plugins/ui-ux-pro-max/skills/ui-styling/SKILL.md`](../../plugins/ui-ux-pro-max/skills/ui-styling/SKILL.md)

### `/ui-ux-pro-max`

UI/UX design intelligence for web, mobile, and desktop. This skill should be used when designing, building, reviewing, or fixing interfaces, including pages, components, design systems, accessibility, interaction, responsive layout, typography, color, charts, and stack-specific UI implementation. Searchable local data: 79 searchable styles (50 active), 192 product palettes and reasoning profiles, 74 font pairings, 119 UX guidelines, 105 icons, 17 GSAP presets, 25 chart types, and 22 stacks.

- 호출: `/ui-ux-pro-max` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `data/`, `references/`, `scripts/`
- 원조 GitHub: [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/tree/HEAD/.claude/skills/ui-ux-pro-max)
- 이 레포 사본: [`plugins/ui-ux-pro-max/skills/ui-ux-pro-max/SKILL.md`](../../plugins/ui-ux-pro-max/skills/ui-ux-pro-max/SKILL.md)
