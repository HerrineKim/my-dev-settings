# magnus-agent-skills

[magnus919/agent-skills](https://github.com/magnus919/agent-skills)(MIT)의 스킬 182개를 그대로 받아 둔 묶음. 프론트엔드·백엔드·디버깅·아키텍처·제품·운영·데이터·문서·글쓰기까지 범위가 넓다.

## 전역 링크
스킬 목록이 매 세션 컨텍스트를 차지하므로 플러그인 전체는 `skills-exclude`로 빼고, `!magnus-agent-skills/<스킬>` 줄에 적은 것만 `~/.claude/skills`에 링크한다.

| 스킬 | 고른 이유 |
|---|---|
| `frontend-engineering`, `react` | 컴포넌트 구조·상태·API 연동 |
| `web-accessibility`, `performance-optimization` | 접근성·성능 점검 |
| `playwright` | E2E 테스트·브라우저 자동화 |
| `supabase` | 마이그레이션·RLS·CLI |
| `systematic-debugging` | 4단계 원인 분석 |
| `api-design-and-evolution` | API·이벤트 인터페이스 설계 |
| `technical-documentation`, `adr-authoring` | README·API 문서·결정 기록 |
| `agent-skills`, `harness-engineering` | 스킬 작성·에이전트 하네스 설계 |

다른 스킬을 전역에 더하려면 `skills-exclude`에 `!magnus-agent-skills/<스킬>` 줄을 넣고 `./install.sh`를 다시 실행한다. 링크하지 않은 스킬은 플러그인으로 설치(`claude plugin install magnus-agent-skills@hyerin-skills`)하면 `/magnus-agent-skills:<스킬>`로 쓸 수 있다.

## 주의
- `flaresolverr`, `flaresolverr-cli`(봇 차단 우회), `camera-hacking`, `binary-analysis` 등은 받아만 두었고 전역 링크하지 않는다.
- 딸린 스크립트는 복사만 하고 실행하지 않았다. 쓰기 전에 내용을 확인한다.
- `nous-branding`의 참고 이미지 때문에 폴더가 40MB 정도로 크다.
- 업스트림 원문 README는 [`../upstream/magnus-agent-skills/`](../upstream/magnus-agent-skills/)에 있다.

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (182개)

### `/actuarial-risk-modeling`

Use when analyzing, selecting, validating, or communicating models for insurance, actuarial, financial-risk, or other consequential uncertain outcomes. Covers regression, generalized linear models, frequency-severity, panel and longitudinal data, survival, time series, credibility, reserving, tail risk, calibration, and model governance. Do not use for generic software forecasting, ordinary SaaS financial models, or credentialed actuarial, investment, legal, or regulatory advice without the relevant specialist review.

- 호출: `/actuarial-risk-modeling` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/actuarial-risk-modeling)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/actuarial-risk-modeling/SKILL.md`](../../plugins/magnus-agent-skills/skills/actuarial-risk-modeling/SKILL.md)

### `/adr-authoring`

Write, review, and maintain architecture decision records with clear context, alternatives, consequences, confirmation links, and lifecycle governance. Use when a consequential technical decision or its enforceable architectural constraint must remain understandable. Do not use for system-wide evolutionary architecture design, general observability, or operating a named test or CI tool.

- 호출: `/adr-authoring` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/adr-authoring)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/adr-authoring/SKILL.md`](../../plugins/magnus-agent-skills/skills/adr-authoring/SKILL.md)

### `/agent-council`

Run a structured multi-agent debate by spawning a panel of expert agents on any question, with convergence-aware iteration and typed synthesis output via the `agent-council` CLI. Use when a decision has genuine tradeoffs, high stakes, or hidden assumptions worth adversarial collaboration, or when confidence diagnostics matter more than a single recommendation. Compatible with any AI agent harness that supports agentskills.io skills (Claude Code, Cursor, Hermes Agent, OpenHands, etc.). Do not use for simple factual lookups, tasks with a clear correct answer, routine single-perspective work, or code execution and tool orchestration beyond debate.

- 호출: `/agent-council` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `agent_council/`, `evals/`, `profiles/`, `references/`, `scripts/`, `templates/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/agent-council)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/agent-council/SKILL.md`](../../plugins/magnus-agent-skills/skills/agent-council/SKILL.md)

### `/agent-evals-and-observability`

Design, run, review, or release framework- and vendor-neutral evaluations and observability for AI agents. Use when defining agent evals, datasets, graders, trajectory review, regression analysis, release gates, production traces, or privacy-aware telemetry. Covers task and trajectory contracts, statistical comparisons, and incident-to-case learning; route framework implementation to pydanticai or langgraph when needed. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/agent-evals-and-observability` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/agent-evals-and-observability)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/agent-evals-and-observability/SKILL.md`](../../plugins/magnus-agent-skills/skills/agent-evals-and-observability/SKILL.md)

### `/agent-production-operations`

Operate an evaluated agent with tools and authority in production through a runtime control plane covering versioning, staged rollout, fallback, cost and latency budgets, tool health, human escalation, disablement, and trace-to-eval feedback. Do not use for building agents, designing evals, or general release, SRE, security, or platform engineering — those methods stay with their specialist skills.

- 호출: `/agent-production-operations` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/agent-production-operations)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/agent-production-operations/SKILL.md`](../../plugins/magnus-agent-skills/skills/agent-production-operations/SKILL.md)

### `/agent-skills`

Use this skill when creating, reviewing, or editing Agent Skills-format skills, or when implementing skill discovery and loading in an agent client. It covers directory structure, SKILL.md metadata, progressive disclosure, evals, and repository conventions. Do not use this skill for general software work that does not involve the Agent Skills format or lifecycle.

- 호출: `/agent-skills` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/agent-skills)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/agent-skills/SKILL.md`](../../plugins/magnus-agent-skills/skills/agent-skills/SKILL.md)

### `/ai-governance`

Design and operate AI governance: principles, decision rights, risk tiers, lifecycle gates, fairness, transparency, privacy, security, compliance mapping, maturity and board reporting across SaaS, API, self-hosted and agentic systems. Use to admit, update or retire Agent Skills, MCP servers and A2A capabilities; approve an agent for production actions; or decide earned-autonomy promotion, reduction or revocation. Cover GxP, ALCOA+, data integrity, electronic records, assurance and QMS interfaces for life sciences. Do not use for legal interpretation (legal-strategy), data-platform mechanics (data-architect/data-engineering), security implementation (secure-software-engineering), skill package inspection (agent-skills), or executing runtime changes (agent-production-operations).

- 호출: `/ai-governance` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `research/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/ai-governance)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/ai-governance/SKILL.md`](../../plugins/magnus-agent-skills/skills/ai-governance/SKILL.md)

### `/ai-operating-economics`

Use when deciding whether an AI-enabled workflow should be adopted, scaled, constrained, redesigned, or retired, and the decision must connect business outcomes, worker or user effects, quality guardrails, full operating cost, telemetry, uncertainty, and accountable governance. Do not use for a standalone financial model, infrastructure cost calculation, agent evaluation design, runtime operations, or general AI governance; route those details to the neighboring specialist skills.

- 호출: `/ai-operating-economics` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/ai-operating-economics)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/ai-operating-economics/SKILL.md`](../../plugins/magnus-agent-skills/skills/ai-operating-economics/SKILL.md)

### `/amazon-memo`

Create, adapt, or revise Amazon-style narrative decision memos, six-pagers, PR/FAQs, and short decision briefs, including reading meetings and async review. Use for choosing the right memo form, evidence-led reasoning, and revising mechanical AI prose for human readers. Do not use for general copywriting, document rendering, or replacing incident reports and technical design records.

- 호출: `/amazon-memo` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/amazon-memo)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/amazon-memo/SKILL.md`](../../plugins/magnus-agent-skills/skills/amazon-memo/SKILL.md)

### `/analog-occultism`

Use this skill to create subject-neutral images and videos in an analog occultism / industrial CRT noir aesthetic: near-monochrome archival technical atmosphere, severe low-key lighting, tactile signal degradation, industrial geometry, and quiet unresolved tension. Use for portraits, products, environments, interfaces, diagrams, abstract forms, stills, and motion. Do not use for colorful cyberpunk, vaporwave, glossy advertising, conventional horror, or clean digital renders.

- 호출: `/analog-occultism` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/analog-occultism)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/analog-occultism/SKILL.md`](../../plugins/magnus-agent-skills/skills/analog-occultism/SKILL.md)

### `/anydoc`

Convert Word (.doc/.docx/.docm), PowerPoint (.ppt/.pps/.pot/.pptx/.pptm/.ppsx/.ppsm), Excel (.xls/.xlsx/.xlsm/.xlsb), OpenDocument (.odt/.ods/.odp), RTF, EPUB, CSV, and PDF documents to clean GitHub-Flavored Markdown locally with the Any Doc CLI (npx -y @firecrawl/anydoc@0.2.4): headings, GFM tables, slide structure, and footnotes in one pass. Use when a task needs the contents of an office document, spreadsheet, presentation, ebook, or PDF you cannot read directly. Do not use for generating, editing, or validating documents (use documents), for ebook packaging (use epub). For scanned or image-only PDFs, use hosted OCR only when the user explicitly authorizes whole-document upload; otherwise route to local OCR tooling.

- 호출: `/anydoc` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `fixtures/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/anydoc)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/anydoc/SKILL.md`](../../plugins/magnus-agent-skills/skills/anydoc/SKILL.md)

### `/api-design-and-evolution`

Design, govern, document, review, and evolve consumer-facing APIs and event interfaces. Use when choosing REST/HTTP, GraphQL, RPC, events, webhooks, or streaming; writing OpenAPI or AsyncAPI contracts; assessing an API landscape, ownership, duplication, lifecycle, discoverability, retirement, gateways, service meshes, north-south or east-west traffic, routing, policy, observability, or failure boundaries; defining schemas, pagination, mutations, errors, idempotency, or compatibility; or planning versioning, deprecation, and migration. Do not use for product discovery, platform operations, full security assessment, ADR authoring, or delivery gates; route those to the neighboring specialist skills.

- 호출: `/api-design-and-evolution` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/api-design-and-evolution)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/api-design-and-evolution/SKILL.md`](../../plugins/magnus-agent-skills/skills/api-design-and-evolution/SKILL.md)

### `/artifact-pyramids`

Organize durable agent research outputs as summaries, analysis, and evidence dossiers. Use when producing multi-layer research artifacts or coordinating research handoffs. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/artifact-pyramids` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/artifact-pyramids)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/artifact-pyramids/SKILL.md`](../../plugins/magnus-agent-skills/skills/artifact-pyramids/SKILL.md)

### `/ascii-city-engine`

Build portable, first-person colored ASCII city engines and small GIS-derived city packs. Use when designing terrain-following walking, raycast character rendering, city-provider schemas, or reproducible public-GIS ingestion. Do not use for conventional 3D/WebGL games, multi-level interiors, general GIS analysis, or committing full-resolution GIS archives.

- 호출: `/ascii-city-engine` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/ascii-city-engine)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/ascii-city-engine/SKILL.md`](../../plugins/magnus-agent-skills/skills/ascii-city-engine/SKILL.md)

### `/autogen`

Build conversational multi-agent systems with Microsoft AutoGen. AssistantAgent, UserProxyAgent, GroupChat, code execution, nested chats, cancellation tokens, tool integration, and MCP support. Use when building conversation-driven multi-agent systems or comparing agent frameworks. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/autogen` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/autogen)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/autogen/SKILL.md`](../../plugins/magnus-agent-skills/skills/autogen/SKILL.md)

### `/backend-engineering`

Design and implement backend services and APIs — REST, gRPC, GraphQL, event-driven handlers, transaction boundaries, outbox/inbox delivery, migration coexistence, database access, integration, error handling, and service-level testing. Use for application/domain/infrastructure implementation decisions. Language and framework agnostic. Do not use for frontend, data engineering, platform provisioning, API contract ownership, service decomposition strategy, or cross-system migration planning.

- 호출: `/backend-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/backend-engineering)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/backend-engineering/SKILL.md`](../../plugins/magnus-agent-skills/skills/backend-engineering/SKILL.md)

### `/binary-analysis`

Plan static inspection of unknown binary files with a deterministic CLI whose Ghidra operations are currently unimplemented and fail closed. Use when you need to inspect a PE, ELF, or Mach-O file — triage suspicious binaries, map imported APIs, decompile functions, trace call paths, or produce structured evidence reports. Do not use for runtime analysis (debugging, dynamic tracing, sandbox execution), for modifying or patching binaries, or for binaries you already know everything about. The skill owns planning, hypothesis formation, and evidence synthesis; the CLI owns all deterministic operations.

- 호출: `/binary-analysis` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/binary-analysis)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/binary-analysis/SKILL.md`](../../plugins/magnus-agent-skills/skills/binary-analysis/SKILL.md)

### `/bmad`

Use this skill to run BMad (Breakthrough Method of Agile AI-Driven Development) as a harness-agnostic control-plane protocol that turns human intent into bounded, inspectable, resumable agent work. Compress intent into a five-field contract (Why, Capabilities, Constraints, Non-goals, Success signal); classify work as direct/bounded/initiative and route to the smallest safe path; carry decisions in durable artifacts; review as triage; route failure to the layer where ambiguity entered; and gate autonomy on observable acceptance with machine-readable status (draft/ready-for-dev/in-progress/in-review/done/blocked). Use when a change request, feature, delegated build, or multi-agent epic needs intent capture, bounded implementation, review, and resumability in any agent harness. Do not use for validating whether a problem is real (product-discovery), shaping bets before planning (product-shaping), formal spec/gate pipelines (spec-driven-development), or the issue-to-PR delivery flow (neckbeard).

