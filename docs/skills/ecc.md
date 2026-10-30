# ecc

[affaan-m/ECC](https://github.com/affaan-m/ECC)(MIT)에서 `skills/`의 스킬 314개만 받아 둔 묶음. ECC 자체는 에이전트 71개·훅·룰·커맨드까지 갖춘 하네스지만, oh-my-claudecode와 훅·에이전트 역할이 겹쳐 스킬만 가져왔다.

## 전역 링크
플러그인 전체는 `skills-exclude`로 빼고, `!ecc/<스킬>` 줄에 적은 것만 `~/.claude/skills`에 링크한다.

| 스킬 | 고른 이유 |
|---|---|
| `nextjs-turbopack` | Next.js 16 + Turbopack, middleware.ts에서 proxy.ts로 바뀐 점 |
| `react-patterns` | 서버·클라이언트 컴포넌트 경계, Suspense, form actions |
| `react-performance` | Vercel React Best Practices 기반 성능 규칙 |
| `react-testing` | RTL·Vitest·MSW·axe, 컴포넌트 테스트와 E2E의 경계 |
| `typescript-patterns` | strict 설정, 타입 설계, 좁히기, 에러 처리 |
| `browser-qa` | 배포 후 브라우저 MCP로 콘솔 에러·Web Vitals·폼 흐름 점검 |

다른 스킬을 더하려면 `skills-exclude`에 `!ecc/<스킬>` 줄을 넣고 `./install.sh`를 다시 실행한다.

## 주의
- 이름이 겹치는 스킬(`design-system`, `make-interfaces-feel-better`, `seo`)은 전역 링크하지 않는다. 기존 플러그인 것이 그대로 쓰인다.
- 일부 스킬은 ECC 에이전트(예: `search-first`의 researcher)나 훅을 전제로 해서, 스킬만으로는 일부 단계가 동작하지 않을 수 있다.
- ECC 전체(훅·에이전트 포함)를 쓰려면 공식 설치(`npx ecc-universal setup` 또는 `ecc@ecc` 플러그인)를 따로 해야 하며, oh-my-claudecode와 같이 쓰면 훅이 겹친다.
- 딸린 스크립트는 복사만 하고 실행하지 않았다.
- 업스트림 원문 문서는 [`../upstream/ecc/`](../upstream/ecc/)에 있다.

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (314개)

### `/accessibility`

Design, implement, and audit accessible UI to WCAG 2.2 Level AA across Web, iOS, and Android — semantic ARIA roles and labels, accessibility traits and hints, focus management, contrast, target size, and screen-reader support. Use when building or auditing UI for accessibility compliance, keyboard navigation, or screen-reader support.

- 호출: `/accessibility` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/accessibility)
- 이 레포 사본: [`plugins/ecc/skills/accessibility/SKILL.md`](../../plugins/ecc/skills/accessibility/SKILL.md)

### `/agent-architecture-audit`

Full-stack diagnostic for agent and LLM applications. Audits the 12-layer agent stack for wrapper regression, memory pollution, tool discipline failures, hidden repair loops, and rendering corruption. Produces severity-ranked findings with code-first fixes. Essential for developers building agent applications, autonomous loops, or any LLM-powered feature. Use when an agent or LLM feature misbehaves and the failing layer is unknown, or before shipping an agent stack.

- 호출: `/agent-architecture-audit` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/agent-architecture-audit)
- 이 레포 사본: [`plugins/ecc/skills/agent-architecture-audit/SKILL.md`](../../plugins/ecc/skills/agent-architecture-audit/SKILL.md)

### `/agent-eval`

Head-to-head comparison of coding agents (Claude Code, Aider, Codex, etc.) on custom tasks with pass rate, cost, time, and consistency metrics. Use when choosing between coding agents, or when a change to an agent setup needs measured pass rate, cost, and time rather than an impression.

- 호출: `/agent-eval` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/agent-eval)
- 이 레포 사본: [`plugins/ecc/skills/agent-eval/SKILL.md`](../../plugins/ecc/skills/agent-eval/SKILL.md)

### `/agent-harness-construction`

Design and optimize AI agent action spaces, tool definitions, and observation formatting for higher completion rates. Use when defining or revising an agent's tool set, action space, or observation format.

- 호출: `/agent-harness-construction` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/agent-harness-construction)
- 이 레포 사본: [`plugins/ecc/skills/agent-harness-construction/SKILL.md`](../../plugins/ecc/skills/agent-harness-construction/SKILL.md)

### `/agent-introspection-debugging`

Structured self-debugging workflow for AI agent failures using capture, diagnosis, contained recovery, and introspection reports. Use when an agent run fails and you need a reproducible diagnosis instead of a retry.

- 호출: `/agent-introspection-debugging` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/agent-introspection-debugging)
- 이 레포 사본: [`plugins/ecc/skills/agent-introspection-debugging/SKILL.md`](../../plugins/ecc/skills/agent-introspection-debugging/SKILL.md)

### `/agent-payment-x402`

Add x402 payment execution to AI agents with per-task budgets, spending controls, and non-custodial wallets. Supports Base through agentwallet-sdk, X Layer through OKX Payments / OKX Agent Payments Protocol, and Solana plus multi-network EVM through the upstream x402 packages with facilitator-based settlement. Use when an agent must pay for something itself and needs per-task budgets, spending controls, and a non-custodial wallet.

- 호출: `/agent-payment-x402` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/agent-payment-x402)
- 이 레포 사본: [`plugins/ecc/skills/agent-payment-x402/SKILL.md`](../../plugins/ecc/skills/agent-payment-x402/SKILL.md)

### `/agent-runtime-gateway-smoke-test`

Verify a local agent API, temporary gateway tunnel, and remote sandbox callback with a tool-free task, then restore the original app connection.

- 호출: `/agent-runtime-gateway-smoke-test` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/agent-runtime-gateway-smoke-test)
- 이 레포 사본: [`plugins/ecc/skills/agent-runtime-gateway-smoke-test/SKILL.md`](../../plugins/ecc/skills/agent-runtime-gateway-smoke-test/SKILL.md)

### `/agent-security-hardening`

Security hardening guidance for AI agent frameworks that process untrusted content, invoke tools, write workspace files, manage runtime identifiers, or handle credentials. Use when building or reviewing an agent runtime, autonomous worker, tool gateway, memory service, or multi-tenant agent deployment. Do not use for general web application security or offensive testing.

- 호출: `/agent-security-hardening` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/agent-security-hardening)
- 이 레포 사본: [`plugins/ecc/skills/agent-security-hardening/SKILL.md`](../../plugins/ecc/skills/agent-security-hardening/SKILL.md)

### `/agent-self-evaluation`

Use after completing any non-trivial task. The agent self-rates its output on 5 axes — accuracy, completeness, clarity, actionability, conciseness — with concrete evidence per criterion. Produces a structured 1-5 scorecard with specific improvement suggestions.

- 호출: `/agent-self-evaluation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/agent-self-evaluation)
- 이 레포 사본: [`plugins/ecc/skills/agent-self-evaluation/SKILL.md`](../../plugins/ecc/skills/agent-self-evaluation/SKILL.md)

### `/agent-sort`

Build an evidence-backed ECC install plan for a specific repo by sorting skills, commands, rules, hooks, and extras into DAILY vs LIBRARY buckets using parallel repo-aware review passes. Use when ECC should be trimmed to what a project actually needs instead of loading the full bundle.

- 호출: `/agent-sort` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/agent-sort)
- 이 레포 사본: [`plugins/ecc/skills/agent-sort/SKILL.md`](../../plugins/ecc/skills/agent-sort/SKILL.md)

### `/agentic-engineering`

Operate as an agentic engineer using eval-first execution, decomposition, and cost-aware model routing. Use when planning or executing engineering work that agents will carry out end to end.

- 호출: `/agentic-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/agentic-engineering)
- 이 레포 사본: [`plugins/ecc/skills/agentic-engineering/SKILL.md`](../../plugins/ecc/skills/agentic-engineering/SKILL.md)

### `/agentic-os`

Build persistent multi-agent operating systems on Claude Code. Covers kernel architecture, specialist agents, slash commands, file-based memory, scheduled automation, and state management without external databases. Use when building a persistent multi-agent system on Claude Code with its own memory, commands, and scheduling.

- 호출: `/agentic-os` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/agentic-os)
- 이 레포 사본: [`plugins/ecc/skills/agentic-os/SKILL.md`](../../plugins/ecc/skills/agentic-os/SKILL.md)

### `/ai-first-engineering`

Engineering operating model for teams where AI agents generate a large share of implementation output. Use when setting team process, review gates, or ownership rules for a codebase largely written by agents.

- 호출: `/ai-first-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ai-first-engineering)
- 이 레포 사본: [`plugins/ecc/skills/ai-first-engineering/SKILL.md`](../../plugins/ecc/skills/ai-first-engineering/SKILL.md)

### `/ai-regression-testing`

Regression testing strategies for AI-assisted development. Sandbox-mode API testing without database dependencies, automated bug-check workflows, and patterns to catch AI blind spots where the same model writes and reviews code. Use when adding regression coverage to AI-assisted code, or when the same model both wrote and reviewed a change.

- 호출: `/ai-regression-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ai-regression-testing)
- 이 레포 사본: [`plugins/ecc/skills/ai-regression-testing/SKILL.md`](../../plugins/ecc/skills/ai-regression-testing/SKILL.md)

### `/android-clean-architecture`

Clean Architecture patterns for Android and Kotlin Multiplatform projects — module structure, dependency rules, UseCases, Repositories, and data layer patterns. Use when structuring modules, layers, or data flow in an Android or KMP project.

- 호출: `/android-clean-architecture` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/android-clean-architecture)
- 이 레포 사본: [`plugins/ecc/skills/android-clean-architecture/SKILL.md`](../../plugins/ecc/skills/android-clean-architecture/SKILL.md)

### `/angular-developer`

Generates Angular code and provides architectural guidance. Trigger when creating projects, components, or services, or for best practices on reactivity (signals, linkedSignal, resource), forms, dependency injection, routing, SSR, accessibility (ARIA), animations, styling (component styles, Tailwind CSS), testing, or CLI tooling.

- 호출: `/angular-developer` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/angular-developer)
- 이 레포 사본: [`plugins/ecc/skills/angular-developer/SKILL.md`](../../plugins/ecc/skills/angular-developer/SKILL.md)

### `/api-connector-builder`

Build a new API connector or provider by matching the target repo's existing integration pattern exactly. Use when adding one more integration without inventing a second architecture.

- 호출: `/api-connector-builder` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/api-connector-builder)
- 이 레포 사본: [`plugins/ecc/skills/api-connector-builder/SKILL.md`](../../plugins/ecc/skills/api-connector-builder/SKILL.md)

### `/api-design`

REST API design patterns including resource naming, status codes, pagination, filtering, error responses, versioning, and rate limiting for production APIs. Use when designing or reviewing REST endpoints, resource names, status codes, pagination, or versioning.

- 호출: `/api-design` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/api-design)
- 이 레포 사본: [`plugins/ecc/skills/api-design/SKILL.md`](../../plugins/ecc/skills/api-design/SKILL.md)

### `/architecture-decision-records`

Capture architectural decisions as numbered ADR markdown files in docs/adr/ with context, alternatives considered, consequences, and an index README. Use when the user says 'record this decision' or 'ADR this', chooses between frameworks or databases, discusses trade-offs, or asks why the codebase is shaped this way.

- 호출: `/architecture-decision-records` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/architecture-decision-records)
- 이 레포 사본: [`plugins/ecc/skills/architecture-decision-records/SKILL.md`](../../plugins/ecc/skills/architecture-decision-records/SKILL.md)

### `/article-writing`

Write articles, guides, blog posts, tutorials, newsletter issues, and other long-form content in a distinctive voice derived from supplied examples or brand guidance. Use when the user wants polished written content longer than a paragraph, especially when voice consistency, structure, and credibility matter.

- 호출: `/article-writing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/article-writing)
- 이 레포 사본: [`plugins/ecc/skills/article-writing/SKILL.md`](../../plugins/ecc/skills/article-writing/SKILL.md)

### `/automation-audit-ops`

Evidence-first automation inventory and overlap audit workflow for ECC. Use when the user wants to know which jobs, hooks, connectors, MCP servers, or wrappers are live, broken, redundant, or missing before fixing anything.

- 호출: `/automation-audit-ops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/automation-audit-ops)
- 이 레포 사본: [`plugins/ecc/skills/automation-audit-ops/SKILL.md`](../../plugins/ecc/skills/automation-audit-ops/SKILL.md)

### `/autonomous-agent-harness`

Transform Claude Code into a fully autonomous agent system with persistent memory, scheduled operations, computer use, and task queuing. Replaces standalone agent frameworks (Hermes, AutoGPT) by leveraging Claude Code's native crons, dispatch, MCP tools, and memory. Use when the user wants continuous autonomous operation, scheduled tasks, or a self-directing agent loop.

- 호출: `/autonomous-agent-harness` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/autonomous-agent-harness)
- 이 레포 사본: [`plugins/ecc/skills/autonomous-agent-harness/SKILL.md`](../../plugins/ecc/skills/autonomous-agent-harness/SKILL.md)

### `/autonomous-loops`

Patterns and architectures for autonomous Claude Code loops — from simple sequential pipelines to RFC-driven multi-agent DAG systems. Retained for compatibility only: when new autonomous loop guidance is needed, use continuous-agent-loop instead.

- 호출: `/autonomous-loops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/autonomous-loops)
- 이 레포 사본: [`plugins/ecc/skills/autonomous-loops/SKILL.md`](../../plugins/ecc/skills/autonomous-loops/SKILL.md)

### `/backend-patterns`

Backend architecture patterns, API design, database optimization, and server-side best practices for Node.js, Express, and Next.js API routes. Use when building or reviewing Node.js, Express, or Next.js API routes and their data access.

- 호출: `/backend-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/backend-patterns)
- 이 레포 사본: [`plugins/ecc/skills/backend-patterns/SKILL.md`](../../plugins/ecc/skills/backend-patterns/SKILL.md)

### `/benchmark`

Measure performance baselines and detect regressions across browser Core Web Vitals (LCP, INP, CLS, page weight), API endpoint latency percentiles, and build/test feedback times, with before/after comparison stored in git-tracked .ecc/benchmarks JSON. Use when checking page speed, responding to 'it feels slow' reports, verifying launch performance targets, or comparing stack alternatives.

- 호출: `/benchmark` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/benchmark)
- 이 레포 사본: [`plugins/ecc/skills/benchmark/SKILL.md`](../../plugins/ecc/skills/benchmark/SKILL.md)

### `/benchmark-methodology`

Score a scoped competitor set into comparable profile cards: nine weighted dimensions (positioning, voice, visual craft, offer packaging, evidence, enterprise-readiness, thought leadership, pricing, client tension) with 1-5 evidence-anchored rubrics and a tension 2x2 plot. Use when benchmarking or scoring competitors, building a competitive comparison matrix, or grading rival positioning before assembling the report; runs after competitive-platform-analysis and before competitive-report-structure.

- 호출: `/benchmark-methodology` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/benchmark-methodology)
- 이 레포 사본: [`plugins/ecc/skills/benchmark-methodology/SKILL.md`](../../plugins/ecc/skills/benchmark-methodology/SKILL.md)

### `/benchmark-optimization-loop`

Convert 'make it faster' requests into a bounded measured optimization loop — baseline first, generate one-hypothesis variants, benchmark each against a correctness gate, and promote the fastest safe variant with reproducible commands. Use when asked to speed something up, try many variants, run recursive optimization, benchmark latency/throughput/cost, or pick the best implementation by repeated measured tests.

- 호출: `/benchmark-optimization-loop` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/benchmark-optimization-loop)
- 이 레포 사본: [`plugins/ecc/skills/benchmark-optimization-loop/SKILL.md`](../../plugins/ecc/skills/benchmark-optimization-loop/SKILL.md)

### `/bengali-nlp`

Bengali (Bangla) text processing patterns including Unicode normalization, script detection, tokenization, conjunct handling, and Bangla-specific NLP best practices for AI applications.

- 호출: `/bengali-nlp` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/bengali-nlp)
- 이 레포 사본: [`plugins/ecc/skills/bengali-nlp/SKILL.md`](../../plugins/ecc/skills/bengali-nlp/SKILL.md)

### `/blender-motion-state-inspection`

Use this skill when inspecting Blender characters, rigs, poses, animation retargeting, ground contact, facing direction, or model-vs-motion alignment where screenshots alone are not enough.

- 호출: `/blender-motion-state-inspection` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/blender-motion-state-inspection)
- 이 레포 사본: [`plugins/ecc/skills/blender-motion-state-inspection/SKILL.md`](../../plugins/ecc/skills/blender-motion-state-inspection/SKILL.md)

### `/blueprint`

Turn a one-line objective into a step-by-step construction plan for multi-session, multi-agent engineering projects: one-PR-sized steps with self-contained context briefs, dependency graph with parallel-step detection, adversarial review gate, and plan mutation protocol. Use when planning a large feature, refactor, or roadmap that spans multiple PRs or sessions; not for single-PR tasks or when the user says \"just do it\".

- 호출: `/blueprint` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/blueprint)
- 이 레포 사본: [`plugins/ecc/skills/blueprint/SKILL.md`](../../plugins/ecc/skills/blueprint/SKILL.md)

### `/brand-discovery`

Run a structured, resumable multi-session brand identity interview across 8 modules (purpose, positioning, audience, personality, voice, narrative, founder tension) using laddering, 5 Whys, and projective techniques, persisting answers to disk and producing a master brandbook (90_SYNTHESIS.md). Use when creating or repositioning a brand, briefing designers or writers, or making implicit founder knowledge explicit.

- 호출: `/brand-discovery` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/brand-discovery)
- 이 레포 사본: [`plugins/ecc/skills/brand-discovery/SKILL.md`](../../plugins/ecc/skills/brand-discovery/SKILL.md)

### `/brand-voice`

Build a source-derived writing style profile from real posts, essays, launch notes, docs, or site copy, then reuse that profile across content, outreach, and social workflows. Use when the user wants voice consistency without generic AI writing tropes.

- 호출: `/brand-voice` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/brand-voice)
- 이 레포 사본: [`plugins/ecc/skills/brand-voice/SKILL.md`](../../plugins/ecc/skills/brand-voice/SKILL.md)

### `/brownfield-retrospective`

Run the ECC engineering process retroactively against an existing project slice. Audit current state, reconstruct past decisions, produce a four-axis gap register (thinking, coding practice, missing features, technology selection), then execute fixes forward through the plan-TDD-review pipeline. Use when adopting ECC mid-project, taking over an inherited codebase, or asking what was missed and what would have been built differently from day one.

- 호출: `/brownfield-retrospective` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/brownfield-retrospective)
- 이 레포 사본: [`plugins/ecc/skills/brownfield-retrospective/SKILL.md`](../../plugins/ecc/skills/brownfield-retrospective/SKILL.md)

### `/browser-qa`

Run automated post-deploy UI verification with a browser automation MCP (claude-in-chrome, Playwright, or Puppeteer): console-error and Core Web Vitals smoke checks, form and auth-flow interaction tests, screenshot visual regression across three breakpoints, and axe-core accessibility audits ending in a SHIP / DO-NOT-SHIP verdict. Use when testing a deployed feature on staging or preview, before shipping frontend changes, reviewing a frontend PR, or checking responsive layout and accessibility.

- 호출: `/browser-qa` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/browser-qa)
- 이 레포 사본: [`plugins/ecc/skills/browser-qa/SKILL.md`](../../plugins/ecc/skills/browser-qa/SKILL.md)

### `/bun-runtime`

Bun as runtime, package manager, bundler, and test runner. When to choose Bun vs Node, migration notes, and Vercel support.

- 호출: `/bun-runtime` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/bun-runtime)
- 이 레포 사본: [`plugins/ecc/skills/bun-runtime/SKILL.md`](../../plugins/ecc/skills/bun-runtime/SKILL.md)

### `/canary-watch`

Use this skill to monitor and verify a deployed URL after releases — checks HTTP endpoints, SSE streams, static assets, console errors, and performance regressions after deploys, merges, or dependency upgrades. Smoke / canary / post-deploy verification.

- 호출: `/canary-watch` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/canary-watch)
- 이 레포 사본: [`plugins/ecc/skills/canary-watch/SKILL.md`](../../plugins/ecc/skills/canary-watch/SKILL.md)

### `/carrier-relationship-management`

