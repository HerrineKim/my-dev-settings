# tdd-tidy-first

Kent Beck식 TDD와 Tidy First 규칙. `plan.md`에 테스트 목록을 적고 "go"라고 하면 다음 테스트 하나를 Red → Green → Refactor로 진행한다. 직접 만든 스킬.

## 사용 예
- "tdd로 진행하자. plan.md 만들어 줘"
- `go` (plan.md의 다음 미완료 테스트 진행)

구조 변경(정리)과 동작 변경은 커밋을 나눈다.

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (1개)

### `/tdd-tidy-first`

Kent Beck의 TDD(Red→Green→Refactor)와 Tidy First(구조 변경과 행위 변경 분리) 원칙으로 개발한다. plan.md가 있으면 "go"라고 할 때마다 다음 미완료 테스트 하나를 작성하고 통과할 만큼만 구현한다. "tdd", "테스트 먼저", "go"(plan.md 진행), "tidy first", "레드 그린 리팩터" 요청 시 사용.

- 호출: `/tdd-tidy-first [go | 구현할 기능 설명]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [HerrineKim/my-dev-settings](https://github.com/HerrineKim/my-dev-settings/tree/HEAD/plugins/tdd-tidy-first/skills/tdd-tidy-first) (이 레포에서 만듦)
- 이 레포 사본: [`plugins/tdd-tidy-first/skills/tdd-tidy-first/SKILL.md`](../../plugins/tdd-tidy-first/skills/tdd-tidy-first/SKILL.md)