- 호출: `/bmad` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/bmad)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/bmad/SKILL.md`](../../plugins/magnus-agent-skills/skills/bmad/SKILL.md)

### `/brand-designer`

Create comprehensive brand identity documentation for any brand. Guides you through documenting strategy, visual identity (logo, color, typography, imagery), voice and tone, application guidelines, governance, and asset inventory. Produces markdown specs, compiled brand books, and brand-compliant images via reference-image-aware generation. Use when you need to capture a brand's identity in structured, durable form — for vault storage, agency handoff, or press kit distribution. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/brand-designer` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/brand-designer)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/brand-designer/SKILL.md`](../../plugins/magnus-agent-skills/skills/brand-designer/SKILL.md)

### `/c4-diagramming`

Create and review C4 software-architecture diagrams using Mermaid or Structurizr. Use when teams need a communication-ready system context, container, component, or code-level view, including audience, narrative, hierarchy, labels, legends, accessibility, and uncertainty. Do not use for Mermaid syntax/rendering work without C4 modeling, architecture decisions, or full accessibility conformance reviews.

- 호출: `/c4-diagramming` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/c4-diagramming)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/c4-diagramming/SKILL.md`](../../plugins/magnus-agent-skills/skills/c4-diagramming/SKILL.md)

### `/camera-hacking`

Investigate, reverse-engineer, develop, and validate digital-camera modifications and interoperability, including custom firmware, hidden settings, camera control protocols, feature unlocks, and model-specific recovery. Use for feasibility research, offline analysis, controlled experiments, and explicitly authorized installation on photographic, cinema, and action cameras across manufacturers, especially Fujifilm X and Ricoh GR. Do not use for ordinary photography advice, routine vendor firmware updates, media editing, or unauthorized camera access.

- 호출: `/camera-hacking` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/camera-hacking)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/camera-hacking/SKILL.md`](../../plugins/magnus-agent-skills/skills/camera-hacking/SKILL.md)

### `/capacity-and-cost-engineering`

Model technical capacity, unit cost, and budget constraints connected to demand, performance, and reliability decisions. Use when projecting capacity from growth forecasts, sizing for peak events, designing cost-aware scaling policies, defining budget thresholds or quota/rate-limit enforcement, running or planning load/soak tests as capacity evidence, resolving SLO-cost tradeoffs, or modeling multi-tenant demand distributions, hot-tenant skew, pooled or siloed headroom, fairness evidence, and tenant-variable unit cost. Do NOT use for financial P&L statements, fundraising scenarios, or SaaS metrics (route to financial-modeling); for infrastructure implementation or cloud-resource provisioning (route to platform-engineering); or for generic cloud-cost tips and universal utilization targets — this skill does not prescribe fixed savings rates or one-size-fits-all thresholds.

- 호출: `/capacity-and-cost-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/capacity-and-cost-engineering)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/capacity-and-cost-engineering/SKILL.md`](../../plugins/magnus-agent-skills/skills/capacity-and-cost-engineering/SKILL.md)

### `/chief-of-staff-methodology`

Prepare accountable executive decisions, information triage, briefing, calendar choices, organizational sensing, and institutional memory without assuming authority or monitoring people. Use when a chief of staff or CoS, executive office, gatekeeping, decision memo, executive briefing, board materials, organizational sensing, team health, institutional memory, calendar triage, meeting audit, strategic time, or attention allocation is requested. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/chief-of-staff-methodology` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/chief-of-staff-methodology)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/chief-of-staff-methodology/SKILL.md`](../../plugins/magnus-agent-skills/skills/chief-of-staff-methodology/SKILL.md)

### `/cli-builder`

Build or refactor agent-facing CLI tools with non-interactive commands, stable --help and --json contracts, idempotent operations, and --dry-run previews. Use for CLI design, agent-friction refactors, output/exit-code debugging, or automation safety. Do not use for GUI/TUI design, conversational tools, MCP server design, or general API architecture; use api-design-and-evolution for the latter.

- 호출: `/cli-builder` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/cli-builder)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/cli-builder/SKILL.md`](../../plugins/magnus-agent-skills/skills/cli-builder/SKILL.md)

### `/cncf-landscape`

Use this skill when discovering and comparing cloud-native technologies from the CNCF Landscape for an architecture or engineering decision. Query the live public Landscape API, filter candidates by capability, category, maturity, license, and repository signals, then produce an evidence-backed shortlist with trade-offs, unknowns, and validation steps. Do not use it as a substitute for project documentation, production-readiness testing, legal review, or general architecture methodology.

- 호출: `/cncf-landscape` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/cncf-landscape)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/cncf-landscape/SKILL.md`](../../plugins/magnus-agent-skills/skills/cncf-landscape/SKILL.md)

### `/color-management`

Manage color workflows with ICC profiles, working spaces, gamut mapping, and color science. Use when inspecting ICC profiles, converting between color spaces, checking gamut clipping, validating well-behaved working spaces, or troubleshooting color workflow issues with ImageMagick, ArgyllCMS, Exiftool, or LittleCMS. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/color-management` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/color-management)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/color-management/SKILL.md`](../../plugins/magnus-agent-skills/skills/color-management/SKILL.md)

### `/community-guides`

Create, adapt, or revise practical community guides with locally grounded activities, participant worksheets, facilitator instructions, and maintenance plans. Use for neighborhood preparedness, mutual support, shared projects, and community learning programs. Do not use for travel guides, promotional brochures, standalone policies, simple document formatting, or live incident response.

- 호출: `/community-guides` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `examples/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/community-guides)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/community-guides/SKILL.md`](../../plugins/magnus-agent-skills/skills/community-guides/SKILL.md)

### `/conditional-customer-success`

Guide recurring human-relationship practices — success plans, health evidence, renewal and expansion signals, QBRs, handoffs, escalation, and closed-loop Voice of Customer. Do not use this skill for products without accounts, renewals, QBRs, or a customer-success team, including some internal tools, pure transactional products without recurring relationships, and public services without account-based engagement. Load only when the product context includes a recurring human relationship; decline or route away otherwise.

- 호출: `/conditional-customer-success` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/conditional-customer-success)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/conditional-customer-success/SKILL.md`](../../plugins/magnus-agent-skills/skills/conditional-customer-success/SKILL.md)

### `/confluence-cli`

Interact with Atlassian Confluence from the terminal: list spaces, browse pages, view page content, search with CQL, and create pages. Use when the user mentions Confluence, a space key (e.g. DEV), or asks about documentation, wiki pages, space content, or knowledge base articles. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/confluence-cli` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/confluence-cli)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/confluence-cli/SKILL.md`](../../plugins/magnus-agent-skills/skills/confluence-cli/SKILL.md)

### `/constrained-optimization`

Define, compare, and audit constrained optimization decisions with explicit variables, units, hard and soft constraints, feasibility, Pareto tradeoffs, and honest solver evidence. Do not use for statistical modeling or ML fitting, which belong to data-scientist or ml-engineering, or for operating a named solver.

- 호출: `/constrained-optimization` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/constrained-optimization)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/constrained-optimization/SKILL.md`](../../plugins/magnus-agent-skills/skills/constrained-optimization/SKILL.md)

### `/crewai`

Build role-based multi-agent systems with CrewAI. Agents with Role/Goal/Backstory, task design, crew composition (sequential or hierarchical), tool integration, callbacks, and production deployment. Use when orchestrating multi-agent teams or comparing agent frameworks. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/crewai` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/crewai)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/crewai/SKILL.md`](../../plugins/magnus-agent-skills/skills/crewai/SKILL.md)

### `/crm`

Operate HubSpot CRM from a terminal or agent: list and search contact records, view deal pipeline stages, and — with explicit confirmation — move deals between stages, backed by a bundled crm-cli script that is read-only by default and gates every stage change behind a --dry-run/--yes confirmation. Use when an agent needs to answer questions about contacts or deals, produce pipeline views, or apply a confirmed stage change. Do not use for building HubSpot apps or workflow automations (that is HubSpot app development), marketing/sequence automation, or other CRMs like Salesforce (that is their own tooling).

- 호출: `/crm` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/crm)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/crm/SKILL.md`](../../plugins/magnus-agent-skills/skills/crm/SKILL.md)

### `/crowdsec`

Deploy, configure, and operate CrowdSec Security Engine, cscli, remediation components, acquisition pipelines, and AppSec WAF. Use for Linux or Docker installation, detection-to-blocking design, incident review, and safe changes. Do not use for generic firewall, Kubernetes, or reverse-proxy design; route those to the named platform skill and use this skill for CrowdSec integration.

- 호출: `/crowdsec` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/crowdsec)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/crowdsec/SKILL.md`](../../plugins/magnus-agent-skills/skills/crowdsec/SKILL.md)

### `/cryptpad`

Use CryptPad encrypted collaboration for integration, automation, and diagnosis with its browser integration API, instance discovery, document import/export, and session-key lifecycle. Use for CryptPad API feasibility, embedded editors, sharing, persistence, or self-hosted instance troubleshooting. Do not use for EncryptPad/OpenPGP, generic office-file conversion, or designing an unrelated collaboration service.

- 호출: `/cryptpad` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/cryptpad)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/cryptpad/SKILL.md`](../../plugins/magnus-agent-skills/skills/cryptpad/SKILL.md)

### `/cyberpunk`

Create or analyze settings, scenes, world operations, and image direction in the literary cyberpunk mode of William Gibson's Sprawl fiction: dense, accreted urban systems; uneven high technology; corporate power; mediated culture; and human-scale survival inside global networks. Use for Gibson-informed creative work, setting design, or visual briefs, not for generic neon cyberpunk, faithful continuation of named canon, or imitation of Gibson's prose.

- 호출: `/cyberpunk` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/cyberpunk)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/cyberpunk/SKILL.md`](../../plugins/magnus-agent-skills/skills/cyberpunk/SKILL.md)

### `/daily-life-discovery`

Guide a consent-based conversation that helps a person discover how an AI agent could improve their day-to-day life: routines, friction, attention, decisions, relationships, learning, and small experiments. Use when someone asks for a daily check-in, wants the agent to learn how they work, says "grill me," wants a conversational journal, or asks what an AI could help with. Do not use for therapy, diagnosis, crisis support, covert monitoring, or product requirements interviews.

- 호출: `/daily-life-discovery` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/daily-life-discovery)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/daily-life-discovery/SKILL.md`](../../plugins/magnus-agent-skills/skills/daily-life-discovery/SKILL.md)

### `/data-architect`

Use this skill to assess, design, and evolve data architectures, including data platforms, data products, data mesh adoption, event-driven data flows, governance, modeling, and migration decisions. Load it when teams need workload-grounded tradeoffs, ownership and quality agreements, or a current-to-target data architecture. Do not use it for pipeline or platform operations, implementation details, interface contract semantics, SQL tuning, or statistical modeling; route those to data-engineering, platform-engineering, api-design-and-evolution, postgres, or data-scientist.

- 호출: `/data-architect` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/data-architect)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/data-architect/SKILL.md`](../../plugins/magnus-agent-skills/skills/data-architect/SKILL.md)

### `/data-cleaning`

Clean, profile, validate, reshape, and document messy tabular, text, JSON, and relational data through an evidence-first, reproducible workflow. Use when preparing data for analysis, reporting, modeling, ingestion, migration, or matching, including AI-suggested repair, entity-match review, score calibration limits, and reversible repair ledgers. Do not use for statistical modeling, dashboard design, or operating a named data platform; route those tasks to data-scientist, data-engineering, or the relevant tool skill.

- 호출: `/data-cleaning` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/data-cleaning)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/data-cleaning/SKILL.md`](../../plugins/magnus-agent-skills/skills/data-cleaning/SKILL.md)

### `/data-engineering`

Design and operate data infrastructure — database operations (vector, relational, graph, time-series), ETL/ELT pipeline design (dbt patterns, incremental loading), SQL analytical patterns, data quality monitoring, schema migration, and storage infrastructure management, including model-assisted transformation contracts, deterministic acceptance, bounded retries, and sink reconciliation. Do not use for statistical analysis or ML model development.

- 호출: `/data-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/data-engineering)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/data-engineering/SKILL.md`](../../plugins/magnus-agent-skills/skills/data-engineering/SKILL.md)

### `/data-scientist`

Use for PhD-level expertise in data science, statistics, and machine learning: rigorous statistical analysis, experimental design, causal inference, advanced modeling, research methodology, or data science project leadership. Load when the user asks about statistical methods, experimental design, model selection, A/B testing, hypothesis testing, power analysis, regression, causality, Bayesian analysis, or research methodology. For insurance, actuarial, claims, reserving, solvency, credibility, tail-risk, or financial-risk statistical modeling, use `actuarial-risk-modeling`; for deterministic operating and SaaS financial models, use `financial-modeling`. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/data-scientist` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/data-scientist)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/data-scientist/SKILL.md`](../../plugins/magnus-agent-skills/skills/data-scientist/SKILL.md)

### `/de-spin`

Use when someone asks what is true, false, misleading, unsupported, unknown, or genuinely complicated in a persuasive message, article, pitch, advertisement, policy claim, or viral post. Analyze propaganda, spin, selective framing, urgency, social proof, deceptive marketing, and AI-generated persuasion by tracing claims to evidence and separating literal truth from implied conclusions. Do not use to read deception from demeanor, adjudicate intent, or replace broad domain research.

- 호출: `/de-spin` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/de-spin)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/de-spin/SKILL.md`](../../plugins/magnus-agent-skills/skills/de-spin/SKILL.md)

### `/digital-twin`

Design, build, evaluate, govern, monitor, evolve, and retire digital twins and federated twin universes for software systems, engineering processes, agentic software factories, infrastructure, and cyber-physical operations. Use when a task involves digital-twin architecture, digital thread, simulation, predictive maintenance, twin health, agent authority, or dark-factory design. Do not use for ordinary observability dashboards, static dependency graphs, generic AI governance, or operating one named infrastructure tool without a twin-specific representation and feedback loop.

- 호출: `/digital-twin` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/digital-twin)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/digital-twin/SKILL.md`](../../plugins/magnus-agent-skills/skills/digital-twin/SKILL.md)