Manage truckload, LTL, and intermodal carrier portfolios: sourcing and FMCSA vetting, freight rate and fuel-surcharge negotiation, RFPs and routing guides, carrier scorecards, allocation, and renewals. Use when onboarding carriers, running freight RFPs, negotiating rates, evaluating carrier performance, reallocating freight, or building freight strategy.

- 호출: `/carrier-relationship-management` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/carrier-relationship-management)
- 이 레포 사본: [`plugins/ecc/skills/carrier-relationship-management/SKILL.md`](../../plugins/ecc/skills/carrier-relationship-management/SKILL.md)

### `/change-impact`

Perform evidence-backed impact analysis before changing code, data, interfaces, or governance documents, then compare the planned impact with the actual diff after implementation. Covers call paths, data and schema, API contracts, tests, documentation, ADRs, deployment, migration, and rollback. Use for cross-module or high-risk changes, database migrations, authentication, public interfaces, blast-radius questions, pre-change checks, and post-implementation alignment.

- 호출: `/change-impact` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/change-impact)
- 이 레포 사본: [`plugins/ecc/skills/change-impact/SKILL.md`](../../plugins/ecc/skills/change-impact/SKILL.md)

### `/cisco-ios-patterns`

Cisco IOS and IOS-XE review patterns for show commands, config hierarchy, wildcard masks, ACL placement, interface hygiene, and safe change-window verification. Use when reading, writing, or reviewing Cisco IOS / IOS-XE configuration or planning a change window.

- 호출: `/cisco-ios-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/cisco-ios-patterns)
- 이 레포 사본: [`plugins/ecc/skills/cisco-ios-patterns/SKILL.md`](../../plugins/ecc/skills/cisco-ios-patterns/SKILL.md)

### `/ck`

Persistent per-project memory for Claude Code (Context Keeper) driven by deterministic Node.js /ck commands: init, save, resume, info, list, forget, and v1-to-v2 migrate, plus a SessionStart hook that injects a compact project brief. Use when context must survive across sessions, saving session state with next steps and decisions, resuming where a previous session left off, or picking up a project without re-explaining it.

- 호출: `/ck` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `commands/`, `hooks/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ck)
- 이 레포 사본: [`plugins/ecc/skills/ck/SKILL.md`](../../plugins/ecc/skills/ck/SKILL.md)

### `/claude-devfleet`

Orchestrate multi-agent coding tasks via Claude DevFleet — plan projects, dispatch parallel agents in isolated worktrees, monitor progress, and read structured reports. Use when dispatching parallel coding agents across isolated worktrees and tracking their reports.

- 호출: `/claude-devfleet` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/claude-devfleet)
- 이 레포 사본: [`plugins/ecc/skills/claude-devfleet/SKILL.md`](../../plugins/ecc/skills/claude-devfleet/SKILL.md)

### `/click-path-audit`

Trace every user-facing button/touchpoint through its full state change sequence to find bugs where functions individually work but cancel each other out, produce wrong final state, or leave the UI in an inconsistent state. Use when: systematic debugging found no bugs but users report broken buttons, or after any major refactor touching shared state stores.

- 호출: `/click-path-audit` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/click-path-audit)
- 이 레포 사본: [`plugins/ecc/skills/click-path-audit/SKILL.md`](../../plugins/ecc/skills/click-path-audit/SKILL.md)

### `/clickhouse-io`

ClickHouse database patterns, query optimization, analytics, and data engineering best practices for high-performance analytical workloads. Use when writing ClickHouse schemas or queries, or when an analytical query is too slow.

- 호출: `/clickhouse-io` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/clickhouse-io)
- 이 레포 사본: [`plugins/ecc/skills/clickhouse-io/SKILL.md`](../../plugins/ecc/skills/clickhouse-io/SKILL.md)

### `/code-tour`

Create CodeTour `.tour` files — persona-targeted, step-by-step walkthroughs with real file and line anchors. Use for onboarding tours, architecture walkthroughs, PR tours, RCA tours, and structured "explain how this works" requests. Use when the user asks for a code tour, onboarding walkthrough, PR tour, or an explanation of how a subsystem works.

- 호출: `/code-tour` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/code-tour)
- 이 레포 사본: [`plugins/ecc/skills/code-tour/SKILL.md`](../../plugins/ecc/skills/code-tour/SKILL.md)

### `/codebase-onboarding`

Analyze an unfamiliar codebase and generate a structured onboarding guide with architecture map, key entry points, conventions, and a starter CLAUDE.md. Use when joining a new project or setting up Claude Code for the first time in a repo.

- 호출: `/codebase-onboarding` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/codebase-onboarding)
- 이 레포 사본: [`plugins/ecc/skills/codebase-onboarding/SKILL.md`](../../plugins/ecc/skills/codebase-onboarding/SKILL.md)

### `/codehealth-mcp`

Real-time structural Code Health via CodeScene MCP — review before edits, verify score deltas after changes, gate commits and PRs. Use when reviewing code quality, refactoring, checking if AI changes degraded a file, or before commit/PR.

- 호출: `/codehealth-mcp` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/codehealth-mcp)
- 이 레포 사본: [`plugins/ecc/skills/codehealth-mcp/SKILL.md`](../../plugins/ecc/skills/codehealth-mcp/SKILL.md)

### `/coding-standards`

Baseline cross-project coding conventions for naming, readability, immutability, and code-quality review. Use detailed frontend or backend skills for framework-specific patterns. Use when reviewing code quality or naming with no framework-specific skill that applies.

- 호출: `/coding-standards` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/coding-standards)
- 이 레포 사본: [`plugins/ecc/skills/coding-standards/SKILL.md`](../../plugins/ecc/skills/coding-standards/SKILL.md)

### `/competitive-platform-analysis`

Use when scoping a competitive landscape — identifying, categorising, and score-filtering a competitor set before any benchmarking begins. Decides who counts as a competitor, which tier they belong to, and which sources to mine. First step in the three-skill competitive pipeline; precedes benchmark-methodology.

- 호출: `/competitive-platform-analysis` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/competitive-platform-analysis)
- 이 레포 사본: [`plugins/ecc/skills/competitive-platform-analysis/SKILL.md`](../../plugins/ecc/skills/competitive-platform-analysis/SKILL.md)

### `/competitive-report-structure`

Assemble scored competitor profile cards (from benchmark-methodology) into a decision-grade competitive report with landscape map, competitor tiers, benchmarking matrix, white-space analysis, strategic recommendations, and team alignment trigger questions. Use when presenting competitive findings to leadership or a board, writing a competitive landscape report, or as the final step of the competitive analysis pipeline.

- 호출: `/competitive-report-structure` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/competitive-report-structure)
- 이 레포 사본: [`plugins/ecc/skills/competitive-report-structure/SKILL.md`](../../plugins/ecc/skills/competitive-report-structure/SKILL.md)

### `/compose-multiplatform-patterns`

Compose Multiplatform and Jetpack Compose patterns for KMP projects — state management, navigation, theming, performance, and platform-specific UI. Use when building Compose or Jetpack Compose UI, state, navigation, or theming in a KMP project.

- 호출: `/compose-multiplatform-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/compose-multiplatform-patterns)
- 이 레포 사본: [`plugins/ecc/skills/compose-multiplatform-patterns/SKILL.md`](../../plugins/ecc/skills/compose-multiplatform-patterns/SKILL.md)

### `/config-gc`

Garbage collection for your Claude Code configuration. Periodically scans ~/.claude (skills, memory, hooks, permissions, MCP servers, caches) for redundant, stale, orphaned, or low-value items, then walks the user through a confirm-each-deletion cleanup. Use when the user says "clean up my config", "config GC", "too many skills", "audit my setup", "my .claude is bloated", or asks for a periodic config review.

- 호출: `/config-gc` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/config-gc)
- 이 레포 사본: [`plugins/ecc/skills/config-gc/SKILL.md`](../../plugins/ecc/skills/config-gc/SKILL.md)

### `/configure-ecc`

Run the conversational ECC setup wizard inside the current harness: inventory the install, collect scope (user/project/local) and hook mode (off/minimal/standard/strict) in Claude Code, use Codex's native plugin lifecycle, or install the project surface under ./.kimi-code, then preview, apply, and verify. Use when installing, updating, reconfiguring, or repairing an ECC installation, changing hook profiles, or moving ECC between install scopes.

- 호출: `/configure-ecc` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/configure-ecc)
- 이 레포 사본: [`plugins/ecc/skills/configure-ecc/SKILL.md`](../../plugins/ecc/skills/configure-ecc/SKILL.md)

### `/connections-optimizer`

Reorganize the user's X and LinkedIn network with review-first pruning, add/follow recommendations, and channel-specific warm outreach drafted in the user's real voice. Use when the user wants to clean up following lists, grow toward current priorities, or rebalance a social graph around higher-signal relationships.

- 호출: `/connections-optimizer` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/connections-optimizer)
- 이 레포 사본: [`plugins/ecc/skills/connections-optimizer/SKILL.md`](../../plugins/ecc/skills/connections-optimizer/SKILL.md)

### `/content-engine`

Create platform-native content systems for X, LinkedIn, TikTok, YouTube, newsletters, and repurposed multi-platform campaigns. Use when the user wants social posts, threads, scripts, content calendars, or one source asset adapted cleanly across platforms.

- 호출: `/content-engine` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/content-engine)
- 이 레포 사본: [`plugins/ecc/skills/content-engine/SKILL.md`](../../plugins/ecc/skills/content-engine/SKILL.md)

### `/content-hash-cache-pattern`

Cache expensive file processing results using SHA-256 content hashes — path-independent, auto-invalidating, with service layer separation. Use when repeated file processing is slow and results should be cached and invalidated by content rather than path.

- 호출: `/content-hash-cache-pattern` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/content-hash-cache-pattern)
- 이 레포 사본: [`plugins/ecc/skills/content-hash-cache-pattern/SKILL.md`](../../plugins/ecc/skills/content-hash-cache-pattern/SKILL.md)

### `/context-and-decisions`

Govern stable domain context with a narrowly scoped CONTEXT.md when needed, and route hard-to-reverse decisions to ECC's existing architecture-decision-records skill. Use when domain terms require repeated explanation, one term has multiple meanings, unclear language causes module-boundary mistakes, or domain semantics must remain separate from architecture decisions.

- 호출: `/context-and-decisions` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`, `templates/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/context-and-decisions)
- 이 레포 사본: [`plugins/ecc/skills/context-and-decisions/SKILL.md`](../../plugins/ecc/skills/context-and-decisions/SKILL.md)

### `/context-budget`

Routes live context checks to the native Codex or Claude Code meter without scanning files, and performs a bounded static component audit only when explicitly requested. Use for context-budget requests about remaining capacity or installed context overhead.

- 호출: `/context-budget` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/context-budget)
- 이 레포 사본: [`plugins/ecc/skills/context-budget/SKILL.md`](../../plugins/ecc/skills/context-budget/SKILL.md)

### `/continuous-agent-loop`

Patterns for continuous autonomous agent loops with quality gates, evals, and recovery controls. Use when running an agent loop that must self-check, gate on evals, and recover from failures.

- 호출: `/continuous-agent-loop` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/continuous-agent-loop)
- 이 레포 사본: [`plugins/ecc/skills/continuous-agent-loop/SKILL.md`](../../plugins/ecc/skills/continuous-agent-loop/SKILL.md)

### `/continuous-learning`

[DEPRECATED - use continuous-learning-v2] Legacy v1 stop-hook skill extractor. v2 is a strict superset with instinct-based, project-scoped, hook-reliable learning. Do not invoke v1: when continuous learning, session learning, or pattern extraction is requested, route to continuous-learning-v2 instead.

- 호출: `/continuous-learning` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/continuous-learning)
- 이 레포 사본: [`plugins/ecc/skills/continuous-learning/SKILL.md`](../../plugins/ecc/skills/continuous-learning/SKILL.md)

### `/continuous-learning-v2`

Instinct-based learning system that observes sessions via hooks, creates atomic instincts with confidence scoring, and evolves them into skills/commands/agents. v2.1 adds project-scoped instincts to prevent cross-project contamination. Use when capturing lessons from a session, managing instincts, or promoting them into skills, commands, or agents.

- 호출: `/continuous-learning-v2` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `agents/`, `hooks/`, `scripts/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/continuous-learning-v2)
- 이 레포 사본: [`plugins/ecc/skills/continuous-learning-v2/SKILL.md`](../../plugins/ecc/skills/continuous-learning-v2/SKILL.md)

### `/contract-first`

Coordinate frontend/backend or service-to-service work through one authoritative machine-checkable contract (OpenAPI, AsyncAPI, Protocol Buffers, or JSON Schema), with generated consumer types and contract-verified integration. Use when parallel consumer and provider work must evolve an API or event schema without field drift, mock/production shape mismatch, or one side silently redefining the interface.

- 호출: `/contract-first` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/contract-first)
- 이 레포 사본: [`plugins/ecc/skills/contract-first/SKILL.md`](../../plugins/ecc/skills/contract-first/SKILL.md)

### `/conventional-commit-review`

Reviews staged changes and drafts a Conventional Commits-compliant commit message with the right type, scope, and length. Use before committing, or when the user asks to write, fix, or review a commit message.

- 호출: `/conventional-commit-review` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/conventional-commit-review)
- 이 레포 사본: [`plugins/ecc/skills/conventional-commit-review/SKILL.md`](../../plugins/ecc/skills/conventional-commit-review/SKILL.md)

### `/cost-aware-llm-pipeline`

Cost optimization patterns for LLM API usage — model routing by task complexity, budget tracking, retry logic, and prompt caching. Use when LLM spend needs to come down, or when routing tasks across model tiers and budgets.

- 호출: `/cost-aware-llm-pipeline` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/cost-aware-llm-pipeline)
- 이 레포 사본: [`plugins/ecc/skills/cost-aware-llm-pipeline/SKILL.md`](../../plugins/ecc/skills/cost-aware-llm-pipeline/SKILL.md)

### `/cost-tracking`

Track and report Claude Code token usage, spending, and budgets from the local ECC cost-tracker metrics log. Use when the user asks about costs, spending, usage, tokens, budgets, or cost breakdowns by model, session, or date.

- 호출: `/cost-tracking` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/cost-tracking)
- 이 레포 사본: [`plugins/ecc/skills/cost-tracking/SKILL.md`](../../plugins/ecc/skills/cost-tracking/SKILL.md)

### `/council`

Convene a four-voice council for ambiguous decisions, tradeoffs, and go/no-go calls. Use when multiple valid paths exist and you need structured disagreement before choosing.

- 호출: `/council` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/council)
- 이 레포 사본: [`plugins/ecc/skills/council/SKILL.md`](../../plugins/ecc/skills/council/SKILL.md)

### `/council-multi-model`

Add one optional external Codex critique after the existing council has produced a decision draft. Use when an ambiguous, high-consequence decision would benefit from a separate model invocation's attempt to break the synthesis. Requires explicit consent before sending the compact draft and disagreement to OpenAI, labels same-provider reviews honestly, and marks the review absent when the adapter is unavailable.

- 호출: `/council-multi-model` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `scripts/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/council-multi-model)
- 이 레포 사본: [`plugins/ecc/skills/council-multi-model/SKILL.md`](../../plugins/ecc/skills/council-multi-model/SKILL.md)

### `/counterparty-channel-discipline`

Per-channel strict prompts, mention gating, silent observation, and a communication autonomy policy for agents that sit in shared channels with external counterparties. Use when an agent joins group chats, shared channels, or DMs where outsiders can read every message and you need it to speak only when addressed, never leak internal context, and route risky content to draft-only approval.

- 호출: `/counterparty-channel-discipline` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/counterparty-channel-discipline)
- 이 레포 사본: [`plugins/ecc/skills/counterparty-channel-discipline/SKILL.md`](../../plugins/ecc/skills/counterparty-channel-discipline/SKILL.md)

### `/cpp-coding-standards`

C++ coding standards based on the C++ Core Guidelines (isocpp.github.io). Use when writing, reviewing, or refactoring C++ code to enforce modern, safe, and idiomatic practices.

- 호출: `/cpp-coding-standards` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/cpp-coding-standards)
- 이 레포 사본: [`plugins/ecc/skills/cpp-coding-standards/SKILL.md`](../../plugins/ecc/skills/cpp-coding-standards/SKILL.md)

### `/cpp-testing`

Use only when writing/updating/fixing C++ tests, configuring GoogleTest/CTest, diagnosing failing or flaky tests, or adding coverage/sanitizers.

- 호출: `/cpp-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/cpp-testing)
- 이 레포 사본: [`plugins/ecc/skills/cpp-testing/SKILL.md`](../../plugins/ecc/skills/cpp-testing/SKILL.md)

### `/crosspost`

Multi-platform content distribution across X, LinkedIn, Threads, and Bluesky. Adapts content per platform using content-engine patterns. Never posts identical content cross-platform. Use when the user wants to distribute content across social platforms.

- 호출: `/crosspost` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/crosspost)
- 이 레포 사본: [`plugins/ecc/skills/crosspost/SKILL.md`](../../plugins/ecc/skills/crosspost/SKILL.md)

### `/csharp-testing`

C# and .NET testing patterns with xUnit, FluentAssertions, mocking, integration tests, and test organization best practices. Use when writing or reviewing xUnit tests, mocks, or integration tests in a C# / .NET project.

- 호출: `/csharp-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/csharp-testing)
- 이 레포 사본: [`plugins/ecc/skills/csharp-testing/SKILL.md`](../../plugins/ecc/skills/csharp-testing/SKILL.md)

### `/customer-billing-ops`

Operate customer billing workflows such as subscriptions, refunds, churn triage, billing-portal recovery, and plan analysis using connected billing tools like Stripe. Use when the user needs to help a customer, inspect subscription state, or manage revenue-impacting billing operations.

- 호출: `/customer-billing-ops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/customer-billing-ops)
- 이 레포 사본: [`plugins/ecc/skills/customer-billing-ops/SKILL.md`](../../plugins/ecc/skills/customer-billing-ops/SKILL.md)

### `/customs-trade-compliance`

Codified customs and trade compliance expertise — HS/HTS tariff classification with GRI rules, commercial invoices and entry documentation, Incoterms 2020, FTA qualification and duty optimization (USMCA, RCEP, FTZs, drawback), denied-party screening, and penalty mitigation across US, EU, UK, and APAC jurisdictions. Use when classifying goods, preparing import/export documentation, screening restricted parties, responding to customs audits or CF-28/penalty notices, or optimizing duties.

- 호출: `/customs-trade-compliance` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/customs-trade-compliance)
- 이 레포 사본: [`plugins/ecc/skills/customs-trade-compliance/SKILL.md`](../../plugins/ecc/skills/customs-trade-compliance/SKILL.md)

### `/dart-flutter-patterns`

Production-ready Dart and Flutter patterns covering null safety, immutable state with Freezed, async composition, widget architecture, state management (BLoC, Riverpod, Provider), GoRouter navigation with auth guards, Dio networking, error handling, and testing. Use when writing or reviewing Dart and Flutter code — state, widgets, navigation, networking, or architecture.

