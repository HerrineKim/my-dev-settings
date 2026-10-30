---
name: ui-polish
description: UI 개선을 한 번에 진행하는 지휘자 스킬. 설치된 UI 스킬(frontend-design, antislop 계열, make-interfaces-feel-better, web-design-guidelines)을 정해진 순서로 불러 방향 잡기 → AI 티 걷어내기 → 디테일 다듬기 → 접근성·반응형 → 최종 점검까지 진행한다. "UI 개선", "화면 다듬어 줘", "UI 폴리시", "디자인 손봐 줘", "ui-polish" 요청 시 사용.
argument-hint: [파일·폴더·컴포넌트·페이지] [--review] [--quick]
---

# ui-polish

이 스킬은 규칙을 직접 담지 않는다. 아래 단계마다 해당 스킬을 Skill 도구로 불러 그 지시를 따르고, 이 파일은 순서·범위·충돌 처리만 정한다.

## 0. 준비

1. `riverlog-knowledge`로 이 작업과 관련된 노트(디자인 시스템, 프론트엔드 관례)를 먼저 찾는다.
2. 대상 범위를 정한다. 인자로 받은 파일·폴더가 있으면 그것을 쓰고, 없으면 묻지 말고 아래 순서로 추론한다. 정한 범위는 시작할 때 한 줄로 알린다.
   1. 대화에서 방금 다루던 화면·컴포넌트·파일
   2. 커밋하지 않은 변경과 현재 브랜치의 변경(`git status`, `git diff <기본 브랜치>...HEAD`) 중 UI 파일(`.tsx`, `.jsx`, `.vue`, `.svelte`, `.css` 등)
   3. 둘 다 없으면 프로젝트의 주요 화면(라우트·페이지 진입점)을 훑어 개선 여지가 큰 곳부터. 범위가 넓으면 `--review`처럼 점검 결과를 먼저 보여 주고 수정할 곳을 고르게 한다.
3. 프로젝트의 기존 스타일 체계(Tailwind, CSS Modules, CSS-in-JS, 디자인 토큰)를 확인한다. 모든 수정은 그 체계 안에서 하고, 두 번째 스타일 체계를 들이지 않는다.
4. 모드를 정한다.

| 모드 | 조건 | 하는 일 |
| --- | --- | --- |
| 기본 | 플래그 없음 | 1~5단계 모두, 코드 수정까지 |
| `--review` | 리뷰만 원할 때 | 1~5단계를 점검만 하고 수정하지 않음 |
| `--quick` | 작은 컴포넌트·빠른 손질 | 2, 3, 4단계만 |

## 1. 방향 잡기: `frontend-design`

- 새 화면이거나 큰 개편일 때만 쓴다. 기존 화면을 다듬는 작업이면 건너뛰고, 현재 디자인 방향을 그대로 기준으로 삼는다.
- 결과로 타이포·색·레이아웃 방향을 2~3줄로 적어 두고 이후 단계의 기준으로 쓴다.

## 2. AI 티 걷어내기: `antislop` + `antislop-ui`

- `antislop`(코어)을 먼저, 이어서 `antislop-ui`를 불러 대상에 걸리는 패턴(기본 보라 그라데이션, 과한 글래스모피즘, 복붙 카드, 균일한 간격 등)을 찾는다.
- 문구가 포함된 화면이면 `antislop-copywriting`도 불러 헤드라인·버튼 문구를 본다.

## 3. 디테일 다듬기: `make-interfaces-feel-better`

- 동심원 radius, 광학 정렬, 그림자, 아이콘 굵기, tabular numbers, 등장·퇴장 모션, hover/focus/active/loading/empty 상태를 본다.
- 범위가 크면 이 스킬의 full review 모드, `--quick`이면 quick 모드로 쓴다.

## 4. 사람과 화면 크기: `antislop-human` + `antislop-layoutmobile`

- `antislop-human`으로 대비, 키보드 이동, 포커스 표시, 상태 피드백을 확인한다. 대비 검사 도구가 있으면 실제로 돌린다.
- 반응형 화면이면 `antislop-layoutmobile`로 그리드 붕괴, 가로 넘침, 터치 영역(최소 44px)을 확인한다.

## 5. 최종 점검: `web-design-guidelines`

- 수정이 끝난 파일을 대상으로 돌려 남은 위반을 `file:line` 형식으로 모은다.
- 여기서 나온 항목 중 앞 단계에서 의도적으로 남긴 것은 이유와 함께 표시한다.

## 규칙이 부딪힐 때

스킬마다 권하는 방향이 다를 수 있다. 아래 우선순위로 정하고, 정한 내용은 결과 보고에 적는다.

1. 접근성(`antislop-human`, 가이드라인의 a11y 항목)이 항상 먼저다.
2. 프로젝트의 기존 디자인 시스템·토큰이 스킬의 일반 권고보다 앞선다.
3. 모션은 절제 쪽을 따른다. `prefers-reduced-motion`을 존중하고, 의미 없는 장식 애니메이션은 넣지 않는다.
4. 그 밖에는 뒤 단계(더 구체적인 스킬)의 권고를 따른다.

## 결과 보고

마지막에 아래 표 하나로 정리한다. em dash는 쓰지 않는다.

| 단계 | 발견 | 조치 | 파일 |
| --- | --- | --- | --- |
| 2. AI 티 | 예: 히어로 보라 그라데이션 | 브랜드 색 단색 배경으로 교체 | `app/page.tsx:12` |

표 아래에 충돌을 어떻게 정했는지, 남긴 항목과 이유, 직접 눈으로 확인하지 못한 부분(브라우저 미확인 등)을 짧게 적는다.

## 필요한 스킬

`frontend-design`, `antislop`, `antislop-ui`, `antislop-copywriting`, `make-interfaces-feel-better`, `antislop-human`, `antislop-layoutmobile`, `web-design-guidelines`, `riverlog-knowledge`. 하나가 설치되어 있지 않으면 그 단계를 건너뛰고 결과 보고에 적는다.