### `/docker-compose`

Use Docker Compose to define, run, debug, and harden multi-container applications. Load for compose.yaml design, networking, volumes, secrets, profiles, overrides, watch mode, lifecycle operations, or troubleshooting. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/docker-compose` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/docker-compose)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/docker-compose/SKILL.md`](../../plugins/magnus-agent-skills/skills/docker-compose/SKILL.md)

### `/documents`

Generate, inspect, validate, and fix PDF, Word (.docx), Excel (.xlsx), and PowerPoint (.pptx) documents: turn structured content into render-ready artifacts, verify structural and output quality before delivery, and repair broken files. Use when a task involves creating, editing, converting, or validating office documents and PDFs. Do not use for ebook packaging (use epub), for images, video, or other media production, for API or code documentation, or for data pipelines (use data-engineering).

- 호출: `/documents` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `fixtures/`, `references/`, `scripts/`, `templates/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/documents)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/documents/SKILL.md`](../../plugins/magnus-agent-skills/skills/documents/SKILL.md)

### `/dsm5`

Assess and explain questions about mental health and neurocognitive conditions against DSM-5-TR diagnostic criteria, and guide evidence-based conversations for clinicians, patients, and family members. Use when someone asks about symptoms, possible conditions, differential diagnoses, diagnostic criteria, prevalence, specifiers, or wants to understand or explain a mental health or neurological condition in plain language. Do not use for formal diagnosis, treatment decisions, crisis intervention, legal or insurance determinations, or any situation that requires a licensed clinician's judgment.

- 호출: `/dsm5` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/dsm5)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/dsm5/SKILL.md`](../../plugins/magnus-agent-skills/skills/dsm5/SKILL.md)

### `/dspy`

Optimize and build programmatic prompt systems with Stanford DSPy. Signatures, modules (Predict, ChainOfThought, ReAct), optimizer/teleprompter selection, compilation, caching, evaluation. Use when doing programmatic prompt optimization or building compiled prompt programs. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/dspy` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/dspy)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/dspy/SKILL.md`](../../plugins/magnus-agent-skills/skills/dspy/SKILL.md)

### `/electronics`

Design, review, prototype, measure, and troubleshoot electronic circuits using component evidence, worst-case calculations, interface contracts, and staged bench verification. Use for component selection, analog or digital building blocks, power and protection, sensor conditioning, schematic-to-wiring review, instrumented diagnosis, and I2C electrical integration. Do not use as a substitute for exact device documentation, ESP32 firmware operations, FPGA RTL development, named CAD-tool operation, or regulated design certification.

- 호출: `/electronics` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/electronics)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/electronics/SKILL.md`](../../plugins/magnus-agent-skills/skills/electronics/SKILL.md)

### `/email`

Send and diagnose transactional email through Twilio SendGrid from a terminal or agent: send messages, check deliverability (bounces and spam reports), and verify Signed Event Webhook signatures (ECDSA P-256) — with a bundled email-cli script that is read-only by default and gates every send behind a --dry-run/--yes confirmation. Use when an agent needs to send a transactional email, triage bounces or spam complaints, or confirm an inbound SendGrid webhook is authentic. Do not use for marketing or bulk email campaigns (that is SendGrid Marketing Campaigns), building email template systems, or other email providers (that is their own tooling).

- 호출: `/email` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/email)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/email/SKILL.md`](../../plugins/magnus-agent-skills/skills/email/SKILL.md)

### `/enterprise-architecture`

Design and evolve enterprise architectures by connecting business capabilities, value streams, applications, information, technology, operating models, and transition choices. Use when mapping an enterprise portfolio, comparing current and target states, sequencing transition architectures, or defining federated architecture decision rights and stakeholder communication. Do not use for system or solution design, API or data-platform design, organizational or talent design, product roadmaps, technology adoption, or corporate strategy; route those to the named specialist skills.

- 호출: `/enterprise-architecture` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/enterprise-architecture)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/enterprise-architecture/SKILL.md`](../../plugins/magnus-agent-skills/skills/enterprise-architecture/SKILL.md)

### `/epub`

Read, write, and edit EPUB2/EPUB3 ebooks as an EPUB file format expert. Extract text, metadata, structure, and knowledge from EPUB files for enrichment or memory. Create valid EPUBs from scratch. Validate against the EPUB specification. Use when the user mentions epub, ebook, EPUB file, ebook format, read epub, write epub, create ebook, extract from epub, epub to text, or ebook structure. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/epub` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/epub)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/epub/SKILL.md`](../../plugins/magnus-agent-skills/skills/epub/SKILL.md)

### `/esp32-development`

Build, configure, flash, test, debug, and recover firmware for ESP32-family boards, including ESP-Mosaico kit bring-up, ESP-IDF C/C++, Arduino/PlatformIO, MicroPython, CircuitPython, ESPHome, Zephyr, Rust, and NuttX. Use when identifying an ESP32 board, choosing a framework, wiring GPIO or peripheral buses, integrating sensors or actuators, diagnosing serial/boot/power/network failures, planning OTA and production security, or automating hardware tests and fault injection. Do not use as a substitute for the exact board schematic, SoC datasheet, or attached component datasheet.

- 호출: `/esp32-development` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/esp32-development)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/esp32-development/SKILL.md`](../../plugins/magnus-agent-skills/skills/esp32-development/SKILL.md)

### `/ffmpeg`

Use this skill for local FFmpeg/FFprobe media inspection, remuxing, transcoding, filtering, evidence-bounded video review, transcript-assisted editorial plans, edit decision lists, podcast/audio cleanup, rendering, and output acceptance. It emphasizes explicit stream selection, source preservation, build-aware commands, bounded evidence, and verified new outputs. Do not use it for libav API programming, opaque whole-video understanding, automatic publishing, rights clearance, DRM circumvention, professional broadcast/color certification, or HyperFrames-authored compositions; route those tasks to their owning capabilities.

- 호출: `/ffmpeg` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/ffmpeg)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/ffmpeg/SKILL.md`](../../plugins/magnus-agent-skills/skills/ffmpeg/SKILL.md)

### `/financial-modeling`

Build and review assumptions-led financial models, unit economics, pricing, fundraising scenarios, and SaaS operating metrics. Use when calculating CAC, LTV, payback, runway, ARR, churn, NDR, Rule of 40, or sales efficiency; when modeling revenue, costs, cash flow, pricing, cap tables, or financing. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/financial-modeling` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/financial-modeling)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/financial-modeling/SKILL.md`](../../plugins/magnus-agent-skills/skills/financial-modeling/SKILL.md)

### `/fireflies`

Query Fireflies.ai meeting transcripts, meeting notes, summaries, contacts, channels, AI meeting analytics, AskFred, audio uploads, and webhook signatures through its GraphQL API. Use when a user mentions Fireflies, Fireflies.ai, meeting transcripts or notes stored in Fireflies, AskFred, or Fireflies webhooks. Do not use for local audio transcription, calendar management, or meetings that are not Fireflies data.

- 호출: `/fireflies` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/fireflies)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/fireflies/SKILL.md`](../../plugins/magnus-agent-skills/skills/fireflies/SKILL.md)

### `/flaresolverr`

Use the minimal FlareSolverr wrapper for a one-off health check or browser-backed GET/POST when ordinary retrieval is blocked by Cloudflare or DDoS-GUARD. Choose flaresolverr-cli instead for named session lifecycle, cookie-only returns, dry-run planning, or the full operational command surface. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/flaresolverr` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/flaresolverr)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/flaresolverr/SKILL.md`](../../plugins/magnus-agent-skills/skills/flaresolverr/SKILL.md)

### `/flaresolverr-cli`

Use a small FlareSolverr JSON CLI for browser-backed GET and POST requests, readiness checks, and session lifecycle management when a site requires Cloudflare or DDoS-GUARD challenge handling. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/flaresolverr-cli` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/flaresolverr-cli)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/flaresolverr-cli/SKILL.md`](../../plugins/magnus-agent-skills/skills/flaresolverr-cli/SKILL.md)

### `/forgejo-cli`

Use when managing a Forgejo or Gitea server from the terminal: issues, pull requests, repositories, file contents, labels, milestones, releases, webhooks, user settings, or any /api/v1 endpoint through a safe generic API command. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/forgejo-cli` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/forgejo-cli)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/forgejo-cli/SKILL.md`](../../plugins/magnus-agent-skills/skills/forgejo-cli/SKILL.md)

### `/forward-deployed-engineering`

Guide embedded technical engagements from ambiguous stakeholder need through discovery, framing, hypothesis, build, evaluation, deployment, adoption, measurement, and generalization while preserving evidence, decision rights, and field learning. Use when one accountable technical lead must carry continuity across customer or stakeholder discovery, implementation, production fit, adoption, and measurable outcomes. Do not use for a bounded repository change, product investment governance, ongoing reliability or platform ownership, an isolated specialist task, or advisory work that ends before implementation and adoption.

- 호출: `/forward-deployed-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/forward-deployed-engineering)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/forward-deployed-engineering/SKILL.md`](../../plugins/magnus-agent-skills/skills/forward-deployed-engineering/SKILL.md)

### `/fpga-development`

Design, review, simulate, and verify FPGA logic using explicit RTL contracts, clock and reset models, CDC analysis, timing constraints, and reproducible implementation evidence. Use for synthesizable HDL, fixed-point arithmetic, handshakes, testbenches, resource tradeoffs, timing closure, and FPGA release or bring-up planning. Do not use for ordinary MCU firmware, generic circuit design, a substitute vendor-tool manual, or unsupported claims of hardware or timing signoff.

- 호출: `/fpga-development` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/fpga-development)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/fpga-development/SKILL.md`](../../plugins/magnus-agent-skills/skills/fpga-development/SKILL.md)

### `/frontend-engineering`

Build and maintain web frontends — component architecture, state management, API integration, responsive layout, client-side performance, and frontend testing patterns. Framework agnostic, focused on web frontend implementation. Do not use for backend service implementation, data engineering, or platform infrastructure work.

- 호출: `/frontend-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/frontend-engineering)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/frontend-engineering/SKILL.md`](../../plugins/magnus-agent-skills/skills/frontend-engineering/SKILL.md)

### `/gap-analysis`

Analyze gaps by comparing a defined current state with a justified target state, characterizing causes and uncertainty, prioritizing actionable interventions, and producing traceable matrices, roadmaps, and decision records. Use for capability, process, compliance, readiness, maturity, operating-model, or research-evidence gaps. Do not use for a vague list of problems, a standalone root-cause analysis, a generic SWOT, or legal or audit certification advice without a governing standard and qualified owner.

- 호출: `/gap-analysis` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/gap-analysis)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/gap-analysis/SKILL.md`](../../plugins/magnus-agent-skills/skills/gap-analysis/SKILL.md)

### `/genius-life`

Guide a person in cultivating creativity in their own work and life: open conversational sessions on creative blocks, habits, environment, motivation, and resilience, or structured development of a concrete project or fledgling idea through a five-phase practice. Do not use for therapy or clinical support, general life coaching, product or stakeholder discovery, or as a study guide for a book.

- 호출: `/genius-life` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/genius-life)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/genius-life/SKILL.md`](../../plugins/magnus-agent-skills/skills/genius-life/SKILL.md)

### `/ghost`

Manage Ghost CMS content over the Admin API — browse posts, pages, and tags, draft and publish content, schedule posts, and inspect site info from the terminal. Do not use this skill for Ghost server installation or site administration (installing, nginx, SSL, systemd, updates); those belong to the official npm ghost-cli tooling.

- 호출: `/ghost` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/ghost)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/ghost/SKILL.md`](../../plugins/magnus-agent-skills/skills/ghost/SKILL.md)

### `/github-runner`

Deploy, manage, and troubleshoot self-hosted GitHub Actions runners. Covers systemd service, Docker containers, Kubernetes (Actions Runner Controller), and the Scale Set Client. Use when setting up a CI runner, debugging registration failures, designing autoscaling, or hardening runner security. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/github-runner` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/github-runner)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/github-runner/SKILL.md`](../../plugins/magnus-agent-skills/skills/github-runner/SKILL.md)

### `/go-to-market`

Plan and evaluate go-to-market strategy using positioning, acquisition, growth economics, market-entry, competitive-response, and governed agent-assisted acquisition experiments. Use for ICP, messaging, channel, CAC/LTV, beachhead, or automated-GTM strategy decisions. Do not use for campaign execution, CRM mutations, legal interpretation, product strategy, or visual brand design.

- 호출: `/go-to-market` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/go-to-market)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/go-to-market/SKILL.md`](../../plugins/magnus-agent-skills/skills/go-to-market/SKILL.md)

### `/grafana`

Operate, configure, provision, secure, and troubleshoot Grafana OSS, Enterprise, and Cloud, including dashboards, folders, data sources, annotations, alert rules, contact points, notification policies, silences, mute timings, service accounts, RBAC, plugins, APIs, and as-code workflows. Use for Grafana product work and Grafana-side integrations. Do not use for defining SLOs or paging policy, operating Prometheus/Loki/Tempo/InfluxDB backends, generic Docker/Kubernetes/Terraform/reverse-proxy work, plugin development, or authorized security assessments; use the corresponding specialist skill.