- 호출: `/dart-flutter-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/dart-flutter-patterns)
- 이 레포 사본: [`plugins/ecc/skills/dart-flutter-patterns/SKILL.md`](../../plugins/ecc/skills/dart-flutter-patterns/SKILL.md)

### `/dashboard-builder`

Build monitoring dashboards that answer real operator questions for Grafana, SigNoz, and similar platforms. Use when turning metrics into a working dashboard instead of a vanity board.

- 호출: `/dashboard-builder` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/dashboard-builder)
- 이 레포 사본: [`plugins/ecc/skills/dashboard-builder/SKILL.md`](../../plugins/ecc/skills/dashboard-builder/SKILL.md)

### `/data-scraper-agent`

Build a fully automated AI-powered data collection agent for any public source — job boards, prices, news, GitHub, sports, anything. Runs on a schedule, enriches data with a free LLM (Gemini Flash), stores results in Notion/Sheets/Supabase, and learns from user feedback. Runs 100% free on GitHub Actions. Use when the user wants to monitor, collect, or track any public data automatically.

- 호출: `/data-scraper-agent` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/data-scraper-agent)
- 이 레포 사본: [`plugins/ecc/skills/data-scraper-agent/SKILL.md`](../../plugins/ecc/skills/data-scraper-agent/SKILL.md)

### `/data-throughput-accelerator`

Diagnose and accelerate large data movement — ingestion, backfill, export, ETL, warehouse loading, manifest catch-up, and table synchronization — by isolating the true bottleneck, benchmarking variants, and codifying the fastest path with a hard accounting block proving rows and timestamps cohere. Use when a pipeline or backfill is too slow and must get faster without losing data correctness.

- 호출: `/data-throughput-accelerator` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/data-throughput-accelerator)
- 이 레포 사본: [`plugins/ecc/skills/data-throughput-accelerator/SKILL.md`](../../plugins/ecc/skills/data-throughput-accelerator/SKILL.md)

### `/database-migrations`

Safe, reversible database migration patterns: forward-only production changes, expand-contract zero-downtime renames, concurrent indexes, batched backfills, and per-tool workflows for PostgreSQL, Prisma, Drizzle, Kysely, Django, and golang-migrate. Use when writing a schema or data migration, adding a column or index to a large table, planning a rollback, or preparing a zero-downtime deploy.

- 호출: `/database-migrations` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/database-migrations)
- 이 레포 사본: [`plugins/ecc/skills/database-migrations/SKILL.md`](../../plugins/ecc/skills/database-migrations/SKILL.md)

### `/deep-research`

Produce cited research reports from multiple web sources using firecrawl and exa MCP tools — plan sub-questions, search and deep-read sources, then synthesize findings with inline citations and confidence levels. Use when the user asks to research a topic in depth, run a deep dive or investigation, or do competitive analysis, technology evaluation, market sizing, or due diligence on a company.

- 호출: `/deep-research` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/deep-research)
- 이 레포 사본: [`plugins/ecc/skills/deep-research/SKILL.md`](../../plugins/ecc/skills/deep-research/SKILL.md)

### `/deepseek-harness-setup`

Install and operate Everything Claude Code (ECC) on the DeepSeek Harness (DSH): native skill roots (~/.dsh/skills, .agents/skills), the @deepseek-ai/dsh-hooks-claude-code bridge for command hooks, bare-insert patch mounting, generator usage, event-support limits, and update workflow. Use when setting up ECC on DeepSeek Harness, wiring ECC hooks into a DSH profile, or debugging why ECC skills or hooks do not appear in a DSH session.

- 호출: `/deepseek-harness-setup` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/deepseek-harness-setup)
- 이 레포 사본: [`plugins/ecc/skills/deepseek-harness-setup/SKILL.md`](../../plugins/ecc/skills/deepseek-harness-setup/SKILL.md)

### `/defi-amm-security`

Security checklist for Solidity AMM contracts, liquidity pools, and swap flows. Covers reentrancy, CEI ordering, donation or inflation attacks, oracle manipulation, slippage, admin controls, and integer math. Use when auditing or writing Solidity AMM, liquidity pool, or swap code.

- 호출: `/defi-amm-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/defi-amm-security)
- 이 레포 사본: [`plugins/ecc/skills/defi-amm-security/SKILL.md`](../../plugins/ecc/skills/defi-amm-security/SKILL.md)

### `/delivery-gate`

Stop hook that blocks Claude from finishing until quality checks pass. Detects rationalization patterns (surface text heuristics), stale learning logs (filesystem mtime), and low disk space. Complements self-audit by mechanically enforcing learning capture habits. Use when Claude should be mechanically blocked from declaring work finished before quality checks and learning capture actually pass.

- 호출: `/delivery-gate` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `hooks/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/delivery-gate)
- 이 레포 사본: [`plugins/ecc/skills/delivery-gate/SKILL.md`](../../plugins/ecc/skills/delivery-gate/SKILL.md)

### `/deployment-patterns`

Deployment workflows, CI/CD pipeline patterns, Docker containerization, health checks, rollback strategies, and production readiness checklists for web applications. Use when setting up CI/CD, containerizing an app, or checking production readiness before a release.

- 호출: `/deployment-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/deployment-patterns)
- 이 레포 사본: [`plugins/ecc/skills/deployment-patterns/SKILL.md`](../../plugins/ecc/skills/deployment-patterns/SKILL.md)

### `/design-system`

Generate a design system from an existing codebase or audit one for visual consistency: extract tokens (colors, typography, spacing, shadows) into design-tokens.json and CSS custom properties with DESIGN.md rationale and an interactive HTML preview, score the UI across 10 dimensions, and flag AI-slop patterns. Use when starting a design system, auditing visual consistency before a redesign, or reviewing a PR that touches styling.

- 호출: `/design-system` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/design-system)
- 이 레포 사본: [`plugins/ecc/skills/design-system/SKILL.md`](../../plugins/ecc/skills/design-system/SKILL.md)

### `/dev-team`

Simulate a collaborative dev team session where multiple role-based personas (PM, Architect, Developer, QA) respond to the same problem together in one session. Use when designing a feature, reviewing a proposal, or onboarding a new initiative and you want multi-role perspective without switching agents manually.

- 호출: `/dev-team` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/dev-team)
- 이 레포 사본: [`plugins/ecc/skills/dev-team/SKILL.md`](../../plugins/ecc/skills/dev-team/SKILL.md)

### `/django-celery`

Django + Celery async task patterns — configuration, task design, beat scheduling, retries, canvas workflows, monitoring, and testing. Use when adding background jobs, scheduled tasks, or async processing to a Django app.

- 호출: `/django-celery` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/django-celery)
- 이 레포 사본: [`plugins/ecc/skills/django-celery/SKILL.md`](../../plugins/ecc/skills/django-celery/SKILL.md)

### `/django-patterns`

Django architecture patterns, REST API design with DRF, ORM best practices, caching, signals, middleware, and production-grade Django apps. Use when building or reviewing Django apps, DRF APIs, ORM queries, or caching.

- 호출: `/django-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/django-patterns)
- 이 레포 사본: [`plugins/ecc/skills/django-patterns/SKILL.md`](../../plugins/ecc/skills/django-patterns/SKILL.md)

### `/django-security`

Django security best practices, authentication, authorization, CSRF protection, SQL injection prevention, XSS prevention, and secure deployment configurations. Use when reviewing Django authentication, authorization, input handling, or deployment settings.

- 호출: `/django-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/django-security)
- 이 레포 사본: [`plugins/ecc/skills/django-security/SKILL.md`](../../plugins/ecc/skills/django-security/SKILL.md)

### `/django-tdd`

Django testing strategies with pytest-django, TDD methodology, factory_boy, mocking, coverage, and testing Django REST Framework APIs. Use when writing Django or DRF tests with pytest-django, or driving a Django feature test-first.

- 호출: `/django-tdd` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/django-tdd)
- 이 레포 사본: [`plugins/ecc/skills/django-tdd/SKILL.md`](../../plugins/ecc/skills/django-tdd/SKILL.md)

### `/django-verification`

Run the full Django verification loop — environment check, mypy/ruff/black linting, migration safety, pytest with coverage targets, pip-audit and bandit security scans, settings and logging review, and diff review — producing a phased pass/fail report before release or PR. Use when preparing a Django pull request, validating migrations or coverage, or running pre-deploy readiness checks.

- 호출: `/django-verification` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/django-verification)
- 이 레포 사본: [`plugins/ecc/skills/django-verification/SKILL.md`](../../plugins/ecc/skills/django-verification/SKILL.md)

### `/dmux-workflows`

Multi-agent orchestration using dmux (tmux pane manager for AI agents). Patterns for parallel agent workflows across Claude Code, Codex, OpenCode, and other harnesses. Use when running multiple agent sessions in parallel or coordinating multi-agent development workflows.

- 호출: `/dmux-workflows` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/dmux-workflows)
- 이 레포 사본: [`plugins/ecc/skills/dmux-workflows/SKILL.md`](../../plugins/ecc/skills/dmux-workflows/SKILL.md)

### `/docker-patterns`

Docker and Docker Compose patterns for local development, hardened CLI installer harnesses, container security, networking, volumes, and multi-service orchestration. Use when creating or reviewing Dockerfiles and Compose services, testing installers across Linux distributions, or planning accurate native macOS and Windows validation.

- 호출: `/docker-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/docker-patterns)
- 이 레포 사본: [`plugins/ecc/skills/docker-patterns/SKILL.md`](../../plugins/ecc/skills/docker-patterns/SKILL.md)

### `/docs-governance`

Route broad documentation-governance requests to existing ECC skills and run an opt-in, read-only audit of mapped documentation roles, links, ADR indexes, and evidence references. Use when a user asks for documentation governance, project-knowledge organization, documentation integrity, or a deterministic docs audit without naming a narrower skill.

- 호출: `/docs-governance` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`, `scripts/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/docs-governance)
- 이 레포 사본: [`plugins/ecc/skills/docs-governance/SKILL.md`](../../plugins/ecc/skills/docs-governance/SKILL.md)

### `/documentation-lookup`

Use up-to-date library and framework docs via Context7 MCP instead of training data. Activates for setup questions, API references, code examples, or when the user names a framework (e.g. React, Next.js, Prisma).

- 호출: `/documentation-lookup` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/documentation-lookup)
- 이 레포 사본: [`plugins/ecc/skills/documentation-lookup/SKILL.md`](../../plugins/ecc/skills/documentation-lookup/SKILL.md)

### `/dotnet-patterns`

Idiomatic C# and .NET patterns, conventions, dependency injection, async/await, and best practices for building robust, maintainable .NET applications. Use when writing or reviewing C# / .NET code — DI, async, or general conventions.

- 호출: `/dotnet-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/dotnet-patterns)
- 이 레포 사본: [`plugins/ecc/skills/dotnet-patterns/SKILL.md`](../../plugins/ecc/skills/dotnet-patterns/SKILL.md)

### `/dynamic-workflow-mode`

Design task-local harnesses, eval gates, and reusable skill extraction for Claude dynamic workflow mode and other adaptive agent harnesses. Use when building a task-local harness, adding eval gates, or extracting a reusable skill from ad-hoc work.

- 호출: `/dynamic-workflow-mode` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/dynamic-workflow-mode)
- 이 레포 사본: [`plugins/ecc/skills/dynamic-workflow-mode/SKILL.md`](../../plugins/ecc/skills/dynamic-workflow-mode/SKILL.md)

### `/e2e-testing`

Playwright E2E testing patterns, Page Object Model, configuration, CI/CD integration, artifact management, and flaky test strategies. Use when writing Playwright tests, structuring page objects, or fixing flaky E2E runs in CI.

- 호출: `/e2e-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/e2e-testing)
- 이 레포 사본: [`plugins/ecc/skills/e2e-testing/SKILL.md`](../../plugins/ecc/skills/e2e-testing/SKILL.md)

### `/ecc-guide`

Answer questions about ECC by reading the live repo surface — agents, skills, commands, hooks, rules, install profiles, and docs — instead of memory. Use when the user asks what ECC includes, how to install or reset it, which skill or command fits a task, or how project onboarding works.

- 호출: `/ecc-guide` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ecc-guide)
- 이 레포 사본: [`plugins/ecc/skills/ecc-guide/SKILL.md`](../../plugins/ecc/skills/ecc-guide/SKILL.md)

### `/ecc-recipes`

Map a described workflow to the right ECC command group with run-order and stop condition, or browse all command-group recipe families read live from the commands directory. Advisory only — never executes. Use when asked which commands run a workflow, the command sequence for a task, or to list ECC pipelines; not for executing the task (route to the command itself), single-command docs (use ecc-guide), or prompt rewrites (use prompt-optimizer).

- 호출: `/ecc-recipes <workflow description | empty=list all>` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ecc-recipes)
- 이 레포 사본: [`plugins/ecc/skills/ecc-recipes/SKILL.md`](../../plugins/ecc/skills/ecc-recipes/SKILL.md)

### `/ecc-tools-cost-audit`

Evidence-first ECC Tools burn and billing audit workflow. Use when investigating runaway PR creation, quota bypass, premium-model leakage, duplicate jobs, or GitHub App cost spikes in the ECC Tools repo.

- 호출: `/ecc-tools-cost-audit` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ecc-tools-cost-audit)
- 이 레포 사본: [`plugins/ecc/skills/ecc-tools-cost-audit/SKILL.md`](../../plugins/ecc/skills/ecc-tools-cost-audit/SKILL.md)

### `/email-ops`

Evidence-first mailbox triage, drafting, send verification, and sent-mail-safe follow-up workflow for ECC. Use when the user wants to organize email, draft or send through the real mail surface, or prove what landed in Sent.

- 호출: `/email-ops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/email-ops)
- 이 레포 사본: [`plugins/ecc/skills/email-ops/SKILL.md`](../../plugins/ecc/skills/email-ops/SKILL.md)

### `/energy-procurement`

Procure electricity and natural gas for commercial and industrial facilities: tariff and rate-schedule optimization, demand-charge mitigation, supplier RFPs, fixed/index/block-and-index hedging, renewable PPA and REC evaluation, and sustainability reporting. Use when procuring energy, optimizing utility tariffs, managing demand charges, evaluating PPAs, or building energy budgets and hedge strategies.

- 호출: `/energy-procurement` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/energy-procurement)
- 이 레포 사본: [`plugins/ecc/skills/energy-procurement/SKILL.md`](../../plugins/ecc/skills/energy-procurement/SKILL.md)

### `/enterprise-agent-ops`

Operational controls for long-lived or cloud-hosted agent systems — runtime lifecycle (start, pause, stop, restart), observability (logs, metrics, traces), least-privilege safety scopes and kill switches, and rollout/rollback change management with audit logs and success/cost metrics. Use when running production agent fleets on PM2, systemd, or containers that need monitoring, incident response, or deployment gates.

- 호출: `/enterprise-agent-ops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/enterprise-agent-ops)
- 이 레포 사본: [`plugins/ecc/skills/enterprise-agent-ops/SKILL.md`](../../plugins/ecc/skills/enterprise-agent-ops/SKILL.md)

### `/error-handling`

Patterns for robust error handling across TypeScript, Python, and Go. Covers typed errors, error boundaries, retries, circuit breakers, and user-facing error messages. Use when designing error types, retries, circuit breakers, or user-facing failure messages in TypeScript, Python, or Go.

- 호출: `/error-handling` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/error-handling)
- 이 레포 사본: [`plugins/ecc/skills/error-handling/SKILL.md`](../../plugins/ecc/skills/error-handling/SKILL.md)

### `/esign-field-placement`

Deterministic method for placing signature, date, and text fields in a web e-signature composer through a browser automation session, using a fixed signature page, numeric Location panel coordinates instead of drag, and a save-as-draft default. Use when automating envelope preparation for generated agreements and you need repeatable field positions, correct per-recipient ownership, and a hard gate before anything is sent or signed.

- 호출: `/esign-field-placement` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/esign-field-placement)
- 이 레포 사본: [`plugins/ecc/skills/esign-field-placement/SKILL.md`](../../plugins/ecc/skills/esign-field-placement/SKILL.md)

### `/eval-harness`

Eval-driven development (EDD) framework for AI coding sessions — define capability and regression evals before coding, grade with code-based, model-based, rule, or human graders, and track pass@k and pass^k reliability. Use when defining pass/fail criteria for agent tasks, measuring agent reliability, building regression suites for prompt or agent changes, or benchmarking across model versions.

- 호출: `/eval-harness` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/eval-harness)
- 이 레포 사본: [`plugins/ecc/skills/eval-harness/SKILL.md`](../../plugins/ecc/skills/eval-harness/SKILL.md)

### `/evm-token-decimals`

Prevent silent decimal mismatch bugs across EVM chains. Covers runtime decimal lookup, chain-aware caching, bridged-token precision drift, and safe normalization for bots, dashboards, and DeFi tools. Use when handling token amounts across EVM chains, or when a balance, price, or transfer amount is off by orders of magnitude.

- 호출: `/evm-token-decimals` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/evm-token-decimals)
- 이 레포 사본: [`plugins/ecc/skills/evm-token-decimals/SKILL.md`](../../plugins/ecc/skills/evm-token-decimals/SKILL.md)

### `/exa-search`

Neural search via Exa MCP for web, code, and company research. Use when the user needs web search, code examples, company intel, people lookup, or AI-powered deep research with Exa's neural search engine.

- 호출: `/exa-search` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/exa-search)
- 이 레포 사본: [`plugins/ecc/skills/exa-search/SKILL.md`](../../plugins/ecc/skills/exa-search/SKILL.md)

### `/fal-ai-media`

Unified media generation via fal.ai MCP — image, video, and audio. Covers text-to-image (Nano Banana), text/image-to-video (Seedance, Kling, Veo 3), text-to-speech (CSM-1B), and video-to-audio (ThinkSound). Use when the user wants to generate images, videos, or audio with AI.

- 호출: `/fal-ai-media` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/fal-ai-media)
- 이 레포 사본: [`plugins/ecc/skills/fal-ai-media/SKILL.md`](../../plugins/ecc/skills/fal-ai-media/SKILL.md)

### `/fastapi-patterns`

FastAPI best practices covering project structure, Pydantic v2 schemas, dependency injection, async handlers, authentication, authorization, transactional service layers, and testing with httpx and pytest. Use when building or reviewing FastAPI apps — Pydantic schemas, dependencies, async handlers, auth, or tests.

- 호출: `/fastapi-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/fastapi-patterns)
- 이 레포 사본: [`plugins/ecc/skills/fastapi-patterns/SKILL.md`](../../plugins/ecc/skills/fastapi-patterns/SKILL.md)

### `/finance-billing-ops`

Evidence-first revenue, pricing, refunds, team-billing, and billing-model truth workflow for ECC. Use when the user wants a sales snapshot, pricing comparison, duplicate-charge diagnosis, or code-backed billing reality instead of generic payments advice.

- 호출: `/finance-billing-ops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/finance-billing-ops)
- 이 레포 사본: [`plugins/ecc/skills/finance-billing-ops/SKILL.md`](../../plugins/ecc/skills/finance-billing-ops/SKILL.md)

### `/flox-environments`

Create reproducible, cross-platform (macOS/Linux) development environments with Flox, a declarative Nix-based environment manager. Use when setting up project toolchains, installing system-level dependencies (compilers, databases, native libs), pinning exact package versions for a team, onboarding developers, running local services (PostgreSQL, Redis, Kafka), or solving 'works on my machine' problems — including agent/vibe-coding setups that need project-scoped tools without sudo. Also use when the user mentions .flox/, manifest.toml, flox activate, or FloxHub.

- 호출: `/flox-environments` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/flox-environments)
- 이 레포 사본: [`plugins/ecc/skills/flox-environments/SKILL.md`](../../plugins/ecc/skills/flox-environments/SKILL.md)

### `/flutter-dart-code-review`

Library-agnostic Flutter/Dart code review checklist covering widget best practices, state management patterns (BLoC, Riverpod, Provider, GetX, MobX, Signals), Dart idioms, performance, accessibility, security, and clean architecture. Use when reviewing Flutter or Dart code, whatever state management library the project uses.

- 호출: `/flutter-dart-code-review` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/flutter-dart-code-review)
- 이 레포 사본: [`plugins/ecc/skills/flutter-dart-code-review/SKILL.md`](../../plugins/ecc/skills/flutter-dart-code-review/SKILL.md)

### `/foundation-models-on-device`

Apple FoundationModels framework for on-device LLM — text generation, guided generation with @Generable, tool calling, and snapshot streaming in iOS 26+. Use when adding on-device LLM features with Apple FoundationModels on iOS 26+.

- 호출: `/foundation-models-on-device` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/foundation-models-on-device)
- 이 레포 사본: [`plugins/ecc/skills/foundation-models-on-device/SKILL.md`](../../plugins/ecc/skills/foundation-models-on-device/SKILL.md)

### `/frontend-a11y`

Accessibility patterns for React and Next.js — semantic HTML, ARIA attributes, form labeling, keyboard navigation, focus management, and screen reader support. Use when building or reviewing forms, modals, dropdowns, tooltips, or tabs, fixing a11y lint or code-review findings, or wiring up keyboard navigation and focus management.

- 호출: `/frontend-a11y` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/frontend-a11y)
- 이 레포 사본: [`plugins/ecc/skills/frontend-a11y/SKILL.md`](../../plugins/ecc/skills/frontend-a11y/SKILL.md)

### `/frontend-design-direction`

Set an ECC-specific frontend design direction for production UI work. Use when building or improving websites, dashboards, applications, components, landing pages, visual tools, or any web UI that needs stronger product-specific design judgment.

- 호출: `/frontend-design-direction` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `scripts/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/frontend-design-direction)
- 이 레포 사본: [`plugins/ecc/skills/frontend-design-direction/SKILL.md`](../../plugins/ecc/skills/frontend-design-direction/SKILL.md)

### `/frontend-patterns`

Frontend development patterns for React, Next.js, state management, performance optimization, and UI best practices. Use when building or reviewing React or Next.js components, state, or render performance.

