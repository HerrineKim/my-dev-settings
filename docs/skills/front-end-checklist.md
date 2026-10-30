# front-end-checklist

[thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist)(MIT)의 규칙 스킬 391개와 통합 감사 스킬. 규칙 하나가 스킬 하나이며 접근성·성능·SEO·보안·HTML/CSS/JS·테스트·i18n을 다룬다.

## 준비
- 원격 MCP `front-end-checklist`(`https://mcp.frontendchecklist.io`). `install.sh`가 `frontend-checklist-global`을 전역 링크할 때 user 스코프로 등록한다. 통합 감사 스킬은 규칙을 기억에 의존하지 않고 이 MCP로 찾는다

## 사용 예
- `/frontend-checklist-global app/page.tsx`: 컴포넌트·페이지를 규칙 전체로 감사(`review_code`)
- "front-end-checklist MCP로 https://example.com 감사해 줘": 공개 URL 감사(`audit_url`)
- "출시 전 접근성 체크리스트 뽑아 줘": `get_workflow`·`get_checklist_rules`

MCP 도구를 늦게 찾는 클라이언트가 있어, 요청에 "front-end-checklist MCP"를 직접 적으면 확실하다.

## 전역 링크
규칙 스킬은 `review`, `quality`, `product`, `video`, `length`처럼 이름이 일반적이라 전역에 깔면 엉뚱한 요청에 걸린다. 그래서 플러그인 전체는 `skills-exclude`로 빼고 `frontend-checklist-global`만 링크한다. 특정 규칙을 자주 쓰면 `!front-end-checklist/<스킬>` 줄을 더한다.

## 주의
- MCP를 쓰면 리뷰할 코드·URL이 외부 서버(frontendchecklist.io)로 전송된다. 회사 코드는 사내 정책을 확인한다. 끄려면 `skills-exclude`에서 `!front-end-checklist/frontend-checklist-global` 줄을 지우고 `./install.sh`를 다시 실행한다(MCP도 지워짐)
- 업스트림 원문 README는 [`../upstream/front-end-checklist/`](../upstream/front-end-checklist/)에 있다.

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (391개)

### `/404-page`

Use when reviewing templates, rendered HTML, or shared components related to Create a custom 404 error page. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/404-page` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/404-page)
- 이 레포 사본: [`plugins/front-end-checklist/skills/404-page/SKILL.md`](../../plugins/front-end-checklist/skills/404-page/SKILL.md)

### `/about-page`

Use when auditing metadata, crawlability, structured data, or indexability related to Create a dedicated About page. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/about-page` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/about-page)
- 이 레포 사본: [`plugins/front-end-checklist/skills/about-page/SKILL.md`](../../plugins/front-end-checklist/skills/about-page/SKILL.md)

### `/accessibility-testing`

Use when reviewing component libraries, page flows, or CI pipelines that need repeatable accessibility checks. Automated testing is strongest at catching structural and attribute-level issues; it does not replace keyboard, screen reader, and manual UX testing.

- 호출: `/accessibility-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/accessibility-testing)
- 이 레포 사본: [`plugins/front-end-checklist/skills/accessibility-testing/SKILL.md`](../../plugins/front-end-checklist/skills/accessibility-testing/SKILL.md)

### `/accessible-authentication`

Use when reviewing sign-in, sign-up, MFA, CAPTCHA, recovery, and re-auth flows. Evaluate the full authentication path, including error handling and backup methods, not just the primary login form.

- 호출: `/accessible-authentication` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/accessible-authentication)
- 이 레포 사본: [`plugins/front-end-checklist/skills/accessible-authentication/SKILL.md`](../../plugins/front-end-checklist/skills/accessible-authentication/SKILL.md)

### `/accessible-notifications`

Use when reviewing templates, rendered HTML, or shared components related to Make notifications accessible. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/accessible-notifications` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/accessible-notifications)
- 이 레포 사본: [`plugins/front-end-checklist/skills/accessible-notifications/SKILL.md`](../../plugins/front-end-checklist/skills/accessible-notifications/SKILL.md)

### `/accessible-tables`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use semantic table markup for screen readers. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/accessible-tables` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/accessible-tables)
- 이 레포 사본: [`plugins/front-end-checklist/skills/accessible-tables/SKILL.md`](../../plugins/front-end-checklist/skills/accessible-tables/SKILL.md)

### `/accessible-tooltips`

Use when reviewing templates, rendered HTML, or shared components related to Create accessible tooltips. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/accessible-tooltips` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/accessible-tooltips)
- 이 레포 사본: [`plugins/front-end-checklist/skills/accessible-tooltips/SKILL.md`](../../plugins/front-end-checklist/skills/accessible-tooltips/SKILL.md)

### `/accesskeys`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Ensure accesskey values are unique. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/accesskeys` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/accesskeys)
- 이 레포 사본: [`plugins/front-end-checklist/skills/accesskeys/SKILL.md`](../../plugins/front-end-checklist/skills/accesskeys/SKILL.md)

### `/accordion-accessibility`

Use when reviewing templates, rendered HTML, or shared components related to Make accordions keyboard navigable. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/accordion-accessibility` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/accordion-accessibility)
- 이 레포 사본: [`plugins/front-end-checklist/skills/accordion-accessibility/SKILL.md`](../../plugins/front-end-checklist/skills/accordion-accessibility/SKILL.md)

### `/affiliate-disclosure`

Use when auditing metadata, crawlability, structured data, or indexability related to Provide clear affiliate disclosures. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/affiliate-disclosure` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/affiliate-disclosure)
- 이 레포 사본: [`plugins/front-end-checklist/skills/affiliate-disclosure/SKILL.md`](../../plugins/front-end-checklist/skills/affiliate-disclosure/SKILL.md)

### `/ai-content`

Use when auditing metadata, crawlability, structured data, or indexability related to Audit and refine AI-generated content. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/ai-content` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/ai-content)
- 이 레포 사본: [`plugins/front-end-checklist/skills/ai-content/SKILL.md`](../../plugins/front-end-checklist/skills/ai-content/SKILL.md)

### `/all-noindex-pages`

Use when auditing metadata, crawlability, structured data, or indexability related to Audit all noindex pages. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/all-noindex-pages` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/all-noindex-pages)
- 이 레포 사본: [`plugins/front-end-checklist/skills/all-noindex-pages/SKILL.md`](../../plugins/front-end-checklist/skills/all-noindex-pages/SKILL.md)

### `/alt-text`

Use when reviewing image assets, markup, and CDN or build transforms related to Provide meaningful alt text for images. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/alt-text` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/alt-text)
- 이 레포 사본: [`plugins/front-end-checklist/skills/alt-text/SKILL.md`](../../plugins/front-end-checklist/skills/alt-text/SKILL.md)

### `/anchor-smooth-scroll`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Provide instant anchor scroll option. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/anchor-smooth-scroll` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/anchor-smooth-scroll)
- 이 레포 사본: [`plugins/front-end-checklist/skills/anchor-smooth-scroll/SKILL.md`](../../plugins/front-end-checklist/skills/anchor-smooth-scroll/SKILL.md)

### `/anchor-text`

Use when auditing metadata, crawlability, structured data, or indexability related to Use descriptive anchor text. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/anchor-text` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/anchor-text)
- 이 레포 사본: [`plugins/front-end-checklist/skills/anchor-text/SKILL.md`](../../plugins/front-end-checklist/skills/anchor-text/SKILL.md)

### `/animated-content`

Use when auditing slow page loads, heavy assets, or rendering delays related to Convert animated GIFs to video. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/animated-content` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/animated-content)
- 이 레포 사본: [`plugins/front-end-checklist/skills/animated-content/SKILL.md`](../../plugins/front-end-checklist/skills/animated-content/SKILL.md)

### `/animation-performance`

Use when reviewing stylesheets, component styles, and responsive behavior related to Use transform and opacity for animations. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/animation-performance` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/animation-performance)
- 이 레포 사본: [`plugins/front-end-checklist/skills/animation-performance/SKILL.md`](../../plugins/front-end-checklist/skills/animation-performance/SKILL.md)

### `/aria-allowed-attr`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use only allowed ARIA attributes for each role. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-allowed-attr` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-allowed-attr)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-allowed-attr/SKILL.md`](../../plugins/front-end-checklist/skills/aria-allowed-attr/SKILL.md)

### `/aria-command-name`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Provide accessible names for ARIA command elements. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-command-name` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-command-name)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-command-name/SKILL.md`](../../plugins/front-end-checklist/skills/aria-command-name/SKILL.md)

### `/aria-deprecated-role`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Avoid using deprecated ARIA roles. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-deprecated-role` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-deprecated-role)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-deprecated-role/SKILL.md`](../../plugins/front-end-checklist/skills/aria-deprecated-role/SKILL.md)

### `/aria-dialog-name`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Ensure dialogs have an accessible name. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-dialog-name` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-dialog-name)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-dialog-name/SKILL.md`](../../plugins/front-end-checklist/skills/aria-dialog-name/SKILL.md)

### `/aria-hidden-body`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Do not use aria-hidden on the document body. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-hidden-body` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-hidden-body)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-hidden-body/SKILL.md`](../../plugins/front-end-checklist/skills/aria-hidden-body/SKILL.md)

### `/aria-hidden-focus`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Remove focusable elements from aria-hidden containers. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-hidden-focus` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-hidden-focus)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-hidden-focus/SKILL.md`](../../plugins/front-end-checklist/skills/aria-hidden-focus/SKILL.md)

### `/aria-input-field-name`

Use when applies to all `<input>` (except type=hidden), `<textarea>`, `<select>`, and custom form widgets using role=textbox, role=combobox, role=spinbutton, role=searchbox, or role=listbox.

- 호출: `/aria-input-field-name` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-input-field-name)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-input-field-name/SKILL.md`](../../plugins/front-end-checklist/skills/aria-input-field-name/SKILL.md)

### `/aria-labels`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Provide accessible names for all interactive elements. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-labels` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-labels)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-labels/SKILL.md`](../../plugins/front-end-checklist/skills/aria-labels/SKILL.md)

### `/aria-live-regions`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Announce dynamic content with ARIA live regions. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-live-regions` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-live-regions)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-live-regions/SKILL.md`](../../plugins/front-end-checklist/skills/aria-live-regions/SKILL.md)

### `/aria-meter-name`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Provide accessible names for meter elements. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-meter-name` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-meter-name)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-meter-name/SKILL.md`](../../plugins/front-end-checklist/skills/aria-meter-name/SKILL.md)

### `/aria-progressbar-name`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Provide accessible names for progress bars. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-progressbar-name` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-progressbar-name)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-progressbar-name/SKILL.md`](../../plugins/front-end-checklist/skills/aria-progressbar-name/SKILL.md)

### `/aria-required-attr`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Include required ARIA attributes for roles. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-required-attr` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-required-attr)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-required-attr/SKILL.md`](../../plugins/front-end-checklist/skills/aria-required-attr/SKILL.md)

### `/aria-required-children`

Use when applies to custom ARIA widgets using composite roles: tablist, list, listbox, menu, menubar, tree, treegrid, grid, rowgroup, row, radiogroup. Use when reviewing components built with div/span elements that replace native HTML list, select, or nav elements.

- 호출: `/aria-required-children` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-required-children)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-required-children/SKILL.md`](../../plugins/front-end-checklist/skills/aria-required-children/SKILL.md)

### `/aria-required-parent`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Ensure ARIA roles are contained by required parent roles. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-required-parent` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-required-parent)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-required-parent/SKILL.md`](../../plugins/front-end-checklist/skills/aria-required-parent/SKILL.md)

### `/aria-roles`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use valid ARIA role values. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-roles` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-roles)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-roles/SKILL.md`](../../plugins/front-end-checklist/skills/aria-roles/SKILL.md)

### `/aria-text`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Avoid focusable descendants in role='text' elements. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-text` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-text)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-text/SKILL.md`](../../plugins/front-end-checklist/skills/aria-text/SKILL.md)

### `/aria-toggle-field-name`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Provide accessible names for toggle fields. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-toggle-field-name` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-toggle-field-name)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-toggle-field-name/SKILL.md`](../../plugins/front-end-checklist/skills/aria-toggle-field-name/SKILL.md)

### `/aria-tooltip-name`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Provide accessible names for tooltips. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-tooltip-name` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-tooltip-name)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-tooltip-name/SKILL.md`](../../plugins/front-end-checklist/skills/aria-tooltip-name/SKILL.md)

### `/aria-treeitem-name`

Use when applies to custom tree widgets built with role='tree', role='treeitem', and role='group'. Common in file explorers, nested navigation menus, org charts, and any UI where items can be expanded or collapsed to reveal children.

- 호출: `/aria-treeitem-name` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-treeitem-name)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-treeitem-name/SKILL.md`](../../plugins/front-end-checklist/skills/aria-treeitem-name/SKILL.md)

### `/aria-valid-attr`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Ensure ARIA attributes are valid. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-valid-attr` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-valid-attr)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-valid-attr/SKILL.md`](../../plugins/front-end-checklist/skills/aria-valid-attr/SKILL.md)

### `/aria-valid-attr-value`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use valid values for ARIA attributes. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/aria-valid-attr-value` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/aria-valid-attr-value)
- 이 레포 사본: [`plugins/front-end-checklist/skills/aria-valid-attr-value/SKILL.md`](../../plugins/front-end-checklist/skills/aria-valid-attr-value/SKILL.md)

### `/article`

Use when auditing metadata, crawlability, structured data, or indexability related to Implement valid Article structured data. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/article` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/article)
- 이 레포 사본: [`plugins/front-end-checklist/skills/article/SKILL.md`](../../plugins/front-end-checklist/skills/article/SKILL.md)

### `/article-links`

Use when auditing metadata, crawlability, structured data, or indexability related to Optimize article link density. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/article-links` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/article-links)
- 이 레포 사본: [`plugins/front-end-checklist/skills/article-links/SKILL.md`](../../plugins/front-end-checklist/skills/article-links/SKILL.md)

### `/audio-descriptions`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Provide audio descriptions for video. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/audio-descriptions` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/audio-descriptions)
- 이 레포 사본: [`plugins/front-end-checklist/skills/audio-descriptions/SKILL.md`](../../plugins/front-end-checklist/skills/audio-descriptions/SKILL.md)

### `/author-byline`

Use when auditing metadata, crawlability, structured data, or indexability related to Display clear author bylines. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/author-byline` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/author-byline)
- 이 레포 사본: [`plugins/front-end-checklist/skills/author-byline/SKILL.md`](../../plugins/front-end-checklist/skills/author-byline/SKILL.md)

### `/author-expertise`

Use when auditing metadata, crawlability, structured data, or indexability related to Highlight author credentials and expertise. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/author-expertise` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/author-expertise)
- 이 레포 사본: [`plugins/front-end-checklist/skills/author-expertise/SKILL.md`](../../plugins/front-end-checklist/skills/author-expertise/SKILL.md)

### `/author-info`

Use when auditing metadata, crawlability, structured data, or indexability related to Implement comprehensive author markup. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/author-info` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/author-info)
- 이 레포 사본: [`plugins/front-end-checklist/skills/author-info/SKILL.md`](../../plugins/front-end-checklist/skills/author-info/SKILL.md)

### `/autofocus-avoidance`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Avoid autofocus on form fields. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/autofocus-avoidance` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/autofocus-avoidance)
- 이 레포 사본: [`plugins/front-end-checklist/skills/autofocus-avoidance/SKILL.md`](../../plugins/front-end-checklist/skills/autofocus-avoidance/SKILL.md)

### `/autoplay-media`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Avoid autoplaying media. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/autoplay-media` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/autoplay-media)
- 이 레포 사본: [`plugins/front-end-checklist/skills/autoplay-media/SKILL.md`](../../plugins/front-end-checklist/skills/autoplay-media/SKILL.md)

### `/avif-format`

Use when reviewing image assets, markup, and CDN or build transforms related to Use AVIF format for modern browsers. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/avif-format` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/avif-format)
- 이 레포 사본: [`plugins/front-end-checklist/skills/avif-format/SKILL.md`](../../plugins/front-end-checklist/skills/avif-format/SKILL.md)

### `/avoid-eval`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Never use eval() or unsafe dynamic code execution. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/avoid-eval` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/avoid-eval)
- 이 레포 사본: [`plugins/front-end-checklist/skills/avoid-eval/SKILL.md`](../../plugins/front-end-checklist/skills/avoid-eval/SKILL.md)

### `/back-forward-cache`

Use when reviewing navigation performance, browser lifecycle events, or resume-from-memory behavior. Check the actual browser lifecycle and restore path, not only static code patterns.

- 호출: `/back-forward-cache` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/back-forward-cache)
- 이 레포 사본: [`plugins/front-end-checklist/skills/back-forward-cache/SKILL.md`](../../plugins/front-end-checklist/skills/back-forward-cache/SKILL.md)

### `/blocked-links`

Use when reviewing HTML source and JavaScript for links or resource URLs pointing to domains listed in common adblocker filter lists.

- 호출: `/blocked-links` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/blocked-links)
- 이 레포 사본: [`plugins/front-end-checklist/skills/blocked-links/SKILL.md`](../../plugins/front-end-checklist/skills/blocked-links/SKILL.md)

### `/breadcrumb`