- 호출: `/grafana` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/grafana)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/grafana/SKILL.md`](../../plugins/magnus-agent-skills/skills/grafana/SKILL.md)

### `/gutenberg`

Search, download, and extract public-domain books from Project Gutenberg. Look up books by ID or keyword via gutendex, download plain-text and EPUB editions, strip licensing boilerplate, extract clean text from EPUB for illustrated works, and classify fiction vs non-fiction. Ships a portable CLI script with zero external dependencies. Use when the user says "gutenberg", "public domain", "download a book", "classic literature", "free ebook", "gutenberg.org", or names any public-domain title or author. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/gutenberg` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/gutenberg)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/gutenberg/SKILL.md`](../../plugins/magnus-agent-skills/skills/gutenberg/SKILL.md)

### `/harness-engineering`

Design, build, diagnose, and evolve agent harnesses: instructions, tools, execution environments, durable state, context management, verification, recovery, and bounded autonomous loops. Use for unreliable coding agents, cross-session drift, premature completion, harness audits, or changes to the runtime around a model, including bounded typed-decision routing. Do not use for prompt rewriting alone, model training, general application architecture, or operating an already evaluated agent in production; route those concerns to their specialist skills.

- 호출: `/harness-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/harness-engineering)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/harness-engineering/SKILL.md`](../../plugins/magnus-agent-skills/skills/harness-engineering/SKILL.md)

### `/haystack`

Build production search and NLP pipelines with Haystack. Pipeline DAG composition, document stores, retrievers, PromptBuilder (Jinja2), generators, evaluation, Hayhooks deployment. Use when building search pipelines or comparing NLP application frameworks. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/haystack` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/haystack)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/haystack/SKILL.md`](../../plugins/magnus-agent-skills/skills/haystack/SKILL.md)

### `/hugo-theme`

Build, customize, and debug advanced Hugo CMS themes — template architecture, asset pipeline (CSS/JS/image processing), shortcodes and render hooks, page bundles, cover images, Hugo Modules, performance, SEO, and CI/CD. Use when working on a Hugo theme or site template layer. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/hugo-theme` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/hugo-theme)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/hugo-theme/SKILL.md`](../../plugins/magnus-agent-skills/skills/hugo-theme/SKILL.md)

### `/implementation-planning`

Plan the implementation of an approved requirement or specification: produce an executable, dependency-aware delivery plan covering work breakdown, dependency mapping, critical path, ownership, parallelism and sequencing, rollout strategy, rollback and recovery paths, and verification against the original requirement. Supports cross-team, cross-repository, migration, and staged-rollout scenarios. Do not use for pre-approval discovery or needs-finding, authoring a specification from scratch, coding or implementation, the neckbeard issue-to-PR delivery flow itself, or any work whose prerequisite decision has not been approved — planning unapproved work is an explicit stop condition.

- 호출: `/implementation-planning` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/implementation-planning)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/implementation-planning/SKILL.md`](../../plugins/magnus-agent-skills/skills/implementation-planning/SKILL.md)

### `/incident-learning`

Convert operational incident and near-miss evidence into durable product, engineering, test, evaluation, and governance improvements with verified closure. Separate observed facts from causal hypotheses and unresolved uncertainty; map follow-up work across code, tests, skills, operations, product, and governance; track ownership, verification, and closure for every finding. Do not use to assign blame or produce a generic postmortem template; do not close learning because tickets were created — require evidence the intended change occurred.

- 호출: `/incident-learning` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/incident-learning)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/incident-learning/SKILL.md`](../../plugins/magnus-agent-skills/skills/incident-learning/SKILL.md)

### `/infographic`

Design, create, or improve an infographic, visual explainer, illustrated guide, comparison poster, process graphic, or data story for any audience. Use for turning evidence and ideas into a clear, polished visual explanation, including choosing information structure, visual encoding, and a distinct aesthetic. Do not use for standalone decorative artwork, complete brand identity systems, statistical analysis alone, or ordinary document formatting.

- 호출: `/infographic` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/infographic)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/infographic/SKILL.md`](../../plugins/magnus-agent-skills/skills/infographic/SKILL.md)

### `/jellyfin`

Query your Jellyfin media server from the terminal — recently added media, search, item details, series navigation, next-up episodes, library browsing, server info, and user login. Use when the user asks about Jellyfin, media servers, movies, TV shows, next episodes, or their media library. Do not use this skill for server installation, library management, playback control, or Emby/Plex servers.

- 호출: `/jellyfin` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/jellyfin)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/jellyfin/SKILL.md`](../../plugins/magnus-agent-skills/skills/jellyfin/SKILL.md)

### `/jira`

Interact with Atlassian Jira from the terminal: search issues with JQL, view details, create issues, add comments, count matches with fast approximate-count, list projects, discover valid transitions, and change status. Includes a full JQL language reference (functions, operators, history predicates, date expressions, saved filters, performance tuning) plus REST auth/pagination guidance. Use when the user mentions Jira, a ticket key (e.g. PROJ-123), asks about issues, bugs, tasks, projects, or sprint work, or needs to write, debug, or optimize JQL queries. Do not use for GitHub or GitLab issue tracking, Jira site administration, or generic ticketing systems.

- 호출: `/jira` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/jira)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/jira/SKILL.md`](../../plugins/magnus-agent-skills/skills/jira/SKILL.md)

### `/job-interview-coaching`

Use this skill to coach candidates and interviewers for job interviews: prepare truthful examples, critique interview transcripts, run interactive mock interviews and targeted practice, design structured questions and evidence-based scorecards, and improve candidate experience. Adapt to profession, seniority, and interview format. Do not use for journalism, user research, workflow discovery, general resume writing, clinical interviewing, or autonomous hiring decisions.

- 호출: `/job-interview-coaching` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/job-interview-coaching)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/job-interview-coaching/SKILL.md`](../../plugins/magnus-agent-skills/skills/job-interview-coaching/SKILL.md)

### `/kanban-guru`

Diagnose Kanban flow problems and design board operating models. Load this when your team is struggling with throughput, cycle times are unpredictable, multiple stakeholders compete for the same engineers, or you're wondering if Kanban is right for you. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/kanban-guru` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/kanban-guru)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/kanban-guru/SKILL.md`](../../plugins/magnus-agent-skills/skills/kanban-guru/SKILL.md)

### `/kubernetes`

Operate, troubleshoot, secure, upgrade, and automate Kubernetes clusters and workloads safely across upstream Kubernetes, k3s, RKE2, MicroK8s, k0s, Talos, OpenShift/OKD, kind, Minikube, Rancher-managed clusters, EKS, AKS, and GKE. Use when a task involves kubectl, Kubernetes APIs, Pods, Deployments, StatefulSets, Services, Ingress or Gateway API, CRDs, RBAC, NetworkPolicy, storage, scheduling, autoscaling, cluster lifecycle, or the bundled agent-first k8s-cli. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/kubernetes` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/kubernetes)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/kubernetes/SKILL.md`](../../plugins/magnus-agent-skills/skills/kubernetes/SKILL.md)

### `/langchain`

Build LLM applications with LangChain. Use when working with LangChain or comparing LLM application frameworks. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/langchain` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/langchain)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/langchain/SKILL.md`](../../plugins/magnus-agent-skills/skills/langchain/SKILL.md)

### `/langgraph`

Build multi-agent AI systems with LangGraph — the low-level orchestration framework for stateful, graph-based agent workflows. Covers supervisor, swarm, and hierarchical multi-agent patterns; subgraph composition; state management (checkpointers/stores); persistence; evals; and production debugging. Reach for this when designing agent architectures that need cycles, conditional branching, parallel execution, or human-in-the-loop patterns. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/langgraph` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/langgraph)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/langgraph/SKILL.md`](../../plugins/magnus-agent-skills/skills/langgraph/SKILL.md)

### `/lastfm`

Interact with the Last.fm music data API: lookup user listening history, get artist/album/track metadata, discover similar music via collaborative filtering, explore global and per-country charts, search by artist/album/track, manage tags, and scrobble listening events. Use when the user asks about music data, listening statistics, music recommendations, similar artists, charts, or wants to scrobble or love tracks. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/lastfm` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/lastfm)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/lastfm/SKILL.md`](../../plugins/magnus-agent-skills/skills/lastfm/SKILL.md)

### `/legal-strategy`

Analyze legal and regulatory risk, IP, contracts, privacy, governance, and employment questions as structured issue-spotting for counsel. Do not use this methodology as legal advice or for technical security implementation, CRM, or delivery execution.

- 호출: `/legal-strategy` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/legal-strategy)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/legal-strategy/SKILL.md`](../../plugins/magnus-agent-skills/skills/legal-strategy/SKILL.md)

### `/life-coach`

Guide a bounded, user-led coaching process for personal goals, decisions, transitions, habits, recurring nonclinical patterns, accountability, and progress review. Use when a person explicitly asks to be coached, wants reflective challenge, or wants help examining ambivalence while retaining ownership. Do not use for therapy, crisis support, diagnosis, direct factual or action requests, product or stakeholder discovery, or medical, legal, financial, addiction, domestic-violence, or other specialist advice.

- 호출: `/life-coach` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/life-coach)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/life-coach/SKILL.md`](../../plugins/magnus-agent-skills/skills/life-coach/SKILL.md)

### `/linear`

Manage Linear teams, projects, cycles, issues, comments, workflow state, and documents from a terminal through Linear's public GraphQL API. Use when a user asks to list, search, inspect, create, update, move, or comment on Linear work, or to find Linear documents. Do not use to embed a live agent inside Linear or to build an MCP integration.

- 호출: `/linear` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/linear)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/linear/SKILL.md`](../../plugins/magnus-agent-skills/skills/linear/SKILL.md)

### `/litellm`

Operate, configure, secure, and troubleshoot the LiteLLM AI gateway (proxy) and Python SDK: run the proxy (litellm --config), route to 100+ providers through one OpenAI-compatible API, configure model lists and routing/reliability, virtual keys, teams, budgets, rate limits, caching, guardrails, observability, and spend, and diagnose request failures. Use when deploying or running a LiteLLM proxy or gateway (config.yaml, ghcr.io/berriai/litellm), wiring the Python SDK or OpenAI SDK through it, or hardening a public-facing deployment. Do not use for operating a single inference engine (vllm, llama-cpp), for engine-selection methodology (ml-engineering), or for building applications on top of an LLM API (backend/frontend engineering).

- 호출: `/litellm` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/litellm)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/litellm/SKILL.md`](../../plugins/magnus-agent-skills/skills/litellm/SKILL.md)

### `/llama-cpp`

Operate, configure, benchmark, and troubleshoot llama.cpp across CPU, Metal, CUDA, HIP/ROCm, Vulkan, SYCL, and hybrid or multi-GPU systems. Use when installing or building llama.cpp, selecting or inspecting GGUF models, running llama-cli or bounded llama-completion, serving an OpenAI-compatible API with llama-server, tuning memory and performance, or diagnosing backend, context, template, and API failures. Do not use for model training or fine-tuning, general inference-framework selection, llama-cpp-python or other bindings, LlamaIndex, Ollama, or LM Studio operation.

- 호출: `/llama-cpp` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `evidence/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/llama-cpp)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/llama-cpp/SKILL.md`](../../plugins/magnus-agent-skills/skills/llama-cpp/SKILL.md)

### `/llamaindex`

Build LLM applications with the LlamaIndex framework. Use when working with LlamaIndex or comparing RAG and agent orchestration frameworks. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/llamaindex` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/llamaindex)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/llamaindex/SKILL.md`](../../plugins/magnus-agent-skills/skills/llamaindex/SKILL.md)

### `/meetings`

Plan, organize, facilitate, and document meetings and relationship-sensitive one-on-ones, including invitees, decision processes, proactive accessibility, private preference memory, agreed actions, and follow-through. Use for the meeting lifecycle or deciding whether to meet; do not substitute for formal performance procedures, specialist incident response, therapy, or memo writing.

- 호출: `/meetings` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/meetings)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/meetings/SKILL.md`](../../plugins/magnus-agent-skills/skills/meetings/SKILL.md)

### `/mermaid-diagrams`

Author, render, troubleshoot, and review Mermaid diagrams for documentation, architecture, processes, and technical communication. Use when a versionable diagram must communicate a defined audience job across a real renderer, including narrative, hierarchy, labels, legends, accessibility fallback, and uncertainty. Do not use for C4 level/model ownership, architecture decisions, or full accessibility conformance.

- 호출: `/mermaid-diagrams` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/mermaid-diagrams)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/mermaid-diagrams/SKILL.md`](../../plugins/magnus-agent-skills/skills/mermaid-diagrams/SKILL.md)

### `/meshcore-packet-capture`

Capture MeshCore Companion packets via BLE, serial, or TCP. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/meshcore-packet-capture` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/meshcore-packet-capture)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/meshcore-packet-capture/SKILL.md`](../../plugins/magnus-agent-skills/skills/meshcore-packet-capture/SKILL.md)

### `/migration-engineering`

Plan and execute safe cross-system migrations, including service extraction from monoliths. Use when moving data, schemas, interfaces, infrastructure, or service ownership through compatibility windows, dual-running, reconciliation, cutover, recovery, or deprecation. Do not use for deciding whether decomposition is justified, designing a target architecture, or implementing one named technology; route those to the relevant architecture or specialist skill.

- 호출: `/migration-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/migration-engineering)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/migration-engineering/SKILL.md`](../../plugins/magnus-agent-skills/skills/migration-engineering/SKILL.md)

### `/ml-engineering`

Plan and execute production ML engineering work — classifier versus generative model selection, zero-shot baselines, coding specialization, model training and fine-tuning (LoRA/QLoRA), evaluation and eval-set design, quantization decisions, inference deployment, lineage, feature parity, drift response, and regression triage, grounded in practical engineering patterns for production ML systems. Do not use for statistical modeling and experimental design (that's the data scientist) or for operating a specific inference engine (that's a tool skill such as llama-cpp or vllm).

- 호출: `/ml-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/ml-engineering)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/ml-engineering/SKILL.md`](../../plugins/magnus-agent-skills/skills/ml-engineering/SKILL.md)

### `/mobile-development`

Build, test, sign, and ship mobile apps across iOS, Android, Flutter, and React Native — project scaffolding, builds and code signing, device and emulator testing, store submission (App Store and Play Store), app lifecycle and backgrounding, offline and sync, and mobile-specific testing. Use when the task involves creating, building, testing, or shipping a mobile app for iOS or Android, or reasoning about mobile behavior such as background execution, push notifications, offline storage, and data sync. Do not use for web frontend work (that is frontend-engineering), backend services and APIs (that is backend-engineering), or desktop and web platform targets outside the iOS and Android scope.

- 호출: `/mobile-development` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/mobile-development)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/mobile-development/SKILL.md`](../../plugins/magnus-agent-skills/skills/mobile-development/SKILL.md)