- 호출: `/frontend-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/frontend-patterns)
- 이 레포 사본: [`plugins/ecc/skills/frontend-patterns/SKILL.md`](../../plugins/ecc/skills/frontend-patterns/SKILL.md)

### `/frontend-slides`

Create stunning, animation-rich HTML presentations from scratch or by converting PowerPoint files. Use when the user wants to build a presentation, convert a PPT/PPTX to web, or create slides for a talk/pitch. Helps non-designers discover their aesthetic through visual exploration rather than abstract choices.

- 호출: `/frontend-slides` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `scripts/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/frontend-slides)
- 이 레포 사본: [`plugins/ecc/skills/frontend-slides/SKILL.md`](../../plugins/ecc/skills/frontend-slides/SKILL.md)

### `/fsharp-testing`

F# testing patterns with xUnit, FsUnit, Unquote, FsCheck property-based testing, integration tests, and test organization best practices. Use when writing F# tests with xUnit, FsUnit, Unquote, or FsCheck.

- 호출: `/fsharp-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/fsharp-testing)
- 이 레포 사본: [`plugins/ecc/skills/fsharp-testing/SKILL.md`](../../plugins/ecc/skills/fsharp-testing/SKILL.md)

### `/gan-style-harness`

GAN-inspired Generator-Evaluator agent harness for building high-quality applications autonomously. Based on Anthropic's March 2026 harness design paper. Use when a feature should be built autonomously through generator and evaluator iteration until it clears a quality bar.

- 호출: `/gan-style-harness` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/gan-style-harness)
- 이 레포 사본: [`plugins/ecc/skills/gan-style-harness/SKILL.md`](../../plugins/ecc/skills/gan-style-harness/SKILL.md)

### `/gateguard`

PreToolUse fact-forcing gate that denies the first Edit/Write/Bash (including MultiEdit and NotebookEdit) attempt until the agent presents concrete facts (importers, data schemas, verbatim user instruction), then allows retry; A/B-tested at +2.25 quality points. Use when enabling or configuring the GateGuard hook, exempting paths via env vars, or handling first-touch denials.

- 호출: `/gateguard` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/gateguard)
- 이 레포 사본: [`plugins/ecc/skills/gateguard/SKILL.md`](../../plugins/ecc/skills/gateguard/SKILL.md)

### `/generating-python-installer`

Commercial-grade Python installer expert for Windows: Nuitka extreme compilation, dist slimming, DLL footprint analysis, and Inno Setup packaging to ship the smallest, fastest installers. Use when a Python app must ship as a minimal, fast-starting Windows installer; not for basic script-to-exe conversion. 中文触发：Nuitka 极限优化、Python 商业打包、极限编译 Python、dist 瘦身、DLL 分析、最小安装包、最快启动、商业级打包风格

- 호출: `/generating-python-installer` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/generating-python-installer)
- 이 레포 사본: [`plugins/ecc/skills/generating-python-installer/SKILL.md`](../../plugins/ecc/skills/generating-python-installer/SKILL.md)

### `/git-workflow`

Git workflow patterns including branching strategies, commit conventions, keeping history clean and readable, tidying local commits before merging, merge vs rebase, conflict resolution, and collaborative development best practices for teams of all sizes. Use when choosing a branching strategy, writing commit conventions, cleaning up history before a pull request, deciding merge versus rebase, or resolving conflicts.

- 호출: `/git-workflow` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/git-workflow)
- 이 레포 사본: [`plugins/ecc/skills/git-workflow/SKILL.md`](../../plugins/ecc/skills/git-workflow/SKILL.md)

### `/github-ops`

GitHub repository operations, automation, and management. Issue triage, PR management, CI/CD operations, release management, and security monitoring using the gh CLI. Use when the user wants to manage GitHub issues, PRs, CI status, releases, contributors, stale items, or any GitHub operational task beyond simple git commands.

- 호출: `/github-ops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/github-ops)
- 이 레포 사본: [`plugins/ecc/skills/github-ops/SKILL.md`](../../plugins/ecc/skills/github-ops/SKILL.md)

### `/golang-patterns`

Idiomatic Go patterns, best practices, and conventions for building robust, efficient, and maintainable Go applications. Use when writing or reviewing Go code and idiomatic structure or conventions are in question.

- 호출: `/golang-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/golang-patterns)
- 이 레포 사본: [`plugins/ecc/skills/golang-patterns/SKILL.md`](../../plugins/ecc/skills/golang-patterns/SKILL.md)

### `/golang-testing`

Go testing patterns including table-driven tests, subtests, benchmarks, fuzzing, and test coverage. Follows TDD methodology with idiomatic Go practices. Use when writing Go tests — table-driven cases, subtests, benchmarks, fuzzing, or coverage.

- 호출: `/golang-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/golang-testing)
- 이 레포 사본: [`plugins/ecc/skills/golang-testing/SKILL.md`](../../plugins/ecc/skills/golang-testing/SKILL.md)

### `/google-workspace-ops`

Operate across Google Drive, Docs, Sheets, and Slides as one workflow surface for plans, trackers, decks, and shared documents. Use when the user needs to find, summarize, edit, migrate, or clean up Google Workspace assets without dropping to raw tool calls.

- 호출: `/google-workspace-ops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/google-workspace-ops)
- 이 레포 사본: [`plugins/ecc/skills/google-workspace-ops/SKILL.md`](../../plugins/ecc/skills/google-workspace-ops/SKILL.md)

### `/growth-log`

Write growth log entries that extract reusable patterns from completed work — root cause, transferable rule, and a recognizable signal — instead of diary-style event narration, with a 4-8 sentence template and merge-duplicates discipline. Use when capturing what was learned after a complex task, debugging session, failure, or rollback, when reviewing progress over a period, or when a delivery gate asks what was learned.

- 호출: `/growth-log` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/growth-log)
- 이 레포 사본: [`plugins/ecc/skills/growth-log/SKILL.md`](../../plugins/ecc/skills/growth-log/SKILL.md)

### `/healthcare-cdss-patterns`

Clinical Decision Support System (CDSS) development patterns. Drug interaction checking, dose validation, clinical scoring (NEWS2, qSOFA), alert severity classification, and integration into EMR workflows. Use when building clinical decision support — drug interaction checks, dose validation, clinical scoring, or alert severity.

- 호출: `/healthcare-cdss-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/healthcare-cdss-patterns)
- 이 레포 사본: [`plugins/ecc/skills/healthcare-cdss-patterns/SKILL.md`](../../plugins/ecc/skills/healthcare-cdss-patterns/SKILL.md)

### `/healthcare-emr-patterns`

EMR/EHR development patterns for healthcare applications. Clinical safety, encounter workflows, prescription generation, clinical decision support integration, and accessibility-first UI for medical data entry. Use when building EMR or EHR features such as encounter workflows, prescription generation, or clinical data entry UI.

- 호출: `/healthcare-emr-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/healthcare-emr-patterns)
- 이 레포 사본: [`plugins/ecc/skills/healthcare-emr-patterns/SKILL.md`](../../plugins/ecc/skills/healthcare-emr-patterns/SKILL.md)

### `/healthcare-eval-harness`

Patient safety evaluation harness for healthcare application deployments. Automated test suites for CDSS accuracy, PHI exposure, clinical workflow integrity, and integration compliance. Blocks deployments on safety failures. Use when a healthcare deployment must be gated on patient-safety tests for CDSS accuracy, PHI exposure, and workflow integrity.

- 호출: `/healthcare-eval-harness` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/healthcare-eval-harness)
- 이 레포 사본: [`plugins/ecc/skills/healthcare-eval-harness/SKILL.md`](../../plugins/ecc/skills/healthcare-eval-harness/SKILL.md)

### `/healthcare-phi-compliance`

Protected Health Information (PHI) and PII compliance patterns for healthcare applications: data classification, row-level access control, tamper-proof audit trails, schema tagging, and common leak vectors such as logs, URLs, and browser storage. Use when code touches patient or clinician data, when implementing HIPAA or GDPR access controls, or when auditing a healthcare system for data exposure.

- 호출: `/healthcare-phi-compliance` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/healthcare-phi-compliance)
- 이 레포 사본: [`plugins/ecc/skills/healthcare-phi-compliance/SKILL.md`](../../plugins/ecc/skills/healthcare-phi-compliance/SKILL.md)

### `/hermes-imports`

Convert local Hermes operator workflows into sanitized ECC skills and release-pack artifacts. Use when preparing a Hermes workflow for public ECC reuse without leaking private workspace state, credentials, or local-only paths.

- 호출: `/hermes-imports` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/hermes-imports)
- 이 레포 사본: [`plugins/ecc/skills/hermes-imports/SKILL.md`](../../plugins/ecc/skills/hermes-imports/SKILL.md)

### `/hexagonal-architecture`

Design, implement, and refactor Ports & Adapters systems with clear domain boundaries, dependency inversion, and testable use-case orchestration across TypeScript, Java, Kotlin, and Go services. Use when introducing or refactoring toward Ports and Adapters, or when domain logic has become entangled with I/O.

- 호출: `/hexagonal-architecture` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/hexagonal-architecture)
- 이 레포 사본: [`plugins/ecc/skills/hexagonal-architecture/SKILL.md`](../../plugins/ecc/skills/hexagonal-architecture/SKILL.md)

### `/hipaa-compliance`

HIPAA-specific entrypoint for healthcare privacy and security work. Use when a task is explicitly framed around HIPAA, PHI handling, covered entities, BAAs, breach posture, or US healthcare compliance requirements.

- 호출: `/hipaa-compliance` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/hipaa-compliance)
- 이 레포 사본: [`plugins/ecc/skills/hipaa-compliance/SKILL.md`](../../plugins/ecc/skills/hipaa-compliance/SKILL.md)

### `/homelab-network-readiness`

Readiness checklist for homelab VLAN segmentation, local DNS filtering (Pi-hole, AdGuard Home), and WireGuard-style remote access. Use when planning or reviewing home network changes — splitting a flat network into trusted, IoT, guest, or management VLANs, moving DHCP to a local resolver, or adding VPN access — before changing router, firewall, DHCP, or VPN configuration.

- 호출: `/homelab-network-readiness` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/homelab-network-readiness)
- 이 레포 사본: [`plugins/ecc/skills/homelab-network-readiness/SKILL.md`](../../plugins/ecc/skills/homelab-network-readiness/SKILL.md)

### `/homelab-network-setup`

Practical home and homelab network planning for gateways, switches, access points, IP ranges, DHCP reservations, DNS, cabling, and common beginner mistakes. Use when planning or fixing a home or homelab network — gateway, switch, AP, IP ranges, DHCP, DNS, or cabling.

- 호출: `/homelab-network-setup` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/homelab-network-setup)
- 이 레포 사본: [`plugins/ecc/skills/homelab-network-setup/SKILL.md`](../../plugins/ecc/skills/homelab-network-setup/SKILL.md)

### `/homelab-pihole-dns`

Pi-hole installation, blocklist management, DNS-over-HTTPS setup, DHCP integration, local DNS records, and troubleshooting broken DNS resolution on a home network. Use when the task explicitly involves Pi-hole — installing it, managing blocklists, configuring DoH or DHCP, adding local DNS records, or diagnosing DNS resolution with Pi-hole in the path.

- 호출: `/homelab-pihole-dns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/homelab-pihole-dns)
- 이 레포 사본: [`plugins/ecc/skills/homelab-pihole-dns/SKILL.md`](../../plugins/ecc/skills/homelab-pihole-dns/SKILL.md)

### `/homelab-vlan-segmentation`

Segmenting home networks into VLANs for IoT, guest, trusted, and server traffic using UniFi, pfSense/OPNsense, and MikroTik — including switch trunk config, firewall rules, and wireless SSID mapping. Use when splitting a home network into IoT, guest, trusted, and server VLANs on UniFi, pfSense/OPNsense, or MikroTik.

- 호출: `/homelab-vlan-segmentation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/homelab-vlan-segmentation)
- 이 레포 사본: [`plugins/ecc/skills/homelab-vlan-segmentation/SKILL.md`](../../plugins/ecc/skills/homelab-vlan-segmentation/SKILL.md)

### `/homelab-wireguard-vpn`

WireGuard VPN server setup, peer configuration, key generation, split tunneling vs full tunnel routing, and remote access to a home network from mobile and laptop clients. Use when setting up WireGuard for remote access to a home network, or deciding between split and full tunnel routing.

- 호출: `/homelab-wireguard-vpn` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/homelab-wireguard-vpn)
- 이 레포 사본: [`plugins/ecc/skills/homelab-wireguard-vpn/SKILL.md`](../../plugins/ecc/skills/homelab-wireguard-vpn/SKILL.md)

### `/hookify-rules`

Create and configure hookify rules — markdown files with YAML frontmatter that match bash, file, prompt, or stop events by regex or conditions and show warn/block messages to the agent. Use when creating a hookify rule, writing hook rule syntax, configuring hookify, or adding pattern guardrails such as blocking dangerous commands, .env edits, or debug code.

- 호출: `/hookify-rules` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/hookify-rules)
- 이 레포 사본: [`plugins/ecc/skills/hookify-rules/SKILL.md`](../../plugins/ecc/skills/hookify-rules/SKILL.md)

### `/i18n-sync`

Translate and synchronize application JSON locale files using source-key usage, project terminology, and focused validation. Use when adding keys or languages, updating source copy, or reviewing missing and stale translations.

- 호출: `/i18n-sync` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/i18n-sync)
- 이 레포 사본: [`plugins/ecc/skills/i18n-sync/SKILL.md`](../../plugins/ecc/skills/i18n-sync/SKILL.md)

### `/inherit-legacy-style`

Prevent AI style drift on legacy projects by scanning the codebase for implicit conventions, resolving conflicts with the operator one at a time, and writing an enforceable .ai-style-rules.md (Golden Files, naming rules, DONTs) plus an optional CLAUDE.md hook. Use when onboarding an AI agent onto a hand-written legacy codebase or extracting a project's unwritten coding rules.

- 호출: `/inherit-legacy-style` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/inherit-legacy-style)
- 이 레포 사본: [`plugins/ecc/skills/inherit-legacy-style/SKILL.md`](../../plugins/ecc/skills/inherit-legacy-style/SKILL.md)

### `/intent-driven-development`

Turn ambiguous or high-impact product and engineering changes into scoped, verifiable acceptance criteria before or alongside implementation. Use when a user asks to clarify a feature, define acceptance criteria, de-risk a security/data/migration/integration change, prepare implementation requirements for another agent, or make a complex request testable. Do not trigger for trivial edits, straightforward fixes, active debugging, code review, or implementation requests whose acceptance conditions are already clear unless the user explicitly invokes this skill.

- 호출: `/intent-driven-development` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/intent-driven-development)
- 이 레포 사본: [`plugins/ecc/skills/intent-driven-development/SKILL.md`](../../plugins/ecc/skills/intent-driven-development/SKILL.md)

### `/inventory-demand-planning`

Codified demand planning expertise for multi-location retailers: demand forecasting method selection, ABC/XYZ segmentation, safety stock and reorder-point optimization, promotional lift and post-promo dip estimation, and seasonal transition and markdown timing. Use when forecasting demand, setting safety stock, planning replenishment, managing promotions, or optimizing inventory levels.

- 호출: `/inventory-demand-planning` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/inventory-demand-planning)
- 이 레포 사본: [`plugins/ecc/skills/inventory-demand-planning/SKILL.md`](../../plugins/ecc/skills/inventory-demand-planning/SKILL.md)

### `/investor-materials`

Create and update pitch decks, one-pagers, investor memos, accelerator applications, financial models, and fundraising materials. Use when the user needs investor-facing documents, projections, use-of-funds tables, milestone plans, or materials that must stay internally consistent across multiple fundraising assets.

- 호출: `/investor-materials` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/investor-materials)
- 이 레포 사본: [`plugins/ecc/skills/investor-materials/SKILL.md`](../../plugins/ecc/skills/investor-materials/SKILL.md)

### `/investor-outreach`

Draft cold emails, warm intro blurbs, follow-ups, update emails, and investor communications for fundraising. Use when the user wants outreach to angels, VCs, strategic investors, or accelerators and needs concise, personalized, investor-facing messaging.

- 호출: `/investor-outreach` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/investor-outreach)
- 이 레포 사본: [`plugins/ecc/skills/investor-outreach/SKILL.md`](../../plugins/ecc/skills/investor-outreach/SKILL.md)

### `/ios-icon-gen`

Generate iOS app icons as PNG imagesets for Xcode asset catalogs from SF Symbols (5000+ Apple-native) or Iconify API (275k+ open source icons from 200+ collections). Use when generating icons, creating icon assets, adding icons to asset catalog, or searching for icons for iOS projects.

- 호출: `/ios-icon-gen` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `scripts/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ios-icon-gen)
- 이 레포 사본: [`plugins/ecc/skills/ios-icon-gen/SKILL.md`](../../plugins/ecc/skills/ios-icon-gen/SKILL.md)

### `/issue-review`

Review a GitHub issue the way /code-review reviews a PR. Fetches the issue with the gh CLI, checks the report against the current codebase, searches for duplicates and prior fixes, scores completeness, assigns severity, and writes a triage report plus a draft reply. Posting comments or labels is opt-in only. Use when the user asks to check, triage, validate, or review a GitHub issue.

- 호출: `/issue-review` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/issue-review)
- 이 레포 사본: [`plugins/ecc/skills/issue-review/SKILL.md`](../../plugins/ecc/skills/issue-review/SKILL.md)

### `/iterative-retrieval`

Pattern for progressively refining context retrieval to solve the subagent context problem. Use when a subagent lacks the context it needs and retrieval must be refined across passes.

- 호출: `/iterative-retrieval` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/iterative-retrieval)
- 이 레포 사본: [`plugins/ecc/skills/iterative-retrieval/SKILL.md`](../../plugins/ecc/skills/iterative-retrieval/SKILL.md)

### `/ito-baskets`

Read-only Itô basket and prediction-market data skill. Index the live basket catalog, compare a basket against user-supplied research or a watchlist, build a source-grounded market brief, or draft a non-executable planning worksheet. Use when a user asks to browse or index Itô baskets, compare a basket against notes or a thesis, research prediction-market events/venues/liquidity, or plan a basket or market idea without trading. Never advises, orders, trades, reserves, or executes.

- 호출: `/ito-baskets` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `agents/`, `scripts/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ito-baskets)
- 이 레포 사본: [`plugins/ecc/skills/ito-baskets/SKILL.md`](../../plugins/ecc/skills/ito-baskets/SKILL.md)

### `/ito-compute`

Query live GPU inventory, submit an authenticated Itô fixed-rate RFQ, inspect RFQ or procurement status, revoke device credentials, and run explicitly gated node qualification through the separately installed canonical CLI. Use when a user asks to find H100/H200 capacity, request a fixed compute rate, check Itô compute status, validate GPU nodes, revoke Itô access, or rent or purchase GPU compute and needs the supported boundary explained.

- 호출: `/ito-compute` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `agents/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ito-compute)
- 이 레포 사본: [`plugins/ecc/skills/ito-compute/SKILL.md`](../../plugins/ecc/skills/ito-compute/SKILL.md)

### `/ito-inference`

Inspect the availability of model serving on a completed Itô compute booking and, when the canonical backend becomes available, hand off an explicitly confirmed serving manifest. Use after ito-compute has booked GPU nodes and the user asks for an OpenAI-compatible endpoint, ito-serve, hosted Kimi, or self-hosted open-weights inference. ECC implements no serving stack of its own.

- 호출: `/ito-inference` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ito-inference)
- 이 레포 사본: [`plugins/ecc/skills/ito-inference/SKILL.md`](../../plugins/ecc/skills/ito-inference/SKILL.md)

### `/ito-training`

Inspect the availability of ML training on a completed Itô compute booking and, when the canonical backend becomes available, hand off an explicitly confirmed training manifest. Use after ito-compute has booked GPU nodes and the user wants pre-training, fine-tuning, or RL on that metal. ECC implements no training stack of its own.

- 호출: `/ito-training` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ito-training)
- 이 레포 사본: [`plugins/ecc/skills/ito-training/SKILL.md`](../../plugins/ecc/skills/ito-training/SKILL.md)

### `/java-coding-standards`

Java coding standards for Spring Boot and Quarkus services: naming, immutability, Optional usage, streams, exceptions, generics, CDI, reactive patterns, and project layout. Automatically applies framework-specific conventions. Use when writing or reviewing Java in a Spring Boot or Quarkus service.

- 호출: `/java-coding-standards` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/java-coding-standards)
- 이 레포 사본: [`plugins/ecc/skills/java-coding-standards/SKILL.md`](../../plugins/ecc/skills/java-coding-standards/SKILL.md)

### `/jira-integration`

Use this skill when retrieving Jira tickets, analyzing requirements, updating ticket status, adding comments, or transitioning issues. Provides Jira API patterns via MCP or direct REST calls.

