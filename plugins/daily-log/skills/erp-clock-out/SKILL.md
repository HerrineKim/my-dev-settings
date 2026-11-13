---
name: erp-clock-out
description: ERP MCP(erp 서버)로 퇴근을 찍고 오늘 업무일지를 함께 남긴다. 오늘 한 업무를 하나씩 제목으로 두고 그 아래 상세 내역을 불릿으로 적으며, 관련 GitHub PR·커밋 링크와 ERP 업무·스토리(티켓) 링크를 빠짐없이 붙인다. "퇴근", "퇴근할게", "퇴근 찍어 줘", "업무일지 쓰고 퇴근", "erp-clock-out" 요청 시 사용. 노션 데일리 회고 기록(daily-log)이나 출근·자리 비움만 바꾸는 요청에는 쓰지 않는다.
argument-hint: "[일지에 꼭 넣을 내용이나 중심 주제] (생략 가능)"
---

# erp-clock-out

ERP MCP의 퇴근 흐름(`erp_get_work_note_context` → 초안 → `erp_clock_out`)을 그대로 따르면서, 일지 본문을 **업무별 제목 + 상세 불릿 + 링크** 형식으로 만든다. 데이터 수집은 같은 플러그인의 `daily-log` 스크립트를 재사용한다.

## 0. ERP MCP 확인

- 도구 이름은 `mcp__erp__erp_get_work_note_context`, `mcp__erp__erp_clock_out` 형식이다. 지연 로드 상태면 ToolSearch로 `select:mcp__erp__erp_get_work_note_context,mcp__erp__erp_clock_out,mcp__erp__erp_list_tasks,mcp__erp__erp_list_stories,mcp__erp__erp_get_story`를 한 번에 불러온다(없는 도구는 건너뛴다).
- `erp` 서버가 아예 없으면 멈추고 연결 방법만 안내한다.

  ```bash
  claude mcp add --transport http --scope user erp https://erp.taply.xyz/mcp
  ```

  연결 뒤 `/mcp`에서 `erp` 로그인을 하고, 동의 화면의 **개인 근태**(읽기·쓰기)를 켜야 퇴근 도구가 보인다. 근태 도구만 없으면 근태 권한 없이 연결된 것이므로 다시 연결하라고 알린다.

## 1. 퇴근 가능 여부 확인

`erp_get_work_note_context`를 부른다.

- `can_clock_out:false`이면 퇴근을 부르지 않는다. `session.status`(출근 전, 이미 퇴근 등)를 알려 주고 끝낸다.
- `logical_date`(근무일)를 기억한다. 자정 이후 퇴근이면 근무일이 어제일 수 있다.

## 2. 중심 내용 묻기

`focus_question`(**오늘 업무일지는 어떤 내용을 중심으로 쓸까요?**)을 그대로 묻고 `focus_options`를 예시로 보인다. 사용자가 인자로 이미 중심 내용을 줬다면 그 답을 쓰고 다시 묻지 않는다. **답을 받기 전에는 초안을 쓰지 않는다.** 2·3단계 수집은 질문과 동시에 시작해도 된다.

## 3. 재료 모으기

세 출처를 모두 본다. 하나가 실패해도 나머지로 진행하고 보고에 알린다.

1. **Claude 작업·GitHub 반영**: `daily-log` 수집 스크립트를 돌린다.

   ```bash
   python3 ~/.claude/skills/daily-log/scripts/collect.py --date <logical_date>
   ```

   근무일이 어제(자정 이후 퇴근)이면 `--date <오늘 날짜>`로 한 번 더 돌려 자정 이후 분량을 합친다. 쓰는 필드: `claude_sessions[]`(prompts, files_changed, branch, cwd), `local_git[]`, `github.pushes / pull_requests / reviews / issues / prs_updated_today`. `github.error`가 있으면 `gh auth login` 필요를 보고에 적는다.