### `/multi-tenant-saas-architecture`

Design and review end-to-end multi-tenant SaaS architectures: tenant and subscription semantics, control and application planes, pooled or isolated tenancy, onboarding, entitlements, metering, billing handoffs, lifecycle, partitioning, and tenant-aware operations. Use when a subscription product needs a coherent tenant model and architecture decision across these seams. Do not use for threat modeling or isolation controls, API contract semantics, data-platform design, backend implementation, migration execution, privacy compliance artifacts, capacity evidence, financial modeling, or infrastructure operations; route those to the named specialist owners.

- 호출: `/multi-tenant-saas-architecture` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/multi-tenant-saas-architecture)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/multi-tenant-saas-architecture/SKILL.md`](../../plugins/magnus-agent-skills/skills/multi-tenant-saas-architecture/SKILL.md)

### `/neckbeard`

Use when asked to fix, build, refactor, review, verify, or release software and the work is non-trivial — including delivering a change request through planning, gates, implementation, review, verified PR, and authorized release; continuing work started elsewhere with no packet via evidence-based position assessment; or operating tracked work items in Linear, Jira, or Notion via their tooling skills. neckbeard routes the change through framing, discovery, design, implementation, review, verification, and learning — choosing the smallest *safe* intervention, proving it at the real delivery boundary, and leaving an inspectable evidence ledger. For issue-to-PR work, conditionally loads a 9-phase journey with gates and lifecycle integration. Composes specialist catalog skills rather than replacing them. Not a persona or LOC-minimizer. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/neckbeard` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `eval/`, `evals/`, `references/`, `research/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/neckbeard)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/neckbeard/SKILL.md`](../../plugins/magnus-agent-skills/skills/neckbeard/SKILL.md)

### `/notion`

Operate Notion from a terminal or agent: retrieve pages, query databases, search pages and databases, and update page properties — with a bundled notion-cli script that is read-only by default and gates every create or update behind a --dry-run/--yes confirmation. Use when an agent needs to read Notion content, answer questions from a team wiki or database, or make a confirmed edit. Do not use for building Notion integrations or block-level page composition beyond property updates (that is Notion API application development), or for other knowledge bases (that is their own tooling).

- 호출: `/notion` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/notion)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/notion/SKILL.md`](../../plugins/magnus-agent-skills/skills/notion/SKILL.md)

### `/nous-branding`

Generate images and content consistent with the Nous Research brand identity. Use when creating visuals in the Nous / Theia / Hermes ecosystem: a "cyber-classical" style blending neo-classical statuary, cyberpunk/industrial grunge, and retro anime illustration. Covers official brand color palette, typography (Inter/IBM Plex Sans, JetBrains Mono, heavy distressed display faces), the Nous Girl mascot, texture system, and image prompt construction. Ships reference images for palette, mascot, and brand collage that can be used as img2img inputs. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/nous-branding` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/nous-branding)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/nous-branding/SKILL.md`](../../plugins/magnus-agent-skills/skills/nous-branding/SKILL.md)

### `/open-knowledge-format`

Define knowledge bundles with Google's Open Knowledge Format (OKF) v0.1. Use when the user mentions OKF, Open Knowledge Format, Google's knowledge format, LLM wiki bundles, agent knowledge packs, creating OKF bundles, validating OKF documents, or converting knowledge into the OKF standard. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/open-knowledge-format` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/open-knowledge-format)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/open-knowledge-format/SKILL.md`](../../plugins/magnus-agent-skills/skills/open-knowledge-format/SKILL.md)

### `/openlibrary`

Query the Open Library catalog from the terminal: search books and authors, look up works, editions, and ISBNs, enumerate every edition of a work, read community ratings, and resolve cover-image URLs. Fully keyless public API. Includes the OL…M/W/A key-graph reference, ISBN 302-redirect resolution, search query syntax, covers-host rules, and worked pipelines. Do not use for library-IT administration (Koha/MARC/ILS migration), commercial book-data feeds, or managing your reading account on Open Library itself.

- 호출: `/openlibrary` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/openlibrary)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/openlibrary/SKILL.md`](../../plugins/magnus-agent-skills/skills/openlibrary/SKILL.md)

### `/opensource-contributions`

Make good open source contributions — check CONTRIBUTING.md first, follow project norms, be a good citizen. Covers bug reports, feature requests, and pull requests with a defensible default posture when the project hasn't documented expectations. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/opensource-contributions` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/opensource-contributions)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/opensource-contributions/SKILL.md`](../../plugins/magnus-agent-skills/skills/opensource-contributions/SKILL.md)

### `/operational-design`

Design and improve operational processes, controls, metrics, vendors, and scaling models through bounded pilots and evidence. Do not use for engineering delivery, financial modeling, technology evaluation, or legal advice. design, operational metrics, compliance and audit, vendor management, and team topology. Covers value stream mapping, BPMN, bottleneck analysis, scaling from 10 to 100 to 1000 people, KPI design, balanced scorecard, SOC 2, ISO 27001, GDPR readiness, RFP processes, SLA design, vendor scorecards, team topologies, Conway's Law, and Dunbar's Number. Do not use for engineering delivery, financial modeling, or technology evaluation.

- 호출: `/operational-design` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/operational-design)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/operational-design/SKILL.md`](../../plugins/magnus-agent-skills/skills/operational-design/SKILL.md)

### `/org-design`

Design organizational topology, talent, rewards, culture, and health decisions with explicit decision rights and validation. Do not use for legal advice, project delivery planning, financial modeling, or technology implementation. reporting structures), talent strategy (make-vs-buy, skill taxonomies, succession planning), compensation frameworks (market benchmarking, equity design, leveling), culture architecture (values codification, rituals, psychological safety), organizational health metrics (eNPS, retention risk, engagement surveys), DEI strategy (inclusive design, equitable systems, belonging).

- 호출: `/org-design` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/org-design)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/org-design/SKILL.md`](../../plugins/magnus-agent-skills/skills/org-design/SKILL.md)

### `/pace-plan`

Build, coordinate, operate, troubleshoot, exercise, and improve an authorized Primary, Alternate, Contingency, and Emergency communications plan. Use for resilient emergency-communications paths and their ownership, triggers, check-ins, tests, and corrective actions. Do not use for generic incident status messaging, frequency or channel planning, radio programming, or unauthorized transmission and activation.

- 호출: `/pace-plan` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/pace-plan)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/pace-plan/SKILL.md`](../../plugins/magnus-agent-skills/skills/pace-plan/SKILL.md)

### `/peertube`

Browse PeerTube federated video from the terminal — instance stats, latest videos, video detail, comment threads, channels, accounts, instance-local search, and OAuth2 login with per-instance token persistence. Set PEERTUBE_SERVER to any instance; point it at sepiasearch.org for fediverse-wide search. Use when the user mentions PeerTube, federated video, SepiaSearch, or browsing a specific PeerTube instance. Do not use this skill for YouTube/Vimeo uploads, video editing, or installing and administering a PeerTube server.

- 호출: `/peertube` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/peertube)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/peertube/SKILL.md`](../../plugins/magnus-agent-skills/skills/peertube/SKILL.md)

### `/performance-optimization`

Optimize software performance through user-journey baselines, profiling, representative benchmarks, controlled experiments, and field verification. Use when asked to make an application, service, workflow, or hot path faster or more efficient, or to build the measurement loop first. Do not use for a reliability incident, capacity forecast, generic product A/B test, or operating a named telemetry or load-testing tool without an optimization objective.

- 호출: `/performance-optimization` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `examples/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/performance-optimization)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/performance-optimization/SKILL.md`](../../plugins/magnus-agent-skills/skills/performance-optimization/SKILL.md)

### `/platform-engineering`

Use this skill when building or operating internal developer platforms: infrastructure as code, CI/CD, container orchestration, service networking, secrets, and observability, or when shaping platform products, self-service interfaces, adoption evidence, and policy guardrails. Do not use it to define release process, promotion, rollout, or rollback policy; use release-engineering for that delivery model. Route named-tool configuration and troubleshooting to the corresponding operational skill, such as kubernetes or traefik for ingress-controller configuration.

- 호출: `/platform-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/platform-engineering)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/platform-engineering/SKILL.md`](../../plugins/magnus-agent-skills/skills/platform-engineering/SKILL.md)

### `/playwright`

Operate Playwright for browser automation end to end: author and debug E2E test suites (robust locators, network interception and mocking, parallel workers, accessibility snapshot checks), wire them into CI, and drive headless browsing and scraping with an extract -> validate -> save loop. Use when writing, running, fixing, or scraping with Playwright, when a Playwright CI failure or JSON report needs triage, or when the bundled pwrun script should analyze a run. Do not use for QA strategy or test framework selection (route to qa-methodology), for frontend component or architecture design (route to frontend-engineering), or for Cloudflare/DDoS-GUARD challenge bypass (use flaresolverr).

- 호출: `/playwright` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/playwright)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/playwright/SKILL.md`](../../plugins/magnus-agent-skills/skills/playwright/SKILL.md)

### `/postgres`

Operate PostgreSQL instances safely: configuration review, index and query-plan analysis, vacuum and bloat management, WAL archiving and point-in-time recovery, replication and failover, extensions, major-version upgrades, and evidence-based diagnostics with the bundled read-only pgdiag script. Use when running or inspecting a PostgreSQL server, diagnosing performance or backup health, or planning an upgrade or failover. Do not use for application-level data access patterns (that's backend-engineering) or schema design (that's data-architect/data-engineering).

- 호출: `/postgres` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/postgres)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/postgres/SKILL.md`](../../plugins/magnus-agent-skills/skills/postgres/SKILL.md)

### `/privacy-engineering`

Translate privacy principles and legal requirements into data-flow, lifecycle, acceptance, and verification artifacts. Map data classification, purpose, processing, access, retention, deletion, residency, and consent; define verifiable privacy acceptance criteria; and produce data-lifecycle records, retention/deletion verification plans, and privacy change reviews. Use when engineering privacy into a system, feature, or data flow — not for legal advice, jurisdiction-specific regulatory interpretation, or replacing security engineering or incident response.

- 호출: `/privacy-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/privacy-engineering)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/privacy-engineering/SKILL.md`](../../plugins/magnus-agent-skills/skills/privacy-engineering/SKILL.md)

### `/product-adoption`

Diagnose and design product adoption for onboarding, activation, behavior change, feature discovery, rollout, and sustained use after launch. Covers consumer, B2B, internal-tool, and public-service contexts with evidence-based decision points and cohort segmentation. Does not own acquisition campaigns or marketing conversion (routes to go-to-market), product-analytics instrumentation (routes to product-analytics-and-measurement), or customer-success account management and health scoring (routes to conditional-customer-success). Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/product-adoption` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/product-adoption)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/product-adoption/SKILL.md`](../../plugins/magnus-agent-skills/skills/product-adoption/SKILL.md)

### `/product-analytics-and-measurement`

Define observable, governed evidence for product outcomes through metric trees, event/tracking plans, instrumentation QA, and measurement governance. Use when defining product metrics, designing tracking plans, building event taxonomies, running product funnels or cohort analysis, setting up dashboard contracts, or auditing instrumentation quality. Do NOT use for statistical inference or experiment design (route to data-scientist), data pipeline implementation (route to data-engineering), data architecture decisions (route to data-architect), observability or infrastructure monitoring (route to site-reliability-engineering), or general business intelligence and dashboard building (route to BI tooling).

- 호출: `/product-analytics-and-measurement` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/product-analytics-and-measurement)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/product-analytics-and-measurement/SKILL.md`](../../plugins/magnus-agent-skills/skills/product-analytics-and-measurement/SKILL.md)

### `/product-design-and-ux`

Define user-facing product behavior from validated evidence and approved scope. Use for information architecture, task flows, state and recovery models, interface contracts, usability-study plans, interaction-pattern tradeoffs, AI recommendations and generated outputs, uncertainty, human control, feedback, or engineering UX handoffs. Use after product discovery and product decisions; route WCAG/ARIA conformance work to web-accessibility and formal software specifications to spec-driven-development. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/product-design-and-ux` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/product-design-and-ux)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/product-design-and-ux/SKILL.md`](../../plugins/magnus-agent-skills/skills/product-design-and-ux/SKILL.md)

### `/product-discovery`

Discover product requirements from human stakeholders — map who to talk to, ask questions that surface hidden assumptions, detect gaps in real time, resolve conflicts, and translate conversations into structured SDD specs. Phase 0 upstream of Spec-Driven Development. Also grill a PRD, interrogate a proposal, poke holes in a spec, or interview its author about an existing draft, one consequential question at a time. Do not use for personal-life discovery (daily-life-discovery), general research without product requirements (research-methodology), or implementation planning.

- 호출: `/product-discovery` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/product-discovery)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/product-discovery/SKILL.md`](../../plugins/magnus-agent-skills/skills/product-discovery/SKILL.md)

### `/product-experimentation`

Run end-to-end product experiments from assumption to decision: translate assumptions into testable hypotheses and experiment briefs, select the right method among qualitative interviews, prototypes, concierge tests, fake doors, feature flags, and A/B tests, and produce readouts that update the roadmap and decision record. Do not use when a qualitative or prototype test is the clearly right answer without statistical measurement; do not prescribe A/B testing by default; do not treat statistical significance as the only decision criterion or hide ethical and guardrail considerations.

