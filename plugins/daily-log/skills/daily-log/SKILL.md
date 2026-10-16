---
name: daily-log
description: 오늘(00:00~실행 시각) Claude Code에서 한 작업과 GitHub에 반영한 내역(push·PR·리뷰·이슈)을 정리해 노션 "2026 데일리 업무 회고" DB의 오늘 날짜 페이지에 기록한다. 날짜당 페이지 1개, 같은 날 다시 실행하면 지난 기록 이후 분량만 이어 붙인다. "daily-log", "업무노트 기록", "오늘 작업 정리해서 노션에", "데일리 로그" 요청 시 사용.
argument-hint: "[YYYY-MM-DD] (생략 시 오늘)"
---

# daily-log

오늘 한 일을 모아 노션 업무노트에 기록한다. 설정은 `config.json`(같은 폴더)에 있다.

## 규칙

- **범위**: 대상 날짜 00:00 ~ 실행 시각(로컬 시간). 과거 날짜를 인자로 주면 그날 00:00~24:00.
- **페이지**: 날짜당 1개. 제목은 `2026년 10월 11일 일요일` 형식.
- **재실행**: 같은 날짜 페이지가 있으면 새로 만들지 않고, 지난 실행 이후 분량만 같은 페이지에 추가한다.
- **여러 맥북**: 각 맥북은 훅(Stop·SessionEnd·SessionStart)으로 자기 Claude 기록을 `config.shared_dir`(기본 iCloud Drive) 아래 `<기기명>/projects/`에 복사한다(`install.sh`가 훅을 등록). `collect.py`는 이 폴더의 다른 기기 기록도 함께 읽어 세션마다 `machine`을 붙이므로, 어느 맥북에서 한 번 실행해도 모든 기기의 작업이 기록된다. `--since`는 기기별로 정하고(아래 1-3), GitHub 내역은 계정 단위라 이미 적힌 커밋(sha)·PR(번호)은 다시 쓰지 않는다.
- **동기화 지연**: 다른 기기의 기록은 그 기기가 켜져 있고 iCloud가 올린 뒤에야 보인다. 그래서 마커에는 기기마다 **실제로 본 데이터의 끝 시각**(`machines[].until`)을 적는다. 미러 기기의 `until`은 현재 시각이 아니라 그 기기 기록에서 본 마지막 이벤트 시각이므로, 늦게 도착한 기록은 다음 실행 때 그 시각부터 다시 수집된다. 마커에 적히지 않은 기기는 00:00부터 수집한다.

## 절차

### 1. 오늘 페이지 찾기

1. 대상 날짜 제목(예: `2026년 10월 11일 일요일`)을 만든다.
2. Notion 검색 도구로 `config.notion_data_source` 안에서 그 제목을 찾는다. 제목이 정확히 일치하는 페이지만 인정한다.
3. 있으면 fetch해서 본문을 읽고, `🤖 daily-log · <기기명>@HH:MM[, <기기명>@HH:MM…] · HH:MM` 형식 마커를 모두 모은다. 기기마다 **그 기기의 `@HH:MM` 중 가장 늦은 값**이 그 기기의 `since`다(옛 형식 `<기기명> · HH:MM`은 끝의 HH:MM을 그 기기의 값으로 본다). 2단계에 `--since 기기A=HH:MM,기기B=HH:MM` 형태로 넘기고, 어떤 마커에도 없는 기기는 적지 않는다(00:00부터 수집). 기기명은 2단계 출력의 `machines[].name`이므로 먼저 `--since` 없이 한 번 돌려 확인해도 된다. since 분(分) 안의 항목은 다음 실행에 한 번 더 들어올 수 있으니 이미 적힌 내용과 겹치면 뺀다.

### 2. 데이터 수집

```bash
python3 "<이 스킬 폴더>/scripts/collect.py" [--date YYYY-MM-DD] [--since HH:MM | 기기A=HH:MM,기기B=HH:MM]
```

JSON 출력 필드:
- `claude_sessions[]`: 세션별 `machine`(어느 맥북), `title`, `cwd`, `branch`, `start`/`end`, `prompts[]`(사용자가 입력한 요청), `files_changed`, `last_reply`(마지막 응답 앞부분)
- `machines[]`: 기기별 `name`, `source`(`local`/`mirror`), `since`, `until`(이번에 본 데이터의 끝 시각, 마커에 적을 값), `sessions`(세션 수), `last_synced`(마지막 기록 시각)
- `shared_dir_ok`: 공유 폴더가 이 맥북에 있는지. `false`면 다른 기기 기록을 읽을 수 없는 상태다
- `sync_warnings[]`: 다른 기기 기록이 iCloud에서 아직 내려오지 않았을 때 등의 경고
- `local_git[]`: 이 맥북 세션이 돌았던 저장소의 내 커밋(아직 push 안 한 것 포함)
- `github`: `pushes`, `pull_requests`(opened/merged/closed), `reviews`, `issues`, `other`(브랜치·릴리스 생성), `prs_updated_today`
- `window`(git·GitHub 범위, 기기별 since 중 가장 이른 시각부터), `machine`(현재 기기), `date`, `weekday_ko`

`github.error`가 있으면(또는 `--no-github`로 `github.skipped`이면) GitHub 부분은 건너뛰고 마지막 보고에 `gh auth login` 필요하다고 알린다. `sync_warnings`가 있으면 그대로 진행하되 5단계 보고에 알린다.
수집 결과가 전부 비어 있으면 노션에 쓰지 말고 "기록할 내역 없음"으로 끝낸다.

### 3. 정리하기

원문을 나열하지 말고 **무엇을 했는지** 업무 단위로 묶어 요약한다.