Use when auditing metadata, crawlability, structured data, or indexability related to Implement valid BreadcrumbList schema. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/breadcrumb` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/breadcrumb)
- 이 레포 사본: [`plugins/front-end-checklist/skills/breadcrumb/SKILL.md`](../../plugins/front-end-checklist/skills/breadcrumb/SKILL.md)

### `/breadcrumb-navigation`

Use when reviewing templates, rendered HTML, or shared components related to Implement accessible breadcrumb navigation. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/breadcrumb-navigation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/breadcrumb-navigation)
- 이 레포 사본: [`plugins/front-end-checklist/skills/breadcrumb-navigation/SKILL.md`](../../plugins/front-end-checklist/skills/breadcrumb-navigation/SKILL.md)

### `/broken-external-links`

Use when auditing metadata, crawlability, structured data, or indexability related to Fix or remove broken external links. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/broken-external-links` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/broken-external-links)
- 이 레포 사본: [`plugins/front-end-checklist/skills/broken-external-links/SKILL.md`](../../plugins/front-end-checklist/skills/broken-external-links/SKILL.md)

### `/broken-html`

Use when auditing metadata, crawlability, structured data, or indexability related to Fix malformed HTML structure. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/broken-html` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/broken-html)
- 이 레포 사본: [`plugins/front-end-checklist/skills/broken-html/SKILL.md`](../../plugins/front-end-checklist/skills/broken-html/SKILL.md)

### `/broken-images`

Use when reviewing image assets, markup, and CDN or build transforms related to Fix broken images. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/broken-images` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/broken-images)
- 이 레포 사본: [`plugins/front-end-checklist/skills/broken-images/SKILL.md`](../../plugins/front-end-checklist/skills/broken-images/SKILL.md)

### `/broken-links`

Use when auditing metadata, crawlability, structured data, or indexability related to Resolve internal broken links. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/broken-links` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/broken-links)
- 이 레포 사본: [`plugins/front-end-checklist/skills/broken-links/SKILL.md`](../../plugins/front-end-checklist/skills/broken-links/SKILL.md)

### `/browser-caching`

Use when auditing slow page loads, heavy assets, or rendering delays related to Enable browser caching. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/browser-caching` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/browser-caching)
- 이 레포 사본: [`plugins/front-end-checklist/skills/browser-caching/SKILL.md`](../../plugins/front-end-checklist/skills/browser-caching/SKILL.md)

### `/browser-required`

Use when auditing slow page loads, heavy assets, or rendering delays related to Perform browser-based performance audits. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/browser-required` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/browser-required)
- 이 레포 사본: [`plugins/front-end-checklist/skills/browser-required/SKILL.md`](../../plugins/front-end-checklist/skills/browser-required/SKILL.md)

### `/button-name`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Provide accessible names for buttons. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/button-name` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/button-name)
- 이 레포 사본: [`plugins/front-end-checklist/skills/button-name/SKILL.md`](../../plugins/front-end-checklist/skills/button-name/SKILL.md)

### `/canonical-chain`

Use when auditing metadata, crawlability, structured data, or indexability related to Avoid redirect chains on canonical URLs. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/canonical-chain` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/canonical-chain)
- 이 레포 사본: [`plugins/front-end-checklist/skills/canonical-chain/SKILL.md`](../../plugins/front-end-checklist/skills/canonical-chain/SKILL.md)

### `/canonical-header`

Use when auditing metadata, crawlability, structured data, or indexability related to Sync HTML canonical tags and Link headers. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/canonical-header` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/canonical-header)
- 이 레포 사본: [`plugins/front-end-checklist/skills/canonical-header/SKILL.md`](../../plugins/front-end-checklist/skills/canonical-header/SKILL.md)

### `/canonical-url`

Use when auditing metadata, crawlability, structured data, or indexability related to Set canonical URLs for all pages. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/canonical-url` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/canonical-url)
- 이 레포 사본: [`plugins/front-end-checklist/skills/canonical-url/SKILL.md`](../../plugins/front-end-checklist/skills/canonical-url/SKILL.md)

### `/carousel-accessibility`

Use when reviewing templates, rendered HTML, or shared components related to Make carousels accessible. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/carousel-accessibility` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/carousel-accessibility)
- 이 레포 사본: [`plugins/front-end-checklist/skills/carousel-accessibility/SKILL.md`](../../plugins/front-end-checklist/skills/carousel-accessibility/SKILL.md)

### `/cascade-layers`

Use when reviewing a CSS architecture for specificity issues, setting up a design system, or migrating a large codebase from utility-first to a layered architecture.

- 호출: `/cascade-layers` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/cascade-layers)
- 이 레포 사본: [`plugins/front-end-checklist/skills/cascade-layers/SKILL.md`](../../plugins/front-end-checklist/skills/cascade-layers/SKILL.md)

### `/cdn`

Use when auditing slow page loads, heavy assets, or rendering delays related to Use a content delivery network. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/cdn` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/cdn)
- 이 레포 사본: [`plugins/front-end-checklist/skills/cdn/SKILL.md`](../../plugins/front-end-checklist/skills/cdn/SKILL.md)

### `/charset`

Use when reviewing templates, rendered HTML, or shared components related to Declare UTF-8 character encoding. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/charset` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/charset)
- 이 레포 사본: [`plugins/front-end-checklist/skills/charset/SKILL.md`](../../plugins/front-end-checklist/skills/charset/SKILL.md)

### `/citations`

Use when auditing metadata, crawlability, structured data, or indexability related to Cite authoritative external sources. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/citations` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/citations)
- 이 레포 사본: [`plugins/front-end-checklist/skills/citations/SKILL.md`](../../plugins/front-end-checklist/skills/citations/SKILL.md)

### `/clean-up-comments`

Use when reviewing templates, rendered HTML, or shared components related to Remove comments and debug code in production. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/clean-up-comments` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/clean-up-comments)
- 이 레포 사본: [`plugins/front-end-checklist/skills/clean-up-comments/SKILL.md`](../../plugins/front-end-checklist/skills/clean-up-comments/SKILL.md)

### `/code-splitting`

Use when reviewing large SPA bundles, new dependency additions, or routes that feel slow to hydrate. Focus on code that is not required for the initial view and can move behind route transitions, user interaction, or viewport-based loading.

- 호출: `/code-splitting` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/code-splitting)
- 이 레포 사본: [`plugins/front-end-checklist/skills/code-splitting/SKILL.md`](../../plugins/front-end-checklist/skills/code-splitting/SKILL.md)

### `/color-contrast`

Use when applies to all visible text and text images, UI component borders (input fields, buttons), focus indicators, icons that convey meaning, and graphical objects required to understand content. Does not apply to inactive/disabled UI components or purely decorative elements.

- 호출: `/color-contrast` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/color-contrast)
- 이 레포 사본: [`plugins/front-end-checklist/skills/color-contrast/SKILL.md`](../../plugins/front-end-checklist/skills/color-contrast/SKILL.md)

### `/color-oklch`

Use when building a design token system, creating accessible colour palettes, generating colour ramps programmatically, or migrating a design system to support wide-gamut displays.

- 호출: `/color-oklch` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/color-oklch)
- 이 레포 사본: [`plugins/front-end-checklist/skills/color-oklch/SKILL.md`](../../plugins/front-end-checklist/skills/color-oklch/SKILL.md)

### `/compression`

Use when auditing slow page loads, heavy assets, or rendering delays related to Enable text-based compression. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/compression` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/compression)
- 이 레포 사본: [`plugins/front-end-checklist/skills/compression/SKILL.md`](../../plugins/front-end-checklist/skills/compression/SKILL.md)

### `/consent-mode`

Use when auditing slow page loads, heavy assets, or rendering delays related to Implement Google Consent Mode v2. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/consent-mode` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/consent-mode)
- 이 레포 사본: [`plugins/front-end-checklist/skills/consent-mode/SKILL.md`](../../plugins/front-end-checklist/skills/consent-mode/SKILL.md)

### `/consistent-help`

Use when reviewing support UI across multi-page flows such as checkout, onboarding, account recovery, or support journeys. Compare multiple pages in the same variation instead of reviewing a single page alone.

- 호출: `/consistent-help` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/consistent-help)
- 이 레포 사본: [`plugins/front-end-checklist/skills/consistent-help/SKILL.md`](../../plugins/front-end-checklist/skills/consistent-help/SKILL.md)

### `/console-cleanup`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Remove console statements in production. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/console-cleanup` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/console-cleanup)
- 이 레포 사본: [`plugins/front-end-checklist/skills/console-cleanup/SKILL.md`](../../plugins/front-end-checklist/skills/console-cleanup/SKILL.md)

### `/const-let`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Prefer const and let over var. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/const-let` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/const-let)
- 이 레포 사본: [`plugins/front-end-checklist/skills/const-let/SKILL.md`](../../plugins/front-end-checklist/skills/const-let/SKILL.md)

### `/contact-page`

Use when auditing metadata, crawlability, structured data, or indexability related to Create a comprehensive Contact page. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/contact-page` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/contact-page)
- 이 레포 사본: [`plugins/front-end-checklist/skills/contact-page/SKILL.md`](../../plugins/front-end-checklist/skills/contact-page/SKILL.md)

### `/container-queries`

Use when reviewing stylesheets, component styles, and responsive behavior related to Use container queries for component-level responsiveness. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/container-queries` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/container-queries)
- 이 레포 사본: [`plugins/front-end-checklist/skills/container-queries/SKILL.md`](../../plugins/front-end-checklist/skills/container-queries/SKILL.md)

### `/content-dates`

Use when auditing article or blog pages for date markup, generating Article JSON-LD with datePublished/dateModified, or checking whether a CMS template surfaces dates correctly.

- 호출: `/content-dates` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/content-dates)
- 이 레포 사본: [`plugins/front-end-checklist/skills/content-dates/SKILL.md`](../../plugins/front-end-checklist/skills/content-dates/SKILL.md)

### `/content-security-policy`

Use when reviewing headers, forms, cookies, or third-party integrations related to Implement a content security policy. Validate the effective browser and HTTP behavior in a production-like environment.

- 호출: `/content-security-policy` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/content-security-policy)
- 이 레포 사본: [`plugins/front-end-checklist/skills/content-security-policy/SKILL.md`](../../plugins/front-end-checklist/skills/content-security-policy/SKILL.md)

### `/content-without-css`

Use when reviewing rendered HTML, layout components, or design-system patterns that may depend on presentation for meaning. Check the DOM order, semantic structure, form relationships, and whether CSS generated content carries essential information.

- 호출: `/content-without-css` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/content-without-css)
- 이 레포 사본: [`plugins/front-end-checklist/skills/content-without-css/SKILL.md`](../../plugins/front-end-checklist/skills/content-without-css/SKILL.md)

### `/contract-testing`

Use when setting up integration testing for a frontend-backend API boundary, evaluating whether two services are safe to deploy independently, or replacing slow end-to-end tests with contract tests.

- 호출: `/contract-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/contract-testing)
- 이 레포 사본: [`plugins/front-end-checklist/skills/contract-testing/SKILL.md`](../../plugins/front-end-checklist/skills/contract-testing/SKILL.md)

### `/cookie-consent`

Use when reviewing a website for GDPR/CCPA compliance, specifically whether cookie consent is obtained before non-essential cookies are set.

- 호출: `/cookie-consent` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/cookie-consent)
- 이 레포 사본: [`plugins/front-end-checklist/skills/cookie-consent/SKILL.md`](../../plugins/front-end-checklist/skills/cookie-consent/SKILL.md)

### `/critical-images`

Use when reviewing image assets, markup, and CDN or build transforms related to Prioritize loading critical images. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/critical-images` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/critical-images)
- 이 레포 사본: [`plugins/front-end-checklist/skills/critical-images/SKILL.md`](../../plugins/front-end-checklist/skills/critical-images/SKILL.md)

### `/critical-request-chains`

Use when auditing slow page loads, heavy assets, or rendering delays related to Minimize critical request chains. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/critical-request-chains` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/critical-request-chains)
- 이 레포 사본: [`plugins/front-end-checklist/skills/critical-request-chains/SKILL.md`](../../plugins/front-end-checklist/skills/critical-request-chains/SKILL.md)

### `/cross-browser-testing`

Use when reviewing CI coverage, automated checks, or test strategy related to Test across all major browsers. Focus on whether the rule is continuously verified, not just documented.

- 호출: `/cross-browser-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/cross-browser-testing)
- 이 레포 사본: [`plugins/front-end-checklist/skills/cross-browser-testing/SKILL.md`](../../plugins/front-end-checklist/skills/cross-browser-testing/SKILL.md)

### `/cross-origin-isolation`

Use when reviewing security-sensitive web apps, SharedArrayBuffer usage, worker-heavy apps, editors, or measurement features that require cross-origin isolation. Check both headers and real browser behavior.

- 호출: `/cross-origin-isolation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/cross-origin-isolation)
- 이 레포 사본: [`plugins/front-end-checklist/skills/cross-origin-isolation/SKILL.md`](../../plugins/front-end-checklist/skills/cross-origin-isolation/SKILL.md)

### `/cross-origin-security`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Handle cross-origin requests securely. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/cross-origin-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/cross-origin-security)
- 이 레포 사본: [`plugins/front-end-checklist/skills/cross-origin-security/SKILL.md`](../../plugins/front-end-checklist/skills/cross-origin-security/SKILL.md)

### `/css-at-property`

Use when implementing animated gradients, complex CSS transitions that involve custom property values, or building a typed design token system where custom property misuse should produce visible errors.

- 호출: `/css-at-property` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/css-at-property)
- 이 레포 사본: [`plugins/front-end-checklist/skills/css-at-property/SKILL.md`](../../plugins/front-end-checklist/skills/css-at-property/SKILL.md)

### `/css-containment`

Use when reviewing stylesheets, component styles, and responsive behavior related to Use CSS containment to limit repaint scope. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/css-containment` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/css-containment)
- 이 레포 사본: [`plugins/front-end-checklist/skills/css-containment/SKILL.md`](../../plugins/front-end-checklist/skills/css-containment/SKILL.md)

### `/css-critical`

Use when reviewing stylesheets, component styles, and responsive behavior related to Inline critical CSS for faster rendering. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/css-critical` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/css-critical)
- 이 레포 사본: [`plugins/front-end-checklist/skills/css-critical/SKILL.md`](../../plugins/front-end-checklist/skills/css-critical/SKILL.md)

### `/css-custom-properties`

Use when reviewing stylesheets, component styles, and responsive behavior related to Use CSS custom properties for design tokens. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/css-custom-properties` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/css-custom-properties)
- 이 레포 사본: [`plugins/front-end-checklist/skills/css-custom-properties/SKILL.md`](../../plugins/front-end-checklist/skills/css-custom-properties/SKILL.md)

### `/css-file-size`

Use when auditing slow page loads, heavy assets, or rendering delays related to Optimize CSS file size. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/css-file-size` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/css-file-size)
- 이 레포 사본: [`plugins/front-end-checklist/skills/css-file-size/SKILL.md`](../../plugins/front-end-checklist/skills/css-file-size/SKILL.md)

### `/css-grid`

Use when reviewing stylesheets, component styles, and responsive behavior related to Use CSS Grid for two-dimensional layouts. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/css-grid` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/css-grid)
- 이 레포 사본: [`plugins/front-end-checklist/skills/css-grid/SKILL.md`](../../plugins/front-end-checklist/skills/css-grid/SKILL.md)

### `/css-minification`

Use when reviewing stylesheets, component styles, and responsive behavior related to Minify all CSS files. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/css-minification` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/css-minification)
- 이 레포 사본: [`plugins/front-end-checklist/skills/css-minification/SKILL.md`](../../plugins/front-end-checklist/skills/css-minification/SKILL.md)

### `/css-non-blocking`

Use when reviewing stylesheets, component styles, and responsive behavior related to Load CSS without blocking render. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/css-non-blocking` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/css-non-blocking)
- 이 레포 사본: [`plugins/front-end-checklist/skills/css-non-blocking/SKILL.md`](../../plugins/front-end-checklist/skills/css-non-blocking/SKILL.md)

### `/css-order`

Use when reviewing stylesheets, component styles, and responsive behavior related to Order CSS files correctly. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/css-order` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/css-order)
- 이 레포 사본: [`plugins/front-end-checklist/skills/css-order/SKILL.md`](../../plugins/front-end-checklist/skills/css-order/SKILL.md)

### `/css-print`

Use when reviewing stylesheets, component styles, and responsive behavior related to Include a print stylesheet. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/css-print` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/css-print)
- 이 레포 사본: [`plugins/front-end-checklist/skills/css-print/SKILL.md`](../../plugins/front-end-checklist/skills/css-print/SKILL.md)

### `/cumulative-layout-shift`

Use when auditing slow page loads, heavy assets, or rendering delays related to Minimize cumulative layout shift. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/cumulative-layout-shift` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/cumulative-layout-shift)
- 이 레포 사본: [`plugins/front-end-checklist/skills/cumulative-layout-shift/SKILL.md`](../../plugins/front-end-checklist/skills/cumulative-layout-shift/SKILL.md)

### `/currency-formatting`

Use when reviewing utility functions, component props, or template strings that format numbers, prices, or dates to check whether Intl APIs are used correctly.

- 호출: `/currency-formatting` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/currency-formatting)
- 이 레포 사본: [`plugins/front-end-checklist/skills/currency-formatting/SKILL.md`](../../plugins/front-end-checklist/skills/currency-formatting/SKILL.md)

### `/custom-element-accessibility`

Use when reviewing custom element class definitions or Web Component source code to check for missing ARIA reflection, keyboard handling, and form association.

- 호출: `/custom-element-accessibility` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/custom-element-accessibility)
- 이 레포 사본: [`plugins/front-end-checklist/skills/custom-element-accessibility/SKILL.md`](../../plugins/front-end-checklist/skills/custom-element-accessibility/SKILL.md)

### `/dark-mode-css`

Use when reviewing stylesheets, component styles, and responsive behavior related to Support dark mode with prefers-color-scheme. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/dark-mode-css` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/dark-mode-css)
- 이 레포 사본: [`plugins/front-end-checklist/skills/dark-mode-css/SKILL.md`](../../plugins/front-end-checklist/skills/dark-mode-css/SKILL.md)