2. **ERP 업무(티켓)**: `task_query`가 있으면 그 인자를 그대로 `erp_list_tasks`에 보내 오늘 완료한 내 업무를 받는다. 진행 중인 업무도 일지에 들어가면 `erp_list_tasks`를 `assignment:"my_assignments"`, `status:"in_progress"`로 한 번 더 부른다. `task_query:null`이면 업무 조회 권한이 없는 것이니 건너뛴다.
3. **ERP 스토리**: 스토리 도구가 있고 브랜치명·PR 본문·세션 프롬프트에 스토리 번호가 보이면 `erp_get_story`로 제목을 확인한다.

### 링크 만들기

| 대상 | 링크 형식 |
| --- | --- |
| GitHub PR | PR `url` 그대로 (`https://github.com/<owner>/<repo>/pull/<번호>`) |
| 커밋 (PR 없이 push만 한 것) | `https://github.com/<owner>/<repo>/commit/<sha 7자리 이상>` |
| GitHub 이슈 | 이슈 `url` 그대로 |
| ERP 업무 | `https://erp.taply.xyz/kanban/<project_id>?taskId=<task id>` |
| ERP 스토리 | `https://erp.taply.xyz/stories/<스토리 번호>` |

- 업무와 PR은 제목·브랜치명·PR 본문의 번호로 짝을 맞춰 같은 업무 아래 둔다. 짝을 확신하지 못하면 억지로 묶지 말고 따로 둔다.
- 커밋은 PR에 들어간 것이면 PR 링크 하나로 대신한다. 커밋 링크는 PR 없이 push만 한 경우에만 대표 1~2개를 단다.
- 로컬에만 있고 push 안 한 커밋은 링크 없이 "로컬 커밋(미push)"으로 적는다.

## 4. 초안 쓰기

사용자 답을 중심에 두고, 오늘 한 일을 **업무 단위**로 묶는다. 같은 저장소·브랜치·ERP 업무에 속한 세션·커밋·PR은 한 업무로 합친다.

일지 `note`는 **마크다운이 아닌 평문**이다. ERP 웹은 줄바꿈만 살려 그대로 보여 주고, 팀 텔레그램은 HTML 이스케이프 후 보내므로 `**굵게**`, `## 제목`, `[글](url)`은 기호가 그대로 보인다. 그래서 아래 형식을 지킨다.

```text
[업무 제목 1]
- 한 일과 결과 (머지됨 / 리뷰 중 / 진행 중을 밝힌다)
- 한 일
- PR #192 https://github.com/owner/repo/pull/192
- 업무 https://erp.taply.xyz/kanban/<project_id>?taskId=<id>

[업무 제목 2]
- ...
- 커밋 abc1234 https://github.com/owner/repo/commit/abc1234

[내일 할 일]
- ...
```

- 업무 제목은 `[ ]`로 감싼 한 줄, 그 아래 상세 불릿 2~4개, 이어서 링크 불릿. 업무 사이는 빈 줄 하나.
- 링크는 URL을 그대로 쓴다(텔레그램과 웹이 자동으로 링크로 만든다). 업무에 관련된 PR·커밋·이슈·ERP 업무·스토리 링크는 하나도 빼지 않는다.
- 사용자가 고른 중심 내용이 "진행 중·막힌 점", "회의·협업", "내일 할 일", "특이사항"이면 그 내용을 맨 앞 업무나 별도 `[ ]` 제목으로 둔다. 사용자가 직접 말한 내용(회의, 문의 대응처럼 기록에 없는 일)도 업무로 넣는다.
- 세션·커밋에 없는 결과는 만들지 않는다. 확인 못 한 것은 "진행 중" 또는 "확인 필요"로 적는다.
- 지금 이 퇴근 세션, 파일 변경·커밋 없는 가벼운 질문 세션은 뺀다.
- 비밀번호·토큰·개인 연락처·고객 개인정보처럼 보이는 문자열은 옮기지 않는다. 일지는 팀 채널에 공유된다.
- 길이: 1~10,000자. 텔레그램은 앞 **1,500자**만 보이므로 넘으면 초안 아래에 "텔레그램에서는 ○○ 업무부터 잘립니다"라고 알리고, 줄일지 사용자에게 맡긴다.

### 4-1. 문장 다듬기 (항상)