- 호출: `/jira-integration` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/jira-integration)
- 이 레포 사본: [`plugins/ecc/skills/jira-integration/SKILL.md`](../../plugins/ecc/skills/jira-integration/SKILL.md)

### `/jpa-patterns`

JPA/Hibernate patterns for entity design, relationships, query optimization, transactions, auditing, indexing, pagination, and pooling in Spring Boot. Use when designing JPA entities or relationships, or when a Hibernate query, transaction, or N+1 problem needs fixing.

- 호출: `/jpa-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/jpa-patterns)
- 이 레포 사본: [`plugins/ecc/skills/jpa-patterns/SKILL.md`](../../plugins/ecc/skills/jpa-patterns/SKILL.md)

### `/knowledge-ops`

Knowledge base management, ingestion, sync, and retrieval across multiple storage layers (local files, MCP memory, vector stores, Git repos). Use when the user wants to save, organize, sync, deduplicate, or search across their knowledge systems.

- 호출: `/knowledge-ops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/knowledge-ops)
- 이 레포 사본: [`plugins/ecc/skills/knowledge-ops/SKILL.md`](../../plugins/ecc/skills/knowledge-ops/SKILL.md)

### `/kotlin-coroutines-flows`

Kotlin Coroutines and Flow patterns for Android and KMP — structured concurrency, Flow operators, StateFlow, error handling, and testing. Use when writing coroutines or Flow code on Android or KMP, or debugging cancellation and concurrency.

- 호출: `/kotlin-coroutines-flows` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/kotlin-coroutines-flows)
- 이 레포 사본: [`plugins/ecc/skills/kotlin-coroutines-flows/SKILL.md`](../../plugins/ecc/skills/kotlin-coroutines-flows/SKILL.md)

### `/kotlin-exposed-patterns`

JetBrains Exposed ORM patterns including DSL queries, DAO pattern, transactions, HikariCP connection pooling, Flyway migrations, and repository pattern. Use when working with the Exposed ORM — DSL or DAO queries, transactions, pooling, or migrations.

- 호출: `/kotlin-exposed-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/kotlin-exposed-patterns)
- 이 레포 사본: [`plugins/ecc/skills/kotlin-exposed-patterns/SKILL.md`](../../plugins/ecc/skills/kotlin-exposed-patterns/SKILL.md)

### `/kotlin-ktor-patterns`

Ktor server patterns including routing DSL, plugins, authentication, Koin DI, kotlinx.serialization, WebSockets, and testApplication testing. Use when building a Ktor server — routing, plugins, auth, DI, serialization, or tests.

- 호출: `/kotlin-ktor-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/kotlin-ktor-patterns)
- 이 레포 사본: [`plugins/ecc/skills/kotlin-ktor-patterns/SKILL.md`](../../plugins/ecc/skills/kotlin-ktor-patterns/SKILL.md)

### `/kotlin-patterns`

Idiomatic Kotlin patterns, best practices, and conventions for building robust, efficient, and maintainable Kotlin applications with coroutines, null safety, and DSL builders. Use when writing or reviewing Kotlin code and idiomatic structure or null safety is in question.

- 호출: `/kotlin-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/kotlin-patterns)
- 이 레포 사본: [`plugins/ecc/skills/kotlin-patterns/SKILL.md`](../../plugins/ecc/skills/kotlin-patterns/SKILL.md)

### `/kotlin-testing`

Kotlin testing patterns with Kotest, MockK, coroutine testing, property-based testing, and Kover coverage. Follows TDD methodology with idiomatic Kotlin practices. Use when writing Kotlin tests with Kotest or MockK, or testing coroutines and checking coverage.

- 호출: `/kotlin-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/kotlin-testing)
- 이 레포 사본: [`plugins/ecc/skills/kotlin-testing/SKILL.md`](../../plugins/ecc/skills/kotlin-testing/SKILL.md)

### `/kubernetes-patterns`

Kubernetes workload patterns, resource management, RBAC, probes, autoscaling, ConfigMap/Secret handling, and kubectl debugging for production-grade deployments. Use when writing or reviewing Kubernetes manifests, or debugging probes, RBAC, autoscaling, or resource limits.

- 호출: `/kubernetes-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/kubernetes-patterns)
- 이 레포 사본: [`plugins/ecc/skills/kubernetes-patterns/SKILL.md`](../../plugins/ecc/skills/kubernetes-patterns/SKILL.md)

### `/laravel-patterns`

Laravel architecture patterns, routing/controllers, Eloquent ORM, service layers, queues, events, caching, and API resources for production apps. Use when building or reviewing Laravel apps — controllers, Eloquent, service layers, queues, or API resources.

- 호출: `/laravel-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/laravel-patterns)
- 이 레포 사본: [`plugins/ecc/skills/laravel-patterns/SKILL.md`](../../plugins/ecc/skills/laravel-patterns/SKILL.md)

### `/laravel-plugin-discovery`

Discover and evaluate Laravel packages via LaraPlugins.io MCP. Use when the user wants to find plugins, check package health, or assess Laravel/PHP compatibility.

- 호출: `/laravel-plugin-discovery` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/laravel-plugin-discovery)
- 이 레포 사본: [`plugins/ecc/skills/laravel-plugin-discovery/SKILL.md`](../../plugins/ecc/skills/laravel-plugin-discovery/SKILL.md)

### `/laravel-security`

Laravel security best practices — authentication, authorization, Eloquent safety, CSRF, XSS prevention, API security, and secure deployment configurations. Use when reviewing Laravel auth, Eloquent safety, CSRF, XSS, API security, or deployment configuration.

- 호출: `/laravel-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/laravel-security)
- 이 레포 사본: [`plugins/ecc/skills/laravel-security/SKILL.md`](../../plugins/ecc/skills/laravel-security/SKILL.md)

### `/laravel-tdd`

Laravel testing strategies with PHPUnit, Pest, model factories, HTTP tests, Sanctum authentication testing, mocking, and coverage. Use when writing Laravel tests with PHPUnit or Pest, or driving a Laravel feature test-first.

- 호출: `/laravel-tdd` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/laravel-tdd)
- 이 레포 사본: [`plugins/ecc/skills/laravel-tdd/SKILL.md`](../../plugins/ecc/skills/laravel-tdd/SKILL.md)

### `/laravel-verification`

Verification loop for Laravel projects: env checks, linting, static analysis, tests with coverage, security scans, and deployment readiness. Use when verifying a Laravel project before merge or deploy — lint, static analysis, tests, coverage, security.

- 호출: `/laravel-verification` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/laravel-verification)
- 이 레포 사본: [`plugins/ecc/skills/laravel-verification/SKILL.md`](../../plugins/ecc/skills/laravel-verification/SKILL.md)

### `/latency-critical-systems`

Optimize and verify latency-sensitive systems — realtime dashboards, market data feeds, streaming agents, execution gateways, queues, and caches — by tracking p50/p95/p99 latency, freshness age, and queue depth, mapping hot paths, and running live readbacks. Use when p95 latency, throughput, or data freshness matters.

- 호출: `/latency-critical-systems` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/latency-critical-systems)
- 이 레포 사본: [`plugins/ecc/skills/latency-critical-systems/SKILL.md`](../../plugins/ecc/skills/latency-critical-systems/SKILL.md)

### `/lead-intelligence`

AI-native lead intelligence and outreach pipeline. Replaces Apollo, Clay, and ZoomInfo with agent-powered signal scoring, mutual ranking, warm path discovery, source-derived voice modeling, and channel-specific outreach across email, LinkedIn, and X. Use when the user wants to find, qualify, and reach high-value contacts.

- 호출: `/lead-intelligence` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `agents/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/lead-intelligence)
- 이 레포 사본: [`plugins/ecc/skills/lead-intelligence/SKILL.md`](../../plugins/ecc/skills/lead-intelligence/SKILL.md)

### `/liquid-glass-design`

iOS 26 Liquid Glass design system — dynamic glass material with blur, reflection, and interactive morphing for SwiftUI, UIKit, and WidgetKit. Use when building iOS 26 Liquid Glass UI in SwiftUI, UIKit, or WidgetKit.

- 호출: `/liquid-glass-design` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/liquid-glass-design)
- 이 레포 사본: [`plugins/ecc/skills/liquid-glass-design/SKILL.md`](../../plugins/ecc/skills/liquid-glass-design/SKILL.md)

### `/living-docs-governance`

Keep a long-lived project's documentation from rotting by assigning existing project docs clear constitution, map, status, and history roles, then wiring the active agent harness to those canonical sources. Use in the maintain phase when docs drift from code, agents lose context between sessions, or intentional removals keep being recreated. Prefer adopting the repository's current docs structure over creating new root files. 中文触发：文档治理、活文档、项目状态追踪、防文档漂移、项目地图、健康仪表盘、删除区、长期项目治理

- 호출: `/living-docs-governance` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/living-docs-governance)
- 이 레포 사본: [`plugins/ecc/skills/living-docs-governance/SKILL.md`](../../plugins/ecc/skills/living-docs-governance/SKILL.md)

### `/llm-trading-agent-security`

Security patterns for autonomous trading agents with wallet or transaction authority. Covers prompt injection, spend limits, pre-send simulation, circuit breakers, MEV protection, and key handling. Use when an autonomous agent holds wallet or transaction authority and its limits, simulation, or key handling need review.

- 호출: `/llm-trading-agent-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/llm-trading-agent-security)
- 이 레포 사본: [`plugins/ecc/skills/llm-trading-agent-security/SKILL.md`](../../plugins/ecc/skills/llm-trading-agent-security/SKILL.md)

### `/logistics-exception-management`

Codified freight-exception handling expertise for shipment delays, damages, losses, shortages, and carrier disputes, with escalation protocols, carrier-specific behaviors by mode, claims procedures, and eat-the-cost vs fight-the-claim judgment frameworks. Use when handling shipping exceptions, freight claims, delivery issues, or carrier disputes.

- 호출: `/logistics-exception-management` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/logistics-exception-management)
- 이 레포 사본: [`plugins/ecc/skills/logistics-exception-management/SKILL.md`](../../plugins/ecc/skills/logistics-exception-management/SKILL.md)

### `/loop-design-check`

Design a goal-oriented agent loop or review one for failure modes: spinning, Goodhart-gaming the verifier, or running a wrong answer to completion. Covers machine-decidable goals, loop types, plan/build/judge skeletons, and runaway prevention; mechanism wiring lives in autonomous-loops. Use when designing, writing, or checking an agent loop. 中文触发：写 loop、设计 loop、做一个 loop、检查 loop 对不对、loop 体检、loop 会不会跑飞、可判定目标、五个崩法、plan build judge。

- 호출: `/loop-design-check` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/loop-design-check)
- 이 레포 사본: [`plugins/ecc/skills/loop-design-check/SKILL.md`](../../plugins/ecc/skills/loop-design-check/SKILL.md)

### `/mailtrap-email-integration`

Guides agents through integrating transactional email sending via Mailtrap's Email API, including sandbox testing, domain verification, and API authentication. Use when implementing email-sending features, debugging delivery issues, or setting up safe dev/staging email testing.

- 호출: `/mailtrap-email-integration` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/mailtrap-email-integration)
- 이 레포 사본: [`plugins/ecc/skills/mailtrap-email-integration/SKILL.md`](../../plugins/ecc/skills/mailtrap-email-integration/SKILL.md)

### `/make-interfaces-feel-better`

Apply concrete design-engineering details that make interfaces feel polished. Use when reviewing or improving UI spacing, typography, borders, shadows, motion, hit areas, icons, text wrapping, and interaction states.

- 호출: `/make-interfaces-feel-better` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/make-interfaces-feel-better)
- 이 레포 사본: [`plugins/ecc/skills/make-interfaces-feel-better/SKILL.md`](../../plugins/ecc/skills/make-interfaces-feel-better/SKILL.md)

### `/manim-video`

Build reusable Manim explainers for technical concepts, graphs, system diagrams, and product walkthroughs, then hand off to the wider ECC video stack if needed. Use when the user wants a clean animated explainer rather than a generic talking-head script.

- 호출: `/manim-video` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/manim-video)
- 이 레포 사본: [`plugins/ecc/skills/manim-video/SKILL.md`](../../plugins/ecc/skills/manim-video/SKILL.md)

### `/market-research`

Conduct market research, competitive analysis, investor due diligence, and industry intelligence with source attribution and decision-oriented summaries. Use when the user wants market sizing, competitor comparisons, fund research, technology scans, or research that informs business decisions.

- 호출: `/market-research` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/market-research)
- 이 레포 사본: [`plugins/ecc/skills/market-research/SKILL.md`](../../plugins/ecc/skills/market-research/SKILL.md)

### `/marketing-campaign`

End-to-end marketing campaign planning and execution. Covers audience research, positioning, campaign angle definition, landing page copy, email sequences, social posts, ad copy, short-form video scripts, and content calendars. Use as the orchestration layer for multi-channel product launches. Use when planning or executing a multi-channel product launch, or producing landing page, email, social, or ad copy.

- 호출: `/marketing-campaign` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/marketing-campaign)
- 이 레포 사본: [`plugins/ecc/skills/marketing-campaign/SKILL.md`](../../plugins/ecc/skills/marketing-campaign/SKILL.md)

### `/master-agreement-generator`

Generate review drafts of counterparty master agreements from one template plus a JSON spec, with role-selected clauses and a Schedule A workflow limited to the executed agreement's notice authority. Use when you need reproducible drafting and separately reviewed execution preparation.

- 호출: `/master-agreement-generator` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`, `scripts/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/master-agreement-generator)
- 이 레포 사본: [`plugins/ecc/skills/master-agreement-generator/SKILL.md`](../../plugins/ecc/skills/master-agreement-generator/SKILL.md)

### `/mcp-dependency-review`

Statically review MCP configuration for mutable package references before approval or CI, without executing discovered MCP servers. Use when reviewing .mcp.json, Cursor, VS Code, Claude, Windsurf, or other repo-scoped MCP config.

- 호출: `/mcp-dependency-review` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/mcp-dependency-review)
- 이 레포 사본: [`plugins/ecc/skills/mcp-dependency-review/SKILL.md`](../../plugins/ecc/skills/mcp-dependency-review/SKILL.md)

### `/mcp-server-patterns`

Build MCP servers with Node/TypeScript SDK — tools, resources, prompts, Zod validation, stdio vs Streamable HTTP. Use Context7 or official MCP docs for latest API. Use when building or debugging an MCP server — tools, resources, prompts, validation, or transport choice.

- 호출: `/mcp-server-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/mcp-server-patterns)
- 이 레포 사본: [`plugins/ecc/skills/mcp-server-patterns/SKILL.md`](../../plugins/ecc/skills/mcp-server-patterns/SKILL.md)

### `/messages-ops`

Evidence-first live messaging workflow for ECC. Use when the user wants to read texts or DMs, recover a recent one-time code, inspect a thread before replying, or prove which message source was actually checked.

- 호출: `/messages-ops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/messages-ops)
- 이 레포 사본: [`plugins/ecc/skills/messages-ops/SKILL.md`](../../plugins/ecc/skills/messages-ops/SKILL.md)

### `/ml-adoption-playbook`

End-to-end methodology for AI agents and software engineers to add machine learning algorithms to existing non-ML codebases. Covers problem framing, data readiness, architectural decoupling, and baseline model integration. Use when adding a machine learning capability to a codebase that has none, from problem framing through a baseline model.

- 호출: `/ml-adoption-playbook` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ml-adoption-playbook)
- 이 레포 사본: [`plugins/ecc/skills/ml-adoption-playbook/SKILL.md`](../../plugins/ecc/skills/ml-adoption-playbook/SKILL.md)

### `/mle-workflow`

Production machine-learning engineering workflow for data contracts, reproducible training, model evaluation, deployment, monitoring, and rollback. Use when building, reviewing, or hardening ML systems beyond one-off notebooks.

- 호출: `/mle-workflow` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/mle-workflow)
- 이 레포 사본: [`plugins/ecc/skills/mle-workflow/SKILL.md`](../../plugins/ecc/skills/mle-workflow/SKILL.md)

### `/module-governance`

Establish or maintain a business module's local agent instructions, domain-context links, and interface ownership when implementing a new module or changing its responsibilities. Reuse project-level rules and existing ECC workflows; ordinary bug fixes, styling, and read-only design discussions do not start module documentation setup.

- 호출: `/module-governance` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/module-governance)
- 이 레포 사본: [`plugins/ecc/skills/module-governance/SKILL.md`](../../plugins/ecc/skills/module-governance/SKILL.md)

### `/module-regression`

Govern cross-module regression in large repositories with a REGRESSION.md ledger that records each module's downstream consumers and executable acceptance command. After a change, run the changed module and every affected downstream command, and use observed exit codes as regression evidence under the project's delivery policy. Use for module regression, regression ledgers, impact audits, downstream verification, and changes where modifying A may break B.

- 호출: `/module-regression` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `templates/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/module-regression)
- 이 레포 사본: [`plugins/ecc/skills/module-regression/SKILL.md`](../../plugins/ecc/skills/module-regression/SKILL.md)

### `/motion-advanced`

Advanced motion patterns for React / Next.js — drag & drop, gestures, text animations, SVG path drawing, custom hooks, imperative sequences (useAnimate), loaders, and the full API decision tree. Requires motion-foundations. Use when building drag and drop, gestures, text or SVG animation, or imperative animation sequences in React or Next.js.

- 호출: `/motion-advanced` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/motion-advanced)
- 이 레포 사본: [`plugins/ecc/skills/motion-advanced/SKILL.md`](../../plugins/ecc/skills/motion-advanced/SKILL.md)

### `/motion-foundations`

Motion tokens, spring presets, performance rules, device adaptation, accessibility enforcement, and SSR safety for React / Next.js using motion/react. Foundation layer — all other motion skills depend on this. Use when setting up motion tokens, spring presets, reduced-motion handling, or SSR-safe animation in React or Next.js.

- 호출: `/motion-foundations` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/motion-foundations)
- 이 레포 사본: [`plugins/ecc/skills/motion-foundations/SKILL.md`](../../plugins/ecc/skills/motion-foundations/SKILL.md)

### `/motion-patterns`

Production-ready animation patterns for React / Next.js — button, modal, toast, stagger, page transitions, exit animations, scroll, and layout — built on motion-foundations tokens and springs. Use when animating a specific UI element in React or Next.js — button, modal, toast, stagger, page transition, or scroll.

- 호출: `/motion-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/motion-patterns)
- 이 레포 사본: [`plugins/ecc/skills/motion-patterns/SKILL.md`](../../plugins/ecc/skills/motion-patterns/SKILL.md)

### `/mybatis-patterns`

MyBatis and MyBatis-Spring patterns for mapper design, XML and annotation SQL, result mapping, dynamic SQL safety, transactions, batching, pagination, and query performance. Use when building or reviewing Java persistence code with MyBatis, Spring Boot, MyBatis-Spring, or MyBatis-based legacy applications.

- 호출: `/mybatis-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/mybatis-patterns)
- 이 레포 사본: [`plugins/ecc/skills/mybatis-patterns/SKILL.md`](../../plugins/ecc/skills/mybatis-patterns/SKILL.md)

### `/mysql-patterns`

MySQL and MariaDB schema, query, indexing, transaction, replication, and connection-pool patterns for production backends. Use when designing MySQL or MariaDB schemas and indexes, or when a query, transaction, or replica lags.

- 호출: `/mysql-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/mysql-patterns)
- 이 레포 사본: [`plugins/ecc/skills/mysql-patterns/SKILL.md`](../../plugins/ecc/skills/mysql-patterns/SKILL.md)

### `/nanoclaw-repl`

Operate and extend NanoClaw, ECC's zero-dependency session-aware REPL, with persistent markdown-backed sessions and slash commands for model switching, skill loading, session branching, cross-session search, history compaction, and export. Use when running or extending scripts/claw.js, or when resuming, branching, compacting, searching, or exporting a NanoClaw session.

- 호출: `/nanoclaw-repl` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/nanoclaw-repl)
- 이 레포 사본: [`plugins/ecc/skills/nanoclaw-repl/SKILL.md`](../../plugins/ecc/skills/nanoclaw-repl/SKILL.md)

### `/nasiko-control-plane`

Manage the experimental Nasiko CLI lifecycle through ECC — read-only status checks, consent-gated install of the pinned qualified version with dry-run preview, and ownership-checked uninstall, under explicit telemetry and secrets boundaries. Use when the user asks to install, inspect, or remove the Nasiko CLI or check whether it is present.

- 호출: `/nasiko-control-plane` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `agents/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/nasiko-control-plane)
- 이 레포 사본: [`plugins/ecc/skills/nasiko-control-plane/SKILL.md`](../../plugins/ecc/skills/nasiko-control-plane/SKILL.md)