### `/data-minimisation`

Use when reviewing form components, API payloads, or client-side storage to identify fields that are collected but not consumed by a stated feature.

- 호출: `/data-minimisation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/data-minimisation)
- 이 레포 사본: [`plugins/front-end-checklist/skills/data-minimisation/SKILL.md`](../../plugins/front-end-checklist/skills/data-minimisation/SKILL.md)

### `/dead-end-pages`

Use when auditing a site's internal link graph for dead-end pages, suggesting related-content links to add to thin or standalone pages, or reviewing CMS templates that produce link-free content pages.

- 호출: `/dead-end-pages` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/dead-end-pages)
- 이 레포 사본: [`plugins/front-end-checklist/skills/dead-end-pages/SKILL.md`](../../plugins/front-end-checklist/skills/dead-end-pages/SKILL.md)

### `/debounce-throttle`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Debounce and throttle event handlers. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/debounce-throttle` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/debounce-throttle)
- 이 레포 사본: [`plugins/front-end-checklist/skills/debounce-throttle/SKILL.md`](../../plugins/front-end-checklist/skills/debounce-throttle/SKILL.md)

### `/decorative-elements`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Hide decorative elements from assistive technology. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant. If an image is clearly decorative, default to no finding unless the snippet shows an actual issue such as broken semantics, focusability, or visible layout instability.

- 호출: `/decorative-elements` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/decorative-elements)
- 이 레포 사본: [`plugins/front-end-checklist/skills/decorative-elements/SKILL.md`](../../plugins/front-end-checklist/skills/decorative-elements/SKILL.md)

### `/defer-async`

Use when reviewing templates, rendered HTML, or shared components related to Load scripts with defer, async, or type=module. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/defer-async` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/defer-async)
- 이 레포 사본: [`plugins/front-end-checklist/skills/defer-async/SKILL.md`](../../plugins/front-end-checklist/skills/defer-async/SKILL.md)

### `/definition-list`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use correct definition list structure. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/definition-list` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/definition-list)
- 이 레포 사본: [`plugins/front-end-checklist/skills/definition-list/SKILL.md`](../../plugins/front-end-checklist/skills/definition-list/SKILL.md)

### `/dependency-audit`

Use when reviewing a project's security posture, setting up CI pipelines, or responding to a reported vulnerability in a dependency.

- 호출: `/dependency-audit` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/dependency-audit)
- 이 레포 사본: [`plugins/front-end-checklist/skills/dependency-audit/SKILL.md`](../../plugins/front-end-checklist/skills/dependency-audit/SKILL.md)

### `/dimensions`

Use when reviewing image assets, markup, and CDN or build transforms related to Set explicit width and height on images. Check encoded size, rendered size, loading strategy, and above-the-fold impact together. Separate real CLS risks from tiny decorative SVGs or ornament-only assets that are unlikely to move surrounding content.

- 호출: `/dimensions` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/dimensions)
- 이 레포 사본: [`plugins/front-end-checklist/skills/dimensions/SKILL.md`](../../plugins/front-end-checklist/skills/dimensions/SKILL.md)

### `/direction-attribute`

Use when reviewing templates, rendered HTML, or shared components related to Set text direction for RTL languages. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/direction-attribute` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/direction-attribute)
- 이 레포 사본: [`plugins/front-end-checklist/skills/direction-attribute/SKILL.md`](../../plugins/front-end-checklist/skills/direction-attribute/SKILL.md)

### `/disclaimers`

Use when auditing YMYL content pages for trust signals, generating disclaimer copy for medical or financial content, or reviewing affiliate disclosure requirements under FTC or ASA guidelines.

- 호출: `/disclaimers` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/disclaimers)
- 이 레포 사본: [`plugins/front-end-checklist/skills/disclaimers/SKILL.md`](../../plugins/front-end-checklist/skills/disclaimers/SKILL.md)

### `/dlitem`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Wrap definition items in a definition list. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/dlitem` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/dlitem)
- 이 레포 사본: [`plugins/front-end-checklist/skills/dlitem/SKILL.md`](../../plugins/front-end-checklist/skills/dlitem/SKILL.md)

### `/doctype`

Use when applies to all HTML documents. Always check the very first line of the raw HTML source (view-source: or DevTools > Network > Response). In SSR frameworks, check the root HTML template (e.g., _document.tsx in Next.js, index.html in Vite/Vue, application.html.erb in Rails). The doctype is not a tag — it is a declaration and does not need a closing tag.

- 호출: `/doctype` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/doctype)
- 이 레포 사본: [`plugins/front-end-checklist/skills/doctype/SKILL.md`](../../plugins/front-end-checklist/skills/doctype/SKILL.md)

### `/dom-performance`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Minimize costly DOM read/write operations. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug. In React, repeated requestAnimationFrame-driven state updates across multiple mounted components are a valid performance smell when visible in the source.

- 호출: `/dom-performance` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/dom-performance)
- 이 레포 사본: [`plugins/front-end-checklist/skills/dom-performance/SKILL.md`](../../plugins/front-end-checklist/skills/dom-performance/SKILL.md)

### `/dom-size`

Use when auditing slow page loads, heavy assets, or rendering delays related to Reduce DOM size and complexity. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/dom-size` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/dom-size)
- 이 레포 사본: [`plugins/front-end-checklist/skills/dom-size/SKILL.md`](../../plugins/front-end-checklist/skills/dom-size/SKILL.md)

### `/draggable-accessibility`

Use when reviewing templates, rendered HTML, or shared components related to Make drag and drop accessible. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/draggable-accessibility` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/draggable-accessibility)
- 이 레포 사본: [`plugins/front-end-checklist/skills/draggable-accessibility/SKILL.md`](../../plugins/front-end-checklist/skills/draggable-accessibility/SKILL.md)

### `/duplicate-description`

Use when auditing a site's meta tag uniqueness, generating page-specific meta descriptions, or reviewing CMS templates that inject the same description globally.

- 호출: `/duplicate-description` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/duplicate-description)
- 이 레포 사본: [`plugins/front-end-checklist/skills/duplicate-description/SKILL.md`](../../plugins/front-end-checklist/skills/duplicate-description/SKILL.md)

### `/duplicate-id-active`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use unique IDs for active elements. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/duplicate-id-active` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/duplicate-id-active)
- 이 레포 사본: [`plugins/front-end-checklist/skills/duplicate-id-active/SKILL.md`](../../plugins/front-end-checklist/skills/duplicate-id-active/SKILL.md)

### `/duplicate-id-aria`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use unique IDs for ARIA references. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/duplicate-id-aria` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/duplicate-id-aria)
- 이 레포 사본: [`plugins/front-end-checklist/skills/duplicate-id-aria/SKILL.md`](../../plugins/front-end-checklist/skills/duplicate-id-aria/SKILL.md)

### `/duplicate-js`

Use when auditing slow page loads, heavy assets, or rendering delays related to Remove duplicate JavaScript libraries. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/duplicate-js` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/duplicate-js)
- 이 레포 사본: [`plugins/front-end-checklist/skills/duplicate-js/SKILL.md`](../../plugins/front-end-checklist/skills/duplicate-js/SKILL.md)

### `/e2e-testing`

Use when reviewing CI coverage, automated checks, or test strategy related to Implement end-to-end testing. Focus on whether the rule is continuously verified, not just documented.

- 호출: `/e2e-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/e2e-testing)
- 이 레포 사본: [`plugins/front-end-checklist/skills/e2e-testing/SKILL.md`](../../plugins/front-end-checklist/skills/e2e-testing/SKILL.md)

### `/editorial-policy`

Use when auditing a blog, news site, or YMYL content site for trust signals, drafting editorial policy page content, or evaluating whether a site meets Google's quality rater trustworthiness criteria.

- 호출: `/editorial-policy` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/editorial-policy)
- 이 레포 사본: [`plugins/front-end-checklist/skills/editorial-policy/SKILL.md`](../../plugins/front-end-checklist/skills/editorial-policy/SKILL.md)

### `/element-hiding`

Use when reviewing a website for layout and functionality issues caused by adblocker filter rules targeting common ad-related class names and IDs.

- 호출: `/element-hiding` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/element-hiding)
- 이 레포 사본: [`plugins/front-end-checklist/skills/element-hiding/SKILL.md`](../../plugins/front-end-checklist/skills/element-hiding/SKILL.md)

### `/embedded-or-inline-css`

Use when reviewing stylesheets, component styles, and responsive behavior related to Avoid embedded and inline CSS. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/embedded-or-inline-css` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/embedded-or-inline-css)
- 이 레포 사본: [`plugins/front-end-checklist/skills/embedded-or-inline-css/SKILL.md`](../../plugins/front-end-checklist/skills/embedded-or-inline-css/SKILL.md)

### `/empty-heading`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Ensure headings contain text. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/empty-heading` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/empty-heading)
- 이 레포 사본: [`plugins/front-end-checklist/skills/empty-heading/SKILL.md`](../../plugins/front-end-checklist/skills/empty-heading/SKILL.md)

### `/empty-links`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Fix empty and broken links. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/empty-links` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/empty-links)
- 이 레포 사본: [`plugins/front-end-checklist/skills/empty-links/SKILL.md`](../../plugins/front-end-checklist/skills/empty-links/SKILL.md)

### `/error-handling`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Implement proper error handling. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/error-handling` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/error-handling)
- 이 레포 사본: [`plugins/front-end-checklist/skills/error-handling/SKILL.md`](../../plugins/front-end-checklist/skills/error-handling/SKILL.md)

### `/error-images`

Use when reviewing image assets, markup, and CDN or build transforms related to Handle image loading errors gracefully. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/error-images` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/error-images)
- 이 레포 사본: [`plugins/front-end-checklist/skills/error-images/SKILL.md`](../../plugins/front-end-checklist/skills/error-images/SKILL.md)

### `/error-monitoring`

Use when setting up a new project's production observability stack, reviewing incident response readiness, or investigating why errors are going undetected.

- 호출: `/error-monitoring` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/error-monitoring)
- 이 레포 사본: [`plugins/front-end-checklist/skills/error-monitoring/SKILL.md`](../../plugins/front-end-checklist/skills/error-monitoring/SKILL.md)

### `/es-modules`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Use ES modules (import/export). Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/es-modules` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/es-modules)
- 이 레포 사본: [`plugins/front-end-checklist/skills/es-modules/SKILL.md`](../../plugins/front-end-checklist/skills/es-modules/SKILL.md)

### `/event-delegation`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Use event delegation for dynamic content. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/event-delegation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/event-delegation)
- 이 레포 사본: [`plugins/front-end-checklist/skills/event-delegation/SKILL.md`](../../plugins/front-end-checklist/skills/event-delegation/SKILL.md)

### `/external-links`

Use when auditing content pages for citation quality, suggesting authoritative sources to link for factual claims, or reviewing whether a page's external link attributes (nofollow, noopener) are correctly set.

- 호출: `/external-links` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/external-links)
- 이 레포 사본: [`plugins/front-end-checklist/skills/external-links/SKILL.md`](../../plugins/front-end-checklist/skills/external-links/SKILL.md)

### `/faq`

Use when adding FAQ sections to landing pages or blog posts, generating FAQPage JSON-LD from existing Q&A content, or validating that structured data on pages with FAQ sections is syntactically and semantically correct.

- 호출: `/faq` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/faq)
- 이 레포 사본: [`plugins/front-end-checklist/skills/faq/SKILL.md`](../../plugins/front-end-checklist/skills/faq/SKILL.md)

### `/favicon`

Use when checking whether a site has a correctly configured favicon, auditing `<link rel='icon'>` tags in the `<head>`, or setting up favicon infrastructure for a new project.

- 호출: `/favicon` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/favicon)
- 이 레포 사본: [`plugins/front-end-checklist/skills/favicon/SKILL.md`](../../plugins/front-end-checklist/skills/favicon/SKILL.md)

### `/favicons`

Use when reviewing templates, rendered HTML, or shared components related to Implement favicons for all devices. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/favicons` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/favicons)
- 이 레포 사본: [`plugins/front-end-checklist/skills/favicons/SKILL.md`](../../plugins/front-end-checklist/skills/favicons/SKILL.md)

### `/fetchpriority-attribute`

Use when optimising Largest Contentful Paint (LCP), reducing render-blocking resource contention, or fine-tuning resource loading order in the critical rendering path.

- 호출: `/fetchpriority-attribute` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/fetchpriority-attribute)
- 이 레포 사본: [`plugins/front-end-checklist/skills/fetchpriority-attribute/SKILL.md`](../../plugins/front-end-checklist/skills/fetchpriority-attribute/SKILL.md)

### `/figure-figcaption`

Use when reviewing image assets, markup, and CDN or build transforms related to Use <figure> and <figcaption> for image captions. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/figure-figcaption` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/figure-figcaption)
- 이 레포 사본: [`plugins/front-end-checklist/skills/figure-figcaption/SKILL.md`](../../plugins/front-end-checklist/skills/figure-figcaption/SKILL.md)

### `/file-upload-accessibility`

Use when reviewing templates, rendered HTML, or shared components related to Make file uploads accessible. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/file-upload-accessibility` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/file-upload-accessibility)
- 이 레포 사본: [`plugins/front-end-checklist/skills/file-upload-accessibility/SKILL.md`](../../plugins/front-end-checklist/skills/file-upload-accessibility/SKILL.md)

### `/filename-quality`

Use when reviewing image assets, markup, and CDN or build transforms related to Use descriptive image filenames. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/filename-quality` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/filename-quality)
- 이 레포 사본: [`plugins/front-end-checklist/skills/filename-quality/SKILL.md`](../../plugins/front-end-checklist/skills/filename-quality/SKILL.md)

### `/find-npm-packages`

Use when you need to find the 2-3 most popular and well-maintained npm packages relevant to a frontend checklist rule, validate they meet quality thresholds, and add them to the rule's frontmatter.

- 호출: `/find-npm-packages` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/find-npm-packages)
- 이 레포 사본: [`plugins/front-end-checklist/skills/find-npm-packages/SKILL.md`](../../plugins/front-end-checklist/skills/find-npm-packages/SKILL.md)

### `/first-contentful-paint`

Use when auditing slow page loads, heavy assets, or rendering delays related to Optimize first contentful paint. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/first-contentful-paint` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/first-contentful-paint)
- 이 레포 사본: [`plugins/front-end-checklist/skills/first-contentful-paint/SKILL.md`](../../plugins/front-end-checklist/skills/first-contentful-paint/SKILL.md)

### `/flashing-content`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Prevent seizure-triggering flashing content. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/flashing-content` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/flashing-content)
- 이 레포 사본: [`plugins/front-end-checklist/skills/flashing-content/SKILL.md`](../../plugins/front-end-checklist/skills/flashing-content/SKILL.md)

### `/flexbox-patterns`

Use when reviewing stylesheets, component styles, and responsive behavior related to Apply Flexbox best practices. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/flexbox-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/flexbox-patterns)
- 이 레포 사본: [`plugins/front-end-checklist/skills/flexbox-patterns/SKILL.md`](../../plugins/front-end-checklist/skills/flexbox-patterns/SKILL.md)

### `/focus-management`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Manage focus during dynamic interactions. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/focus-management` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/focus-management)
- 이 레포 사본: [`plugins/front-end-checklist/skills/focus-management/SKILL.md`](../../plugins/front-end-checklist/skills/focus-management/SKILL.md)

### `/focus-not-obscured`

Use when reviewing sticky navigation, consent banners, chat widgets, skip links, or any fixed-position UI. Validate the actual tab order and viewport behavior at realistic zoom levels.

- 호출: `/focus-not-obscured` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/focus-not-obscured)
- 이 레포 사본: [`plugins/front-end-checklist/skills/focus-not-obscured/SKILL.md`](../../plugins/front-end-checklist/skills/focus-not-obscured/SKILL.md)

### `/focus-order`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Ensure logical focus order. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/focus-order` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/focus-order)
- 이 레포 사본: [`plugins/front-end-checklist/skills/focus-order/SKILL.md`](../../plugins/front-end-checklist/skills/focus-order/SKILL.md)

### `/focus-styles`

Use when reviewing stylesheets, component styles, and responsive behavior related to Provide visible custom focus indicators. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/focus-styles` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/focus-styles)
- 이 레포 사본: [`plugins/front-end-checklist/skills/focus-styles/SKILL.md`](../../plugins/front-end-checklist/skills/focus-styles/SKILL.md)

### `/font-loading`

Use when auditing slow page loads, heavy assets, or rendering delays related to Optimize web font loading. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/font-loading` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/font-loading)
- 이 레포 사본: [`plugins/front-end-checklist/skills/font-loading/SKILL.md`](../../plugins/front-end-checklist/skills/font-loading/SKILL.md)

### `/font-size`

Use when applies to all CSS `font-size` declarations, particularly those using `px` units for body text, UI labels, and navigation. Use when auditing mobile responsiveness and accessibility compliance. Check for `font-size` in media queries targeting small screens.

- 호출: `/font-size` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/font-size)
- 이 레포 사본: [`plugins/front-end-checklist/skills/font-size/SKILL.md`](../../plugins/front-end-checklist/skills/font-size/SKILL.md)

### `/form-captcha`

Use when reviewing public HTML forms (no authentication required to reach them) for bot and abuse protection mechanisms.

- 호출: `/form-captcha` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/form-captcha)
- 이 레포 사본: [`plugins/front-end-checklist/skills/form-captcha/SKILL.md`](../../plugins/front-end-checklist/skills/form-captcha/SKILL.md)

### `/form-field-multiple-labels`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use a single label for each form field. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/form-field-multiple-labels` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/form-field-multiple-labels)
- 이 레포 사본: [`plugins/front-end-checklist/skills/form-field-multiple-labels/SKILL.md`](../../plugins/front-end-checklist/skills/form-field-multiple-labels/SKILL.md)

