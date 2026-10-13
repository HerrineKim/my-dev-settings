# my-claude-skills

개인 Claude Code 스킬 모음.

| 스킬 | 설명 |
|---|---|
| `/daily-log` | 오늘(00:00~실행 시각) Claude Code 작업 + GitHub 반영 내역을 노션 "2026 데일리 업무 회고"에 기록. 날짜당 페이지 1개, 재실행 시 이어 쓰기 |
| `/ui-ux-pro-max` | UI/UX 디자인 판단 데이터(스타일·팔레트·폰트 조합·UX 가이드·차트·스택별 구현). 인터페이스 설계·구현·리뷰 시 |
| `/ui-styling` | shadcn/ui + Tailwind 기반 UI 구현, 테마·다크모드·접근성 컴포넌트 |
| `/design` | 로고·CIP·배너·아이콘·소셜 이미지 등 종합 디자인 |
| `/design-system` | 디자인 토큰(원시→의미→컴포넌트), 컴포넌트 스펙 |
| `/brand` | 브랜드 보이스·비주얼 아이덴티티·메시징 |
| `/banner-design` | 소셜·광고·히어로·인쇄용 배너 디자인 |
| `/slides` | Chart.js 기반 HTML 프레젠테이션 |
| `/frontend-design` | Anthropic 공식. 템플릿 같지 않은 UI 미학·타이포 방향 잡기 |
| `/web-design-guidelines` | Vercel Web Interface Guidelines로 UI 코드 접근성·UX 리뷰 |
| `/clone-website` | URL을 섹션별로 분석(CSS·에셋·인터랙션)해 Next.js + shadcn/ui + Tailwind로 픽셀 단위 복제. 브라우저 MCP 필요 |
| `/ai-slop-thresher` | 한국어 초안의 상투어·과잉 설명·반복 수사를 덜어내 윤문. 사실·조건·말투는 보존 |
| `/thresh` | `/ai-slop-thresher` 단축 호출(직접 불렀을 때만 동작) |
| `/riverlog-knowledge` | 개발 작업 전에 [riverlog](https://github.com/HerrineKim/riverlog) 지식 창고에서 관련 노트를 찾아 참고. 로컬 사본이 없으면 `~/.cache/riverlog`로 받아 옴 |

`/daily-log`, `/tdd-tidy-first`, `/riverlog-knowledge`는 직접 만든 스킬이고, 나머지는 외부 스킬을 `plugins/` 아래에 벤더링한 것입니다(출처는 아래).

## 외부 스킬 출처와 업데이트

| 플러그인 | 출처 |
|---|---|
| `ui-ux-pro-max` (7개 스킬) | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) |
| `frontend-design` | [anthropics/claude-code](https://github.com/anthropics/claude-code/tree/main/plugins/frontend-design) |
| `web-design-guidelines` | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| `clone-website` | [julianromli/ai-skills](https://github.com/julianromli/ai-skills/tree/main/skills/clone-website) |
| `ai-slop-thresher` (2개 스킬) | [Burntgogi/ai-slop-thresher](https://github.com/Burntgogi/ai-slop-thresher) (Apache-2.0) |

최신 버전으로 다시 받으려면 `./vendor.sh` 실행 후 `git diff`를 확인하고 커밋합니다.

## 새 맥북에 설치

```bash
git clone https://github.com/HerrineKim/my-claude-skills.git ~/Projects/my-claude-skills
~/Projects/my-claude-skills/install.sh
```

필요한 것
- **GitHub CLI**: `brew install gh && gh auth login`
- **Notion**: claude.ai 계정의 Notion 커넥터(계정에 붙어 있어 기기마다 따로 설정할 필요 없음)
- Python 3 (macOS 기본 포함, 외부 패키지 없음)

업데이트: `git -C ~/Projects/my-claude-skills pull` — 스킬은 심볼릭 링크라 바로 반영됩니다.

### 플러그인으로 설치하는 방법(대안)

```bash
claude plugin marketplace add HerrineKim/my-claude-skills
claude plugin install daily-log@hyerin-skills
claude plugin install tdd-tidy-first@hyerin-skills
claude plugin install ui-ux-pro-max@hyerin-skills
claude plugin install frontend-design@hyerin-skills
claude plugin install web-design-guidelines@hyerin-skills
claude plugin install clone-website@hyerin-skills
claude plugin install ai-slop-thresher@hyerin-skills
claude plugin install riverlog-knowledge@hyerin-skills
```

이 경우 명령어는 `/daily-log:daily-log`처럼 플러그인 이름이 앞에 붙습니다.

## 전역 CLAUDE.md 설정

`/riverlog-knowledge`가 개발 작업마다 자동으로 쓰이도록 새 기기의 `~/.claude/CLAUDE.md` 끝(OMC 마커 바깥)에 아래를 추가합니다.

```markdown
## riverlog 지식 창고
개발 작업(구현·설계·디버깅·리뷰·기술 선택)을 시작할 때는 항상 `/riverlog-knowledge` 스킬로 riverlog 지식 창고(`~/Projects/riverlog/content/knowledge`, 없으면 github.com/HerrineKim/riverlog)에서 관련 노트를 먼저 찾아 참고한다. 노트의 관례·주의점은 따르되, API·버전 정보는 공식 문서와 현재 코드가 우선이다.
```

## 기기 이름

노션 기록 블록에는 기기 이름이 붙고, 재실행 시 같은 기기의 마지막 기록 이후만 추가합니다.
기본값은 호스트 이름이며 `DAILY_LOG_MACHINE` 환경변수로 바꿀 수 있습니다(예: `~/.zshrc`에 `export DAILY_LOG_MACHINE=회사맥`).

## 한계

- Claude Code(CLI·데스크톱 Code 탭) 기록만 읽습니다. claude.ai 웹/앱의 일반 채팅은 로컬에 남지 않아 수집되지 않습니다.
- Claude 기록은 각 맥북 로컬에만 있으므로, 맥북마다 한 번씩 실행해야 그 기기의 작업이 기록됩니다.