- 호출: `/product-experimentation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/product-experimentation)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/product-experimentation/SKILL.md`](../../plugins/magnus-agent-skills/skills/product-experimentation/SKILL.md)

### `/product-lifecycle`

Route a product through its full lifecycle — discovery, strategy, portfolio choice, roadmap, UX and requirements, experimentation, delivery handoff, adoption, success, and lifecycle review — by composing existing specialist product skills with phase-entry evidence, handoff artifacts, and escalation rules. Use when evaluating a new product idea, managing a product through its lifecycle, or connecting product phases that currently operate in isolation. Do not use for a single product task that is already owned by a specialist skill (load that skill directly); do not use for software delivery lifecycle work (route to neckbeard); do not use to duplicate product discovery, strategy, UX, experimentation, analytics, release, or delivery methods.

- 호출: `/product-lifecycle` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/product-lifecycle)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/product-lifecycle/SKILL.md`](../../plugins/magnus-agent-skills/skills/product-lifecycle/SKILL.md)

### `/product-lifecycle-learning`

Compare intended product outcomes against observed results to close the launch-to-learning loop: collect post-launch evidence, distinguish expected from observed from uncertain from inferred claims, update assumptions, assess feature health, and choose among continue/improve/harvest/pivot/pause/retire — including retirement lifecycles with deprecation, migration, customer treatment, and retained reusable learning. Do not use for incident postmortems or root-cause analysis (routes to incident-learning or site-reliability-engineering); do not use for analytics instrumentation or metric dashboard design (routes to product-analytics-and-measurement); do not use arbitrary thresholds as universal retirement rules — decisions require human judgment and context.

- 호출: `/product-lifecycle-learning` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/product-lifecycle-learning)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/product-lifecycle-learning/SKILL.md`](../../plugins/magnus-agent-skills/skills/product-lifecycle-learning/SKILL.md)

### `/product-methodology`

Translate validated product evidence into tactical backlog decisions, prioritization, specifications, and stakeholder communications. Do not use this skill for CPO-level vision, positioning, or market strategy; use `product-strategy` for strategic direction.

- 호출: `/product-methodology` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/product-methodology)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/product-methodology/SKILL.md`](../../plugins/magnus-agent-skills/skills/product-methodology/SKILL.md)

### `/product-operations-and-governance`

Define and run product governance — recurring decision rights, intake, portfolio cadences, evidence standards, and cross-functional operating contracts. Covers six review cadences (intake, portfolio, roadmap, experiment, launch, lifecycle) with named accountable owners, minimum evidence standards per decision type, and escalation paths. Supports lightweight and high-assurance operating modes with configurable governance patterns. Use when designing a product governance model, resolving contested decisions, establishing evidence standards, recording exceptions and escalations, or building cross-functional operating contracts. Do NOT use for executive governance (capital allocation, org structure — route to chief-of-staff-methodology or strategy-frameworks), for technical delivery gates (CI/CD, release approval — route to release-engineering or spec-driven-development), or to impose a universal org chart.

- 호출: `/product-operations-and-governance` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/product-operations-and-governance)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/product-operations-and-governance/SKILL.md`](../../plugins/magnus-agent-skills/skills/product-operations-and-governance/SKILL.md)

### `/product-roadmapping-and-portfolio`

Build and maintain outcome-based product roadmaps and portfolio views that sequence strategic bets by evidence, not dates. Covers Now/Next/Later views, strategic-bet management, capacity allocation, dependency and confidence mapping, scenario planning, continue/pause/kill/revisit criteria, stakeholder narratives, and roadmap review cadences. Use when building or reviewing a product roadmap, managing a portfolio of bets, or communicating strategic sequencing to stakeholders. Do NOT use for tactical prioritization mechanics (RICE, MoSCoW, Kano, OST — route to product-methodology or product-strategy), for project scheduling or Gantt charts, or for delivery-flow management (route to kanban-guru).

- 호출: `/product-roadmapping-and-portfolio` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/product-roadmapping-and-portfolio)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/product-roadmapping-and-portfolio/SKILL.md`](../../plugins/magnus-agent-skills/skills/product-roadmapping-and-portfolio/SKILL.md)

### `/product-shaping`

Use this skill to shape product or engineering work before committing time to it: set appetites instead of estimates, narrow raw ideas into bounded problems, sketch solutions at the right level of abstraction, de-risk rabbit holes, write pitches, bet with capped downside (circuit breaker), and govern builds with discovered scopes and scope hammering. Adapted from Basecamp's Shape Up and extended for human+AI-agent teams. Use when a raw idea, feature request, or "redesign X" grab-bag needs to become a bounded project before anyone builds; when planning how much work an idea is worth; or when delegated agent builds need budgets, kill criteria, and non-convergence rules. Do not use for discovering whether a problem is real (use product-discovery), for portfolio-level sequencing across quarters (product-roadmapping-and-portfolio), for formal specification after the bet is placed (spec-driven-development), or for task-level prioritization frameworks like RICE (product-methodology).

- 호출: `/product-shaping` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/product-shaping)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/product-shaping/SKILL.md`](../../plugins/magnus-agent-skills/skills/product-shaping/SKILL.md)

### `/product-strategy`

Set product vision, positioning, market strategy, and portfolio direction with a CPO methodology. Route tactical prioritization, specifications, and backlog decisions to `product-methodology`; do not use this skill for delivery-level product decisions or unrelated requests.

- 호출: `/product-strategy` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/product-strategy)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/product-strategy/SKILL.md`](../../plugins/magnus-agent-skills/skills/product-strategy/SKILL.md)

### `/production-excellence`

Build cross-domain production evidence from readiness, migration, recovery, capacity/cost, and incident learning into launch or operational decisions. Do not use this skill for a single specialist's risk packet and launch gate; use `production-readiness` for that readiness review.

- 호출: `/production-excellence` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/production-excellence)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/production-excellence/SKILL.md`](../../plugins/magnus-agent-skills/skills/production-excellence/SKILL.md)

### `/production-readiness`

Define risk-scaled evidence packets and go/no-go/defer/exception launch gates with accountable owners. Do not use this skill for cross-domain production composition; use `production-excellence` for assembling migration, recovery, capacity, and incident evidence.

- 호출: `/production-readiness` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/production-readiness)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/production-readiness/SKILL.md`](../../plugins/magnus-agent-skills/skills/production-readiness/SKILL.md)

### `/programming-principles`

Apply distilled coding principles from 14 classic software books to code review, refactoring, design, and implementation decisions. Do not use for language- or framework-specific tutorials, tool manuals, or tasks already governed by a project's established conventions.

- 호출: `/programming-principles` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/programming-principles)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/programming-principles/SKILL.md`](../../plugins/magnus-agent-skills/skills/programming-principles/SKILL.md)

### `/promise-theory`

Teach promise vocabulary, fundamentals, and coordination diagnosis for promise-based systems. Do not use this skill for Semantic Spacetime models or SST CLI tooling; use `semantic-spacetime` for those model and tool workflows.

- 호출: `/promise-theory` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/promise-theory)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/promise-theory/SKILL.md`](../../plugins/magnus-agent-skills/skills/promise-theory/SKILL.md)

### `/pydanticai`

Build type-safe AI agents and graph-based workflows with PydanticAI and PydanticGraph. Agent creation, function tools, capabilities, dependency injection, structured output, streaming, multi-agent patterns, testing, evals, and graph state machines. Use whenever you are building agents, tool-using LLM workflows, or graph-based state machines in Python. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/pydanticai` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/pydanticai)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/pydanticai/SKILL.md`](../../plugins/magnus-agent-skills/skills/pydanticai/SKILL.md)

### `/qa-methodology`

Design and apply QA methodology for software teams: test strategy, regression testing, CI failure triage, test automation, quality gates and metrics, risk-based testing, exploratory testing, test design techniques, AI code quality gates (independent verification, artifact provenance, spec-first oracles, AI-review-comment triage, acceptance-criteria testability for Spec-Driven Development), mutation-guided test hardening and review evidence (surviving mutants, weak assertions, diff-aware mutation testing), agentic eval design (dataset test design, judge-as-system-under-test, flaky-eval discipline), QA career levels (Senior/Staff/Principal), and SDET engineering (test infrastructure, gTAA, CI/CD integration). Do not use for root-cause debugging of production incidents, security implementation or threat modeling, or evaluation framework governance and statistical analysis — route those to systematic-debugging, secure-software-engineering, and agent-evals-and-observability respectively.

- 호출: `/qa-methodology` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`, `templates/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/qa-methodology)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/qa-methodology/SKILL.md`](../../plugins/magnus-agent-skills/skills/qa-methodology/SKILL.md)

### `/raleigh`

Query, search, and download public datasets and civic information for the City of Raleigh. Use for live ArcGIS Hub catalog discovery, ArcGIS FeatureServer and MapServer queries, ImageServer imagery exports, official Raleigh geocoding, GoRaleigh transit feeds, guest-public development records, public RaleighNC.gov content, eSCRIBE public meetings, Raleigh fire reports and inspections, and the Raleigh-Wake ECC active incident feed. Do not use for private data, authenticated operations, payments, submissions, bulk crawling, or non-public portals.

- 호출: `/raleigh` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/raleigh)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/raleigh/SKILL.md`](../../plugins/magnus-agent-skills/skills/raleigh/SKILL.md)

### `/react`

Operate React applications as a named tool: inspect and diagnose React/Vite projects, design component boundaries and state flow, implement accessible responsive UI, and verify behavior with the project's tests. Use when a task explicitly involves React, JSX/TSX, React hooks, React Router, Vite React configuration, or React build failures. Do not use for framework-agnostic frontend strategy (route to frontend-engineering), browser automation (route to playwright), accessibility policy or audits (route to web-accessibility), or non-React mobile apps (route to mobile-development).

- 호출: `/react` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/react)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/react/SKILL.md`](../../plugins/magnus-agent-skills/skills/react/SKILL.md)

### `/release-engineering`

Design, automate, and operate end-to-end software releases: release process models and pipelines (trunk-based development, CD stages, release trains), progressive delivery and feature flags, versioning and artifact management (SemVer, conventional commits, changelogs, SBOM/provenance), readiness and quality gates, rollback and recovery planning, change-management and audit compliance (SOC 2, SOX, PCI), DORA metrics, and multi-team release coordination. Do not use for application feature implementation (backend-engineering/frontend-engineering), production incident root-cause debugging or on-call/SLO operations (systematic-debugging / site-reliability-engineering), security implementation or threat modeling (secure-software-engineering), or internal developer platform construction (platform-engineering).

- 호출: `/release-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`, `templates/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/release-engineering)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/release-engineering/SKILL.md`](../../plugins/magnus-agent-skills/skills/release-engineering/SKILL.md)

### `/remote-systems-administration`

Administer and troubleshoot remote Linux, FreeBSD, NetBSD, OpenBSD, and macOS systems safely, one host or a fleet at a time. Use when a task requires SSH, Ansible, Paramiko, POSIX diagnostics, service management, software updates, system configuration, firewall changes, or evidence-led remote operations. Do not use for local-only desktop administration, container or cluster orchestration (route to kubernetes), or cloud consoles that expose no remote shell.

- 호출: `/remote-systems-administration` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/remote-systems-administration)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/remote-systems-administration/SKILL.md`](../../plugins/magnus-agent-skills/skills/remote-systems-administration/SKILL.md)

### `/research-and-vault`

Chain web research, atomic extraction, and durable note capture when the same research-to-notes sequence must repeat. Do not use this skill to design or evaluate an investigation; use `research-methodology` for research questions, methods, and evidence assessment.

- 호출: `/research-and-vault` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/research-and-vault)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/research-and-vault/SKILL.md`](../../plugins/magnus-agent-skills/skills/research-and-vault/SKILL.md)

### `/research-methodology`

Plan, conduct, evaluate, and synthesize rigorous research investigations with credible evidence and a traceable method, including source-to-claim closure for media evidence. Do not use this skill for repeated source extraction and durable note orchestration; use `research-and-vault` for that capture workflow, or `ffmpeg` for media operations.

- 호출: `/research-methodology` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/research-methodology)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/research-methodology/SKILL.md`](../../plugins/magnus-agent-skills/skills/research-methodology/SKILL.md)

### `/resilience-and-recovery`

Design, exercise, and evidence graceful degradation, disaster recovery, and restoration behavior across systems and dependencies. Covers failure-mode analysis, RTO/RPO decision records, restore testing, game days, failover drills, data integrity verification, and recovery communication. Do not use for live incident command or incident response; route to site-reliability-engineering for those. Do not use for infrastructure implementation details; route to platform-engineering.

- 호출: `/resilience-and-recovery` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/resilience-and-recovery)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/resilience-and-recovery/SKILL.md`](../../plugins/magnus-agent-skills/skills/resilience-and-recovery/SKILL.md)

### `/restic`

Install, configure, operate, secure, automate, tune, troubleshoot, and recover restic backups across local, SFTP, S3-compatible, cloud, and REST backends. Use when creating or managing a restic repository, designing backup or retention policy, validating restores, handling repository health or locks, moving repositories, or building safe scheduled backup jobs. Do not use for a generic file-copy task that does not need encrypted, deduplicated snapshots.

- 호출: `/restic` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/restic)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/restic/SKILL.md`](../../plugins/magnus-agent-skills/skills/restic/SKILL.md)

### `/secure-software-engineering`

Use when designing or implementing software securely: define security requirements, threat-model a feature, choose secure defaults, design authentication and authorization, handle untrusted data and secrets, evaluate dependencies, design multi-tenant trust boundaries, or review security-sensitive changes. Use for prevention during requirements, design, implementation, and review; not for post-build security assessments or scanning an existing codebase.

- 호출: `/secure-software-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/secure-software-engineering)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/secure-software-engineering/SKILL.md`](../../plugins/magnus-agent-skills/skills/secure-software-engineering/SKILL.md)

### `/security-audit-methodology`

Plan authorized security reviews with threat modeling, architecture and dependency audits, and vulnerability classification. Use for scoped defensive security assessment. Do not use for offensive operations, unauthorized testing, or security control implementation.

- 호출: `/security-audit-methodology` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/security-audit-methodology)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/security-audit-methodology/SKILL.md`](../../plugins/magnus-agent-skills/skills/security-audit-methodology/SKILL.md)