### `/form-https`

Use when reviewing HTML forms, fetch/XHR calls, and form action attributes to ensure data is submitted exclusively over HTTPS.

- 호출: `/form-https` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/form-https)
- 이 레포 사본: [`plugins/front-end-checklist/skills/form-https/SKILL.md`](../../plugins/front-end-checklist/skills/form-https/SKILL.md)

### `/form-labels`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Associate labels with form controls. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/form-labels` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/form-labels)
- 이 레포 사본: [`plugins/front-end-checklist/skills/form-labels/SKILL.md`](../../plugins/front-end-checklist/skills/form-labels/SKILL.md)

### `/form-validation`

Use when reviewing templates, rendered HTML, or shared components related to Validate forms accessibly. Validate the final browser-facing markup, not just the source framework abstraction. Distinguish between browser-posted forms and client-handled React forms so you do not over-report missing `method` or `action` as accessibility defects.

- 호출: `/form-validation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/form-validation)
- 이 레포 사본: [`plugins/front-end-checklist/skills/form-validation/SKILL.md`](../../plugins/front-end-checklist/skills/form-validation/SKILL.md)

### `/frame-title`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Provide titles for iframes and frames. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/frame-title` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/frame-title)
- 이 레포 사본: [`plugins/front-end-checklist/skills/frame-title/SKILL.md`](../../plugins/front-end-checklist/skills/frame-title/SKILL.md)

### `/freshness`

Use when auditing content pages for freshness signals, setting up HTTP Last-Modified headers in a web server config, or ensuring Article JSON-LD dateModified is updated when CMS content changes.

- 호출: `/freshness` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/freshness)
- 이 레포 사본: [`plugins/front-end-checklist/skills/freshness/SKILL.md`](../../plugins/front-end-checklist/skills/freshness/SKILL.md)

### `/frontend-checklist-global`

Use when auditing or improving any frontend codebase against the full Front-End Checklist rule corpus through one entry point.

- 호출: `/frontend-checklist-global` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/frontend-checklist-global)
- 이 레포 사본: [`plugins/front-end-checklist/skills/frontend-checklist-global/SKILL.md`](../../plugins/front-end-checklist/skills/frontend-checklist-global/SKILL.md)

### `/geo-meta`

Use when auditing locally-focused or regionally-targeted pages for geo targeting signals, particularly on sites targeting audiences through Bing or regional search engines. Note that these meta tags have no documented effect on Google's ranking.

- 호출: `/geo-meta` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/geo-meta)
- 이 레포 사본: [`plugins/front-end-checklist/skills/geo-meta/SKILL.md`](../../plugins/front-end-checklist/skills/geo-meta/SKILL.md)

### `/gtm-present`

Use when auditing slow page loads, heavy assets, or rendering delays related to Optimize Google Tag Manager implementation. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/gtm-present` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/gtm-present)
- 이 레포 사본: [`plugins/front-end-checklist/skills/gtm-present/SKILL.md`](../../plugins/front-end-checklist/skills/gtm-present/SKILL.md)

### `/h1`

Use when auditing a page's heading structure, generating H1 text for landing pages or blog posts, or reviewing a CMS template that may produce empty or missing H1 elements.

- 호출: `/h1` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/h1)
- 이 레포 사본: [`plugins/front-end-checklist/skills/h1/SKILL.md`](../../plugins/front-end-checklist/skills/h1/SKILL.md)

### `/has-selector`

Use when reviewing stylesheets or components that use JavaScript to toggle classes on parent elements based on child state, form input values, or content presence — :has() may replace the JavaScript entirely.

- 호출: `/has-selector` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/has-selector)
- 이 레포 사본: [`plugins/front-end-checklist/skills/has-selector/SKILL.md`](../../plugins/front-end-checklist/skills/has-selector/SKILL.md)

### `/heading-hierarchy`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use logical heading hierarchy. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/heading-hierarchy` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/heading-hierarchy)
- 이 레포 사본: [`plugins/front-end-checklist/skills/heading-hierarchy/SKILL.md`](../../plugins/front-end-checklist/skills/heading-hierarchy/SKILL.md)

### `/heading-order`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Maintain logical heading order. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/heading-order` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/heading-order)
- 이 레포 사본: [`plugins/front-end-checklist/skills/heading-order/SKILL.md`](../../plugins/front-end-checklist/skills/heading-order/SKILL.md)

### `/horizontal-scroll`

Use when applies to all CSS layout rules. Check `width`, `min-width`, fixed pixel values on containers, `overflow`, `white-space`, and `word-break` properties. Use when auditing responsive design or WCAG 2.1 Level AA compliance. Test at 320px viewport width and at 400% browser zoom.

- 호출: `/horizontal-scroll` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/horizontal-scroll)
- 이 레포 사본: [`plugins/front-end-checklist/skills/horizontal-scroll/SKILL.md`](../../plugins/front-end-checklist/skills/horizontal-scroll/SKILL.md)

### `/hreflang`

Use when auditing metadata, crawlability, structured data, or indexability related to Add hreflang tags for multilingual sites. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/hreflang` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/hreflang)
- 이 레포 사본: [`plugins/front-end-checklist/skills/hreflang/SKILL.md`](../../plugins/front-end-checklist/skills/hreflang/SKILL.md)

### `/hsts`

Use when reviewing HTTP response headers on any site that serves content over HTTPS.

- 호출: `/hsts` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/hsts)
- 이 레포 사본: [`plugins/front-end-checklist/skills/hsts/SKILL.md`](../../plugins/front-end-checklist/skills/hsts/SKILL.md)

### `/html-resource-hints`

Use when reviewing templates, rendered HTML, or shared components related to Add resource hints (preload, prefetch, dns-prefetch). Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/html-resource-hints` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/html-resource-hints)
- 이 레포 사본: [`plugins/front-end-checklist/skills/html-resource-hints/SKILL.md`](../../plugins/front-end-checklist/skills/html-resource-hints/SKILL.md)

### `/html-size`

Use when auditing page weight for crawl efficiency, investigating why certain page content is not appearing in Google's index, or reviewing server-rendered pages that embed large JSON payloads in HTML.

- 호출: `/html-size` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/html-size)
- 이 레포 사본: [`plugins/front-end-checklist/skills/html-size/SKILL.md`](../../plugins/front-end-checklist/skills/html-size/SKILL.md)

### `/html-xml-lang-mismatch`

Use when applies to XHTML documents and polyglot HTML documents that must parse correctly as both HTML5 and XML. For modern HTML5-only documents, only `lang` is needed and `xml:lang` is not required. Check when auditing documents served as application/xhtml+xml or documents that include both attributes.

- 호출: `/html-xml-lang-mismatch` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/html-xml-lang-mismatch)
- 이 레포 사본: [`plugins/front-end-checklist/skills/html-xml-lang-mismatch/SKILL.md`](../../plugins/front-end-checklist/skills/html-xml-lang-mismatch/SKILL.md)

### `/html5-semantic-elements`

Use when reviewing templates, rendered HTML, or shared components related to Use semantic HTML elements. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/html5-semantic-elements` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/html5-semantic-elements)
- 이 레포 사본: [`plugins/front-end-checklist/skills/html5-semantic-elements/SKILL.md`](../../plugins/front-end-checklist/skills/html5-semantic-elements/SKILL.md)

### `/http-requests`

Use when auditing slow page loads, heavy assets, or rendering delays related to Minimize HTTP requests. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/http-requests` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/http-requests)
- 이 레포 사본: [`plugins/front-end-checklist/skills/http-requests/SKILL.md`](../../plugins/front-end-checklist/skills/http-requests/SKILL.md)

### `/http-to-https`

Use when checking whether a web server is configured to redirect all HTTP traffic to HTTPS.

- 호출: `/http-to-https` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/http-to-https)
- 이 레포 사본: [`plugins/front-end-checklist/skills/http-to-https/SKILL.md`](../../plugins/front-end-checklist/skills/http-to-https/SKILL.md)

### `/http2`

Use when auditing slow page loads, heavy assets, or rendering delays related to Enable HTTP/2 or HTTP/3. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/http2` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/http2)
- 이 레포 사본: [`plugins/front-end-checklist/skills/http2/SKILL.md`](../../plugins/front-end-checklist/skills/http2/SKILL.md)

### `/https`

Use when auditing whether a website or web application serves content exclusively over HTTPS with a valid certificate.

- 호출: `/https` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/https)
- 이 레포 사본: [`plugins/front-end-checklist/skills/https/SKILL.md`](../../plugins/front-end-checklist/skills/https/SKILL.md)

### `/https-downgrade`

Use when auditing a site's internal and external links for protocol consistency, migrating a site from HTTP to HTTPS, or reviewing hardcoded URLs in a codebase that may use `http://` instead of `https://`.

- 호출: `/https-downgrade` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/https-downgrade)
- 이 레포 사본: [`plugins/front-end-checklist/skills/https-downgrade/SKILL.md`](../../plugins/front-end-checklist/skills/https-downgrade/SKILL.md)

### `/hyphens`

Use when auditing URL structures for word separator format, generating slugs from titles, or planning a URL migration from underscores or spaces to hyphens with appropriate redirects.

- 호출: `/hyphens` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/hyphens)
- 이 레포 사본: [`plugins/front-end-checklist/skills/hyphens/SKILL.md`](../../plugins/front-end-checklist/skills/hyphens/SKILL.md)

### `/identical-links-same-purpose`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Ensure identical links have consistent destinations. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/identical-links-same-purpose` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/identical-links-same-purpose)
- 이 레포 사본: [`plugins/front-end-checklist/skills/identical-links-same-purpose/SKILL.md`](../../plugins/front-end-checklist/skills/identical-links-same-purpose/SKILL.md)

### `/image-cdn`

Use when reviewing image assets, markup, and CDN or build transforms related to Serve images from a CDN. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/image-cdn` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/image-cdn)
- 이 레포 사본: [`plugins/front-end-checklist/skills/image-cdn/SKILL.md`](../../plugins/front-end-checklist/skills/image-cdn/SKILL.md)

### `/image-compression`

Use when reviewing image assets, markup, and CDN or build transforms related to Compress images without quality loss. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/image-compression` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/image-compression)
- 이 레포 사본: [`plugins/front-end-checklist/skills/image-compression/SKILL.md`](../../plugins/front-end-checklist/skills/image-compression/SKILL.md)

### `/image-file-size`

Use when auditing the image pipeline, static assets in `public/`, CMS-managed media, or image CDN transforms. Separate file-size problems from dimension mismatches so you can tell whether the issue is compression, format choice, or responsive delivery.

- 호출: `/image-file-size` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/image-file-size)
- 이 레포 사본: [`plugins/front-end-checklist/skills/image-file-size/SKILL.md`](../../plugins/front-end-checklist/skills/image-file-size/SKILL.md)

### `/image-optimization`

Use when reviewing image assets, markup, and CDN or build transforms related to Optimize all images for web. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/image-optimization` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/image-optimization)
- 이 레포 사본: [`plugins/front-end-checklist/skills/image-optimization/SKILL.md`](../../plugins/front-end-checklist/skills/image-optimization/SKILL.md)

### `/image-redundant-alt`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Avoid redundant image alternative text. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/image-redundant-alt` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/image-redundant-alt)
- 이 레포 사본: [`plugins/front-end-checklist/skills/image-redundant-alt/SKILL.md`](../../plugins/front-end-checklist/skills/image-redundant-alt/SKILL.md)

### `/immutable-patterns`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Prefer immutable data patterns. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/immutable-patterns` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/immutable-patterns)
- 이 레포 사본: [`plugins/front-end-checklist/skills/immutable-patterns/SKILL.md`](../../plugins/front-end-checklist/skills/immutable-patterns/SKILL.md)

### `/import-on-interaction`

Use when reviewing slow initial loads caused by optional features. Prioritize code that is expensive to download or execute and not required for the first viewport, first input, or core task completion.

- 호출: `/import-on-interaction` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/import-on-interaction)
- 이 레포 사본: [`plugins/front-end-checklist/skills/import-on-interaction/SKILL.md`](../../plugins/front-end-checklist/skills/import-on-interaction/SKILL.md)

### `/import-on-visibility`

Use when reviewing long pages, dashboards, or content feeds with expensive offscreen modules. Balance early enough loading for smooth scrolling against keeping the initial route light.

- 호출: `/import-on-visibility` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/import-on-visibility)
- 이 레포 사본: [`plugins/front-end-checklist/skills/import-on-visibility/SKILL.md`](../../plugins/front-end-checklist/skills/import-on-visibility/SKILL.md)

### `/improve-rule`

Use when reviewing or improving a Front-End Checklist rule MDX file to raise its quality score, fix stub prompts, add missing fields, or enrich content with real code examples.

- 호출: `/improve-rule` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/improve-rule)
- 이 레포 사본: [`plugins/front-end-checklist/skills/improve-rule/SKILL.md`](../../plugins/front-end-checklist/skills/improve-rule/SKILL.md)

### `/inclusive-language`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use inclusive language. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/inclusive-language` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/inclusive-language)
- 이 레포 사본: [`plugins/front-end-checklist/skills/inclusive-language/SKILL.md`](../../plugins/front-end-checklist/skills/inclusive-language/SKILL.md)

### `/indexability`

Use when auditing a site for accidental noindex directives, investigating why important pages are not appearing in Google Search, or reviewing CMS settings that control indexing at the page or category level.

- 호출: `/indexability` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/indexability)
- 이 레포 사본: [`plugins/front-end-checklist/skills/indexability/SKILL.md`](../../plugins/front-end-checklist/skills/indexability/SKILL.md)

### `/indexability-conflicts`

Use when auditing a site for indexability issues, investigating why pages appear in Google's index that should be excluded (or vice versa), or reviewing robots.txt and meta robots configurations for consistency.

- 호출: `/indexability-conflicts` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/indexability-conflicts)
- 이 레포 사본: [`plugins/front-end-checklist/skills/indexability-conflicts/SKILL.md`](../../plugins/front-end-checklist/skills/indexability-conflicts/SKILL.md)

### `/input-image-alt`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Provide alt text for image buttons. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/input-image-alt` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/input-image-alt)
- 이 레포 사본: [`plugins/front-end-checklist/skills/input-image-alt/SKILL.md`](../../plugins/front-end-checklist/skills/input-image-alt/SKILL.md)

### `/input-types`

Use when reviewing templates, rendered HTML, or shared components related to Use semantic input type attributes. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/input-types` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/input-types)
- 이 레포 사본: [`plugins/front-end-checklist/skills/input-types/SKILL.md`](../../plugins/front-end-checklist/skills/input-types/SKILL.md)

### `/integration-testing`

Use when reviewing CI coverage, automated checks, or test strategy related to Write integration tests for key workflows. Focus on whether the rule is continuously verified, not just documented.

- 호출: `/integration-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/integration-testing)
- 이 레포 사본: [`plugins/front-end-checklist/skills/integration-testing/SKILL.md`](../../plugins/front-end-checklist/skills/integration-testing/SKILL.md)

### `/interaction-to-next-paint`

Use when auditing slow page loads, heavy assets, or rendering delays related to Optimize interaction to next paint. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/interaction-to-next-paint` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/interaction-to-next-paint)
- 이 레포 사본: [`plugins/front-end-checklist/skills/interaction-to-next-paint/SKILL.md`](../../plugins/front-end-checklist/skills/interaction-to-next-paint/SKILL.md)

### `/internal-links`

Use when auditing a site's internal link structure, identifying pages that need more incoming links, generating contextual linking opportunities between related content, or reviewing a CMS template's internal linking patterns.

- 호출: `/internal-links` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/internal-links)
- 이 레포 사본: [`plugins/front-end-checklist/skills/internal-links/SKILL.md`](../../plugins/front-end-checklist/skills/internal-links/SKILL.md)

### `/interstitials`

Use when applies to CSS and JavaScript implementations of modals, overlays, pop-ups, cookie banners, newsletter sign-up dialogs, and promotional overlays. Check for `position: fixed`, `position: absolute` with large z-index, backdrop overlays, and JavaScript that shows modals on page load or shortly after. Consider both SEO impact (Google) and accessibility (WCAG focus management).

- 호출: `/interstitials` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/interstitials)
- 이 레포 사본: [`plugins/front-end-checklist/skills/interstitials/SKILL.md`](../../plugins/front-end-checklist/skills/interstitials/SKILL.md)

### `/invalid-links`

Use when auditing a page's link elements for crawlability, reviewing JavaScript-heavy SPAs where navigation may not use `<a href>` tags, or checking that dynamically generated links have valid href values.

- 호출: `/invalid-links` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/invalid-links)
- 이 레포 사본: [`plugins/front-end-checklist/skills/invalid-links/SKILL.md`](../../plugins/front-end-checklist/skills/invalid-links/SKILL.md)

### `/javascript-inline`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Avoid inline JavaScript. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/javascript-inline` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/javascript-inline)
- 이 레포 사본: [`plugins/front-end-checklist/skills/javascript-inline/SKILL.md`](../../plugins/front-end-checklist/skills/javascript-inline/SKILL.md)

### `/javascript-linter`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Lint JavaScript code. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/javascript-linter` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/javascript-linter)
- 이 레포 사본: [`plugins/front-end-checklist/skills/javascript-linter/SKILL.md`](../../plugins/front-end-checklist/skills/javascript-linter/SKILL.md)

### `/javascript-minification`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Minify all JavaScript files. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/javascript-minification` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/javascript-minification)
- 이 레포 사본: [`plugins/front-end-checklist/skills/javascript-minification/SKILL.md`](../../plugins/front-end-checklist/skills/javascript-minification/SKILL.md)

### `/js-file-size`

