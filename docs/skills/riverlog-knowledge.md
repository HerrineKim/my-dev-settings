# riverlog-knowledge

새 작업(개발·디자인·리뷰·문서·글쓰기·조사) 전에 [riverlog](https://github.com/HerrineKim/riverlog) 지식 창고(`content/knowledge`)에서 관련 노트를 찾아 참고한다. `global-claude.md`가 작업마다 먼저 쓰도록 지시한다. 다른 스킬이 작업을 이끌어도, 서브에이전트에 맡길 때도 마찬가지다. 직접 만든 스킬.

## 준비
- `~/Projects/riverlog`에 클론해 두면 그걸 읽고, 없으면 `~/.cache/riverlog`로 받아 온다

## 사용 예
- "riverlog 찾아봐: Supabase RLS 관련"
- "내가 정리한 거 있어? Next.js 캐시"

노트의 관례·주의점은 따르되 API·버전 정보는 공식 문서와 현재 코드가 우선이다.

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (1개)

### `/riverlog-knowledge`

작업의 종류와 상관없이(개발·디자인·리뷰·문서·글쓰기·조사 등) 새 작업을 시작할 때 riverlog 지식 창고(HerrineKim/riverlog의 content/knowledge)에서 관련 노트를 찾아 사용자의 기존 정리·관례·결정을 참고한다. 어느 프로젝트에서든 다른 스킬보다 먼저 쓰고, 서브에이전트에 일을 맡길 때도 브리프에 넣는다. "지식 창고 참고", "riverlog 찾아봐", "내가 정리한 거 있어?" 요청에도 사용.

- 호출: `/riverlog-knowledge` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [HerrineKim/my-dev-settings](https://github.com/HerrineKim/my-dev-settings/tree/HEAD/plugins/riverlog-knowledge/skills/riverlog-knowledge) (이 레포에서 만듦)
- 이 레포 사본: [`plugins/riverlog-knowledge/skills/riverlog-knowledge/SKILL.md`](../../plugins/riverlog-knowledge/skills/riverlog-knowledge/SKILL.md)