일지를 다 쓰면 사용자에게 보여 주기 전에 매번 `/antislop`과 `/thresh`(ai-slop-thresher)를 차례로 적용한다. 일지가 짧아도, 이미 퇴근한 날 일지를 고칠 때도 건너뛰지 않는다.

- `/antislop`: em dash 금지(R-02), 근거 없는 수치·주장 금지(R-17, R-36), 상투적 마케팅 표현 금지(R-16). 세션·커밋에 없는 결과를 만들지 않고, 확인 못 한 것은 "진행 중"이나 "확인 필요"로 적는다.
- `/thresh`: 뜻·수치·조건을 그대로 둔 채 군더더기 반응, 겹친 수식어, 명사화(`~를 진행`), 불필요한 쉼표와 따옴표를 덜어낸다.
- 다듬는 대상은 문장이다. `[ ]` 업무 제목, 불릿, 빈 줄 같은 평문 형식과 PR 번호·SHA·URL은 건드리지 않는다.
- 다듬은 뒤 1,500자(텔레그램)·10,000자 기준을 다시 확인한다.

초안을 보여 주고 **수정할 곳이 있는지, 이대로 퇴근할지** 묻는다. 사용자가 명확히 승인하기 전에는 `erp_clock_out`을 부르지 않는다. 승인하면 퇴근 기록과 팀 채널 공유가 바로 일어난다는 점을 질문에 함께 적는다.

- **질문 창이 앞선 답변을 가린다.** AskUserQuestion이 열리면 사용자는 질문 창만 보고, 그 앞에 쓴 초안은 보지 못한다. 그래서 승인 질문에는 초안 전문을 반드시 함께 싣는다.
  - AskUserQuestion으로 물을 때: "이대로 퇴근" 선택지의 `preview`에 확정할 일지 전문을 그대로 넣는다(줄바꿈 유지, 요약·생략 금지). "수정 후 퇴근" 선택지에도 같은 전문을 `preview`로 넣어, 어느 쪽에 초점이 가도 초안이 보이게 한다. 질문 문장에 글자 수와 텔레그램 잘림 여부를 적는다.
  - 질문 창을 쓰지 않을 때: 초안 코드 블록과 승인 질문을 같은 답변 맨 끝에 두고, 그 뒤에 다른 도구 호출을 붙이지 않는다.
- 사용자가 고칠 곳을 말하면 고친 초안 전문을 다시 같은 방식으로 보여 주고 다시 묻는다.

## 5. 퇴근 기록

승인을 받으면 `erp_clock_out`을 한 번 부른다.

- `focus`: 2단계에서 받은 사용자 답 원문(1~500자, 길면 500자 안으로 자른다)
- `note`: 확정한 일지 전문
- `idempotency_key`: 새 UUID(`uuidgen | tr A-Z a-z`). 응답이 유실돼 재시도할 때는 **같은 키와 같은 입력**을 그대로 쓴다. 내용을 바꿔 다시 부를 때만 새 키를 만든다.

응답 처리:

- `replay:true`: 이미 저장된 퇴근이다. 알림은 다시 가지 않았다고 알린다.
- `notification:"failed"`: 퇴근은 저장됐고 팀 알림만 실패했다고 알린다.
- `not_working` + `auto_closed:true`: 자동 마감된 뒤다. 퇴근은 다시 찍지 말고, 응답의 안내대로 `erp_get_my_attendance`로 해당 세션의 `attendance_id`·`updated_at`을 읽은 뒤 사용자 확인을 받아 `erp_update_my_work_note`로 일지만 넣는다(`edit_window_closed`면 기간이 지난 것이니 웹에서 확인하라고 안내한다).
- 이미 퇴근한 날 일지를 고치고 싶다는 요청도 같은 `erp_update_my_work_note` 흐름을 쓴다. `conflict`면 다시 읽고 최신 본문 기준으로 다시 확인받는다.

## 6. 보고

2~3줄로 알린다: 퇴근 시각·근무 시간(응답 `attendance.clock_out`을 KST로, `attendance.total_minutes`를 시간·분으로), 일지에 넣은 업무 수와 링크 수(GitHub / ERP 업무·스토리), 팀 알림 결과(`notification`), 건너뛴 출처(GitHub 인증, 업무 조회 권한 등).
