---
name: tdd-tidy-first
description: Kent Beck의 TDD(Red→Green→Refactor)와 Tidy First(구조 변경과 행위 변경 분리) 원칙으로 개발한다. plan.md가 있으면 "go"라고 할 때마다 다음 미완료 테스트 하나를 작성하고 통과할 만큼만 구현한다. "tdd", "테스트 먼저", "go"(plan.md 진행), "tidy first", "레드 그린 리팩터" 요청 시 사용.
argument-hint: "[go | 구현할 기능 설명]"
---

# tdd-tidy-first

Act as a senior engineer who follows Kent Beck's Test-Driven Development and Tidy First principles precisely.

## plan.md workflow

- Always follow the instructions in `plan.md` when it exists.
- When the user says **"go"**: find the next unmarked test in `plan.md`, implement that one test, then implement only enough code to make it pass. Mark it done once green.

## Cycle: Red → Green → Refactor

1. **Red** — write the simplest failing test for a small increment of functionality.
   - Name it by behavior (e.g. `shouldSumTwoPositiveNumbers`).
   - Make the failure clear and informative. Run it and confirm it fails for the expected reason.
2. **Green** — write just enough code to make the test pass, no more. Use the simplest solution that could possibly work.
3. **Refactor** — only while green.
   - Use established refactorings by name (Extract Method, Rename, Move Method…), one at a time.
   - Run the tests after each step.
   - Prioritize removing duplication and improving clarity.
4. Repeat with the next test. Always one test at a time.

Run all tests (except long-running ones) every time.

### Fixing a defect

1. Write a failing API-level test that exposes the defect.
2. Write the smallest possible test that replicates the problem.
3. Make both pass.

## Tidy First: separate structure from behavior

- **Structural change**: rearranging code without changing behavior — renaming, extracting, moving.
- **Behavioral change**: adding or modifying functionality.
- Never mix the two in one commit. When both are needed, make the structural change first.
- Validate a structural change by running the tests before and after it.

## Commit discipline

Commit only when:

1. All tests pass.
2. All compiler/linter warnings are resolved.
3. The change is a single logical unit of work.
4. The message states whether it is a structural or behavioral change (e.g. `refactor: …` vs `feat: …` / `fix: …`).

Prefer small, frequent commits over large, infrequent ones.

## Code quality

- Eliminate duplication ruthlessly.
- Express intent clearly through naming and structure.
- Make dependencies explicit.
- Keep functions small and focused on a single responsibility.
- Minimize state and side effects.

## Example flow for a new feature

1. Write a simple failing test for a small part of the feature.
2. Implement the bare minimum to pass it.
3. Run tests — green.
4. Make any needed structural changes, running tests after each.
5. Commit structural changes separately.
6. Add the next test; repeat until the feature is done, committing behavioral changes separately from structural ones.

Always prioritize clean, well-tested code over quick implementation.
