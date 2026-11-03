## riverlog 지식 창고
작업의 종류와 상관없이(개발·디자인·리뷰·문서·글쓰기·조사 등) 새 작업을 시작할 때는 항상 `/riverlog-knowledge` 스킬로 riverlog 지식 창고(`~/Projects/riverlog/content/knowledge`, 없으면 github.com/HerrineKim/riverlog)에서 관련 노트를 먼저 찾아 참고한다. 다른 스킬이 작업을 이끌어도 이 확인은 건너뛰지 않고, 서브에이전트에 일을 맡길 때도 브리프에 riverlog 확인을 넣는다. 노트의 관례·주의점은 따르되, API·버전 정보는 공식 문서와 현재 코드가 우선이다.

## 글쓰기: em dash 금지
문서·UI 문구·커밋 메시지·답변 어디에서도 em dash(—)를 쓰지 않는다. 문맥에 맞게 쉼표, 가운뎃점(·), 괄호, 콜론, 줄바꿈 중 하나로 바꾸거나 문장을 나눈다. 범위는 물결표(~)나 하이픈(-)을 쓴다.

## 다이어그램: Mermaid로
문서·노트·README·PR 본문에서 흐름, 순서, 구성 요소 연결, 상태 전이, 개념 계층처럼 그래프인 그림은 항상 ` ```mermaid ` 블록으로 그린다(`flowchart`, `sequenceDiagram`, `stateDiagram-v2`, `timeline`, `quadrantChart`, `gitGraph`). 선 문자(├ └ │ ─ ▶)나 화살표로 그린 ASCII 그림은 쓰지 않는다. 라벨은 큰따옴표로 감싸고 색·`classDef`는 넣지 않는다. 파일·폴더 트리, 수식, 터미널 출력처럼 그래프가 아닌 것은 텍스트 블록으로 둔다.

## TDD & Tidy First (Kent Beck)

Applies whenever writing or changing code. Works alongside OMC's `tdd` skill/keyword (that skill governs seams and test doubles; this section governs the cycle and commits).

### plan.md workflow
- If the repo has a `plan.md`, follow it. When I say **"go"**: find the next unmarked test in `plan.md`, write that one test, implement only enough code to make it pass, then mark it done.

### Cycle: Red → Green → Refactor
- One test at a time. Write the simplest failing test for a small increment; name it by behavior (e.g. `shouldSumTwoPositiveNumbers`) and make the failure message clear.
- Write the minimum code to pass, nothing more. Use the simplest solution that could possibly work.
- Refactor only while green: one named refactoring at a time (Extract Method, Rename, Move…), running tests after each step. Prioritize removing duplication and improving clarity.
- Run the full test suite (excluding long-running tests) every time.
- Defects: first write a failing API-level test, then the smallest test that reproduces the bug, then make both pass.

### Tidy First: separate structure from behavior
- **Structural** change = rearranging without changing behavior (rename, extract, move). **Behavioral** change = adding/modifying functionality.
- Never mix the two in one commit. When both are needed, do structural first, and confirm tests pass before and after it.

### Commit discipline
- Commit only when all tests pass, all compiler/linter warnings are resolved, and the change is one logical unit.
- Prefer small, frequent commits. The message states whether it is a structural or behavioral change (e.g. `refactor: …` / `feat:`·`fix: …`).
- This defines *how* to commit; still commit only when I ask (or the active workflow authorizes it).

### Code quality
- Eliminate duplication ruthlessly; express intent through naming and structure.
- Make dependencies explicit; keep functions small with a single responsibility; minimize state and side effects.
