# claude-skills

개인 Claude Code 스킬 모음.

| 스킬 | 설명 |
|---|---|
| `/daily-log` | 오늘(00:00~실행 시각) Claude Code 작업 + GitHub 반영 내역을 노션 "2026 데일리 업무 회고"에 기록. 날짜당 페이지 1개, 재실행 시 이어 쓰기 |

## 새 맥북에 설치

```bash
git clone https://github.com/HerrineKim/claude-skills.git ~/Projects/claude-skills
~/Projects/claude-skills/install.sh
```

필요한 것
- **GitHub CLI**: `brew install gh && gh auth login`
- **Notion**: claude.ai 계정의 Notion 커넥터(계정에 붙어 있어 기기마다 따로 설정할 필요 없음)
- Python 3 (macOS 기본 포함, 외부 패키지 없음)

업데이트: `git -C ~/Projects/claude-skills pull` — 스킬은 심볼릭 링크라 바로 반영됩니다.

### 플러그인으로 설치하는 방법(대안)

```bash
claude plugin marketplace add HerrineKim/claude-skills
claude plugin install daily-log@hyerin-skills
```

이 경우 명령어는 `/daily-log:daily-log`가 됩니다.

## 기기 이름

노션 기록 블록에는 기기 이름이 붙고, 재실행 시 같은 기기의 마지막 기록 이후만 추가합니다.
기본값은 호스트 이름이며 `DAILY_LOG_MACHINE` 환경변수로 바꿀 수 있습니다(예: `~/.zshrc`에 `export DAILY_LOG_MACHINE=회사맥`).

## 한계

- Claude Code(CLI·데스크톱 Code 탭) 기록만 읽습니다. claude.ai 웹/앱의 일반 채팅은 로컬에 남지 않아 수집되지 않습니다.
- Claude 기록은 각 맥북 로컬에만 있으므로, 맥북마다 한 번씩 실행해야 그 기기의 작업이 기록됩니다.