### `/semantic-spacetime`

Model and analyze Semantic Spacetime (SST) graphs, distances, trajectories, drift, and model files. Do not use this skill for promise-theory vocabulary and fundamentals without SST modeling; use `promise-theory` for the substrate concepts.

- 호출: `/semantic-spacetime` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/semantic-spacetime)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/semantic-spacetime/SKILL.md`](../../plugins/magnus-agent-skills/skills/semantic-spacetime/SKILL.md)

### `/seo`

Audit and improve website discoverability across traditional search, answer engines, and generative search. Use for technical SEO, on-page content, structured data, question and entity architecture, AI citations, crawler controls, agent-readable content, and reproducible visibility measurement. Do not use for only copy-editing, writing, CMS operations, or generic AI marketing claims without a defined search surface and verification plan.

- 호출: `/seo` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/seo)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/seo/SKILL.md`](../../plugins/magnus-agent-skills/skills/seo/SKILL.md)

### `/site-reliability-engineering`

Design, operate, and improve reliable production systems with SLOs, incident command, observability, error budgets, and operational practices. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/site-reliability-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/site-reliability-engineering)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/site-reliability-engineering/SKILL.md`](../../plugins/magnus-agent-skills/skills/site-reliability-engineering/SKILL.md)

### `/slack`

Operate Slack workspaces from a terminal or agent: list channels, read messages, follow threads, search message history, list files, and verify inbound webhook signatures — with a bundled slack-cli script that is read-only by default and gates every send behind a --dry-run/--yes confirmation. Use when an agent needs to read or post Slack data, triage incidents, or answer questions about what was said in a workspace. Do not use for building Slack apps or bots (that is application development) or workspace administration like user provisioning and org settings (that is the Slack admin console).

- 호출: `/slack` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/slack)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/slack/SKILL.md`](../../plugins/magnus-agent-skills/skills/slack/SKILL.md)

### `/software-architecture`

Design and review software architectures from business drivers through system boundaries, tradeoffs, runtime behavior, evolution, and architecture practice. Use when choosing a greenfield or target architecture, comparing modular-monolith and service shapes, designing distributed consistency, replication, partitioning, coordination, ordering, transaction isolation, or failure behavior, defining architecture fitness evidence, or facilitating a consequential architecture review. Do not use for reverse engineering, API contract semantics, data-platform design, implementation, infrastructure operations, security lifecycle, or migration execution; route those to the named specialist skills.

- 호출: `/software-architecture` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/software-architecture)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/software-architecture/SKILL.md`](../../plugins/magnus-agent-skills/skills/software-architecture/SKILL.md)

### `/software-architecture-analysis`

Use this skill to reverse-engineer an existing software system, map its architecture, data flow, privacy posture, coupling, quality characteristics, and feature surface, then produce an evidence-grounded clean-room design document, PRD, or migration plan under new constraints. Use for codebase archaeology, implicit contract extraction, architecture health assessment, or decomposition-readiness analysis. Do not use for greenfield architecture design, direct code review, bug hunting, security auditing, or implementation of API, data, platform, or migration changes; route those to the relevant neighboring skill.

- 호출: `/software-architecture-analysis` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/software-architecture-analysis)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/software-architecture-analysis/SKILL.md`](../../plugins/magnus-agent-skills/skills/software-architecture-analysis/SKILL.md)

### `/solarpunk`

Create, explore, critique, and practice solarpunk across visual art and image prompts, fiction and worldbuilding, fashion, games, education, everyday living, adaptive reuse, ecological design, parklets, guerrilla gardening, urban and rural planning, community infrastructure, and hopeful collective futures. Use for solarpunk aesthetics, stories, values, or practical paths toward equitable ecological flourishing. Do not use for generic sustainability tasks with no solarpunk intent, certified engineering, jurisdiction-specific legal advice, or operating an image or infrastructure tool; pair with the relevant specialist.

- 호출: `/solarpunk` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/solarpunk)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/solarpunk/SKILL.md`](../../plugins/magnus-agent-skills/skills/solarpunk/SKILL.md)

### `/spec-driven-development`

Design and run a Spec-Driven Development (SDD) pipeline for AI software factories — where structured specifications are the input, AI agents generate the code, and quality gates enforce correctness at each phase: SPECIFY → DECOMPOSE → IMPLEMENT → VERIFY → DELIVER. Use when building or refining a spec-driven pipeline any AI coding tool (Claude Code, Cursor, Hermes Agent, Devin, OpenHands, droid) can follow, or when you need spec quality gates, phase-gate verdicts, NFR encoding, or format translation. Do not use for a single small change with a clear goal (classify first via bmad), for the control-plane protocol of intent contracts, autonomy gating, and failure routing around a pipeline (bmad), or for unvalidated problems (product-discovery).

- 호출: `/spec-driven-development` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/spec-driven-development)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/spec-driven-development/SKILL.md`](../../plugins/magnus-agent-skills/skills/spec-driven-development/SKILL.md)

### `/spring-ai`

Diagnose and operate Spring AI projects with version-aware Maven or Gradle checks for ChatClient, advisors, retrieval, conversation memory, tool/MCP boundaries, streaming, configuration, and observability. Use for setup compatibility, local smoke checks, and failure triage; do not use for provider-specific model evaluation, general Java/Spring development, security threat modeling, or production rollout governance.

- 호출: `/spring-ai` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `examples/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/spring-ai)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/spring-ai/SKILL.md`](../../plugins/magnus-agent-skills/skills/spring-ai/SKILL.md)

### `/strategy-frameworks`

Structure organizational strategy work: strategic direction, competitive and industry analysis, growth options, capital allocation, acquisitions, and portfolio choices. Use when framing consequential choices about where to compete, how to pursue an opportunity, or how to compare strategic options. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/strategy-frameworks` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/strategy-frameworks)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/strategy-frameworks/SKILL.md`](../../plugins/magnus-agent-skills/skills/strategy-frameworks/SKILL.md)

### `/stripe`

Read Stripe account state from a terminal or agent: balance, payment intents, and subscriptions — and perform guarded mutations like canceling a subscription — backed by a bundled stripe-cli script that is read-only first and gates every state-changing command behind a --dry-run/--yes confirmation. Use when an agent needs to answer questions about account balance, recent payments, active subscriptions, or apply a confirmed subscription cancellation. Do not use for building Stripe payments into an application (that is Stripe integration development), managing Stripe dashboard settings, or other payment processors (that is their own tooling).

- 호출: `/stripe` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/stripe)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/stripe/SKILL.md`](../../plugins/magnus-agent-skills/skills/stripe/SKILL.md)

### `/supabase`

Use this skill when developing applications with Supabase, running the Supabase CLI, designing migrations and RLS policies, testing database behavior, generating client types, deploying the official self-hosted Docker stack, or administering its Postgres, Auth, Storage, Realtime, Functions, API gateway, backups, upgrades, and security. Use it for managed and self-hosted projects. Do not use for generic PostgreSQL work with no Supabase services or conventions.

- 호출: `/supabase` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/supabase)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/supabase/SKILL.md`](../../plugins/magnus-agent-skills/skills/supabase/SKILL.md)

### `/system-one`

Design, integrate, evaluate, self-host, and troubleshoot typed System One decision models including TypeSafe Jev, Convai Innovations Laya, CLM, and experimental Strands Decider. Use for Choice/Score/Noul judgments and experimental Jev image/Box queries inside deterministic software, app-control loops, routing, ranking, guardrails, calibration, semantic code linting and post-edit feedback, DevOps decision support, confidence-based escalation, or private open-model inference. Do not use for syntactic/style linting, exact policy or authorization, open-ended generation, or generic LLM serving without a bounded decision contract.

- 호출: `/system-one` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `examples/`, `references/`, `scripts/`, `templates/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/system-one)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/system-one/SKILL.md`](../../plugins/magnus-agent-skills/skills/system-one/SKILL.md)

### `/systematic-debugging`

Diagnose root causes with a four-phase debugging protocol. Use for ANY technical issue — test failures, production bugs, unexpected behavior, performance problems, build failures, or integration issues. ESPECIALLY when under time pressure, when "one quick fix" seems obvious, or when previous fix attempts have failed. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/systematic-debugging` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/systematic-debugging)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/systematic-debugging/SKILL.md`](../../plugins/magnus-agent-skills/skills/systematic-debugging/SKILL.md)

### `/tabpfn`

Operate and evaluate TabPFN for local tabular classification, regression and dataset-specific fine-tuning: checkpoint selection, weight licensing, environment setup, training-context leakage, calibration, resource budgeting and reproducible inference artifacts. Use for TabPFN package or checkpoint workflows. Do not use for generic model selection, operating TabICL, or language-model fine-tuning; use ml-engineering, the selected tool, or unsloth respectively.

- 호출: `/tabpfn` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/tabpfn)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/tabpfn/SKILL.md`](../../plugins/magnus-agent-skills/skills/tabpfn/SKILL.md)

### `/tailscale`

Deploy and manage the self-hosted Tailscale/Headscale ecosystem: a Headscale control server, tailscale clients, ACL policies, node lifecycle, subnet routing, DERP relays, backup/migration, and Tailworm security exposure triage. Use when the user mentions Tailscale, Headscale, tailnet, mesh VPN, WireGuard mesh, or self-hosted VPN infrastructure. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/tailscale` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `skills/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/tailscale)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/tailscale/SKILL.md`](../../plugins/magnus-agent-skills/skills/tailscale/SKILL.md)

### `/teach-me`

Teach a subject through source-grounded explanations, brief diagnostic tasks, practice, and adaptive feedback. Use when a learner asks to learn, understand, refresh, practice, or be tutored toward an observable goal. Do not use for a standalone factual lookup, doing the task on someone's behalf, life coaching, group-program design, or collecting research without teaching.

- 호출: `/teach-me` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/teach-me)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/teach-me/SKILL.md`](../../plugins/magnus-agent-skills/skills/teach-me/SKILL.md)

### `/technical-documentation`

Create and review technical documentation, including READMEs, agent-facing instructions, API references, and CLI help. Use when documentation must help someone complete real work. Do not use for marketing copy, brand messaging, or long-form editorial content.

- 호출: `/technical-documentation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/technical-documentation)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/technical-documentation/SKILL.md`](../../plugins/magnus-agent-skills/skills/technical-documentation/SKILL.md)

### `/technical-program-management`

Manage technical programs made of multiple related projects, products, teams, or vendors: establish the program mandate and benefits, align component work, manage cross-project dependencies and shared capacity, govern risks and decisions, coordinate transformation and adoption, and communicate program health to executives, delivery teams, and partners. Use when the work is a coordinated change larger than one project or when component projects are locally green but the combined outcome is at risk. Do not use for single-project control, detailed implementation planning, product portfolio or capital-allocation decisions, enterprise architecture design, release approval, or live incident command; route those to the named specialists.

- 호출: `/technical-program-management` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/technical-program-management)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/technical-program-management/SKILL.md`](../../plugins/magnus-agent-skills/skills/technical-program-management/SKILL.md)

### `/technical-project-management`

Manage technical projects from initiation through delivery and closure: choose and tailor predictive, iterative, Scrum, flow-based, or hybrid approaches; coordinate teams and vendors; track milestones, risks, issues, dependencies, forecasts, scope changes, and recovery. Use when a team has no project manager, a TPM needs decision-ready analysis, a project is slipping, or commitments and handoffs need coordination. Use `technical-program-management` instead when multiple related projects, teams, vendors, shared capacity, or benefits must be coordinated toward one outcome. Adapt depth to the user's expertise. Do not use for a standalone coding task, product discovery or strategy, only writing an implementation plan, only diagnosing Kanban flow, operating a ticket tool, incident command, or a release go/no-go decision; route those to specialists.

- 호출: `/technical-project-management` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/technical-project-management)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/technical-project-management/SKILL.md`](../../plugins/magnus-agent-skills/skills/technical-project-management/SKILL.md)

### `/technology-radar`

Build and maintain technology radars for adoption, trial, assessment, and hold decisions, and choose proportionate architecture-governance paths for technology portfolios. Use when governing technology choices, build-versus-buy decisions, architecture standards, exceptions, or engineering portfolio risk. Do not use for enterprise capability or target-state architecture, writing ADRs, implementing systems, security engineering, or operational incident/runbook work.

- 호출: `/technology-radar` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/technology-radar)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/technology-radar/SKILL.md`](../../plugins/magnus-agent-skills/skills/technology-radar/SKILL.md)

### `/telemetry`

Operate the observability stack that deploys as one unit: Prometheus scrape configuration, recording and alerting rules, relabeling, retention, and high availability; OpenTelemetry Collector pipelines (receivers, processors, exporters, sampling, trace/span correlation); and Loki ingest, LogQL, retention, and label design — with a bundled read-only telemetry-check script for Prometheus rule sanity and scrape-target reachability. Use when running, tuning, or troubleshooting a Prometheus, OpenTelemetry Collector, or Loki deployment, or reviewing the collection/ingest/retention layer, including bounded PromQL and LogQL query construction, semantic review, and no-data diagnosis. Do not use for observability strategy, SLI/SLO design, or paging policy (that is platform-engineering), Grafana dashboards, panels, and Grafana-side alerting (that is grafana), or Tempo/tracing operations, which remain deferred to a future named-tool skill.

- 호출: `/telemetry` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `fixtures/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/telemetry)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/telemetry/SKILL.md`](../../plugins/magnus-agent-skills/skills/telemetry/SKILL.md)