### `/nestjs-patterns`

NestJS architecture patterns for modules, controllers, providers, DTO validation, guards, interceptors, config, and production-grade TypeScript backends. Use when building or reviewing a NestJS backend — modules, providers, DTO validation, guards, or interceptors.

- 호출: `/nestjs-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/nestjs-patterns)
- 이 레포 사본: [`plugins/ecc/skills/nestjs-patterns/SKILL.md`](../../plugins/ecc/skills/nestjs-patterns/SKILL.md)

### `/netmiko-ssh-automation`

Safe Python Netmiko patterns for read-only collection, bounded batch SSH, TextFSM parsing, guarded config changes, timeouts, and network automation error handling. Use when automating network device access with Python Netmiko, whether collecting state or pushing guarded config changes.

- 호출: `/netmiko-ssh-automation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/netmiko-ssh-automation)
- 이 레포 사본: [`plugins/ecc/skills/netmiko-ssh-automation/SKILL.md`](../../plugins/ecc/skills/netmiko-ssh-automation/SKILL.md)

### `/network-bgp-diagnostics`

Diagnostics-only BGP troubleshooting patterns for neighbor state, route exchange, prefix policy, AS path inspection, and safe evidence collection. Use when a BGP neighbor is down, routes are missing, or prefix policy and AS path need inspection.

- 호출: `/network-bgp-diagnostics` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/network-bgp-diagnostics)
- 이 레포 사본: [`plugins/ecc/skills/network-bgp-diagnostics/SKILL.md`](../../plugins/ecc/skills/network-bgp-diagnostics/SKILL.md)

### `/network-config-validation`

Pre-deployment checks for router and switch configuration, including dangerous commands, duplicate addresses, subnet overlaps, stale references, management-plane risk, and IOS-style security hygiene. Use when reviewing a router or switch configuration before deployment.

- 호출: `/network-config-validation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/network-config-validation)
- 이 레포 사본: [`plugins/ecc/skills/network-config-validation/SKILL.md`](../../plugins/ecc/skills/network-config-validation/SKILL.md)

### `/network-interface-health`

Diagnose interface errors, drops, CRCs, duplex mismatches, flapping, speed negotiation issues, and counter trends on routers, switches, and Linux hosts. Use when an interface shows errors, drops, CRCs, flapping, or a duplex or speed mismatch.

- 호출: `/network-interface-health` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/network-interface-health)
- 이 레포 사본: [`plugins/ecc/skills/network-interface-health/SKILL.md`](../../plugins/ecc/skills/network-interface-health/SKILL.md)

### `/nextjs-turbopack`

Next.js 16+ and Turbopack guidance — incremental Rust bundling, file-system caching, faster dev startup and HMR, Turbopack vs webpack tradeoffs, and the middleware.ts to proxy.ts filename change. Use when developing or debugging Next.js 16+ apps, diagnosing slow dev startup or hot reload, choosing between bundlers, or reviewing middleware/proxy file naming.

- 호출: `/nextjs-turbopack` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/nextjs-turbopack)
- 이 레포 사본: [`plugins/ecc/skills/nextjs-turbopack/SKILL.md`](../../plugins/ecc/skills/nextjs-turbopack/SKILL.md)

### `/nodejs-keccak256`

Prevent Ethereum hashing bugs in JavaScript and TypeScript. Node's sha3-256 is NIST SHA3, not Ethereum Keccak-256, and silently breaks selectors, signatures, storage slots, and address derivation. Use when hashing for Ethereum in JavaScript or TypeScript, or when a selector, signature, storage slot, or derived address is wrong.

- 호출: `/nodejs-keccak256` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/nodejs-keccak256)
- 이 레포 사본: [`plugins/ecc/skills/nodejs-keccak256/SKILL.md`](../../plugins/ecc/skills/nodejs-keccak256/SKILL.md)

### `/nutrient-document-processing`

Process, convert, OCR, extract, redact, sign, and fill documents using the Nutrient DWS API. Works with PDFs, DOCX, XLSX, PPTX, HTML, and images. Use when converting, OCRing, extracting from, redacting, signing, or filling documents via the Nutrient DWS API.

- 호출: `/nutrient-document-processing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/nutrient-document-processing)
- 이 레포 사본: [`plugins/ecc/skills/nutrient-document-processing/SKILL.md`](../../plugins/ecc/skills/nutrient-document-processing/SKILL.md)

### `/nuxt4-patterns`

Nuxt 4 app patterns for hydration safety, performance, route rules, lazy loading, and SSR-safe data fetching with useFetch and useAsyncData. Use when building or reviewing a Nuxt 4 app, or debugging hydration mismatches and SSR-safe data fetching.

- 호출: `/nuxt4-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/nuxt4-patterns)
- 이 레포 사본: [`plugins/ecc/skills/nuxt4-patterns/SKILL.md`](../../plugins/ecc/skills/nuxt4-patterns/SKILL.md)

### `/openclaw-persona-forge`

为 OpenClaw AI Agent 锻造完整的龙虾灵魂方案。根据用户偏好或随机抽卡， 输出身份定位、灵魂描述(SOUL.md)、角色化底线规则、名字和头像生图提示词。 如当前环境提供已审核的生图 skill，可自动生成统一风格头像图片。 当用户需要创建、设计或定制 OpenClaw 龙虾灵魂时使用。 不适用于：微调已有 SOUL.md、非 OpenClaw 平台的角色设计、纯工具型无性格 Agent。 触发词：龙虾灵魂、虾魂、OpenClaw 灵魂、养虾灵魂、龙虾角色、龙虾定位、 龙虾剧本杀角色、龙虾游戏角色、龙虾 NPC、龙虾性格、龙虾背景故事、 lobster soul、lobster character、抽卡、随机龙虾、龙虾 SOUL、gacha。 Use when creating, designing, or customizing an OpenClaw lobster persona — identity, SOUL.md, name, or avatar prompt.

- 호출: `/openclaw-persona-forge` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/openclaw-persona-forge)
- 이 레포 사본: [`plugins/ecc/skills/openclaw-persona-forge/SKILL.md`](../../plugins/ecc/skills/openclaw-persona-forge/SKILL.md)

### `/opensource-pipeline`

Open-source pipeline: fork, sanitize, and package private projects for safe public release. Chains 3 agents (forker, sanitizer, packager). Triggers: '/opensource', 'open source this', 'make this public', 'prepare for open source'. Use when a private project must be forked, stripped of secrets, and packaged for public release.

- 호출: `/opensource-pipeline` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/opensource-pipeline)
- 이 레포 사본: [`plugins/ecc/skills/opensource-pipeline/SKILL.md`](../../plugins/ecc/skills/opensource-pipeline/SKILL.md)

### `/operator-approval-loop`

Operator approval contract with internal filing notices for agent-drafted outbound messages, hashed drafts, epoch-keyed decisions, durable delivery claims and receipts, and a pre-draft baseline gate. Use when an agent drafts messages to external counterparties and a human operator must approve, reject, or steer each send before it leaves.

- 호출: `/operator-approval-loop` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/operator-approval-loop)
- 이 레포 사본: [`plugins/ecc/skills/operator-approval-loop/SKILL.md`](../../plugins/ecc/skills/operator-approval-loop/SKILL.md)

### `/orch-add-feature`

Orchestrate building a brand-new feature end to end — research, plan, TDD implementation, review, and gated commit — by delegating each phase to the matching ECC agent. Use when adding a capability that does not exist yet.

- 호출: `/orch-add-feature` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/orch-add-feature)
- 이 레포 사본: [`plugins/ecc/skills/orch-add-feature/SKILL.md`](../../plugins/ecc/skills/orch-add-feature/SKILL.md)

### `/orch-build-mvp`

Orchestrate bootstrapping a working MVP from a design or spec document — ingest the SDD/PRD, plan thin vertical slices, scaffold the first end-to-end slice, then drive a generator-evaluator build loop with review and gated feat commits. Use when a design or spec document must become a running MVP through planned vertical slices.

- 호출: `/orch-build-mvp` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/orch-build-mvp)
- 이 레포 사본: [`plugins/ecc/skills/orch-build-mvp/SKILL.md`](../../plugins/ecc/skills/orch-build-mvp/SKILL.md)

### `/orch-change-feature`

Orchestrate altering an existing, working feature to new desired behavior — update its tests to the new spec, change the implementation to match, review, and gated commit. Use when behavior is not broken but should be different.

- 호출: `/orch-change-feature` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/orch-change-feature)
- 이 레포 사본: [`plugins/ecc/skills/orch-change-feature/SKILL.md`](../../plugins/ecc/skills/orch-change-feature/SKILL.md)

### `/orch-fix-defect`

Orchestrate fixing a bug — reproduce it as a failing regression test, fix to green, review, and gated commit — by delegating each phase to the matching ECC agent. Use when existing behavior is broken or wrong.

- 호출: `/orch-fix-defect` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/orch-fix-defect)
- 이 레포 사본: [`plugins/ecc/skills/orch-fix-defect/SKILL.md`](../../plugins/ecc/skills/orch-fix-defect/SKILL.md)

### `/orch-pipeline`

Shared orchestration engine behind the orch-* skill family — the gated Research-Plan-TDD-Review-Commit pipeline, size classifier, agent and command map, and two human gates (plan approval, commit confirmation) that orch-* operation skills delegate to. Use indirectly via orch-add-feature, orch-fix-defect, orch-change-feature, orch-refine-code, or orch-build-mvp; read directly only when adding an orch operation or tuning shared phases.

- 호출: `/orch-pipeline` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/orch-pipeline)
- 이 레포 사본: [`plugins/ecc/skills/orch-pipeline/SKILL.md`](../../plugins/ecc/skills/orch-pipeline/SKILL.md)

### `/orch-refine-code`

Orchestrate a behavior-preserving refactor — confirm tests are green, restructure without changing behavior, keep tests green, review, and gated commit. Use when the structure should improve but behavior must not change.

- 호출: `/orch-refine-code` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/orch-refine-code)
- 이 레포 사본: [`plugins/ecc/skills/orch-refine-code/SKILL.md`](../../plugins/ecc/skills/orch-refine-code/SKILL.md)

### `/osint-investigation`

Sparse-clue OSINT investigation methodology for extracting overlooked leads, connecting fragmented evidence, and testing explanations across sources. Use for multi-step CTF challenges, image/video geolocation, event reconstruction, public-account and entity verification, artifact interpretation, infrastructure research, or stalled investigations.

- 호출: `/osint-investigation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/osint-investigation)
- 이 레포 사본: [`plugins/ecc/skills/osint-investigation/SKILL.md`](../../plugins/ecc/skills/osint-investigation/SKILL.md)

### `/parallel-execution-optimizer`

Speed up a task by turning it into a dependency graph of parallel lanes with a lane matrix, batched reads and checks, write surfaces isolated by file, worktree, branch, or service, and a final verification table. Use when the user wants a task done much faster through parallel work, concurrent agents, batched tool calls, isolated worktrees, many independent verification lanes, or bounded homogeneous work that reuses shared preparation while record operations remain sequential, without losing correctness.

- 호출: `/parallel-execution-optimizer` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/parallel-execution-optimizer)
- 이 레포 사본: [`plugins/ecc/skills/parallel-execution-optimizer/SKILL.md`](../../plugins/ecc/skills/parallel-execution-optimizer/SKILL.md)

### `/perl-patterns`

Modern Perl 5.36+ idioms, best practices, and conventions for building robust, maintainable Perl applications. Use when writing or reviewing modern Perl 5.36+ code.

- 호출: `/perl-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/perl-patterns)
- 이 레포 사본: [`plugins/ecc/skills/perl-patterns/SKILL.md`](../../plugins/ecc/skills/perl-patterns/SKILL.md)

### `/perl-security`

Comprehensive Perl security covering taint mode, input validation, safe process execution, DBI parameterized queries, web security (XSS/SQLi/CSRF), and perlcritic security policies. Use when reviewing Perl input handling, process execution, DBI queries, or web-facing code.

- 호출: `/perl-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/perl-security)
- 이 레포 사본: [`plugins/ecc/skills/perl-security/SKILL.md`](../../plugins/ecc/skills/perl-security/SKILL.md)

### `/perl-testing`

Perl testing patterns using Test2::V0, Test::More, prove runner, mocking, coverage with Devel::Cover, and TDD methodology. Use when writing Perl tests with Test2::V0 or Test::More, or measuring coverage.

- 호출: `/perl-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/perl-testing)
- 이 레포 사본: [`plugins/ecc/skills/perl-testing/SKILL.md`](../../plugins/ecc/skills/perl-testing/SKILL.md)

### `/plan-canvas`

Open plans and HTML artifacts in a local browser canvas where the human annotates elements, chats, and approves or requests changes without leaving the page. Use when presenting a plan for review, or when feedback like "move this, change that" is easier pointed at than typed.

- 호출: `/plan-canvas` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/plan-canvas)
- 이 레포 사본: [`plugins/ecc/skills/plan-canvas/SKILL.md`](../../plugins/ecc/skills/plan-canvas/SKILL.md)

### `/plan-orchestrate`

Read a plan document, decompose it into steps, classify each step, and emit the ready-to-paste ECC slash command for that step, carrying the step identifier and scope in the command's own documented argument form. Generative only — never invokes commands itself and never claims to control what a command runs internally. Steps whose command cannot carry plan scope fail closed instead of being emitted. Use when the user has a multi-step plan and wants the right command for each step without picking it by hand.

- 호출: `/plan-orchestrate` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/plan-orchestrate)
- 이 레포 사본: [`plugins/ecc/skills/plan-orchestrate/SKILL.md`](../../plugins/ecc/skills/plan-orchestrate/SKILL.md)

### `/plankton-code-quality`

Write-time code quality enforcement using Plankton — auto-formatting, linting, and Claude-powered fixes on every file edit via hooks. Use when setting up write-time formatting, linting, or auto-fix hooks on file edits.

- 호출: `/plankton-code-quality` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/plankton-code-quality)
- 이 레포 사본: [`plugins/ecc/skills/plankton-code-quality/SKILL.md`](../../plugins/ecc/skills/plankton-code-quality/SKILL.md)

### `/postgres-patterns`

PostgreSQL database patterns for query optimization, schema design, indexing, and security. Based on Supabase best practices. Use when designing PostgreSQL schemas, indexes, or RLS policies, or when a query is too slow.

- 호출: `/postgres-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/postgres-patterns)
- 이 레포 사본: [`plugins/ecc/skills/postgres-patterns/SKILL.md`](../../plugins/ecc/skills/postgres-patterns/SKILL.md)

### `/prediction-market-oracle-research`

Research prediction markets as data sources or oracle signals for products, agents, dashboards, and corporate decision intelligence. Use for source-grounded analysis of market-implied probabilities, caveats, and integration patterns without investment advice. Use when evaluating prediction markets as a data source or oracle signal for a product, agent, or dashboard.

- 호출: `/prediction-market-oracle-research` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/prediction-market-oracle-research)
- 이 레포 사본: [`plugins/ecc/skills/prediction-market-oracle-research/SKILL.md`](../../plugins/ecc/skills/prediction-market-oracle-research/SKILL.md)

### `/prediction-market-risk-review`

Review prediction-market, basket, oracle, and trading-agent workflows for compliance, safety, data-quality, privacy, and execution risk. Use before any workflow handles venue auth, user portfolio data, API keys, or trade planning.

- 호출: `/prediction-market-risk-review` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/prediction-market-risk-review)
- 이 레포 사본: [`plugins/ecc/skills/prediction-market-risk-review/SKILL.md`](../../plugins/ecc/skills/prediction-market-risk-review/SKILL.md)

### `/prisma-patterns`

Prisma ORM patterns for TypeScript backends — schema design, query optimization, transactions, pagination, and critical traps like updateMany returning count not records, $transaction timeouts, migrate dev resetting the DB, @updatedAt skipped on bulk writes, and serverless connection exhaustion. Use when writing a Prisma schema or query, or debugging transactions, migrations, or serverless connection limits.

- 호출: `/prisma-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/prisma-patterns)
- 이 레포 사본: [`plugins/ecc/skills/prisma-patterns/SKILL.md`](../../plugins/ecc/skills/prisma-patterns/SKILL.md)

### `/product-capability`

Translate PRD intent, roadmap asks, or product discussions into an implementation-ready capability plan that exposes constraints, invariants, interfaces, and unresolved decisions before multi-service work starts. Use when the user needs an ECC-native PRD-to-SRS lane instead of vague planning prose.

- 호출: `/product-capability` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/product-capability)
- 이 레포 사본: [`plugins/ecc/skills/product-capability/SKILL.md`](../../plugins/ecc/skills/product-capability/SKILL.md)

### `/product-lens`

Validate the why before building through four product diagnostics — a YC-style product diagnostic that produces PRODUCT-BRIEF.md with a go/no-go recommendation, a founder review scoring product-market-fit signals, a user journey audit measuring time-to-value, and ICE feature prioritization. Use when pressure-testing product direction, choosing between features, sanity-checking a launch, or converting a vague idea into a product brief.

- 호출: `/product-lens` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/product-lens)
- 이 레포 사본: [`plugins/ecc/skills/product-lens/SKILL.md`](../../plugins/ecc/skills/product-lens/SKILL.md)

### `/production-audit`

Local-evidence production readiness audit for shipped apps, pre-launch reviews, post-merge checks, and "what breaks in prod?" questions without sending repo data to an external audit service. Use when auditing production readiness before launch, after a merge, or when asked what breaks in prod.

- 호출: `/production-audit` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/production-audit)
- 이 레포 사본: [`plugins/ecc/skills/production-audit/SKILL.md`](../../plugins/ecc/skills/production-audit/SKILL.md)

### `/production-scheduling`

Codified expertise for production scheduling, job sequencing, line balancing, changeover optimization, and bottleneck resolution in discrete and batch manufacturing. Informed by production schedulers with 15+ years experience. Includes TOC/drum-buffer-rope, SMED, OEE analysis, disruption response frameworks, and ERP/MES interaction patterns. Use when scheduling production, resolving bottlenecks, optimizing changeovers, responding to disruptions, or balancing manufacturing lines.

- 호출: `/production-scheduling` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/production-scheduling)
- 이 레포 사본: [`plugins/ecc/skills/production-scheduling/SKILL.md`](../../plugins/ecc/skills/production-scheduling/SKILL.md)

### `/project-flow-ops`

Operate execution flow across GitHub and Linear by triaging issues and pull requests, linking active work, and keeping GitHub public-facing while Linear remains the internal execution layer. Use when the user wants backlog control, PR triage, or GitHub-to-Linear coordination.

- 호출: `/project-flow-ops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/project-flow-ops)
- 이 레포 사본: [`plugins/ecc/skills/project-flow-ops/SKILL.md`](../../plugins/ecc/skills/project-flow-ops/SKILL.md)

### `/prompt-caching-strategy`

Optimize LLM prompt caching hit rate to reduce API costs and improve latency. Analyzes prompt structure, identifies cacheable vs non-cacheable content, and recommends restructuring to maximize cache reuse. TRIGGER when: user says "prompt cache", "cache hit rate", "reduce LLM cost", "optimize token usage", "cheaper LLM calls", or asks about prompt caching strategies for OpenAI/Anthropic/other providers. DO NOT TRIGGER when: user just wants to optimize a single prompt's quality (use prompt-optimizer instead), or asks about general caching infrastructure.

- 호출: `/prompt-caching-strategy` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/prompt-caching-strategy)
- 이 레포 사본: [`plugins/ecc/skills/prompt-caching-strategy/SKILL.md`](../../plugins/ecc/skills/prompt-caching-strategy/SKILL.md)

### `/prompt-optimizer`

Analyze draft prompts, detect intent and missing context, match ECC commands, skills, and agents, and output a ready-to-paste optimized prompt with diagnosis and rationale — advisory only, never executes the task. Use when the user says 'optimize prompt', 'improve my prompt', 'rewrite this prompt', 'help me prompt', 优化prompt, 改进prompt, 怎么写prompt, or 帮我优化这个指令; not for requests to optimize code or performance.

- 호출: `/prompt-optimizer` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/prompt-optimizer)
- 이 레포 사본: [`plugins/ecc/skills/prompt-optimizer/SKILL.md`](../../plugins/ecc/skills/prompt-optimizer/SKILL.md)

### `/python-patterns`

Pythonic idioms, PEP 8 standards, type hints, and best practices for building robust, efficient, and maintainable Python applications. Use when writing or reviewing Python code and idiomatic structure, typing, or PEP 8 is in question.

