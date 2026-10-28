# daily-log

오늘(00:00~실행 시각) Claude Code에서 한 작업과 GitHub 반영 내역(push·PR·리뷰·이슈)을 노션 "2026 데일리 업무 회고" DB의 오늘 날짜 페이지에 기록한다. 직접 만든 스킬.

## 준비
- `install.sh`를 쓰는 맥마다 한 번 실행(기록 복사 훅 등록, iCloud Drive 공유 폴더 생성)
- `gh auth login`, claude.ai 계정의 Notion 커넥터
- 기기 이름을 바꾸려면 `export DAILY_LOG_MACHINE=회사맥`

## 사용 예
- `/daily-log`
- "오늘 작업 정리해서 노션에 올려 줘"

같은 날 다시 실행하면 그 기기의 마지막 기록 이후 분량만 이어 붙인다. 다른 맥북에서 한 작업도 공유 폴더를 통해 함께 들어간다.

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (1개)

### `/daily-log`

오늘(00:00~실행 시각) Claude Code에서 한 작업과 GitHub에 반영한 내역(push·PR·리뷰·이슈)을 정리해 노션 "2026 데일리 업무 회고" DB의 오늘 날짜 페이지에 기록한다. 날짜당 페이지 1개, 같은 날 다시 실행하면 지난 기록 이후 분량만 이어 붙인다. "daily-log", "업무노트 기록", "오늘 작업 정리해서 노션에", "데일리 로그" 요청 시 사용.

- 호출: `/daily-log [YYYY-MM-DD] (생략 시 오늘)` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `scripts/`, `tests/`
- 원조 GitHub: [HerrineKim/my-dev-settings](https://github.com/HerrineKim/my-dev-settings/tree/HEAD/plugins/daily-log/skills/daily-log) (이 레포에서 만듦)
- 이 레포 사본: [`plugins/daily-log/skills/daily-log/SKILL.md`](../../plugins/daily-log/skills/daily-log/SKILL.md)