- 같은 저장소·주제의 세션과 커밋은 하나의 항목으로 합친다(`cwd`의 저장소명, 브랜치명 기준). 다른 기기에서 한 같은 주제의 작업도 한 항목으로 합친다.
- 각 항목: 굵은 제목 1줄 + 한 일 2~4개 bullet. 결과가 확인된 것(커밋, PR 머지)과 진행 중인 것을 구분한다. 이번 블록에 세션이 있는 기기가 둘 이상이면 항목 제목 끝에 `(기기명)`을 붙인다.
- 지금 이 세션이 `daily-log` 실행만 한 경우 그 세션은 빼고(다른 작업도 했다면 그 작업은 포함), 단순 질문·잡담 세션(파일 변경·커밋 없고 프롬프트 1개짜리 가벼운 질문)은 뺀다.
- scratch 작업 공간(`/scratch-workspaces/`) 세션은 저장소명 대신 세션 `title`로 부른다.
- 비밀번호·토큰·개인정보처럼 보이는 문자열은 옮기지 않는다.

기록 블록 형식(노션 마크다운):

```markdown
### 🤖 daily-log · <기기명>@<until>[, <기기명>@<until>…] · <window.to>  (<window.from>–<window.to>)
**<업무 1 제목>** — <저장소/프로젝트>
- 한 일
- 한 일
**<업무 2 제목>** — ...
- ...

**GitHub 반영**
- `owner/repo` <branch>: push N건 — <대표 커밋 메시지> (`abc1234`)
- PR [#12 제목](url) — merged
```

GitHub 반영이 없으면 그 소제목을 생략한다. 마커에는 **이번 블록에 실제로 항목을 적은 세션이 있는 기기**와 현재 기기를 `machines[]`의 `until` 값과 함께 적는다. 세션을 전부 걸러낸(가벼운 질문만 있던) 기기는 적지 않는다.

### 4. 노션에 쓰기

**페이지가 없을 때** — `config.notion_data_source`에 `config.notion_template_id` 템플릿으로 페이지를 만든다. 속성:
- `날짜`(제목): 위 제목
- `date:날짜 2:start`: `YYYY-MM-DD`, `date:날짜 2:is_datetime`: 0
- `구분`: `YYYY년 M월` (예: `2026년 10월`, 0 없이). select 옵션은 자동 생성되지 않으므로, 데이터 소스에 그 옵션이 없으면 Notion 데이터 소스 수정 도구로 옵션을 먼저 추가한다. `ALTER COLUMN "구분" SET SELECT(...)`는 나열하지 않은 옵션을 **삭제**하므로, 데이터 소스를 fetch해 기존 옵션 전부를 원래 색 그대로 나열하고 새 옵션을 덧붙인다. 추가할 수 없으면 `구분`을 비우고 보고에 알린다.
- `태그`: `config.default_tags`
- `오늘의 업무`: 핵심 업무 1~3개를 한 줄로(쉼표 구분)

템플릿 적용 후 페이지를 fetch해 `# 1. 오늘 요약` 바로 아래(다음 `# 2. TIL` 앞)에 기록 블록을 넣는다. GitHub PR·커밋 링크는 `# 4. 관련 자료` 아래에도 bullet로 넣는다.

**페이지가 있을 때** — 본문을 덮어쓰지 않는다. `# 1. 오늘 요약` 섹션의 마지막 기존 기록 블록 뒤(=`# 2. TIL` 바로 앞)에 새 블록을 추가하고, `# 4. 관련 자료` 끝에 새 링크만 추가한다. `오늘의 업무` 속성은 기존 값에 새 업무를 합쳐 갱신한다(중복 제거). 사용자가 직접 쓴 내용(Check in/out, 일기, TIL 등)은 절대 바꾸지 않는다.

섹션 제목이 템플릿과 달라 찾을 수 없으면 페이지 맨 끝에 블록을 추가한다.

### 5. 보고

노션 페이지 링크, 신규/추가 여부, 기록 범위(`window`), 포함된 기기, 업무 항목 수와 GitHub 반영 건수를 2~3줄로 알린다. `sync_warnings`가 있으면 그대로 알리고, `shared_dir_ok`가 `false`이거나 `machines[]`에 `mirror` 기기가 하나도 없으면 다른 맥북에서 `install.sh`를 돌렸는지(훅 등록·iCloud Drive) 확인하라고 덧붙인다.

## 기기 간 기록 공유 구조

- `scripts/sync_transcripts.py`: 훅으로 실행되어 `~/.claude/projects/*/*.jsonl` 중 최근 2일 안에 바뀐 파일을 `<shared_dir>/<기기명>/projects/` 아래에 복사한다(mtime·크기가 같으면 생략, Stop 훅은 1분 안에 복사한 파일은 건너뜀, 임시 파일 후 교체, 14일 지난 미러는 삭제). 공유 폴더가 없으면 아무 일도 하지 않고, 어떤 오류도 Claude Code를 막지 않는다.
- 훅 등록: 심볼릭 링크 설치는 `install.sh`가 `~/.claude/settings.json`에 추가하고, 플러그인 설치는 `hooks/hooks.json`이 자동 적용된다.
- 기기명: `DAILY_LOG_MACHINE` 환경변수 → `config.machine_name` → macOS LocalHostName(`scutil --get LocalHostName`) → 호스트명 순. 기기명이 바뀌면 공유 폴더에 새 폴더가 생기고 옛 폴더는 별도 기기처럼 보인다(같은 세션은 한 번만 집계됨). 바꾼 뒤에는 옛 폴더를 지운다.
- 테스트: 이 폴더에서 `python3 -m unittest discover -s tests`.