Use when auditing slow page loads, heavy assets, or rendering delays related to Optimize JavaScript bundle size. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/js-file-size` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/js-file-size)
- 이 레포 사본: [`plugins/front-end-checklist/skills/js-file-size/SKILL.md`](../../plugins/front-end-checklist/skills/js-file-size/SKILL.md)

### `/js-libraries`

Use when auditing slow page loads, heavy assets, or rendering delays related to Use secure and up-to-date JS libraries. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/js-libraries` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/js-libraries)
- 이 레포 사본: [`plugins/front-end-checklist/skills/js-libraries/SKILL.md`](../../plugins/front-end-checklist/skills/js-libraries/SKILL.md)

### `/js-redirects`

Use when auditing slow page loads, heavy assets, or rendering delays related to Avoid JavaScript-based redirects. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/js-redirects` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/js-redirects)
- 이 레포 사본: [`plugins/front-end-checklist/skills/js-redirects/SKILL.md`](../../plugins/front-end-checklist/skills/js-redirects/SKILL.md)

### `/json-ld-valid`

Use when generating or auditing any `<script type='application/ld+json'>` blocks, implementing structured data for articles, products, FAQs, breadcrumbs, or local businesses, or investigating why rich results are not appearing in Google Search Console.

- 호출: `/json-ld-valid` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/json-ld-valid)
- 이 레포 사본: [`plugins/front-end-checklist/skills/json-ld-valid/SKILL.md`](../../plugins/front-end-checklist/skills/json-ld-valid/SKILL.md)

### `/json-safety`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Parse JSON safely with error handling. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/json-safety` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/json-safety)
- 이 레포 사본: [`plugins/front-end-checklist/skills/json-safety/SKILL.md`](../../plugins/front-end-checklist/skills/json-safety/SKILL.md)

### `/keyboard-navigation`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Enable keyboard navigation for all elements. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/keyboard-navigation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/keyboard-navigation)
- 이 레포 사본: [`plugins/front-end-checklist/skills/keyboard-navigation/SKILL.md`](../../plugins/front-end-checklist/skills/keyboard-navigation/SKILL.md)

### `/keyword-stuffing`

Use when auditing content pages for over-optimisation, reviewing AI-generated content that may repeat target phrases excessively, or checking meta tags and alt text for unnatural keyword accumulation.

- 호출: `/keyword-stuffing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/keyword-stuffing)
- 이 레포 사본: [`plugins/front-end-checklist/skills/keyword-stuffing/SKILL.md`](../../plugins/front-end-checklist/skills/keyword-stuffing/SKILL.md)

### `/label-content-name-mismatch`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Align visible labels with accessible names. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/label-content-name-mismatch` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/label-content-name-mismatch)
- 이 레포 사본: [`plugins/front-end-checklist/skills/label-content-name-mismatch/SKILL.md`](../../plugins/front-end-checklist/skills/label-content-name-mismatch/SKILL.md)

### `/landmark-one-main`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use exactly one main landmark. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/landmark-one-main` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/landmark-one-main)
- 이 레포 사본: [`plugins/front-end-checklist/skills/landmark-one-main/SKILL.md`](../../plugins/front-end-checklist/skills/landmark-one-main/SKILL.md)

### `/landmark-regions`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use landmark regions correctly. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/landmark-regions` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/landmark-regions)
- 이 레포 사본: [`plugins/front-end-checklist/skills/landmark-regions/SKILL.md`](../../plugins/front-end-checklist/skills/landmark-regions/SKILL.md)

### `/lang-attribute`

Use when applies to all HTML documents. Check the `<html>` opening tag for a `lang` attribute with a non-empty, valid BCP 47 language code. Also check for `lang` attribute changes on individual elements when the document contains content in multiple languages (inline quotes, foreign terms, multilingual sections). The `lang` attribute is inherited — child elements inherit the language from their nearest ancestor with `lang`.

- 호출: `/lang-attribute` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/lang-attribute)
- 이 레포 사본: [`plugins/front-end-checklist/skills/lang-attribute/SKILL.md`](../../plugins/front-end-checklist/skills/lang-attribute/SKILL.md)

### `/largest-contentful-paint`

Use when auditing slow page loads, heavy assets, or rendering delays related to Optimize largest contentful paint. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/largest-contentful-paint` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/largest-contentful-paint)
- 이 레포 사본: [`plugins/front-end-checklist/skills/largest-contentful-paint/SKILL.md`](../../plugins/front-end-checklist/skills/largest-contentful-paint/SKILL.md)

### `/lazy-above-fold`

Use when auditing slow page loads, heavy assets, or rendering delays related to Disable lazy loading for above-the-fold content. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/lazy-above-fold` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/lazy-above-fold)
- 이 레포 사본: [`plugins/front-end-checklist/skills/lazy-above-fold/SKILL.md`](../../plugins/front-end-checklist/skills/lazy-above-fold/SKILL.md)

### `/lazy-loading`

Use when auditing slow page loads, heavy assets, or rendering delays related to Implement lazy loading for offscreen content. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes. Absence of `loading='lazy'` is not enough by itself when fold position is unknown.

- 호출: `/lazy-loading` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/lazy-loading)
- 이 레포 사본: [`plugins/front-end-checklist/skills/lazy-loading/SKILL.md`](../../plugins/front-end-checklist/skills/lazy-loading/SKILL.md)

### `/leaked-secrets`

Use when reviewing client-side JavaScript, HTML source, or git history for exposed credentials, API keys, or tokens.

- 호출: `/leaked-secrets` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/leaked-secrets)
- 이 레포 사본: [`plugins/front-end-checklist/skills/leaked-secrets/SKILL.md`](../../plugins/front-end-checklist/skills/leaked-secrets/SKILL.md)

### `/legacy-js`

Use when auditing slow page loads, heavy assets, or rendering delays related to Avoid serving legacy JavaScript to modern browsers. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/legacy-js` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/legacy-js)
- 이 레포 사본: [`plugins/front-end-checklist/skills/legacy-js/SKILL.md`](../../plugins/front-end-checklist/skills/legacy-js/SKILL.md)

### `/length`

Use when generating URL slugs from article titles, auditing URL structures for unnecessary depth or length, or reviewing URL patterns in a CMS or router configuration.

- 호출: `/length` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/length)
- 이 레포 사본: [`plugins/front-end-checklist/skills/length/SKILL.md`](../../plugins/front-end-checklist/skills/length/SKILL.md)

### `/link-checker`

Use when reviewing templates, rendered HTML, or shared components related to Check for broken links. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/link-checker` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/link-checker)
- 이 레포 사본: [`plugins/front-end-checklist/skills/link-checker/SKILL.md`](../../plugins/front-end-checklist/skills/link-checker/SKILL.md)

### `/link-in-text-block`

Use when applies to hyperlinks (`<a>` elements) that appear inline within paragraphs or text blocks. Does not apply to navigation menus, button-style links, or standalone links that are visually isolated from body text. Use when reviewing CSS that removes text-decoration from inline body copy links.

- 호출: `/link-in-text-block` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/link-in-text-block)
- 이 레포 사본: [`plugins/front-end-checklist/skills/link-in-text-block/SKILL.md`](../../plugins/front-end-checklist/skills/link-in-text-block/SKILL.md)

### `/link-text`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use descriptive link text. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/link-text` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/link-text)
- 이 레포 사본: [`plugins/front-end-checklist/skills/link-text/SKILL.md`](../../plugins/front-end-checklist/skills/link-text/SKILL.md)

### `/list-structure`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use correct list structure. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/list-structure` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/list-structure)
- 이 레포 사본: [`plugins/front-end-checklist/skills/list-structure/SKILL.md`](../../plugins/front-end-checklist/skills/list-structure/SKILL.md)

### `/list-virtualization`

Use when reviewing dashboards, admin tables, search results, or feeds with many repeated items. Confirm the bottleneck is DOM or rendering cost before introducing virtualization because small lists usually do not need the added complexity.

- 호출: `/list-virtualization` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/list-virtualization)
- 이 레포 사본: [`plugins/front-end-checklist/skills/list-virtualization/SKILL.md`](../../plugins/front-end-checklist/skills/list-virtualization/SKILL.md)

### `/listitem`

Use when applies to HTML documents with `<li>` elements. Also applies to custom ARIA lists where `role='listitem'` must be owned by `role='list'`. Common violations occur in templating systems where list markup is split across components or in CSS resets where developers use `<li>` for layout without proper list parents.

- 호출: `/listitem` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/listitem)
- 이 레포 사본: [`plugins/front-end-checklist/skills/listitem/SKILL.md`](../../plugins/front-end-checklist/skills/listitem/SKILL.md)

### `/llm-parsability`

Use when auditing content pages for AI discoverability. Applies to any informational page intended to appear in AI-generated answers, search snippets, or knowledge base extraction.

- 호출: `/llm-parsability` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/llm-parsability)
- 이 레포 사본: [`plugins/front-end-checklist/skills/llm-parsability/SKILL.md`](../../plugins/front-end-checklist/skills/llm-parsability/SKILL.md)

### `/llms-txt`

Use when auditing public documentation portals, API references, help centers, SDK docs, or large knowledge bases. Check the final file served at `/llms.txt` and verify that the linked pages are stable, high-value, and accessible without relying on a JavaScript-only interface.

- 호출: `/llms-txt` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/llms-txt)
- 이 레포 사본: [`plugins/front-end-checklist/skills/llms-txt/SKILL.md`](../../plugins/front-end-checklist/skills/llms-txt/SKILL.md)

### `/loading-indicators`

Use when auditing slow page loads, heavy assets, or rendering delays related to Show loading indicators. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/loading-indicators` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/loading-indicators)
- 이 레포 사본: [`plugins/front-end-checklist/skills/loading-indicators/SKILL.md`](../../plugins/front-end-checklist/skills/loading-indicators/SKILL.md)

### `/local-business`

Use when auditing a local business website's structured data. Applies to any business that serves customers at a physical location or specific geographic area.

- 호출: `/local-business` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/local-business)
- 이 레포 사본: [`plugins/front-end-checklist/skills/local-business/SKILL.md`](../../plugins/front-end-checklist/skills/local-business/SKILL.md)

### `/locale-images`

Use when reviewing image assets, icon libraries, or components that render illustrations to identify culture-specific content that may need locale overrides or replacement with neutral alternatives.

- 호출: `/locale-images` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/locale-images)
- 이 레포 사본: [`plugins/front-end-checklist/skills/locale-images/SKILL.md`](../../plugins/front-end-checklist/skills/locale-images/SKILL.md)

### `/logical-properties`

Use when reviewing stylesheets, component styles, and responsive behavior related to Use CSS logical properties for i18n and RTL support. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/logical-properties` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/logical-properties)
- 이 레포 사본: [`plugins/front-end-checklist/skills/logical-properties/SKILL.md`](../../plugins/front-end-checklist/skills/logical-properties/SKILL.md)

### `/lowercase`

Use when auditing URL structure or configuring a new site's routing. Applies to any server or framework that allows case-insensitive file systems (Linux servers are case-sensitive by default).

- 호출: `/lowercase` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/lowercase)
- 이 레포 사본: [`plugins/front-end-checklist/skills/lowercase/SKILL.md`](../../plugins/front-end-checklist/skills/lowercase/SKILL.md)

### `/memory-leaks`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Prevent common memory leak patterns. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/memory-leaks` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/memory-leaks)
- 이 레포 사본: [`plugins/front-end-checklist/skills/memory-leaks/SKILL.md`](../../plugins/front-end-checklist/skills/memory-leaks/SKILL.md)

### `/meta-description`

Use when auditing page metadata or generating descriptions for new pages. Applies to every page that should receive organic search traffic.

- 호출: `/meta-description` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/meta-description)
- 이 레포 사본: [`plugins/front-end-checklist/skills/meta-description/SKILL.md`](../../plugins/front-end-checklist/skills/meta-description/SKILL.md)

### `/meta-in-body`

Use when auditing HTML document structure. Applies to any page where meta tags (noindex, canonical-url, description, viewport, OG tags) may have been injected into the body by CMS plugins, widgets, or JavaScript rendering.

- 호출: `/meta-in-body` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/meta-in-body)
- 이 레포 사본: [`plugins/front-end-checklist/skills/meta-in-body/SKILL.md`](../../plugins/front-end-checklist/skills/meta-in-body/SKILL.md)

### `/meta-refresh`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Avoid meta refresh redirects. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/meta-refresh` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/meta-refresh)
- 이 레포 사본: [`plugins/front-end-checklist/skills/meta-refresh/SKILL.md`](../../plugins/front-end-checklist/skills/meta-refresh/SKILL.md)

### `/meta-title`

Use when auditing page metadata or generating SEO-optimized titles. Applies to every HTML page that should appear in search results.

- 호출: `/meta-title` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/meta-title)
- 이 레포 사본: [`plugins/front-end-checklist/skills/meta-title/SKILL.md`](../../plugins/front-end-checklist/skills/meta-title/SKILL.md)

### `/mime-type`

Use when auditing server configuration or diagnosing broken resources. Applies to any web server serving HTML, CSS, JS, images, fonts, or other static assets.

- 호출: `/mime-type` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/mime-type)
- 이 레포 사본: [`plugins/front-end-checklist/skills/mime-type/SKILL.md`](../../plugins/front-end-checklist/skills/mime-type/SKILL.md)

### `/mixed-content`

Use when reviewing an HTTPS page for resources (scripts, images, stylesheets, iframes) that are loaded over plain HTTP.

- 호출: `/mixed-content` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/mixed-content)
- 이 레포 사본: [`plugins/front-end-checklist/skills/mixed-content/SKILL.md`](../../plugins/front-end-checklist/skills/mixed-content/SKILL.md)

### `/mobile-testing`

Use when reviewing CI coverage, automated checks, or test strategy related to Test on real mobile devices and viewports. Focus on whether the rule is continuously verified, not just documented.

- 호출: `/mobile-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/mobile-testing)
- 이 레포 사본: [`plugins/front-end-checklist/skills/mobile-testing/SKILL.md`](../../plugins/front-end-checklist/skills/mobile-testing/SKILL.md)

### `/mock-best-practices`

Use when reviewing CI coverage, automated checks, or test strategy related to Follow mocking best practices. Focus on whether the rule is continuously verified, not just documented.

- 호출: `/mock-best-practices` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/mock-best-practices)
- 이 레포 사본: [`plugins/front-end-checklist/skills/mock-best-practices/SKILL.md`](../../plugins/front-end-checklist/skills/mock-best-practices/SKILL.md)

### `/modal-accessibility`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Make modal dialogs keyboard accessible. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/modal-accessibility` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/modal-accessibility)
- 이 레포 사본: [`plugins/front-end-checklist/skills/modal-accessibility/SKILL.md`](../../plugins/front-end-checklist/skills/modal-accessibility/SKILL.md)

### `/modern-array-methods`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Use modern array and object methods. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/modern-array-methods` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/modern-array-methods)
- 이 레포 사본: [`plugins/front-end-checklist/skills/modern-array-methods/SKILL.md`](../../plugins/front-end-checklist/skills/modern-array-methods/SKILL.md)

### `/modern-format`

Use when reviewing image assets, markup, and CDN or build transforms related to Use modern image formats (WebP, AVIF). Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/modern-format` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/modern-format)
- 이 레포 사본: [`plugins/front-end-checklist/skills/modern-format/SKILL.md`](../../plugins/front-end-checklist/skills/modern-format/SKILL.md)

### `/mutation-testing`

Use when evaluating test quality on modules containing business logic, calculation utilities, or state machines to determine whether the tests provide genuine defect detection.

- 호출: `/mutation-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/mutation-testing)
- 이 레포 사본: [`plugins/front-end-checklist/skills/mutation-testing/SKILL.md`](../../plugins/front-end-checklist/skills/mutation-testing/SKILL.md)

### `/naming-conventions`

Use when reviewing stylesheets, component styles, and responsive behavior related to Use consistent CSS naming conventions. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/naming-conventions` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/naming-conventions)
- 이 레포 사본: [`plugins/front-end-checklist/skills/naming-conventions/SKILL.md`](../../plugins/front-end-checklist/skills/naming-conventions/SKILL.md)

### `/nap-consistency`

Use when auditing a local business website for local SEO. Applies to any business that has a physical address and wants to appear in local search results or Google Maps.

- 호출: `/nap-consistency` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/nap-consistency)
- 이 레포 사본: [`plugins/front-end-checklist/skills/nap-consistency/SKILL.md`](../../plugins/front-end-checklist/skills/nap-consistency/SKILL.md)

### `/navigation-landmark`

Use when reviewing templates, rendered HTML, or shared components related to Use navigation landmark regions. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/navigation-landmark` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/navigation-landmark)
- 이 레포 사본: [`plugins/front-end-checklist/skills/navigation-landmark/SKILL.md`](../../plugins/front-end-checklist/skills/navigation-landmark/SKILL.md)

### `/new-tab`

Use when reviewing HTML or JSX for anchor elements with target='_blank' to verify rel='noopener noreferrer' is present.

- 호출: `/new-tab` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/new-tab)
- 이 레포 사본: [`plugins/front-end-checklist/skills/new-tab/SKILL.md`](../../plugins/front-end-checklist/skills/new-tab/SKILL.md)

### `/no-explicit-any`

Use when reviewing TypeScript files for type safety regressions, during code review of functions that handle external data, or when the codebase has ESLint warnings for @typescript-eslint/no-explicit-any.

- 호출: `/no-explicit-any` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/no-explicit-any)
- 이 레포 사본: [`plugins/front-end-checklist/skills/no-explicit-any/SKILL.md`](../../plugins/front-end-checklist/skills/no-explicit-any/SKILL.md)

### `/no-unchecked-indexed-access`

Use when auditing tsconfig.json for missing safety flags, reviewing code that uses array index access in data processing pipelines, or investigating runtime undefined errors that TypeScript did not catch.