- 호출: `/python-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/python-patterns)
- 이 레포 사본: [`plugins/ecc/skills/python-patterns/SKILL.md`](../../plugins/ecc/skills/python-patterns/SKILL.md)

### `/python-testing`

Python testing strategies using pytest, TDD methodology, fixtures, mocking, parametrization, and coverage requirements. Use when writing pytest tests — fixtures, mocks, parametrization, or coverage.

- 호출: `/python-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/python-testing)
- 이 레포 사본: [`plugins/ecc/skills/python-testing/SKILL.md`](../../plugins/ecc/skills/python-testing/SKILL.md)

### `/pytorch-patterns`

PyTorch deep learning patterns and best practices for building robust, efficient, and reproducible training pipelines, model architectures, and data loading. Use when writing or reviewing PyTorch training loops, model architectures, or data loading, or when a run will not reproduce.

- 호출: `/pytorch-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/pytorch-patterns)
- 이 레포 사본: [`plugins/ecc/skills/pytorch-patterns/SKILL.md`](../../plugins/ecc/skills/pytorch-patterns/SKILL.md)

### `/quality-nonconformance`

Quality control and non-conformance management for regulated manufacturing (FDA 21 CFR 820, IATF 16949, AS9100): NCR lifecycle and disposition, 5-Why/Ishikawa/fault-tree/8D root cause analysis, CAPA systems, SPC interpretation, AQL sampling, and supplier quality audits. Use when investigating non-conformances, performing root cause analysis, managing CAPAs, interpreting SPC data, or handling supplier quality issues.

- 호출: `/quality-nonconformance` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/quality-nonconformance)
- 이 레포 사본: [`plugins/ecc/skills/quality-nonconformance/SKILL.md`](../../plugins/ecc/skills/quality-nonconformance/SKILL.md)

### `/quarkus-patterns`

Quarkus 3.x LTS architecture patterns with Camel for messaging, RESTful API design, CDI services, data access with Panache, and async processing. Use for Java Quarkus backend work with event-driven architectures. Use when building or reviewing a Quarkus service, especially with Camel messaging or Panache data access.

- 호출: `/quarkus-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/quarkus-patterns)
- 이 레포 사본: [`plugins/ecc/skills/quarkus-patterns/SKILL.md`](../../plugins/ecc/skills/quarkus-patterns/SKILL.md)

### `/quarkus-security`

Quarkus security implementation patterns: JWT and OIDC authentication, @RolesAllowed RBAC and SecurityIdentity checks, Bean Validation and custom validators, parameterized Panache queries, BCrypt password hashing, CORS and security headers, rate limiting, audit logging, Vault or environment-variable secrets, and dependency CVE scanning. Use when adding authentication or authorization, validating input, managing secrets, or hardening a Quarkus application.

- 호출: `/quarkus-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/quarkus-security)
- 이 레포 사본: [`plugins/ecc/skills/quarkus-security/SKILL.md`](../../plugins/ecc/skills/quarkus-security/SKILL.md)

### `/quarkus-tdd`

Test-driven development for Quarkus 3.x LTS using JUnit 5, Mockito, REST Assured, Camel testing, and JaCoCo. Use when adding features, fixing bugs, or refactoring event-driven services.

- 호출: `/quarkus-tdd` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/quarkus-tdd)
- 이 레포 사본: [`plugins/ecc/skills/quarkus-tdd/SKILL.md`](../../plugins/ecc/skills/quarkus-tdd/SKILL.md)

### `/quarkus-verification`

Verification loop for Quarkus projects: build, static analysis (Checkstyle, PMD, SpotBugs), tests with JaCoCo coverage, OWASP dependency and container security scans, GraalVM native compilation, health checks, and config validation. Use when verifying a Quarkus service before a PR, after major refactoring or dependency upgrades, or pre-deploy.

- 호출: `/quarkus-verification` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/quarkus-verification)
- 이 레포 사본: [`plugins/ecc/skills/quarkus-verification/SKILL.md`](../../plugins/ecc/skills/quarkus-verification/SKILL.md)

### `/rails-patterns`

Ruby on Rails framework patterns for Rails 7.1+ and 8.x apps. Covers the directory contract, skinny controllers with service objects, form objects, query objects, idiomatic ActiveRecord, background jobs, ViewComponent, Hotwire, and the Rails 8 Solid stack. Use when building or reviewing Rails apps, controllers, models, services, jobs, or views.

- 호출: `/rails-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/rails-patterns)
- 이 레포 사본: [`plugins/ecc/skills/rails-patterns/SKILL.md`](../../plugins/ecc/skills/rails-patterns/SKILL.md)

### `/ralphinho-rfc-pipeline`

Split an RFC into a multi-agent execution DAG — decompose into work units with dependencies and acceptance tests, run research, plan, implement, test, and review per unit, then merge through a queue with re-based branches and final system verification. Use when a feature is too large for a single agent pass, orchestrating RFC-driven multi-agent execution, or managing merge queues across agent-built units.

- 호출: `/ralphinho-rfc-pipeline` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ralphinho-rfc-pipeline)
- 이 레포 사본: [`plugins/ecc/skills/ralphinho-rfc-pipeline/SKILL.md`](../../plugins/ecc/skills/ralphinho-rfc-pipeline/SKILL.md)

### `/react-native-patterns`

React Native and Expo app patterns — Expo Router navigation, state separation (server/client/route/form), TanStack Query data fetching with Zod, performant lists, NativeWind/StyleSheet styling, native APIs, and secure storage. Use when building or editing React Native / Expo screens, components, navigation, or data layers.

- 호출: `/react-native-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/react-native-patterns)
- 이 레포 사본: [`plugins/ecc/skills/react-native-patterns/SKILL.md`](../../plugins/ecc/skills/react-native-patterns/SKILL.md)

### `/react-patterns`

React 18/19 patterns including hooks discipline, server/client component boundaries, Suspense + error boundaries, form actions, data fetching, state management decision trees, and accessibility-first composition. Use when writing or reviewing React components.

- 호출: `/react-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/react-patterns)
- 이 레포 사본: [`plugins/ecc/skills/react-patterns/SKILL.md`](../../plugins/ecc/skills/react-patterns/SKILL.md)

### `/react-performance`

React and Next.js performance optimization patterns adapted from Vercel Engineering's React Best Practices (https://github.com/vercel-labs/agent-skills). Organizes 70+ rules across 8 priority categories — waterfalls, bundle size, server-side, client fetching, re-render, rendering, JS micro-perf, advanced. Use when writing, reviewing, or refactoring React/Next.js code for performance.

- 호출: `/react-performance` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/react-performance)
- 이 레포 사본: [`plugins/ecc/skills/react-performance/SKILL.md`](../../plugins/ecc/skills/react-performance/SKILL.md)

### `/react-testing`

React component testing with React Testing Library, Vitest/Jest, MSW for network mocking, accessibility assertions with axe, and the decision boundary between component tests and Playwright/Cypress end-to-end runs. Use when writing or fixing tests for React components, hooks, or pages.

- 호출: `/react-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/react-testing)
- 이 레포 사본: [`plugins/ecc/skills/react-testing/SKILL.md`](../../plugins/ecc/skills/react-testing/SKILL.md)

### `/recsys-pipeline-architect`

Design composable recommendation, ranking, and feed pipelines using the six-stage Source→Hydrator→Filter→Scorer→Selector→SideEffect framework popularized by xAI's open-sourced For You algorithm. Use this skill whenever the user is building any system that picks "the top K items for a (user, context)" — social feeds, content CMSs, RAG rerankers, task prioritizers, notification triage, search reranking, ad ranking.

- 호출: `/recsys-pipeline-architect` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/recsys-pipeline-architect)
- 이 레포 사본: [`plugins/ecc/skills/recsys-pipeline-architect/SKILL.md`](../../plugins/ecc/skills/recsys-pipeline-architect/SKILL.md)

### `/recursive-decision-ledger`

Run repeated rollouts ("Prime Gauss" style recursive prompting) while keeping an append-only decision ledger of trials, marks, coherence checks, and promotion gates, so recursive confidence never auto-approves live trading, deploy, or destructive actions. Use when the user asks for repeated rollouts, marked decision processes, high-dimensional search, stochastic optimization, local-optima exploration, ensemble comparison, or recursive reasoning with a visible evidence trail.

- 호출: `/recursive-decision-ledger` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/recursive-decision-ledger)
- 이 레포 사본: [`plugins/ecc/skills/recursive-decision-ledger/SKILL.md`](../../plugins/ecc/skills/recursive-decision-ledger/SKILL.md)

### `/redis-patterns`

Redis data structure patterns, caching strategies, distributed locks, rate limiting, pub/sub, and connection management for production applications. Use when adding caching, a distributed lock, rate limiting, or pub/sub with Redis, or when key design needs review.

- 호출: `/redis-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/redis-patterns)
- 이 레포 사본: [`plugins/ecc/skills/redis-patterns/SKILL.md`](../../plugins/ecc/skills/redis-patterns/SKILL.md)

### `/regex-vs-llm-structured-text`

Decision framework for parsing structured text (quizzes, forms, invoices, receipts, tables) with a hybrid regex-first pipeline — regex extraction handles 95%+ cheaply, a confidence scorer flags low-confidence items, and an LLM validator fixes only the edge cases. Use when choosing between regex and LLM for text extraction, building a cheap document parser, or optimizing extraction cost and accuracy.

- 호출: `/regex-vs-llm-structured-text` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/regex-vs-llm-structured-text)
- 이 레포 사본: [`plugins/ecc/skills/regex-vs-llm-structured-text/SKILL.md`](../../plugins/ecc/skills/regex-vs-llm-structured-text/SKILL.md)

### `/remotion-video-creation`

Best practices for Remotion - Video creation in React. 29 domain-specific rules covering 3D, animations, audio, captions, charts, transitions, and more. Use when building video in React with Remotion — animations, audio, captions, charts, or transitions.

- 호출: `/remotion-video-creation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `rules/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/remotion-video-creation)
- 이 레포 사본: [`plugins/ecc/skills/remotion-video-creation/SKILL.md`](../../plugins/ecc/skills/remotion-video-creation/SKILL.md)

### `/repo-scan`

Bootstrap pointer that installs the external repo-scan skill from a pinned, reviewable commit. Use when repo-scan must be installed before running its cross-stack source-code asset audit; this ECC pointer does not perform the audit itself.

- 호출: `/repo-scan` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/repo-scan)
- 이 레포 사본: [`plugins/ecc/skills/repo-scan/SKILL.md`](../../plugins/ecc/skills/repo-scan/SKILL.md)

### `/research-ops`

Evidence-first current-state research workflow for ECC. Use when the user wants fresh facts, comparisons, enrichment, or a recommendation built from current public evidence and any supplied local context.

- 호출: `/research-ops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/research-ops)
- 이 레포 사본: [`plugins/ecc/skills/research-ops/SKILL.md`](../../plugins/ecc/skills/research-ops/SKILL.md)

### `/returns-reverse-logistics`

Codified expertise for returns authorization, receipt and inspection, disposition decisions, refund processing, fraud detection, and warranty claims management. Informed by returns operations managers with 15+ years experience. Includes grading frameworks, disposition economics, fraud pattern recognition, and vendor recovery processes. Use when handling product returns, reverse logistics, refund decisions, return fraud detection, or warranty claims.

- 호출: `/returns-reverse-logistics` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/returns-reverse-logistics)
- 이 레포 사본: [`plugins/ecc/skills/returns-reverse-logistics/SKILL.md`](../../plugins/ecc/skills/returns-reverse-logistics/SKILL.md)

### `/rules-distill`

Scan skills to extract cross-cutting principles and distill them into rules — append, revise, or create new rule files. Use when the same principle keeps recurring across skills and belongs in a rule file instead.

- 호출: `/rules-distill` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `scripts/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/rules-distill)
- 이 레포 사본: [`plugins/ecc/skills/rules-distill/SKILL.md`](../../plugins/ecc/skills/rules-distill/SKILL.md)

### `/rust-patterns`

Idiomatic Rust patterns, ownership, error handling, traits, concurrency, and best practices for building safe, performant applications. Use when writing or reviewing Rust code and ownership, error handling, traits, or concurrency is in question.

- 호출: `/rust-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/rust-patterns)
- 이 레포 사본: [`plugins/ecc/skills/rust-patterns/SKILL.md`](../../plugins/ecc/skills/rust-patterns/SKILL.md)

### `/rust-testing`

Rust testing patterns including unit tests, integration tests, async testing, property-based testing, mocking, and coverage. Follows TDD methodology. Use when writing Rust tests — unit, integration, async, property-based, or coverage.

- 호출: `/rust-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/rust-testing)
- 이 레포 사본: [`plugins/ecc/skills/rust-testing/SKILL.md`](../../plugins/ecc/skills/rust-testing/SKILL.md)

### `/safety-guard`

Guard against destructive operations with three modes: Careful intercepts dangerous commands (rm -rf, git push --force, DROP TABLE) for confirmation, Freeze locks writes to one directory, and Guard combines both. Advisory: the agent applies these rules itself; no hook ships with it. Use when working on production systems, running agents autonomously, restricting edits to a directory, or during migrations, deploys, and data changes.

- 호출: `/safety-guard` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/safety-guard)
- 이 레포 사본: [`plugins/ecc/skills/safety-guard/SKILL.md`](../../plugins/ecc/skills/safety-guard/SKILL.md)

### `/santa-method`

Multi-agent adversarial verification: two independent reviewers with the same rubric must both pass before output ships, with a fix-and-re-review convergence loop and human escalation cap. Use when gating publishing, production deploys, compliance or brand-sensitive content, or hallucination-prone claims before they ship.

- 호출: `/santa-method` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/santa-method)
- 이 레포 사본: [`plugins/ecc/skills/santa-method/SKILL.md`](../../plugins/ecc/skills/santa-method/SKILL.md)

### `/scientific-db-pubmed-database`

Direct PubMed and NCBI E-utilities search workflows for biomedical literature, MeSH queries, PMID lookup, citation retrieval, and API-backed literature monitoring. Use when a task needs biomedical literature from PubMed rather than general web search.

- 호출: `/scientific-db-pubmed-database` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/scientific-db-pubmed-database)
- 이 레포 사본: [`plugins/ecc/skills/scientific-db-pubmed-database/SKILL.md`](../../plugins/ecc/skills/scientific-db-pubmed-database/SKILL.md)

### `/scientific-db-uspto-database`

USPTO patent and trademark data workflow for official record lookup, PatentSearch queries, TSDR checks, assignment data, and reproducible IP research logs. Use when a task needs official United States patent or trademark records from USPTO systems.

- 호출: `/scientific-db-uspto-database` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/scientific-db-uspto-database)
- 이 레포 사본: [`plugins/ecc/skills/scientific-db-uspto-database/SKILL.md`](../../plugins/ecc/skills/scientific-db-uspto-database/SKILL.md)

### `/scientific-pkg-gget`

gget CLI and Python workflow for quick genomic database queries, sequence lookup, BLAST-style searches, enrichment checks, and reproducible bioinformatics evidence logs. Use when a task needs quick bioinformatics lookup across genomic reference databases with the gget CLI or Python package.

- 호출: `/scientific-pkg-gget` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/scientific-pkg-gget)
- 이 레포 사본: [`plugins/ecc/skills/scientific-pkg-gget/SKILL.md`](../../plugins/ecc/skills/scientific-pkg-gget/SKILL.md)

### `/scientific-thinking-literature-review`

Systematic literature-review workflow for academic, biomedical, technical, and scientific topics, including search planning, source screening, synthesis, citation checks, and evidence logging. Use when the task is to find, screen, synthesize, and cite a body of academic or technical literature.

- 호출: `/scientific-thinking-literature-review` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/scientific-thinking-literature-review)
- 이 레포 사본: [`plugins/ecc/skills/scientific-thinking-literature-review/SKILL.md`](../../plugins/ecc/skills/scientific-thinking-literature-review/SKILL.md)

### `/scientific-thinking-scholar-evaluation`

Structured scholarly-work evaluation for papers, proposals, literature reviews, methods sections, evidence quality, citation support, and research-writing feedback. Use when evaluating academic or scientific work — papers, proposals, methods sections, or evidence quality — against a repeatable rubric.

- 호출: `/scientific-thinking-scholar-evaluation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/scientific-thinking-scholar-evaluation)
- 이 레포 사본: [`plugins/ecc/skills/scientific-thinking-scholar-evaluation/SKILL.md`](../../plugins/ecc/skills/scientific-thinking-scholar-evaluation/SKILL.md)

### `/search-first`

Research-before-coding workflow: search npm/PyPI, MCP servers, skills, and GitHub for existing tools before writing custom code, then adopt, extend, or build. Launches the researcher agent for non-trivial needs. Use when starting a feature, adding a dependency or integration, or about to write a utility that may already exist.

- 호출: `/search-first` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/search-first)
- 이 레포 사본: [`plugins/ecc/skills/search-first/SKILL.md`](../../plugins/ecc/skills/search-first/SKILL.md)

### `/security-bounty-hunter`

Hunt for exploitable, bounty-worthy security issues in repositories. Focuses on remotely reachable vulnerabilities that qualify for real reports instead of noisy local-only findings. Use when hunting reportable, remotely reachable vulnerabilities in a repository.

- 호출: `/security-bounty-hunter` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/security-bounty-hunter)
- 이 레포 사본: [`plugins/ecc/skills/security-bounty-hunter/SKILL.md`](../../plugins/ecc/skills/security-bounty-hunter/SKILL.md)

### `/security-review`

Use this skill when adding authentication, handling user input, working with secrets, creating API endpoints, or implementing payment/sensitive features. Provides comprehensive security checklist and patterns.

- 호출: `/security-review` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/security-review)
- 이 레포 사본: [`plugins/ecc/skills/security-review/SKILL.md`](../../plugins/ecc/skills/security-review/SKILL.md)

### `/security-scan`

Scan your Claude Code configuration (.claude/ directory) for security vulnerabilities, misconfigurations, and injection risks using AgentShield. Checks CLAUDE.md, settings.json, MCP servers, hooks, and agent definitions. Use when auditing a .claude/ directory — CLAUDE.md, settings.json, MCP servers, hooks, or agent definitions.

- 호출: `/security-scan` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/security-scan)
- 이 레포 사본: [`plugins/ecc/skills/security-scan/SKILL.md`](../../plugins/ecc/skills/security-scan/SKILL.md)

### `/seo`

Audit, plan, and implement SEO improvements across technical SEO, on-page optimization, structured data, Core Web Vitals, and content strategy. Use when the user wants better search visibility, SEO remediation, schema markup, sitemap/robots work, or keyword mapping.

- 호출: `/seo` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/seo)
- 이 레포 사본: [`plugins/ecc/skills/seo/SKILL.md`](../../plugins/ecc/skills/seo/SKILL.md)

### `/skill-comply`

Visualize whether skills, rules, and agent definitions are actually followed — auto-generates scenarios at 3 prompt strictness levels, runs agents, classifies behavioral sequences, and reports compliance rates with full tool call timelines. Use when checking whether agents actually follow the skills, rules, and definitions they were given, rather than assuming they do.

- 호출: `/skill-comply` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `fixtures/`, `prompts/`, `scripts/`, `tests/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/skill-comply)
- 이 레포 사본: [`plugins/ecc/skills/skill-comply/SKILL.md`](../../plugins/ecc/skills/skill-comply/SKILL.md)

### `/skill-host-compat`

Lint ECC skills for Codex/Cursor-safe frontmatter and Claude-only substitutions before a skill PR.

- 호출: `/skill-host-compat` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/skill-host-compat)
- 이 레포 사본: [`plugins/ecc/skills/skill-host-compat/SKILL.md`](../../plugins/ecc/skills/skill-host-compat/SKILL.md)

### `/skill-scout`

Search existing local, marketplace, GitHub, and web skill sources before creating a new skill. Use when the user wants to create, build, fork, or find a skill for a workflow.

- 호출: `/skill-scout` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/skill-scout)
- 이 레포 사본: [`plugins/ecc/skills/skill-scout/SKILL.md`](../../plugins/ecc/skills/skill-scout/SKILL.md)

### `/skill-stocktake`

Use when auditing Claude skills and commands for quality. Supports Quick Scan (changed skills only) and Full Stocktake modes with sequential subagent batch evaluation.