### `/tempest`

Query hyper-local weather from a WeatherFlow Tempest station over its REST API and the hub's local UDP broadcast: current conditions, forecast, historical observations, and real-time decoded datagrams (obs_st, rapid_wind, evt_precip, evt_strike, hub_status). Use when the user asks about weather, temperature, rain, wind, humidity, or forecast data from their own Tempest/WeatherFlow station, or wants to parse the hub's UDP port 50222 broadcast. Do not use this skill for generic or city forecasts without a Tempest station (public weather services serve those), for Shakespeare's play The Tempest or other literature questions, or for weather hardware from other vendors - the REST endpoints require a personal-use token and the UDP broadcast only exists on a Tempest hub's LAN.

- 호출: `/tempest` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/tempest)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/tempest/SKILL.md`](../../plugins/magnus-agent-skills/skills/tempest/SKILL.md)

### `/terraform`

Operate Terraform and OpenTofu across the whole infrastructure lifecycle: module structure, state backends and locking, plan/apply workflow, drift detection, remote state, upgrade and refactor flows, and evidence-based diagnostics. Use when running or inspecting terraform plans, applies, state files, imports, or state surgery, or when the bundled tfops script should handle the task. Do not use for IaC methodology or cloud design decisions - those route up to platform-engineering.

- 호출: `/terraform` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/terraform)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/terraform/SKILL.md`](../../plugins/magnus-agent-skills/skills/terraform/SKILL.md)

### `/three`

Build browser-based Three.js and WebGL scenes, animations, and interactive 3D visualizations with a small vanilla JavaScript starting point. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/three` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/three)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/three/SKILL.md`](../../plugins/magnus-agent-skills/skills/three/SKILL.md)

### `/tmdb`

Query TMDb metadata for films and television, then enrich results with details, credits, providers, and external IDs. Do not use this skill for personal watch history, watchlists, or tracking; use `trakt` for user activity and watch-state workflows.

- 호출: `/tmdb` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/tmdb)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/tmdb/SKILL.md`](../../plugins/magnus-agent-skills/skills/tmdb/SKILL.md)

### `/traefik`

Deploy, configure, and troubleshoot Traefik v3 reverse proxy — covers all providers, routing, TLS/ACME, middlewares, and production patterns with YAML examples. Load when setting up or debugging a Traefik instance. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/traefik` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/traefik)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/traefik/SKILL.md`](../../plugins/magnus-agent-skills/skills/traefik/SKILL.md)

### `/training-data-annotation`

Design and improve human annotation programs for machine-learning training, validation, and evaluation data, including task and label schemas, active acquisition, annotator guidance, calibration, disagreement, adjudication, provenance, and cost-quality stopping. Do not use for general statistical inference, data storage pipelines, model training, or annotation-interface implementation; route those concerns to data-scientist, data-engineering, ml-engineering, or product-design-and-ux.

- 호출: `/training-data-annotation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/training-data-annotation)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/training-data-annotation/SKILL.md`](../../plugins/magnus-agent-skills/skills/training-data-annotation/SKILL.md)

### `/trakt`

Discover and compare public Trakt.tv trending, popular, and anticipated movies and shows from the terminal. Do not use this skill for personal history, watchlist, collection, or list management; the bundled CLI has no user-scoped operations. Use `tmdb` for catalog metadata, credits, images, and provider lookups.

- 호출: `/trakt` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/trakt)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/trakt/SKILL.md`](../../plugins/magnus-agent-skills/skills/trakt/SKILL.md)

### `/transistor`

Operate Transistor.fm podcast hosting from the terminal: verify API access, browse shows and episodes with JSON:API-aware output, run the episode publish lifecycle (create draft, attach audio, publish or schedule via the dedicated publish endpoint), pull download analytics, and manage private podcast subscribers and webhooks. Use when the user mentions Transistor, Transistor.fm, podcast hosting, episode publishing, private podcast subscribers, or podcast download analytics. Do not use this skill for other podcast hosts (Buzzsprout, Libsyn, Megaphone, Spotify for Creators), for editing or producing audio, or for feed/RSS parsing — the bundled CLI manages a Transistor account through its v1 API and cannot create new shows (dashboard-only).

- 호출: `/transistor` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/transistor)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/transistor/SKILL.md`](../../plugins/magnus-agent-skills/skills/transistor/SKILL.md)

### `/travel-guide`

Create personalized, source-grounded travel dossiers from a destination, dates, duration, travelers, and constraints. Ask only the questions that change the plan, use explicitly permitted personal context without exposing it, research current logistics, and produce a cited, visually coherent PDF or responsive companion web page. Use when someone wants an individualized itinerary, trip brief, travel field guide, or shareable travel website. Do not use for real-time booking, ticket purchasing, visa or legal advice, or generic destination summaries without a specific traveler and trip.

- 호출: `/travel-guide` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`, `styles/`, `templates/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/travel-guide)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/travel-guide/SKILL.md`](../../plugins/magnus-agent-skills/skills/travel-guide/SKILL.md)

### `/unsloth`

Install, operate, and troubleshoot Unsloth Core, Studio, and Desktop for local inference and model training. Use for Unsloth environment setup, LoRA/QLoRA supervised fine-tuning, coding specialization, verifier audits, chat templates, GRPO and preference training, vision and audio workflows, decision models, local coding agents and tools, dynamic quantization, checkpoint recovery, multi-GPU training, and model export to GGUF or serving engines. Do not use for framework-neutral ML strategy or operating a standalone inference server unrelated to Unsloth.

- 호출: `/unsloth` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/unsloth)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/unsloth/SKILL.md`](../../plugins/magnus-agent-skills/skills/unsloth/SKILL.md)

### `/vercel-eve`

Build, develop, deploy, self-host, secure, and troubleshoot durable backend AI agents with Vercel Eve. Use when creating an Eve agent, adding tools, skills, subagents, channels, schedules, sandboxing, durable sessions, observability, or deploying Eve on Vercel or a Node host. Do not use for the separate Vercel AI SDK Agent APIs such as ToolLoopAgent or WorkflowAgent; use an AI SDK-specific skill for those.

- 호출: `/vercel-eve` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/vercel-eve)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/vercel-eve/SKILL.md`](../../plugins/magnus-agent-skills/skills/vercel-eve/SKILL.md)

### `/verification-methodology`

Verify work against explicit criteria using direct, source-faithful evidence, reproducible checks, and clear verdicts. Use before declaring an artifact, implementation, or claim complete; do not use for exploratory research without pass/fail criteria.

- 호출: `/verification-methodology` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/verification-methodology)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/verification-methodology/SKILL.md`](../../plugins/magnus-agent-skills/skills/verification-methodology/SKILL.md)

### `/verified-delivery`

Implement and deliver an authorized change end to end — verify, open the PR, merge, and confirm post-merge state — using live-state gates, durable interruption handoffs, and live-state-first resumption. Use when a user grants end-to-end delivery authority for a specific change and the work may cross tool-call limits, context exhaustion, worker loss, or session interruptions before the delivery boundary is reached. Do not use for plain fixes with no delivery directive, for granting merge or post-merge authority the user did not grant, or for designing release pipelines (use release-engineering for that).

- 호출: `/verified-delivery` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/verified-delivery)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/verified-delivery/SKILL.md`](../../plugins/magnus-agent-skills/skills/verified-delivery/SKILL.md)

### `/vite`

Operate Vite projects: inspect versions and configuration, run bounded development and production builds, diagnose dependency and asset failures, and configure environment-aware frontend delivery. Use when a task names Vite, vite.config, Vite plugins, import.meta.env, dev-server behavior, or Vite build output. Do not use for frontend architecture or visual implementation (route to frontend-engineering), CI/platform provisioning (route to platform-engineering), browser automation (route to playwright), or accessibility design (route to web-accessibility).

- 호출: `/vite` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/vite)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/vite/SKILL.md`](../../plugins/magnus-agent-skills/skills/vite/SKILL.md)

### `/vllm`

Operate, configure, benchmark, and troubleshoot vLLM inference servers: Docker and Kubernetes deployment, quantization-aware model configuration (tensor parallelism, KV cache), OpenAI-compatible API serving, throughput and latency benchmarking, continuous batching tuning, GPU operation, and upgrade/rollback. Use when deploying or running a vLLM server (vllm serve, vllm/vllm-openai), sizing a model and its KV cache for GPUs, selecting quantization and parallelism, serving via /v1 endpoints, measuring serving throughput or latency, tuning batching, or diagnosing GPU, OOM, or startup failures in a vLLM deployment. Do not use for model training, fine-tuning, evaluation-set design, or engine-selection methodology (that is ml-engineering), or for operating the llama.cpp stack with GGUF models (that is llama-cpp); other inference engines (TGI, Ollama, Triton) are out of scope.

- 호출: `/vllm` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`, `tests/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/vllm)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/vllm/SKILL.md`](../../plugins/magnus-agent-skills/skills/vllm/SKILL.md)

### `/waiting-list`

Design and build waiting-list portals for anticipated goods or services: classify whether the experience needs interest capture, verified early access, referral growth, a virtual waiting room, appointment backfill, or scarce-item allocation; choose a reversible architecture; and define the state machine, abuse controls, consent and email lifecycle, fairness, observability, and release gates. Optionally validate supplied email and phone contacts with expiring magic links or provider-managed verification, then feed eligible, consented records to a runtime-configured CRM adapter. Use for prelaunch signups, beta access, launches, bookings, reservations, traffic-spike queues, and premium or cinematic campaign experiences. Do not use for generic landing-page copy, ordinary CRM or email operations, or checkout and inventory systems in isolation; route those parts to the appropriate specialist skill.

- 호출: `/waiting-list` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/waiting-list)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/waiting-list/SKILL.md`](../../plugins/magnus-agent-skills/skills/waiting-list/SKILL.md)

### `/web-accessibility`

Design, build, and review accessible web interfaces with native semantics, keyboard and focus behavior, forms and recovery, responsive input, motion, assistive-technology testing, and WCAG 2.2-informed evidence. Use for a11y, WCAG, ARIA, screen-reader, keyboard, focus, dialog, form, widget, or accessibility review work across frameworks. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/web-accessibility` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/web-accessibility)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/web-accessibility/SKILL.md`](../../plugins/magnus-agent-skills/skills/web-accessibility/SKILL.md)

### `/woodpecker-ci`

Operate Woodpecker CI from installation through production troubleshooting: configure servers and agents, connect Forgejo/Gitea or another forge, write and validate pipelines, manage secrets and plugins, use Docker or Kubernetes backends, run the CLI, and diagnose failed builds. Use when setting up, administering, or debugging Woodpecker CI. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/woodpecker-ci` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/woodpecker-ci)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/woodpecker-ci/SKILL.md`](../../plugins/magnus-agent-skills/skills/woodpecker-ci/SKILL.md)

### `/workflow-architect`

Discover your actual workflow through conversation or observation, then generate a tailored skills bundle that encodes it as loadable agent skills with trigger conditions. Use when you want to understand your own process, formalize it, or share it with collaborators. Also use when a session feels aimless — this skill gives it structure. Do not use this skill for unrelated requests; route to the nearest named specialist.

- 호출: `/workflow-architect` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `skills/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/workflow-architect)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/workflow-architect/SKILL.md`](../../plugins/magnus-agent-skills/skills/workflow-architect/SKILL.md)

### `/writers-helper`

Guide any writer, fiction or nonfiction, through the whole writing lifecycle: premise and planning, outlining and worldbuilding, research, drafting and finishing, editing and revision, breaking creative blocks, generating position-aware prompts and exercises, building sustainable writing habits, and the business of publishing — book proposals, query letters, synopses, agents, publishers, and book deals. Do not use for formatting deliverables into document files (see word-document, pdf-document, epub), for technical or business documentation (see technical-documentation), or for pure grammar and spelling reference.

- 호출: `/writers-helper` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/writers-helper)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/writers-helper/SKILL.md`](../../plugins/magnus-agent-skills/skills/writers-helper/SKILL.md)

### `/yc-default-alive-calculator`

Evaluate startup runway, burn, revenue, and profitability trajectory using the Default Alive / Default Dead framework. Do not use this skill for weekly growth experiments or operating growth decisions; use `yc-weekly-growth-compass` for those decisions.

- 호출: `/yc-default-alive-calculator` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/yc-default-alive-calculator)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/yc-default-alive-calculator/SKILL.md`](../../plugins/magnus-agent-skills/skills/yc-default-alive-calculator/SKILL.md)

### `/yc-weekly-growth-compass`

Make weekly startup growth decisions using growth rate, user behavior, and experiment evidence. Do not use this skill for runway, burn, or profitability trajectory analysis; use `yc-default-alive-calculator` for financial sustainability.

- 호출: `/yc-weekly-growth-compass` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `assets/`, `evals/`, `references/`, `scripts/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/yc-weekly-growth-compass)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/yc-weekly-growth-compass/SKILL.md`](../../plugins/magnus-agent-skills/skills/yc-weekly-growth-compass/SKILL.md)

### `/youtube-thumbnail`

Design, critique, and test YouTube video thumbnails and preview cards for stronger, better-qualified clicks. Use when developing thumbnail concepts, pairing a thumbnail with a title, directing image creation, checking small-screen legibility, preparing a YouTube experiment, or diagnosing thumbnail performance. Do not use for general video editing, channel strategy, or artwork for another platform.

- 호출: `/youtube-thumbnail` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `evals/`, `references/`, `scripts/`, `templates/`
- 원조 GitHub: [magnus919/agent-skills](https://github.com/magnus919/agent-skills/tree/HEAD/youtube-thumbnail)
- 이 레포 사본: [`plugins/magnus-agent-skills/skills/youtube-thumbnail/SKILL.md`](../../plugins/magnus-agent-skills/skills/youtube-thumbnail/SKILL.md)