- 호출: `/no-unchecked-indexed-access` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/no-unchecked-indexed-access)
- 이 레포 사본: [`plugins/front-end-checklist/skills/no-unchecked-indexed-access/SKILL.md`](../../plugins/front-end-checklist/skills/no-unchecked-indexed-access/SKILL.md)

### `/nofollow-internal`

Use when auditing internal link structure or reviewing link attributes. Applies to any site using rel=nofollow on links pointing to pages within the same domain.

- 호출: `/nofollow-internal` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/nofollow-internal)
- 이 레포 사본: [`plugins/front-end-checklist/skills/nofollow-internal/SKILL.md`](../../plugins/front-end-checklist/skills/nofollow-internal/SKILL.md)

### `/noindex-in-sitemap`

Use when auditing an XML sitemap or diagnosing indexing issues. Applies to any site where noindex meta tags or X-Robots-Tag headers may be applied to URLs also listed in the sitemap.

- 호출: `/noindex-in-sitemap` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/noindex-in-sitemap)
- 이 레포 사본: [`plugins/front-end-checklist/skills/noindex-in-sitemap/SKILL.md`](../../plugins/front-end-checklist/skills/noindex-in-sitemap/SKILL.md)

### `/noscript-tag`

Use when reviewing templates, rendered HTML, or shared components related to Provide noscript fallback content. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/noscript-tag` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/noscript-tag)
- 이 레포 사본: [`plugins/front-end-checklist/skills/noscript-tag/SKILL.md`](../../plugins/front-end-checklist/skills/noscript-tag/SKILL.md)

### `/nosnippet`

Use when auditing robots meta tags. Applies to any important landing page, article, or product page that should appear with a description in search results.

- 호출: `/nosnippet` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/nosnippet)
- 이 레포 사본: [`plugins/front-end-checklist/skills/nosnippet/SKILL.md`](../../plugins/front-end-checklist/skills/nosnippet/SKILL.md)

### `/object-alt`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Provide alternative text for objects. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/object-alt` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/object-alt)
- 이 레포 사본: [`plugins/front-end-checklist/skills/object-alt/SKILL.md`](../../plugins/front-end-checklist/skills/object-alt/SKILL.md)

### `/offline-fallback`

Use when adding PWA capabilities, implementing a service worker, or improving the experience for users on unreliable network connections.

- 호출: `/offline-fallback` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/offline-fallback)
- 이 레포 사본: [`plugins/front-end-checklist/skills/offline-fallback/SKILL.md`](../../plugins/front-end-checklist/skills/offline-fallback/SKILL.md)

### `/offscreen-lazy`

Use when reviewing image assets, markup, and CDN or build transforms related to Lazy load offscreen images. Check encoded size, rendered size, loading strategy, and above-the-fold impact together. Missing `loading='lazy'` is only a valid finding when you can reasonably tell the image is offscreen or non-critical.

- 호출: `/offscreen-lazy` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/offscreen-lazy)
- 이 레포 사본: [`plugins/front-end-checklist/skills/offscreen-lazy/SKILL.md`](../../plugins/front-end-checklist/skills/offscreen-lazy/SKILL.md)

### `/og-image-size`

Use when auditing Open Graph tags or generating og:image assets. Applies to any page that may be shared on social networks or messaging platforms.

- 호출: `/og-image-size` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/og-image-size)
- 이 레포 사본: [`plugins/front-end-checklist/skills/og-image-size/SKILL.md`](../../plugins/front-end-checklist/skills/og-image-size/SKILL.md)

### `/og-tags`

Use when auditing a web page's social sharing metadata. Applies to any page users might share on social networks or messaging apps.

- 호출: `/og-tags` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/og-tags)
- 이 레포 사본: [`plugins/front-end-checklist/skills/og-tags/SKILL.md`](../../plugins/front-end-checklist/skills/og-tags/SKILL.md)

### `/og-url-match`

Use when auditing Open Graph tags or investigating why social share counts appear low. Applies to any page with both canonical-url and og:url tags.

- 호출: `/og-url-match` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/og-url-match)
- 이 레포 사본: [`plugins/front-end-checklist/skills/og-url-match/SKILL.md`](../../plugins/front-end-checklist/skills/og-url-match/SKILL.md)

### `/optimized`

Use when reviewing image assets, markup, and CDN or build transforms related to Optimise images for faster loading. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/optimized` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/optimized)
- 이 레포 사본: [`plugins/front-end-checklist/skills/optimized/SKILL.md`](../../plugins/front-end-checklist/skills/optimized/SKILL.md)

### `/organization`

Use when auditing structured data on a business or brand website homepage. Applies to organisations, companies, non-profits, and publishers that want accurate Knowledge Panel information in Google Search.

- 호출: `/organization` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/organization)
- 이 레포 사본: [`plugins/front-end-checklist/skills/organization/SKILL.md`](../../plugins/front-end-checklist/skills/organization/SKILL.md)

### `/orientation`

Use when reviewing mobile-first layouts, tablet experiences, fullscreen flows, forms, dashboards, or media interfaces. Check rendered behavior in both portrait and landscape and separate genuine layout constraints from unnecessary orientation assumptions.

- 호출: `/orientation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/orientation)
- 이 레포 사본: [`plugins/front-end-checklist/skills/orientation/SKILL.md`](../../plugins/front-end-checklist/skills/orientation/SKILL.md)

### `/orphan-pages`

Use when auditing site architecture or investigating why specific pages have low organic traffic despite good content. Applies to any site with more than ~20 pages.

- 호출: `/orphan-pages` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/orphan-pages)
- 이 레포 사본: [`plugins/front-end-checklist/skills/orphan-pages/SKILL.md`](../../plugins/front-end-checklist/skills/orphan-pages/SKILL.md)

### `/page-load-time`

Use when auditing slow page loads, heavy assets, or rendering delays related to Keep page load time under 3 seconds. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/page-load-time` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/page-load-time)
- 이 레포 사본: [`plugins/front-end-checklist/skills/page-load-time/SKILL.md`](../../plugins/front-end-checklist/skills/page-load-time/SKILL.md)

### `/page-weight`

Use when auditing slow page loads, heavy assets, or rendering delays related to Keep page weight under 1500KB. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/page-weight` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/page-weight)
- 이 레포 사본: [`plugins/front-end-checklist/skills/page-weight/SKILL.md`](../../plugins/front-end-checklist/skills/page-weight/SKILL.md)

### `/pagination`

Use when auditing paginated content (blog archives, product category pages, search results). Applies to any site with lists or grids of content split across multiple pages.

- 호출: `/pagination` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/pagination)
- 이 레포 사본: [`plugins/front-end-checklist/skills/pagination/SKILL.md`](../../plugins/front-end-checklist/skills/pagination/SKILL.md)

### `/pagination-accessibility`

Use when reviewing templates, rendered HTML, or shared components related to Make pagination accessible. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/pagination-accessibility` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/pagination-accessibility)
- 이 레포 사본: [`plugins/front-end-checklist/skills/pagination-accessibility/SKILL.md`](../../plugins/front-end-checklist/skills/pagination-accessibility/SKILL.md)

### `/parallax-effects`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Provide alternatives to parallax effects. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/parallax-effects` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/parallax-effects)
- 이 레포 사본: [`plugins/front-end-checklist/skills/parallax-effects/SKILL.md`](../../plugins/front-end-checklist/skills/parallax-effects/SKILL.md)

### `/parameters`

Use when auditing URL structure or configuring search engine handling of filtered, sorted, or tracked URLs. Applies to e-commerce sites, filtered content directories, and any site appending tracking or session parameters.

- 호출: `/parameters` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/parameters)
- 이 레포 사본: [`plugins/front-end-checklist/skills/parameters/SKILL.md`](../../plugins/front-end-checklist/skills/parameters/SKILL.md)

### `/password-field-security`

Use when reviewing headers, forms, cookies, or third-party integrations related to Secure password input fields. Validate the effective browser and HTTP behavior in a production-like environment.

- 호출: `/password-field-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/password-field-security)
- 이 레포 사본: [`plugins/front-end-checklist/skills/password-field-security/SKILL.md`](../../plugins/front-end-checklist/skills/password-field-security/SKILL.md)

### `/paste-inputs`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Allow pasting into form inputs. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/paste-inputs` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/paste-inputs)
- 이 레포 사본: [`plugins/front-end-checklist/skills/paste-inputs/SKILL.md`](../../plugins/front-end-checklist/skills/paste-inputs/SKILL.md)

### `/pdf-size`

Use when auditing a site that publishes downloadable PDFs (reports, white papers, legal documents, manuals). Applies to any site where PDFs are linked as indexable content resources.

- 호출: `/pdf-size` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/pdf-size)
- 이 레포 사본: [`plugins/front-end-checklist/skills/pdf-size/SKILL.md`](../../plugins/front-end-checklist/skills/pdf-size/SKILL.md)

### `/performance-budget`

Use when reviewing CI configuration, bundle analysis workflows, or pull requests that add dependencies and assets. Distinguish bundle-size budgets from runtime budgets such as Lighthouse or Core Web Vitals so teams can enforce both.

- 호출: `/performance-budget` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/performance-budget)
- 이 레포 사본: [`plugins/front-end-checklist/skills/performance-budget/SKILL.md`](../../plugins/front-end-checklist/skills/performance-budget/SKILL.md)

### `/performance-resource-hints`

Use when auditing slow page loads, heavy assets, or rendering delays related to Use resource hints for faster loading. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/performance-resource-hints` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/performance-resource-hints)
- 이 레포 사본: [`plugins/front-end-checklist/skills/performance-resource-hints/SKILL.md`](../../plugins/front-end-checklist/skills/performance-resource-hints/SKILL.md)

### `/permissions-policy`

Use when reviewing HTTP response headers for defense-in-depth security hardening on any web application.

- 호출: `/permissions-policy` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/permissions-policy)
- 이 레포 사본: [`plugins/front-end-checklist/skills/permissions-policy/SKILL.md`](../../plugins/front-end-checklist/skills/permissions-policy/SKILL.md)

### `/physical-address`

Use when auditing local business websites, e-commerce sites, or any site where a physical presence affects trust or local search visibility.

- 호출: `/physical-address` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/physical-address)
- 이 레포 사본: [`plugins/front-end-checklist/skills/physical-address/SKILL.md`](../../plugins/front-end-checklist/skills/physical-address/SKILL.md)

### `/picture-element`

Use when reviewing image assets, markup, and CDN or build transforms related to Use <picture> with an <img> fallback. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/picture-element` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/picture-element)
- 이 레포 사본: [`plugins/front-end-checklist/skills/picture-element/SKILL.md`](../../plugins/front-end-checklist/skills/picture-element/SKILL.md)

### `/plain-language`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Write in plain language. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/plain-language` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/plain-language)
- 이 레포 사본: [`plugins/front-end-checklist/skills/plain-language/SKILL.md`](../../plugins/front-end-checklist/skills/plain-language/SKILL.md)

### `/pluralization`

Use when reviewing string concatenation involving counts, translation key lookups, or i18n library configurations to check whether plural forms are handled correctly for all target locales.

- 호출: `/pluralization` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/pluralization)
- 이 레포 사본: [`plugins/front-end-checklist/skills/pluralization/SKILL.md`](../../plugins/front-end-checklist/skills/pluralization/SKILL.md)

### `/preconnect`

Use when auditing slow page loads, heavy assets, or rendering delays related to Use preconnect for critical third-party origins. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/preconnect` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/preconnect)
- 이 레포 사본: [`plugins/front-end-checklist/skills/preconnect/SKILL.md`](../../plugins/front-end-checklist/skills/preconnect/SKILL.md)

### `/privacy-policy`

Use when reviewing whether a website has a visible, accessible privacy policy link, particularly in the footer navigation.

- 호출: `/privacy-policy` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/privacy-policy)
- 이 레포 사본: [`plugins/front-end-checklist/skills/privacy-policy/SKILL.md`](../../plugins/front-end-checklist/skills/privacy-policy/SKILL.md)

### `/product`

Use when auditing e-commerce product pages or implementing structured data for a shop. Applies to any page selling or describing a specific product.

- 호출: `/product` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/product)
- 이 레포 사본: [`plugins/front-end-checklist/skills/product/SKILL.md`](../../plugins/front-end-checklist/skills/product/SKILL.md)

### `/progressive-jpeg`

Use when reviewing image assets, markup, and CDN or build transforms related to Use progressive JPEG encoding. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/progressive-jpeg` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/progressive-jpeg)
- 이 레포 사본: [`plugins/front-end-checklist/skills/progressive-jpeg/SKILL.md`](../../plugins/front-end-checklist/skills/progressive-jpeg/SKILL.md)

### `/pwa-installability`

Use when auditing PWA readiness, adding an install prompt, or preparing a web app for submission to Microsoft Store or Google Play via PWA Builder.

- 호출: `/pwa-installability` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/pwa-installability)
- 이 레포 사본: [`plugins/front-end-checklist/skills/pwa-installability/SKILL.md`](../../plugins/front-end-checklist/skills/pwa-installability/SKILL.md)

### `/quality`

Use when evaluating content pages for SEO quality. Applies to blog posts, product descriptions, landing pages, or any page expected to receive organic search traffic.

- 호출: `/quality` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/quality)
- 이 레포 사본: [`plugins/front-end-checklist/skills/quality/SKILL.md`](../../plugins/front-end-checklist/skills/quality/SKILL.md)

### `/reading-level`

Use when reviewing content pages for user experience and SEO. Applies to blog posts, landing pages, how-to guides, and any long-form content intended for a broad audience.

- 호출: `/reading-level` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/reading-level)
- 이 레포 사본: [`plugins/front-end-checklist/skills/reading-level/SKILL.md`](../../plugins/front-end-checklist/skills/reading-level/SKILL.md)

### `/redirect-chain`

Use when auditing site redirects after URL migrations, domain changes, or CMS upgrades. Applies to any site that has had multiple rounds of structural changes over time.

- 호출: `/redirect-chain` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/redirect-chain)
- 이 레포 사본: [`plugins/front-end-checklist/skills/redirect-chain/SKILL.md`](../../plugins/front-end-checklist/skills/redirect-chain/SKILL.md)

### `/redirect-chains`

Use when auditing internal link structure after a URL migration, domain change, or site rebuild. Applies to any site that has had redirects in place for more than a month.

- 호출: `/redirect-chains` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/redirect-chains)
- 이 레포 사본: [`plugins/front-end-checklist/skills/redirect-chains/SKILL.md`](../../plugins/front-end-checklist/skills/redirect-chains/SKILL.md)

### `/reduced-motion`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Respect reduced motion preferences. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/reduced-motion` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/reduced-motion)
- 이 레포 사본: [`plugins/front-end-checklist/skills/reduced-motion/SKILL.md`](../../plugins/front-end-checklist/skills/reduced-motion/SKILL.md)

### `/redundant-entry`

Use when reviewing any process that spans multiple screens, steps, or modal stages. Follow the real user journey and compare fields across steps instead of reviewing screens in isolation.

- 호출: `/redundant-entry` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/redundant-entry)
- 이 레포 사본: [`plugins/front-end-checklist/skills/redundant-entry/SKILL.md`](../../plugins/front-end-checklist/skills/redundant-entry/SKILL.md)

### `/referrer-policy`

Use when reviewing HTTP response headers for privacy hardening on any website that handles authentication, session state, or sensitive URL parameters.

- 호출: `/referrer-policy` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/referrer-policy)
- 이 레포 사본: [`plugins/front-end-checklist/skills/referrer-policy/SKILL.md`](../../plugins/front-end-checklist/skills/referrer-policy/SKILL.md)

### `/render-blocking`

Use when auditing slow page loads, heavy assets, or rendering delays related to Eliminate render-blocking resources. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/render-blocking` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/render-blocking)
- 이 레포 사본: [`plugins/front-end-checklist/skills/render-blocking/SKILL.md`](../../plugins/front-end-checklist/skills/render-blocking/SKILL.md)

### `/reset-css`

Use when reviewing stylesheets, component styles, and responsive behavior related to Use a CSS reset or normalize stylesheet. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/reset-css` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/reset-css)
- 이 레포 사본: [`plugins/front-end-checklist/skills/reset-css/SKILL.md`](../../plugins/front-end-checklist/skills/reset-css/SKILL.md)

### `/resource-hints`

Use when auditing slow page loads, heavy assets, or rendering delays related to Use resource hints for faster loading. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/resource-hints` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/resource-hints)
- 이 레포 사본: [`plugins/front-end-checklist/skills/resource-hints/SKILL.md`](../../plugins/front-end-checklist/skills/resource-hints/SKILL.md)

### `/responsive-images`

Use when reviewing article images, cards, galleries, or any component rendered at multiple sizes across breakpoints. Check both the markup and the CSS layout because an incorrect `sizes` attribute can negate a perfectly good `srcset`.

- 호출: `/responsive-images` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/responsive-images)
- 이 레포 사본: [`plugins/front-end-checklist/skills/responsive-images/SKILL.md`](../../plugins/front-end-checklist/skills/responsive-images/SKILL.md)

### `/responsive-size`

Use when reviewing image assets, markup, and CDN or build transforms related to Serve images at the correct display size. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/responsive-size` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/responsive-size)
- 이 레포 사본: [`plugins/front-end-checklist/skills/responsive-size/SKILL.md`](../../plugins/front-end-checklist/skills/responsive-size/SKILL.md)

### `/responsive-units`

