---
name: riverlog-knowledge
description: 개발 작업(구현·설계·디버깅·리뷰·기술 선택)을 시작할 때 riverlog 지식 창고(HerrineKim/riverlog의 content/knowledge)에서 관련 노트를 찾아 사용자의 기존 정리·관례·결정을 참고한다. 어느 프로젝트에서든 코드를 쓰기 전에 사용. "지식 창고 참고", "riverlog 찾아봐", "내가 정리한 거 있어?" 요청에도 사용.
---

# riverlog-knowledge

riverlog는 사용자가 직접 정리한 개발·생활 지식 노트 모음이다(마크다운 330여 개). 개발 작업 전에 관련 노트를 찾아 사용자가 이미 정리한 개념·관례·주의점을 따른다.

## 1. 지식 창고 위치 찾기

아래 순서로 처음 존재하는 경로를 `KB`로 쓴다.

1. `$RIVERLOG_DIR/content/knowledge`
2. `~/Projects/riverlog/content/knowledge`
3. `~/.cache/riverlog/content/knowledge` — 없으면 받아 온다(공개 레포):
   ```bash
   git clone --depth 1 https://github.com/HerrineKim/riverlog.git ~/.cache/riverlog
   ```
   이미 있으면 `git -C ~/.cache/riverlog pull --ff-only`로 갱신한다(실패해도 기존 사본으로 계속).

로컬 경로를 못 쓰는 환경(웹 등)에서는 `gh api repos/HerrineKim/riverlog/contents/content/knowledge/<경로>` 또는 `https://raw.githubusercontent.com/HerrineKim/riverlog/main/content/knowledge/<경로>`로 읽는다.

## 2. 관련 노트 찾기

구조: 분야 폴더(`Frontend/`, `Backend/`, `DevOps/`, `AI-Data/`, `Algorithm/`, `Computer-Science/`, `Tools/`, `Career/`, `Life-and-Learning/` 등)마다 같은 이름의 인덱스 노트(`Frontend.md`)가 있고, 그 안의 "하위 주제" 표가 하위 노트를 요약한다. 각 노트 frontmatter에 `title`, `concept`, `summary`, `tags`가 있다.

1. 작업의 핵심 키워드(라이브러리·개념·에러명, 한/영 둘 다)로 frontmatter와 본문을 검색한다.
   ```bash
   grep -rliE "nextjs|use cache" "$KB" --include='*.md' | head -20
   grep -rhE "^(title|summary|tags):" "$KB/Frontend/Next.js"
   ```
2. 감이 안 오면 해당 분야 인덱스 노트(`$KB/<분야>.md`)의 하위 주제 표부터 읽는다.
3. 노트 본문의 `[[slug|표시명]]` 링크는 같은 이름의 `slug.md` 노트를 가리킨다. 필요하면 따라가 읽는다.
4. 관련 노트 1~3개만 읽는다. 관련 노트가 없으면 조용히 넘어간다.

## 3. 활용 규칙

- 노트에 적힌 사용자의 관례·결정·주의점(예: 테스트 방식, 상태 관리 선택, 폴더 구조)은 프로젝트 코드나 CLAUDE.md와 충돌하지 않는 한 따른다.
- 노트는 작성 시점(`date`) 기준이라 낡았을 수 있다. 라이브러리 API·버전 정보는 공식 문서와 현재 프로젝트 코드가 우선이다. 차이가 있으면 사용자에게 짚어 준다.
- 참고한 노트가 결정에 영향을 줬으면 답변에 경로를 한 줄로 밝힌다(예: `참고: Frontend/Testing/tdd.md`).
- 이 스킬은 읽기 전용이다. 새 노트 추가·수정은 `/note` 스킬로 한다(전역 설치되어 어느 프로젝트에서든 쓸 수 있다).