- 호출: `/skill-stocktake` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `scripts/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/skill-stocktake)
- 이 레포 사본: [`plugins/ecc/skills/skill-stocktake/SKILL.md`](../../plugins/ecc/skills/skill-stocktake/SKILL.md)

### `/social-graph-ranker`

Weighted social-graph ranking for warm intro discovery, bridge scoring, and network gap analysis across X and LinkedIn. Use when the user wants the reusable graph-ranking engine itself, not the broader outreach or network-maintenance workflow layered on top of it.

- 호출: `/social-graph-ranker` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/social-graph-ranker)
- 이 레포 사본: [`plugins/ecc/skills/social-graph-ranker/SKILL.md`](../../plugins/ecc/skills/social-graph-ranker/SKILL.md)

### `/social-publisher`

Agent-driven scheduling and publishing of social media posts across 13 platforms via SocialClaw. Use when the user wants to publish to X, LinkedIn, Instagram, Facebook Pages, TikTok, Discord, Telegram, YouTube, Reddit, WordPress, or Pinterest — or when managing campaigns, uploading media, or monitoring post delivery status.

- 호출: `/social-publisher` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/social-publisher)
- 이 레포 사본: [`plugins/ecc/skills/social-publisher/SKILL.md`](../../plugins/ecc/skills/social-publisher/SKILL.md)

### `/springboot-patterns`

Spring Boot architecture patterns, REST API design, layered services, data access, caching, async processing, and logging. Use for Java Spring Boot backend work. Use when building or reviewing a Spring Boot backend — REST layer, services, data access, caching, or async work.

- 호출: `/springboot-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/springboot-patterns)
- 이 레포 사본: [`plugins/ecc/skills/springboot-patterns/SKILL.md`](../../plugins/ecc/skills/springboot-patterns/SKILL.md)

### `/springboot-security`

Spring Security best practices for authn/authz, validation, CSRF, secrets, headers, rate limiting, and dependency security in Java Spring Boot services. Use when reviewing Spring Security authn/authz, validation, CSRF, secrets, headers, or rate limiting.

- 호출: `/springboot-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/springboot-security)
- 이 레포 사본: [`plugins/ecc/skills/springboot-security/SKILL.md`](../../plugins/ecc/skills/springboot-security/SKILL.md)

### `/springboot-tdd`

Test-driven development for Spring Boot using JUnit 5, Mockito, MockMvc, Testcontainers, and JaCoCo. Use when adding features, fixing bugs, or refactoring.

- 호출: `/springboot-tdd` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/springboot-tdd)
- 이 레포 사본: [`plugins/ecc/skills/springboot-tdd/SKILL.md`](../../plugins/ecc/skills/springboot-tdd/SKILL.md)

### `/springboot-verification`

Run the full Spring Boot verification loop — Maven or Gradle build, SpotBugs, PMD, and Checkstyle static analysis, unit and Testcontainers integration tests with JaCoCo coverage, OWASP dependency and secret scans, and diff review — producing a pass/fail readiness report. Use when preparing a Spring Boot pull request, validating coverage thresholds, or running pre-deploy verification.

- 호출: `/springboot-verification` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/springboot-verification)
- 이 레포 사본: [`plugins/ecc/skills/springboot-verification/SKILL.md`](../../plugins/ecc/skills/springboot-verification/SKILL.md)

### `/story-lifecycle`

Manage a file-based epic → story → sprint development loop without requiring an external project management tool. Creates and tracks epics, breaks them into user stories, assigns them to sprints, and drives implementation story by story. Use when starting a new feature initiative or when the team has no Jira/Linear/Taiga but needs structured delivery tracking.

- 호출: `/story-lifecycle` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `scripts/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/story-lifecycle)
- 이 레포 사본: [`plugins/ecc/skills/story-lifecycle/SKILL.md`](../../plugins/ecc/skills/story-lifecycle/SKILL.md)

### `/strategic-compact`

Suggests manual context compaction at logical intervals to preserve context through task phases rather than arbitrary auto-compaction. Use when a session is approaching a context limit and a task phase is a natural place to compact.

- 호출: `/strategic-compact` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/strategic-compact)
- 이 레포 사본: [`plugins/ecc/skills/strategic-compact/SKILL.md`](../../plugins/ecc/skills/strategic-compact/SKILL.md)

### `/swift-actor-persistence`

Thread-safe data persistence in Swift using actors — in-memory cache with file-backed storage, eliminating data races by design. Use when persisting data in Swift and a data race or thread-safety problem needs designing out.

- 호출: `/swift-actor-persistence` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/swift-actor-persistence)
- 이 레포 사본: [`plugins/ecc/skills/swift-actor-persistence/SKILL.md`](../../plugins/ecc/skills/swift-actor-persistence/SKILL.md)

### `/swift-concurrency-6-2`

Swift 6.2 Approachable Concurrency — single-threaded by default, @concurrent for explicit background offloading, isolated conformances for main actor types. Use when adopting Swift 6.2 concurrency — offloading with @concurrent or resolving main-actor isolation.

- 호출: `/swift-concurrency-6-2` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/swift-concurrency-6-2)
- 이 레포 사본: [`plugins/ecc/skills/swift-concurrency-6-2/SKILL.md`](../../plugins/ecc/skills/swift-concurrency-6-2/SKILL.md)

### `/swift-protocol-di-testing`

Protocol-based dependency injection for testable Swift code — mock file system, network, and external APIs using focused protocols and Swift Testing. Use when Swift code needs testing and file system, network, or external APIs must be mocked.

- 호출: `/swift-protocol-di-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/swift-protocol-di-testing)
- 이 레포 사본: [`plugins/ecc/skills/swift-protocol-di-testing/SKILL.md`](../../plugins/ecc/skills/swift-protocol-di-testing/SKILL.md)

### `/swiftui-patterns`

SwiftUI architecture patterns, state management with @Observable, view composition, navigation, performance optimization, and modern iOS/macOS UI best practices. Use when building or reviewing SwiftUI views, @Observable state, navigation, or render performance.

- 호출: `/swiftui-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/swiftui-patterns)
- 이 레포 사본: [`plugins/ecc/skills/swiftui-patterns/SKILL.md`](../../plugins/ecc/skills/swiftui-patterns/SKILL.md)

### `/taste`

Creative-direction layer for music videos and short-form edits in the angelcore / cloud-trance / hyperpop family — a named-genre aesthetic vocabulary, mood + color + light system, beat-synced editing grammar, and a pipeline chaining ECC's video skills from b-roll generation to distribution. Use when a video must feel intentional rather than merely functional — music videos, fancams, moodboard-driven reels, or giving AI-generated b-roll a coherent visual direction.

- 호출: `/taste` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/taste)
- 이 레포 사본: [`plugins/ecc/skills/taste/SKILL.md`](../../plugins/ecc/skills/taste/SKILL.md)

### `/taste-application`

Generate new video against a distilled style pack and cut it into a finished piece - plan takes from the reference's cut rhythm, generate on fal, grade with the pack's measured LUT, cut at the measured cadence, weave in existing footage, composite overlay plates, mint 3D props, and verify the result numerically. Use when the user wants to make a video in a captured style, supplement existing footage, or assemble generated clips into a real edit.

- 호출: `/taste-application` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `scripts/`, `tests/`, `workflows/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/taste-application)
- 이 레포 사본: [`plugins/ecc/skills/taste-application/SKILL.md`](../../plugins/ecc/skills/taste-application/SKILL.md)

### `/taste-distillation`

Measure a set of reference videos into a reusable style pack - colour grade as a 3D LUT, cut rhythm as a shot-length distribution, hero stills, screen-blend overlay plates, and a text spec for a generative model. Use when the user wants to capture the look of reference footage, build a repeatable look, mint assets from references, or reproduce someone's grade and pacing.

- 호출: `/taste-distillation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `scripts/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/taste-distillation)
- 이 레포 사본: [`plugins/ecc/skills/taste-distillation/SKILL.md`](../../plugins/ecc/skills/taste-distillation/SKILL.md)

### `/tasteforge-video`

Use for file-driven multimodal image, video, and 3D-asset discovery; taste interviews; distill or apply workflows; style-pack validation; editable EDL/FCPXML export; provenance audits; and offline planning that must fail closed before provider generation.

- 호출: `/tasteforge-video` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/tasteforge-video)
- 이 레포 사본: [`plugins/ecc/skills/tasteforge-video/SKILL.md`](../../plugins/ecc/skills/tasteforge-video/SKILL.md)

### `/tdd-workflow`

Test-driven development workflow: write a failing test first, watch it fail, implement the smallest change to green, then refactor with 80%+ coverage across unit, integration, and E2E tests. Use when writing a new feature, fixing a bug, refactoring, or when told to write failing tests first.

- 호출: `/tdd-workflow <path/to/*.plan.md>` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/tdd-workflow)
- 이 레포 사본: [`plugins/ecc/skills/tdd-workflow/SKILL.md`](../../plugins/ecc/skills/tdd-workflow/SKILL.md)

### `/team-agent-orchestration`

Run team-based orchestration for agent squads: work items with owners and scope, agent Kanban state, branch isolation, control pane visibility, and merge gates. Use when coordinating multiple agents in parallel across branches or worktrees — multi-agent fan-out, agent Kanban, squad coordination, or merging agent output into one product.

- 호출: `/team-agent-orchestration` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/team-agent-orchestration)
- 이 레포 사본: [`plugins/ecc/skills/team-agent-orchestration/SKILL.md`](../../plugins/ecc/skills/team-agent-orchestration/SKILL.md)

### `/team-builder`

Interactive picker that discovers available agent personas via the claude agents command and agents/ markdown globs, groups them into domains, has the user select up to five, dispatches them in parallel on one task, and synthesizes agreements and conflicts into a unified report. Use when composing a team of agents, browsing available agent personas, or running several specialist agents in parallel.

- 호출: `/team-builder` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/team-builder)
- 이 레포 사본: [`plugins/ecc/skills/team-builder/SKILL.md`](../../plugins/ecc/skills/team-builder/SKILL.md)

### `/terminal-opener`

Open an executable and its argument array in a visible terminal window through a reusable, shell-free launch plan with dry-run, JSON, capability detection, detached fallback, and standalone recovery modes. Use when Codex needs to open an interactive CLI, SSH session, local development process, sandbox, or other argv-based command in a new host terminal; diagnose whether a supported terminal is available; or provide an actionable plan when the requested terminal is unsupported.

- 호출: `/terminal-opener` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `agents/`, `scripts/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/terminal-opener)
- 이 레포 사본: [`plugins/ecc/skills/terminal-opener/SKILL.md`](../../plugins/ecc/skills/terminal-opener/SKILL.md)

### `/terminal-ops`

Evidence-first repo execution workflow for ECC. Use when the user wants a command run, a repo checked, a CI failure debugged, or a narrow fix pushed with exact proof of what was executed and verified.

- 호출: `/terminal-ops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/terminal-ops)
- 이 레포 사본: [`plugins/ecc/skills/terminal-ops/SKILL.md`](../../plugins/ecc/skills/terminal-ops/SKILL.md)

### `/test-collaboration`

Inventory and govern a project's test assets. Connect requirements, business rules, risks, bugs, and cross-boundary contracts to stable TEST-IDs and executable evidence in the repository's existing test registry or TESTS.md. Use for test inventory, test gap analysis, unit/integration/contract/E2E/smoke classification, bug-to-test regression protection, consumer/provider contract testing, test-necessity review, and pre-delivery evidence review.

- 호출: `/test-collaboration` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `templates/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/test-collaboration)
- 이 레포 사본: [`plugins/ecc/skills/test-collaboration/SKILL.md`](../../plugins/ecc/skills/test-collaboration/SKILL.md)

### `/tinystruct-patterns`

Expert guidance for developing with the tinystruct Java framework. Use when working on the tinystruct codebase or any project built on tinystruct — including generating the bin/dispatcher and bin/dispatcher.cmd launcher scripts when a project lacks them, creating Application classes, @Action-mapped routes, unit tests, ActionRegistry, HTTP/CLI dual-mode handling, the built-in HTTP server, the event system, JSON with Builder/Builders, database persistence with AbstractData, POJO generation, Server-Sent Events (SSE), file uploads, and outbound HTTP networking.

- 호출: `/tinystruct-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/tinystruct-patterns)
- 이 레포 사본: [`plugins/ecc/skills/tinystruct-patterns/SKILL.md`](../../plugins/ecc/skills/tinystruct-patterns/SKILL.md)

### `/token-budget-advisor`

Offer a choice of response depth (25%/50%/75%/100%) with token estimates before answering, then answer at that level. Use when the user asks to control response length or token budget, such as 'token budget', 'short version', 'brief answer', 'respuesta corta vs larga', 'cuántos tokens', 'ahorrar tokens', 'responde al 50%', 'dame la versión corta', 'quiero controlar cuánto usas'. Skip if depth is already set this session or 'token' means an auth/payment token.

- 호출: `/token-budget-advisor` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/token-budget-advisor)
- 이 레포 사본: [`plugins/ecc/skills/token-budget-advisor/SKILL.md`](../../plugins/ecc/skills/token-budget-advisor/SKILL.md)

### `/token-card`

Render a token-usage stat card from local Claude Code, Codex, Gemini CLI, and OpenCode session logs and commit it into the repository as a file. Use when someone wants a current usage figure in a README, or asks for a shareable card of their coding-agent activity.

- 호출: `/token-card` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/token-card)
- 이 레포 사본: [`plugins/ecc/skills/token-card/SKILL.md`](../../plugins/ecc/skills/token-card/SKILL.md)

### `/typescript-patterns`

TypeScript patterns for strict, type-safe, maintainable code in modern TypeScript and JavaScript applications. Covers strict compiler configuration, type design, narrowing, discriminated unions, generics, async and error handling, module boundaries, dependency hygiene, and type-level testing. Use when writing or reviewing TypeScript or JavaScript code.

- 호출: `/typescript-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/typescript-patterns)
- 이 레포 사본: [`plugins/ecc/skills/typescript-patterns/SKILL.md`](../../plugins/ecc/skills/typescript-patterns/SKILL.md)

### `/ui-demo`

Record polished UI demo videos using Playwright. Use when the user asks to create a demo, walkthrough, screen recording, or tutorial video of a web application. Produces WebM videos with visible cursor, natural pacing, and professional feel.

- 호출: `/ui-demo` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ui-demo)
- 이 레포 사본: [`plugins/ecc/skills/ui-demo/SKILL.md`](../../plugins/ecc/skills/ui-demo/SKILL.md)

### `/ui-to-vue`

Use when the user has UI screenshots or design exports that need batch conversion into Vue 3 components, especially with Vant, Element Plus, or Ant Design Vue.

- 호출: `/ui-to-vue` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/ui-to-vue)
- 이 레포 사본: [`plugins/ecc/skills/ui-to-vue/SKILL.md`](../../plugins/ecc/skills/ui-to-vue/SKILL.md)

### `/uncloud`

Use when managing an Uncloud cluster — deploying services, configuring Caddy ingress, adding static proxy routes for non-cluster devices, publishing ports, scaling, inspecting logs, or managing machines and volumes with the `uc` CLI.

- 호출: `/uncloud` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/uncloud)
- 이 레포 사본: [`plugins/ecc/skills/uncloud/SKILL.md`](../../plugins/ecc/skills/uncloud/SKILL.md)

### `/unified-memory`

Share durable, inspectable context and handoffs between Claude, Codex, Hermes, Cursor, OpenCode, and other agents through the local ECC Memory Vault. Use when an agent must save work state, transfer context, resume another agent's task, or search shared project knowledge.

- 호출: `/unified-memory` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/unified-memory)
- 이 레포 사본: [`plugins/ecc/skills/unified-memory/SKILL.md`](../../plugins/ecc/skills/unified-memory/SKILL.md)

### `/unified-notifications-ops`

Operate notifications as one ECC-native workflow across GitHub, Linear, desktop alerts, hooks, and connected communication surfaces. Use when the real problem is alert routing, deduplication, escalation, or inbox collapse.

- 호출: `/unified-notifications-ops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/unified-notifications-ops)
- 이 레포 사본: [`plugins/ecc/skills/unified-notifications-ops/SKILL.md`](../../plugins/ecc/skills/unified-notifications-ops/SKILL.md)

### `/verification-loop`

Run a six-phase verification of a Claude Code session's work — build, type check, lint, tests with coverage, security grep, and diff review — then produce a PASS/FAIL verification report. Use when verifying work after completing a feature or refactor, before creating a PR, or when quality gates must pass.

- 호출: `/verification-loop` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/verification-loop)
- 이 레포 사본: [`plugins/ecc/skills/verification-loop/SKILL.md`](../../plugins/ecc/skills/verification-loop/SKILL.md)

### `/video-editing`

AI-assisted video editing workflows for cutting, structuring, and augmenting real footage. Covers the full pipeline from raw capture through FFmpeg, Remotion, ElevenLabs, fal.ai, and final polish in Descript or CapCut. Use when the user wants to edit video, cut footage, create vlogs, or build video content.

- 호출: `/video-editing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/video-editing)
- 이 레포 사본: [`plugins/ecc/skills/video-editing/SKILL.md`](../../plugins/ecc/skills/video-editing/SKILL.md)

### `/videodb`

Ingest, index, search, edit, and monitor video and audio with the VideoDB Python SDK — upload from files, URLs, or RTSP feeds, build spoken and scene indexes with timestamped search and playable clips, transcode and reframe, do timeline edits (subtitles, overlays, dubbing), and run real-time alerts on live streams or desktop capture. Use when working with video search, transcription, clipping, transcoding, streaming, or live video alerts.

- 호출: `/videodb [task description]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `reference/`, `scripts/`
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/videodb)
- 이 레포 사본: [`plugins/ecc/skills/videodb/SKILL.md`](../../plugins/ecc/skills/videodb/SKILL.md)

### `/visa-doc-translate`

Translate visa document images (bank deposit, employment, income, and retirement certificates; HEIC, PNG, or JPG) into English via OCR and produce a bilingual PDF pairing the original image with a formatted certified-style translation. Use when a visa application needs a document translated to English, an official certificate OCR'd and translated, or a bilingual translation PDF for immigration paperwork.

- 호출: `/visa-doc-translate` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/visa-doc-translate)
- 이 레포 사본: [`plugins/ecc/skills/visa-doc-translate/SKILL.md`](../../plugins/ecc/skills/visa-doc-translate/SKILL.md)

### `/vite-patterns`

Vite build tool patterns including config, plugins, HMR, env variables, proxy setup, SSR, library mode, dependency pre-bundling, and build optimization. Activate when working with vite.config.ts, Vite plugins, or Vite-based projects.

- 호출: `/vite-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/vite-patterns)
- 이 레포 사본: [`plugins/ecc/skills/vite-patterns/SKILL.md`](../../plugins/ecc/skills/vite-patterns/SKILL.md)

### `/vue-patterns`

Vue.js 3 Composition API patterns, component architecture, reactivity best practices, Pinia state management, Vue Router navigation, and Nuxt SSR patterns. Activates for Vue, Nuxt, Vite, or Pinia projects. Use when building or reviewing Vue 3, Nuxt, or Pinia code — Composition API, reactivity, or router navigation.

- 호출: `/vue-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/vue-patterns)
- 이 레포 사본: [`plugins/ecc/skills/vue-patterns/SKILL.md`](../../plugins/ecc/skills/vue-patterns/SKILL.md)

### `/windows-desktop-e2e`

E2E testing for Windows native desktop apps (WPF, WinForms, Win32/MFC, Qt) using pywinauto and Windows UI Automation. Use when writing E2E tests for a Windows native desktop app with pywinauto or UI Automation.

- 호출: `/windows-desktop-e2e` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/windows-desktop-e2e)
- 이 레포 사본: [`plugins/ecc/skills/windows-desktop-e2e/SKILL.md`](../../plugins/ecc/skills/windows-desktop-e2e/SKILL.md)

### `/workspace-surface-audit`

Audit the active repo, MCP servers, plugins, connectors, env surfaces, and harness setup, then recommend the highest-value ECC-native skills, hooks, agents, and operator workflows. Use when the user wants help setting up Claude Code or understanding what capabilities are actually available in their environment.

- 호출: `/workspace-surface-audit` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/workspace-surface-audit)
- 이 레포 사본: [`plugins/ecc/skills/workspace-surface-audit/SKILL.md`](../../plugins/ecc/skills/workspace-surface-audit/SKILL.md)

### `/x-api`

X/Twitter API integration for posting tweets, threads, reading timelines, search, and analytics. Covers OAuth auth patterns, rate limits, and platform-native content posting. Use when the user wants to interact with X programmatically.

- 호출: `/x-api` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/HEAD/skills/x-api)
- 이 레포 사본: [`plugins/ecc/skills/x-api/SKILL.md`](../../plugins/ecc/skills/x-api/SKILL.md)
