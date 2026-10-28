# error-message-ko

toast·alert·에러 상태·`HTTPException(detail)` 등 사용자에게 보이는 에러 문구를 쓸 때 원문 노출 없이 한국어로 안내한다. 출처: HerrineKim/claude-skills(비공개).

## 사용 예
- 에러 처리 코드를 쓰면 자동으로 적용
- "이 화면 에러 문구 점검해 줘"

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (1개)

### `/error-message-ko`

사용자에게 보이는 에러 문구를 쓰거나 고칠 때 반드시 이 스킬을 먼저 참고한다. toast·alert·StateView·에러 바운더리·인라인 에러 텍스트를 만들 때, try/catch 나 `if (error)` 뒤에 화면에 무엇을 띄울지 정할 때, FastAPI `HTTPException(detail=...)` 이나 서버 액션의 실패 응답 문구를 쓸 때 적용한다. "에러 메시지를 고쳐줘 / 문구가 이상하다 / 사용자가 못 알아본다" 같은 말이 나올 때도 사용한다. 사용자가 "문구"를 말하지 않아도 에러 처리 코드를 건드리면 항상 적용할 것. Use whenever writing or editing user-facing error text — toasts, alerts, error boundaries, empty/error states, inline form errors, FastAPI HTTPException detail, or server action failure responses. Proactively check that no raw exception text, DB message, stack trace, JSON fragment, env var name, or English detail can reach the screen, even if the user never mentions wording.

- 호출: `/error-message-ko` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [HerrineKim/claude-skills](https://github.com/HerrineKim/claude-skills/tree/HEAD/skills/error-message-ko)
- 이 레포 사본: [`plugins/error-message-ko/skills/error-message-ko/SKILL.md`](../../plugins/error-message-ko/skills/error-message-ko/SKILL.md)