Use when reviewing stylesheets, component styles, and responsive behavior related to Use relative units for responsive layouts. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/responsive-units` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/responsive-units)
- 이 레포 사본: [`plugins/front-end-checklist/skills/responsive-units/SKILL.md`](../../plugins/front-end-checklist/skills/responsive-units/SKILL.md)

### `/retina-display`

Use when reviewing image assets, markup, and CDN or build transforms related to Support high-DPI retina displays. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/retina-display` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/retina-display)
- 이 레포 사본: [`plugins/front-end-checklist/skills/retina-display/SKILL.md`](../../plugins/front-end-checklist/skills/retina-display/SKILL.md)

### `/review`

Use when applies to product pages, local business pages, recipes, apps, books, and any page that aggregates user reviews. Use when auditing rich result eligibility for e-commerce or review sites.

- 호출: `/review` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/review)
- 이 레포 사본: [`plugins/front-end-checklist/skills/review/SKILL.md`](../../plugins/front-end-checklist/skills/review/SKILL.md)

### `/right-to-erasure`

Use when auditing account settings pages, privacy dashboards, or API routes to verify that a complete data deletion path exists for users.

- 호출: `/right-to-erasure` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/right-to-erasure)
- 이 레포 사본: [`plugins/front-end-checklist/skills/right-to-erasure/SKILL.md`](../../plugins/front-end-checklist/skills/right-to-erasure/SKILL.md)

### `/robots-meta`

Use when applies to all HTML pages. Use when auditing pages that have disappeared from search results or when checking staging vs. production meta tag parity.

- 호출: `/robots-meta` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/robots-meta)
- 이 레포 사본: [`plugins/front-end-checklist/skills/robots-meta/SKILL.md`](../../plugins/front-end-checklist/skills/robots-meta/SKILL.md)

### `/robots-meta-conflict`

Use when applies to sites that use both robots.txt disallow rules and meta robots noindex tags. Use when investigating why deindexed pages still appear in search results.

- 호출: `/robots-meta-conflict` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/robots-meta-conflict)
- 이 레포 사본: [`plugins/front-end-checklist/skills/robots-meta-conflict/SKILL.md`](../../plugins/front-end-checklist/skills/robots-meta-conflict/SKILL.md)

### `/robots-txt`

Use when applies to any public website. Use when auditing technical SEO foundations or diagnosing crawl coverage gaps.

- 호출: `/robots-txt` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/robots-txt)
- 이 레포 사본: [`plugins/front-end-checklist/skills/robots-txt/SKILL.md`](../../plugins/front-end-checklist/skills/robots-txt/SKILL.md)

### `/runtime-validation`

Use when reviewing code that calls fetch(), reads from localStorage, accesses process.env, or processes form submissions without explicitly validating the incoming data shape.

- 호출: `/runtime-validation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/runtime-validation)
- 이 레포 사본: [`plugins/front-end-checklist/skills/runtime-validation/SKILL.md`](../../plugins/front-end-checklist/skills/runtime-validation/SKILL.md)

### `/scheduler-yield`

Use when reviewing JavaScript that performs synchronous loops over large datasets, recursive tree traversals, or bulk DOM updates that may exceed 50 ms on mid-range devices.

- 호출: `/scheduler-yield` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/scheduler-yield)
- 이 레포 사본: [`plugins/front-end-checklist/skills/scheduler-yield/SKILL.md`](../../plugins/front-end-checklist/skills/scheduler-yield/SKILL.md)

### `/schema-noindex-conflict`

Use when applies to any site that uses structured data for rich results. Use when investigating why valid schema markup does not produce rich results in Google Search.

- 호출: `/schema-noindex-conflict` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/schema-noindex-conflict)
- 이 레포 사본: [`plugins/front-end-checklist/skills/schema-noindex-conflict/SKILL.md`](../../plugins/front-end-checklist/skills/schema-noindex-conflict/SKILL.md)

### `/screen-reader-testing`

Use when performing accessibility audits of web pages, components, or full user flows. Applies to all web content accessed via assistive technology. Particularly important for custom JavaScript widgets, single-page applications, dynamically updated content, modal dialogs, and forms with validation.

- 호출: `/screen-reader-testing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/screen-reader-testing)
- 이 레포 사본: [`plugins/front-end-checklist/skills/screen-reader-testing/SKILL.md`](../../plugins/front-end-checklist/skills/screen-reader-testing/SKILL.md)

### `/scrolljacking`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Avoid scrolljacking and custom scroll behavior. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/scrolljacking` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/scrolljacking)
- 이 레포 사본: [`plugins/front-end-checklist/skills/scrolljacking/SKILL.md`](../../plugins/front-end-checklist/skills/scrolljacking/SKILL.md)

### `/search-input`

Use when reviewing templates, rendered HTML, or shared components related to Make search inputs accessible. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/search-input` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/search-input)
- 이 레포 사본: [`plugins/front-end-checklist/skills/search-input/SKILL.md`](../../plugins/front-end-checklist/skills/search-input/SKILL.md)

### `/select-name`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Provide accessible names for select elements. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/select-name` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/select-name)
- 이 레포 사본: [`plugins/front-end-checklist/skills/select-name/SKILL.md`](../../plugins/front-end-checklist/skills/select-name/SKILL.md)

### `/semantic-lists`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use semantic list elements. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/semantic-lists` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/semantic-lists)
- 이 레포 사본: [`plugins/front-end-checklist/skills/semantic-lists/SKILL.md`](../../plugins/front-end-checklist/skills/semantic-lists/SKILL.md)

### `/sensory-instructions`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Avoid sensory-only instructions. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/sensory-instructions` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/sensory-instructions)
- 이 레포 사본: [`plugins/front-end-checklist/skills/sensory-instructions/SKILL.md`](../../plugins/front-end-checklist/skills/sensory-instructions/SKILL.md)

### `/service-area`

Use when applies to service businesses (plumbers, lawyers, consultants) serving multiple regions. Use when planning local SEO strategy for businesses without brick-and-mortar locations in every city.

- 호출: `/service-area` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/service-area)
- 이 레포 사본: [`plugins/front-end-checklist/skills/service-area/SKILL.md`](../../plugins/front-end-checklist/skills/service-area/SKILL.md)

### `/service-worker`

Use when auditing repeat-visit performance, adding offline support, or evaluating PWA readiness for a web application.

- 호출: `/service-worker` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/service-worker)
- 이 레포 사본: [`plugins/front-end-checklist/skills/service-worker/SKILL.md`](../../plugins/front-end-checklist/skills/service-worker/SKILL.md)

### `/session-cookie-flags`

Use when reviewing server-side session management, setting up authentication middleware, or auditing cookie configuration in HTTP response headers.

- 호출: `/session-cookie-flags` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/session-cookie-flags)
- 이 레포 사본: [`plugins/front-end-checklist/skills/session-cookie-flags/SKILL.md`](../../plugins/front-end-checklist/skills/session-cookie-flags/SKILL.md)

### `/session-timeout-recovery`

Use when reviewing authenticated user flows or long forms. Check both client and server behavior: warning timing, dialog accessibility, autosave frequency, timeout extension, and post-login state restoration.

- 호출: `/session-timeout-recovery` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/session-timeout-recovery)
- 이 레포 사본: [`plugins/front-end-checklist/skills/session-timeout-recovery/SKILL.md`](../../plugins/front-end-checklist/skills/session-timeout-recovery/SKILL.md)

### `/share-buttons`

Use when applies to blog posts, news articles, tutorials, and other long-form content. Less relevant for product pages, service pages, or home pages. Use when optimizing content distribution.

- 호출: `/share-buttons` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/share-buttons)
- 이 레포 사본: [`plugins/front-end-checklist/skills/share-buttons/SKILL.md`](../../plugins/front-end-checklist/skills/share-buttons/SKILL.md)

### `/sitemap`

Use when auditing metadata, crawlability, structured data, or indexability related to Create and submit an XML sitemap. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/sitemap` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/sitemap)
- 이 레포 사본: [`plugins/front-end-checklist/skills/sitemap/SKILL.md`](../../plugins/front-end-checklist/skills/sitemap/SKILL.md)

### `/sitemap-4xx`

Use when applies to any site with a dynamically generated or manually maintained XML sitemap. Use when investigating crawl errors or after a site migration that removed pages.

- 호출: `/sitemap-4xx` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/sitemap-4xx)
- 이 레포 사본: [`plugins/front-end-checklist/skills/sitemap-4xx/SKILL.md`](../../plugins/front-end-checklist/skills/sitemap-4xx/SKILL.md)

### `/sitemap-coverage`

Use when applies to content sites, e-commerce stores, and any site where timely indexing of new pages matters. Use when investigating why new pages take a long time to appear in search results.

- 호출: `/sitemap-coverage` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/sitemap-coverage)
- 이 레포 사본: [`plugins/front-end-checklist/skills/sitemap-coverage/SKILL.md`](../../plugins/front-end-checklist/skills/sitemap-coverage/SKILL.md)

### `/sitemap-domain`

Use when applies to sites that have recently migrated from HTTP to HTTPS, changed domain name, or have www/non-www redirect configurations. Use when sitemap submission reports low coverage.

- 호출: `/sitemap-domain` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/sitemap-domain)
- 이 레포 사본: [`plugins/front-end-checklist/skills/sitemap-domain/SKILL.md`](../../plugins/front-end-checklist/skills/sitemap-domain/SKILL.md)

### `/sitemap-valid`

Use when applies to any site with a manually or programmatically generated XML sitemap. Use when debugging sitemap submission errors in Google Search Console.

- 호출: `/sitemap-valid` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/sitemap-valid)
- 이 레포 사본: [`plugins/front-end-checklist/skills/sitemap-valid/SKILL.md`](../../plugins/front-end-checklist/skills/sitemap-valid/SKILL.md)

### `/skip-link`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Implement 'Skip to Content' links. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/skip-link` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/skip-link)
- 이 레포 사본: [`plugins/front-end-checklist/skills/skip-link/SKILL.md`](../../plugins/front-end-checklist/skills/skip-link/SKILL.md)

### `/skip-navigation`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Include a skip navigation link. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/skip-navigation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/skip-navigation)
- 이 레포 사본: [`plugins/front-end-checklist/skills/skip-navigation/SKILL.md`](../../plugins/front-end-checklist/skills/skip-navigation/SKILL.md)

### `/slug-keywords`

Use when applies to blog posts, product pages, and any content page with editable URL slugs. Use when building a URL strategy for a new site or auditing existing URLs for keyword inclusion.

- 호출: `/slug-keywords` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/slug-keywords)
- 이 레포 사본: [`plugins/front-end-checklist/skills/slug-keywords/SKILL.md`](../../plugins/front-end-checklist/skills/slug-keywords/SKILL.md)

### `/social-profiles`

Use when applies to business websites, personal brand sites, and publisher sites. Use when setting up Organization schema or auditing E-E-A-T signals for sites in competitive or YMYL categories.

- 호출: `/social-profiles` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/social-profiles)
- 이 레포 사본: [`plugins/front-end-checklist/skills/social-profiles/SKILL.md`](../../plugins/front-end-checklist/skills/social-profiles/SKILL.md)

### `/source-maps`

Use when auditing slow page loads, heavy assets, or rendering delays related to Provide source maps for production debugging. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/source-maps` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/source-maps)
- 이 레포 사본: [`plugins/front-end-checklist/skills/source-maps/SKILL.md`](../../plugins/front-end-checklist/skills/source-maps/SKILL.md)

### `/special-chars`

Use when applies to any site with user-generated slugs, CMS-generated URLs, or content in non-English languages. Use when auditing URLs for crawl errors or canonicalization issues.

- 호출: `/special-chars` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/special-chars)
- 이 레포 사본: [`plugins/front-end-checklist/skills/special-chars/SKILL.md`](../../plugins/front-end-checklist/skills/special-chars/SKILL.md)

### `/specificity-management`

Use when reviewing stylesheets, component styles, and responsive behavior related to Keep CSS specificity low and flat. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/specificity-management` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/specificity-management)
- 이 레포 사본: [`plugins/front-end-checklist/skills/specificity-management/SKILL.md`](../../plugins/front-end-checklist/skills/specificity-management/SKILL.md)

### `/speculation-rules`

Use when optimising multi-page navigation performance, reducing INP on page transitions, or implementing progressive enhancement for fast page loads.

- 호출: `/speculation-rules` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/speculation-rules)
- 이 레포 사본: [`plugins/front-end-checklist/skills/speculation-rules/SKILL.md`](../../plugins/front-end-checklist/skills/speculation-rules/SKILL.md)

### `/sprite-generation`

Use when reviewing image assets, markup, and CDN or build transforms related to Use image sprites where appropriate. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/sprite-generation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/sprite-generation)
- 이 레포 사본: [`plugins/front-end-checklist/skills/sprite-generation/SKILL.md`](../../plugins/front-end-checklist/skills/sprite-generation/SKILL.md)

### `/srcset`

Use when reviewing image assets, markup, and CDN or build transforms related to Use srcset for responsive images. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/srcset` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/srcset)
- 이 레포 사본: [`plugins/front-end-checklist/skills/srcset/SKILL.md`](../../plugins/front-end-checklist/skills/srcset/SKILL.md)

### `/stack-trace-exposure`

Use when reviewing error handling middleware, API route handlers, or server responses for security-sensitive information disclosure.

- 호출: `/stack-trace-exposure` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/stack-trace-exposure)
- 이 레포 사본: [`plugins/front-end-checklist/skills/stack-trace-exposure/SKILL.md`](../../plugins/front-end-checklist/skills/stack-trace-exposure/SKILL.md)

### `/stop-words`

Use when applies primarily when creating new content pages. Low priority for existing indexed pages where redirect risk outweighs gain. Use when building a slug naming convention.

- 호출: `/stop-words` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/stop-words)
- 이 레포 사본: [`plugins/front-end-checklist/skills/stop-words/SKILL.md`](../../plugins/front-end-checklist/skills/stop-words/SKILL.md)

### `/streaming-html`

Use when reviewing server-side rendering setup, Next.js App Router pages, or Node.js HTTP handlers to verify that HTML is streamed incrementally rather than buffered until completion.

- 호출: `/streaming-html` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/streaming-html)
- 이 레포 사본: [`plugins/front-end-checklist/skills/streaming-html/SKILL.md`](../../plugins/front-end-checklist/skills/streaming-html/SKILL.md)

### `/structured-data`

Use when auditing metadata, crawlability, structured data, or indexability related to Add structured data markup. Verify the rendered HTML and HTTP response rather than relying only on source files.

- 호출: `/structured-data` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/structured-data)
- 이 레포 사본: [`plugins/front-end-checklist/skills/structured-data/SKILL.md`](../../plugins/front-end-checklist/skills/structured-data/SKILL.md)

### `/styles-lint`

Use when reviewing stylesheets, component styles, and responsive behavior related to Lint CSS and SCSS files. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/styles-lint` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/styles-lint)
- 이 레포 사본: [`plugins/front-end-checklist/skills/styles-lint/SKILL.md`](../../plugins/front-end-checklist/skills/styles-lint/SKILL.md)

### `/subgrid`

Use when reviewing card grid layouts with misaligned content areas, or any nested grid where child items need to align with sibling cards' corresponding sections without JavaScript intervention.

- 호출: `/subgrid` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/subgrid)
- 이 레포 사본: [`plugins/front-end-checklist/skills/subgrid/SKILL.md`](../../plugins/front-end-checklist/skills/subgrid/SKILL.md)

### `/subresource-integrity`

Use when reviewing templates, rendered HTML, or shared components related to Add Subresource Integrity to external scripts. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/subresource-integrity` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/subresource-integrity)
- 이 레포 사본: [`plugins/front-end-checklist/skills/subresource-integrity/SKILL.md`](../../plugins/front-end-checklist/skills/subresource-integrity/SKILL.md)

### `/svg-inline`

Use when reviewing image assets, markup, and CDN or build transforms related to Manage inline SVG size and complexity. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/svg-inline` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/svg-inline)
- 이 레포 사본: [`plugins/front-end-checklist/skills/svg-inline/SKILL.md`](../../plugins/front-end-checklist/skills/svg-inline/SKILL.md)

### `/svg-optimization`

Use when reviewing image assets, markup, and CDN or build transforms related to Optimize SVG files. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/svg-optimization` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/svg-optimization)
- 이 레포 사본: [`plugins/front-end-checklist/skills/svg-optimization/SKILL.md`](../../plugins/front-end-checklist/skills/svg-optimization/SKILL.md)

### `/tabindex`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Use appropriate tabindex values. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/tabindex` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/tabindex)
- 이 레포 사본: [`plugins/front-end-checklist/skills/tabindex/SKILL.md`](../../plugins/front-end-checklist/skills/tabindex/SKILL.md)

### `/table-duplicate-name`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Ensure tables have unique accessible names. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/table-duplicate-name` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/table-duplicate-name)
- 이 레포 사본: [`plugins/front-end-checklist/skills/table-duplicate-name/SKILL.md`](../../plugins/front-end-checklist/skills/table-duplicate-name/SKILL.md)

### `/table-headers`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Define proper table headers. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/table-headers` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/table-headers)
- 이 레포 사본: [`plugins/front-end-checklist/skills/table-headers/SKILL.md`](../../plugins/front-end-checklist/skills/table-headers/SKILL.md)

### `/tabs-accessibility`

Use when reviewing templates, rendered HTML, or shared components related to Make tabs keyboard navigable. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/tabs-accessibility` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/tabs-accessibility)
- 이 레포 사본: [`plugins/front-end-checklist/skills/tabs-accessibility/SKILL.md`](../../plugins/front-end-checklist/skills/tabs-accessibility/SKILL.md)

### `/td-headers-attr`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Link table cells to headers using IDs. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/td-headers-attr` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/td-headers-attr)
- 이 레포 사본: [`plugins/front-end-checklist/skills/td-headers-attr/SKILL.md`](../../plugins/front-end-checklist/skills/td-headers-attr/SKILL.md)

### `/tel-mailto`

