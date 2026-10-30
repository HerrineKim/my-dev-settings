# ui-polish

UI 개선을 한 번에 진행하는 지휘자 스킬. 규칙을 직접 담지 않고 설치된 UI 스킬을 순서대로 불러 쓰므로, 원본 스킬이 업데이트되면 그대로 따라간다.

## 준비
- 같은 레포의 `frontend-design`, `antislop`, `make-interfaces-feel-better`, `web-design-guidelines`, `riverlog-knowledge` 플러그인. 빠진 스킬이 있으면 그 단계를 건너뛰고 결과에 적는다

## 사용 예
- `/ui-polish app/dashboard`: 방향 잡기부터 최종 점검까지 수정 포함
- `/ui-polish components/Button.tsx --quick`: AI 티·디테일·접근성만 빠르게
- `/ui-polish src/pages --review`: 수정 없이 점검 결과 표만

진행 순서: 준비(riverlog·스타일 체계 확인) → `frontend-design`(새 화면일 때만) → `antislop`·`antislop-ui` → `make-interfaces-feel-better` → `antislop-human`·`antislop-layoutmobile` → `web-design-guidelines`. 규칙이 부딪히면 접근성, 기존 디자인 시스템, 모션 절제, 더 구체적인 스킬 순으로 따른다.

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (1개)

### `/ui-polish`

UI 개선을 한 번에 진행하는 지휘자 스킬. 설치된 UI 스킬(frontend-design, antislop 계열, make-interfaces-feel-better, web-design-guidelines)을 정해진 순서로 불러 방향 잡기 → AI 티 걷어내기 → 디테일 다듬기 → 접근성·반응형 → 최종 점검까지 진행한다. "UI 개선", "화면 다듬어 줘", "UI 폴리시", "디자인 손봐 줘", "ui-polish" 요청 시 사용.

- 호출: `/ui-polish <파일·폴더·컴포넌트·페이지> [--review] [--quick]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [HerrineKim/my-dev-settings](https://github.com/HerrineKim/my-dev-settings/tree/HEAD/plugins/ui-polish/skills/ui-polish) (이 레포에서 만듦)
- 이 레포 사본: [`plugins/ui-polish/skills/ui-polish/SKILL.md`](../../plugins/ui-polish/skills/ui-polish/SKILL.md)
