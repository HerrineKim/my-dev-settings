# note

어느 프로젝트에서든 자료(붙여 넣은 글·URL·파일 경로·주제)를 riverlog 지식 창고 노트 형식으로 다시 써서 넣고, 상위 인덱스·관련 노트 링크까지 갱신한다. 출처: riverlog 레포의 `.claude/skills/note`(벤더링 때 레포 위치 찾기 안내를 앞에 끼워 넣음).

## 준비
- `~/Projects/riverlog` 클론(다른 위치면 `export RIVERLOG_DIR=...`)

## 사용 예
- `/note https://example.com/article`
- `/note ~/Downloads/meeting.md`
- "이거 요약해서 knowledge에 넣어 줘" + 붙여 넣은 글

원문을 번역·복사하지 않고 재구성하며, 넣을 때마다 주변 노트와 중복을 점검한다.

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (1개)

### `/note`

어느 프로젝트에서든 riverlog 지식 창고(~/Projects/riverlog의 content/knowledge)에 새 지식 노트를 요약·재구성해 넣는다. "/note <붙여 넣은 글·URL·파일 경로·주제>" 형태로 쓰며, 원문을 번역·복사하지 않고 riverlog 노트 형식(frontmatter, 출처 인용, 표·소제목 중심 정리, 관련 노트 링크)으로 다시 쓰고, 상위 분야 인덱스의 하위 노트 목록까지 갱신한다. 넣을 때마다 주변 노트와의 중복을 점검해 병합·정리한다. "지식 창고에 넣어 줘", "노트로 정리해 줘", "이거 요약해서 knowledge에" 요청에도 사용.

- 호출: `/note <붙여 넣은 글 | URL | 파일 경로 | 주제> [→ 분야/주제 경로] [--draft]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `scripts/`
- 원조 GitHub: [HerrineKim/riverlog](https://github.com/HerrineKim/riverlog/tree/HEAD/.claude/skills/note)
- 이 레포 사본: [`plugins/note/skills/note/SKILL.md`](../../plugins/note/skills/note/SKILL.md)