Use when applies to contact pages, business listing pages, headers/footers, and any page displaying a phone number or email address. Use when auditing contact UX or schema-marked LocalBusiness pages.

- 호출: `/tel-mailto` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/tel-mailto)
- 이 레포 사본: [`plugins/front-end-checklist/skills/tel-mailto/SKILL.md`](../../plugins/front-end-checklist/skills/tel-mailto/SKILL.md)

### `/terms-of-service`

Use when reviewing whether a website or web application has a visible Terms of Service link accessible from every page.

- 호출: `/terms-of-service` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/terms-of-service)
- 이 레포 사본: [`plugins/front-end-checklist/skills/terms-of-service/SKILL.md`](../../plugins/front-end-checklist/skills/terms-of-service/SKILL.md)

### `/test-coverage`

Use when reviewing CI coverage, automated checks, or test strategy related to Maintain test coverage thresholds. Focus on whether the rule is continuously verified, not just documented.

- 호출: `/test-coverage` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/test-coverage)
- 이 레포 사본: [`plugins/front-end-checklist/skills/test-coverage/SKILL.md`](../../plugins/front-end-checklist/skills/test-coverage/SKILL.md)

### `/text-expansion`

Use when reviewing CSS for fixed dimensions, truncation, or overflow rules on elements that render translatable strings.

- 호출: `/text-expansion` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/text-expansion)
- 이 레포 사본: [`plugins/front-end-checklist/skills/text-expansion/SKILL.md`](../../plugins/front-end-checklist/skills/text-expansion/SKILL.md)

### `/text-in-images`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Avoid images of text. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/text-in-images` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/text-in-images)
- 이 레포 사본: [`plugins/front-end-checklist/skills/text-in-images/SKILL.md`](../../plugins/front-end-checklist/skills/text-in-images/SKILL.md)

### `/text-resizing`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Support text resizing to 200%. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/text-resizing` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/text-resizing)
- 이 레포 사본: [`plugins/front-end-checklist/skills/text-resizing/SKILL.md`](../../plugins/front-end-checklist/skills/text-resizing/SKILL.md)

### `/th-has-data-cells`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Ensure table headers associate with data cells. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/th-has-data-cells` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/th-has-data-cells)
- 이 레포 사본: [`plugins/front-end-checklist/skills/th-has-data-cells/SKILL.md`](../../plugins/front-end-checklist/skills/th-has-data-cells/SKILL.md)

### `/third-party-cookies`

Use when reviewing a website for privacy compliance, third-party resource loading, or cookie consent implementation.

- 호출: `/third-party-cookies` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/third-party-cookies)
- 이 레포 사본: [`plugins/front-end-checklist/skills/third-party-cookies/SKILL.md`](../../plugins/front-end-checklist/skills/third-party-cookies/SKILL.md)

### `/third-party-scripts`

Use when auditing slow page loads, heavy assets, or rendering delays related to Optimize third-party script loading. Verify the actual bottleneck in DevTools, Lighthouse, or field data before recommending changes.

- 호출: `/third-party-scripts` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/third-party-scripts)
- 이 레포 사본: [`plugins/front-end-checklist/skills/third-party-scripts/SKILL.md`](../../plugins/front-end-checklist/skills/third-party-scripts/SKILL.md)

### `/title-unique`

Use when applies to all HTML pages. Use when auditing a site crawl report or investigating why multiple pages compete for the same keyword in search results.

- 호출: `/title-unique` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/title-unique)
- 이 레포 사본: [`plugins/front-end-checklist/skills/title-unique/SKILL.md`](../../plugins/front-end-checklist/skills/title-unique/SKILL.md)

### `/token-storage-security`

Use when reviewing authentication implementation, setting up a new auth system, or evaluating whether the current token storage approach exposes the application to XSS-based token theft.

- 호출: `/token-storage-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/token-storage-security)
- 이 레포 사본: [`plugins/front-end-checklist/skills/token-storage-security/SKILL.md`](../../plugins/front-end-checklist/skills/token-storage-security/SKILL.md)

### `/touch-targets`

Use when applies to all interactive elements on touchscreen interfaces: buttons, links, checkboxes, radio buttons, form inputs, icon buttons, and menu items. Check CSS for min-width, min-height, width, height, and padding on interactive elements. Particularly important for icon-only buttons (close, delete, share) which are often made too small.

- 호출: `/touch-targets` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/touch-targets)
- 이 레포 사본: [`plugins/front-end-checklist/skills/touch-targets/SKILL.md`](../../plugins/front-end-checklist/skills/touch-targets/SKILL.md)

### `/trailing-slash`

Use when applies to all static and dynamic websites. Use when auditing a site for duplicate content, setting up a new site, or after migrating platforms that changed URL conventions.

- 호출: `/trailing-slash` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/trailing-slash)
- 이 레포 사본: [`plugins/front-end-checklist/skills/trailing-slash/SKILL.md`](../../plugins/front-end-checklist/skills/trailing-slash/SKILL.md)

### `/translation-strings`

Use when reviewing a codebase for internationalisation readiness, setting up an i18n library, or preparing strings for a new locale.

- 호출: `/translation-strings` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/translation-strings)
- 이 레포 사본: [`plugins/front-end-checklist/skills/translation-strings/SKILL.md`](../../plugins/front-end-checklist/skills/translation-strings/SKILL.md)

### `/trust-signals`

Use when applies especially to e-commerce checkouts, contact/lead forms, pricing pages, and YMYL (Your Money or Your Life) content. Use when auditing E-E-A-T or conversion optimization.

- 호출: `/trust-signals` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/trust-signals)
- 이 레포 사본: [`plugins/front-end-checklist/skills/trust-signals/SKILL.md`](../../plugins/front-end-checklist/skills/trust-signals/SKILL.md)

### `/ttfb`

Use when auditing slow first responses on SSR pages, APIs, or cacheable HTML. Distinguish origin compute time from network latency and CDN cache misses before proposing a fix.

- 호출: `/ttfb` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/ttfb)
- 이 레포 사본: [`plugins/front-end-checklist/skills/ttfb/SKILL.md`](../../plugins/front-end-checklist/skills/ttfb/SKILL.md)

### `/twitter-cards`

Use when applies to any page intended to be shared on X (Twitter). Use when auditing social sharing previews or adding social meta tags to a new site.

- 호출: `/twitter-cards` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/twitter-cards)
- 이 레포 사본: [`plugins/front-end-checklist/skills/twitter-cards/SKILL.md`](../../plugins/front-end-checklist/skills/twitter-cards/SKILL.md)

### `/type-coercion`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Avoid implicit type coercion. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/type-coercion` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/type-coercion)
- 이 레포 사본: [`plugins/front-end-checklist/skills/type-coercion/SKILL.md`](../../plugins/front-end-checklist/skills/type-coercion/SKILL.md)

### `/type-only-imports`

Use when auditing import statements in TypeScript files, setting up a new TypeScript project, or investigating unexpected bundle inclusions from type-only dependencies.

- 호출: `/type-only-imports` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/type-only-imports)
- 이 레포 사본: [`plugins/front-end-checklist/skills/type-only-imports/SKILL.md`](../../plugins/front-end-checklist/skills/type-only-imports/SKILL.md)

### `/typescript-strict-mode`

Use when setting up a new TypeScript project, auditing an existing tsconfig.json, or reviewing code where null-reference errors or implicit any types are present.

- 호출: `/typescript-strict-mode` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/typescript-strict-mode)
- 이 레포 사본: [`plugins/front-end-checklist/skills/typescript-strict-mode/SKILL.md`](../../plugins/front-end-checklist/skills/typescript-strict-mode/SKILL.md)

### `/unique-id`

Use when reviewing templates, rendered HTML, or shared components related to Ensure all IDs are unique. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/unique-id` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/unique-id)
- 이 레포 사본: [`plugins/front-end-checklist/skills/unique-id/SKILL.md`](../../plugins/front-end-checklist/skills/unique-id/SKILL.md)

### `/unit-tests`

Use when reviewing CI coverage, automated checks, or test strategy related to Write unit tests. Focus on whether the rule is continuously verified, not just documented.

- 호출: `/unit-tests` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/unit-tests)
- 이 레포 사본: [`plugins/front-end-checklist/skills/unit-tests/SKILL.md`](../../plugins/front-end-checklist/skills/unit-tests/SKILL.md)

### `/unused-css`

Use when reviewing stylesheets, component styles, and responsive behavior related to Remove unused CSS rules. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/unused-css` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/unused-css)
- 이 레포 사본: [`plugins/front-end-checklist/skills/unused-css/SKILL.md`](../../plugins/front-end-checklist/skills/unused-css/SKILL.md)

### `/video`

Use when applies to any page embedding or hosting video content (YouTube, Vimeo, self-hosted). Use when adding video content to a site or auditing structured data coverage.

- 호출: `/video` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/video)
- 이 레포 사본: [`plugins/front-end-checklist/skills/video/SKILL.md`](../../plugins/front-end-checklist/skills/video/SKILL.md)

### `/video-accessibility`

Use when reviewing templates, rendered HTML, or shared components related to Make videos accessible with captions. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/video-accessibility` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/video-accessibility)
- 이 레포 사본: [`plugins/front-end-checklist/skills/video-accessibility/SKILL.md`](../../plugins/front-end-checklist/skills/video-accessibility/SKILL.md)

### `/video-captions`

Use when applies to all `<video>` elements and third-party video embeds (YouTube, Vimeo) where the page owner controls the content. Prerecorded videos require `.vtt` caption files via `<track>`. For videos embedded via `<iframe>`, check that the video platform captions are enabled. Audio-only content requires transcripts instead (SC 1.2.1). Video-only content (no audio) requires a text alternative or audio description instead (SC 1.2.3).

- 호출: `/video-captions` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/video-captions)
- 이 레포 사본: [`plugins/front-end-checklist/skills/video-captions/SKILL.md`](../../plugins/front-end-checklist/skills/video-captions/SKILL.md)

### `/video-optimization`

Use when reviewing <video> elements, background/hero video, or embedded media assets. Check encoded bitrate, resolution relative to the rendered player size, codec/container choice, and whether a poster/thumbnail avoids blocking on the first frame.

- 호출: `/video-optimization` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/video-optimization)
- 이 레포 사본: [`plugins/front-end-checklist/skills/video-optimization/SKILL.md`](../../plugins/front-end-checklist/skills/video-optimization/SKILL.md)

### `/video-thumbnail`

Use when applies to all `<video>` elements in HTML. The `poster` attribute specifies the URL of an image to show as a placeholder before the video is loaded or played. This is distinct from captions or audio descriptions, which are accessibility requirements. The poster is primarily a UX and performance enhancement, though the lack of a poster can indirectly create a CLS (Cumulative Layout Shift) issue if video dimensions are not declared.

- 호출: `/video-thumbnail` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/video-thumbnail)
- 이 레포 사본: [`plugins/front-end-checklist/skills/video-thumbnail/SKILL.md`](../../plugins/front-end-checklist/skills/video-thumbnail/SKILL.md)

### `/view-transitions`

Use when adding page transition animations, image expand/contract effects, shared-element transitions, or improving navigation UX in a single-page or multi-page application.

- 호출: `/view-transitions` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/view-transitions)
- 이 레포 사본: [`plugins/front-end-checklist/skills/view-transitions/SKILL.md`](../../plugins/front-end-checklist/skills/view-transitions/SKILL.md)

### `/viewport`

Use when reviewing templates, rendered HTML, or shared components related to Set the responsive viewport meta tag. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/viewport` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/viewport)
- 이 레포 사본: [`plugins/front-end-checklist/skills/viewport/SKILL.md`](../../plugins/front-end-checklist/skills/viewport/SKILL.md)

### `/viewport-zoom`

Use when applies to any `<meta name='viewport'>` element in HTML documents. Check the `content` attribute for `user-scalable=no`, `user-scalable=0`, `maximum-scale=1`, or `maximum-scale` values less than 2. This is a common mistake in mobile-first templates and CSS frameworks.

- 호출: `/viewport-zoom` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/viewport-zoom)
- 이 레포 사본: [`plugins/front-end-checklist/skills/viewport-zoom/SKILL.md`](../../plugins/front-end-checklist/skills/viewport-zoom/SKILL.md)

### `/visual-regression`

Use when reviewing CI coverage, automated checks, or test strategy related to Use visual regression testing. Focus on whether the rule is continuously verified, not just documented.

- 호출: `/visual-regression` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/visual-regression)
- 이 레포 사본: [`plugins/front-end-checklist/skills/visual-regression/SKILL.md`](../../plugins/front-end-checklist/skills/visual-regression/SKILL.md)

### `/w3c-compliant`

Use when reviewing templates, rendered HTML, or shared components related to Validate HTML against W3C standards. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/w3c-compliant` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/w3c-compliant)
- 이 레포 사본: [`plugins/front-end-checklist/skills/w3c-compliant/SKILL.md`](../../plugins/front-end-checklist/skills/w3c-compliant/SKILL.md)

### `/weak-internal-links`

Use when applies to any site with more than 20 pages. Use when auditing site architecture, investigating why certain pages underperform in search, or after a site migration.

- 호출: `/weak-internal-links` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/weak-internal-links)
- 이 레포 사본: [`plugins/front-end-checklist/skills/weak-internal-links/SKILL.md`](../../plugins/front-end-checklist/skills/weak-internal-links/SKILL.md)

### `/web-app-manifest`

Use when reviewing templates, rendered HTML, or shared components related to Link a Web App Manifest for installability. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/web-app-manifest` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/web-app-manifest)
- 이 레포 사본: [`plugins/front-end-checklist/skills/web-app-manifest/SKILL.md`](../../plugins/front-end-checklist/skills/web-app-manifest/SKILL.md)

### `/web-storage`

Use when reviewing scripts, client components, bundles, or runtime behavior related to Use Web Storage API safely. Inspect both source code and the browser execution path so fixes target the real bottleneck or bug.

- 호출: `/web-storage` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/web-storage)
- 이 레포 사본: [`plugins/front-end-checklist/skills/web-storage/SKILL.md`](../../plugins/front-end-checklist/skills/web-storage/SKILL.md)

### `/webfont-format`

Use when reviewing stylesheets, component styles, and responsive behavior related to Optimize web font formats. Check the rendered layout across breakpoints and interaction states before proposing a fix.

- 호출: `/webfont-format` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/webfont-format)
- 이 레포 사본: [`plugins/front-end-checklist/skills/webfont-format/SKILL.md`](../../plugins/front-end-checklist/skills/webfont-format/SKILL.md)

### `/webp-format`

Use when reviewing image assets, markup, and CDN or build transforms related to Use WebP format with fallbacks. Check encoded size, rendered size, loading strategy, and above-the-fold impact together.

- 호출: `/webp-format` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/webp-format)
- 이 레포 사본: [`plugins/front-end-checklist/skills/webp-format/SKILL.md`](../../plugins/front-end-checklist/skills/webp-format/SKILL.md)

### `/webpagetest`

Use when reviewing templates, rendered HTML, or shared components related to Analyze performance with WebPageTest. Validate the final browser-facing markup, not just the source framework abstraction.

- 호출: `/webpagetest` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/webpagetest)
- 이 레포 사본: [`plugins/front-end-checklist/skills/webpagetest/SKILL.md`](../../plugins/front-end-checklist/skills/webpagetest/SKILL.md)

### `/website-search`

Use when applies to sites with internal site search functionality. Use when optimizing branded search result appearance or adding structured data for the first time.

- 호출: `/website-search` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/website-search)
- 이 레포 사본: [`plugins/front-end-checklist/skills/website-search/SKILL.md`](../../plugins/front-end-checklist/skills/website-search/SKILL.md)

### `/word-count`

Use when applies to key landing pages, blog posts, product pages, and any page targeting competitive queries. Use when diagnosing poor rankings or after a Google Helpful Content update.

- 호출: `/word-count` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/word-count)
- 이 레포 사본: [`plugins/front-end-checklist/skills/word-count/SKILL.md`](../../plugins/front-end-checklist/skills/word-count/SKILL.md)

### `/x-content-type`

Use when auditing HTTP response headers on any web server or CDN for security hardening.

- 호출: `/x-content-type` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/x-content-type)
- 이 레포 사본: [`plugins/front-end-checklist/skills/x-content-type/SKILL.md`](../../plugins/front-end-checklist/skills/x-content-type/SKILL.md)

### `/x-frame-options`

Use when reviewing HTTP response headers for clickjacking protection on any web application with authenticated user actions.

- 호출: `/x-frame-options` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/x-frame-options)
- 이 레포 사본: [`plugins/front-end-checklist/skills/x-frame-options/SKILL.md`](../../plugins/front-end-checklist/skills/x-frame-options/SKILL.md)

### `/ymyl-detection`

Use when applies to any site in health, medicine, finance, law, safety, news, or similar fields. Use when auditing content quality for sites in YMYL categories or investigating why high-quality-seeming content underperforms.

- 호출: `/ymyl-detection` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/ymyl-detection)
- 이 레포 사본: [`plugins/front-end-checklist/skills/ymyl-detection/SKILL.md`](../../plugins/front-end-checklist/skills/ymyl-detection/SKILL.md)

### `/zoom-reflow`

Use when reviewing rendered HTML, interactive components, or design-system patterns related to Support content reflow at 400% zoom. Check native semantics first, then inspect keyboard behavior, focus flow, accessible names, and screen-reader output where relevant.

- 호출: `/zoom-reflow` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [thedaviddias/Front-End-Checklist](https://github.com/thedaviddias/Front-End-Checklist/tree/HEAD/skills/zoom-reflow)
- 이 레포 사본: [`plugins/front-end-checklist/skills/zoom-reflow/SKILL.md`](../../plugins/front-end-checklist/skills/zoom-reflow/SKILL.md)
