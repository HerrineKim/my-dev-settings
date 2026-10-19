# my-dev-settings

맥마다 맞춰 두는 개발 환경 설정. Claude Code 스킬과 설치 앱 목록(`apps/Brewfile`)이 들어 있습니다.

> 예전 이름은 `my-claude-skills`입니다. 이미 받아 둔 맥은 아래 [이름 변경 후 옮기기](#이름-변경-후-옮기기)를 보세요.

## Claude Code 스킬

| 스킬 | 설명 |
|---|---|
| `/daily-log` | 오늘(00:00~실행 시각) Claude Code 작업 + GitHub 반영 내역을 노션 "2026 데일리 업무 회고"에 기록. 날짜당 페이지 1개, 재실행 시 이어 쓰기. 다른 맥북에서 한 Claude 작업도 iCloud Drive로 모아 함께 기록 |
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
| `/error-message-ko` | toast·alert·에러 상태·`HTTPException(detail)` 등 사용자에게 보이는 에러 문구를 쓸 때 원문 노출 없이 한국어로 안내 |
| `/supabase-db-optimization` | Supabase 테이블·쿼리·마이그레이션·RLS·인덱스·검색 필터 작업 시 성능·메모리·보안 점검 |
| `/make-interfaces-feel-better` | 애니메이션·hover·그림자·테두리·타이포·아이콘 등 UI 디테일 다듬기 원칙 |
| `/note` | 어느 프로젝트에서든 자료(글·URL·파일)를 riverlog 지식 창고 노트로 재구성해 넣고 인덱스·링크까지 갱신. `~/Projects/riverlog`(또는 `$RIVERLOG_DIR`)에서 작업 |
| `/riverlog-knowledge` | 개발 작업 전에 [riverlog](https://github.com/HerrineKim/riverlog) 지식 창고에서 관련 노트를 찾아 참고. 로컬 사본이 없으면 `~/.cache/riverlog`로 받아 옴 |

`/daily-log`, `/tdd-tidy-first`, `/riverlog-knowledge`는 직접 만든 스킬이고, 나머지는 외부 스킬을 `plugins/` 아래에 벤더링한 것입니다(출처는 아래).

## 외부 스킬 출처와 업데이트

| 플러그인 | 출처 |
|---|---|
| `ui-ux-pro-max` (7개 스킬) | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) |
| `frontend-design` | [anthropics/claude-code](https://github.com/anthropics/claude-code/tree/main/plugins/frontend-design) |
| `web-design-guidelines` | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| `clone-website` | [julianromli/ai-skills](https://github.com/julianromli/ai-skills/tree/main/skills/clone-website) |
| `make-interfaces-feel-better` | [jakubkrehel/make-interfaces-feel-better](https://github.com/jakubkrehel/make-interfaces-feel-better) (MIT) |
| `error-message-ko`, `supabase-db-optimization` | [HerrineKim/claude-skills](https://github.com/HerrineKim/claude-skills) (비공개 팀 레포, `gh auth` 필요) |
| `note` | [HerrineKim/riverlog](https://github.com/HerrineKim/riverlog/tree/main/.claude/skills/note) — 벤더링 때 `plugins/note/global-preamble.md`(레포 위치 찾기)를 앞에 끼워 넣음 |
| `ai-slop-thresher` (2개 스킬) | [Burntgogi/ai-slop-thresher](https://github.com/Burntgogi/ai-slop-thresher) (Apache-2.0) |

최신 버전으로 다시 받으려면 `./vendor.sh` 실행 후 `git diff`를 확인하고 커밋합니다.

## 설치된 스킬 보기

```bash
skills-ls            # 전역 스킬 전체: ~/.claude/skills, claude.ai 동기화 스킬, user 플러그인 스킬
skills-ls supabase   # 이름·설명에 키워드가 들어간 것만
```

`install.sh`가 `bin/skills-ls`를 `~/.local/bin`에 링크합니다.

## 새 맥북에 설치

```bash
git clone https://github.com/HerrineKim/my-dev-settings.git ~/Projects/my-dev-settings
~/Projects/my-dev-settings/install.sh
apps-sync   # 앱 설치(아래 '앱 맞추기')
```

`install.sh`는 스킬을 심볼릭 링크하고, `/daily-log`용 훅(Stop·SessionEnd·SessionStart)을 `~/.claude/settings.json`에 등록하고, iCloud Drive에 공유 폴더(`claude-daily-log/transcripts/<기기명>/`)를 만든다. 이 훅이 각 맥북의 Claude 기록을 공유 폴더에 복사해 두므로, `/daily-log`를 어느 맥북에서 돌려도 모든 기기의 작업이 들어간다. **쓰는 맥북마다** `install.sh`를 한 번씩 돌려야 한다.

필요한 것
- **iCloud Drive**(기기 간 기록 공유용). 다른 공유 폴더를 쓰려면 `plugins/daily-log/skills/daily-log/config.json`의 `shared_dir`를 바꾼다
- **GitHub CLI**: `brew install gh && gh auth login`
- **Notion**: claude.ai 계정의 Notion 커넥터(계정에 붙어 있어 기기마다 따로 설정할 필요 없음)
- Python 3 (macOS 기본 포함, 외부 패키지 없음)

업데이트: `git -C ~/Projects/my-dev-settings pull` — 스킬은 심볼릭 링크라 바로 반영됩니다.

### 플러그인으로 설치하는 방법(대안)

`install.sh`(심볼릭 링크)와 플러그인 설치를 한 기기에서 함께 쓰지 않는다. daily-log 훅이 두 번 등록되어 기록 복사가 중복 실행된다.

```bash
claude plugin marketplace add HerrineKim/my-dev-settings
claude plugin install daily-log@hyerin-skills
claude plugin install tdd-tidy-first@hyerin-skills
claude plugin install ui-ux-pro-max@hyerin-skills
claude plugin install frontend-design@hyerin-skills
claude plugin install web-design-guidelines@hyerin-skills
claude plugin install clone-website@hyerin-skills
claude plugin install ai-slop-thresher@hyerin-skills
claude plugin install riverlog-knowledge@hyerin-skills
claude plugin install error-message-ko@hyerin-skills
claude plugin install supabase-db-optimization@hyerin-skills
claude plugin install make-interfaces-feel-better@hyerin-skills
claude plugin install note@hyerin-skills
```

이 경우 명령어는 `/daily-log:daily-log`처럼 플러그인 이름이 앞에 붙습니다.

## 앱 맞추기

설치할 앱은 `apps/Brewfile` 한 곳에 적습니다. Homebrew 앱·CLI와 App Store 앱(`mas`)이 들어 있고, 어느 쪽으로도 설치할 수 없는 앱은 `apps/manual.md`에 적습니다.

```bash
apps-sync          # 이 맥에 없는 앱 설치. dmg로 직접 깔아 둔 앱은 지우지 않고 Homebrew 관리로 넘김(--adopt)
apps-sync check    # 없는 앱만 보여 주고 설치하지 않음
apps-sync diff     # 이 맥에는 있는데 Brewfile에 없는 brew·App Store 앱
```

새 앱을 깔았으면 `apps-sync diff`로 나온 줄을 `apps/Brewfile`에 옮기고 커밋·푸시합니다. 다른 맥에서는 `git pull` 후 `apps-sync`를 실행하면 같아집니다. App Store 앱은 App Store에 로그인돼 있어야 설치됩니다. 은행·공공 사이트 보안 프로그램은 사이트가 알아서 설치하므로 목록에서 뺐습니다.

`install.sh`가 `bin/apps-sync`를 `~/.local/bin`에 링크합니다.

## 이름 변경 후 옮기기

`my-claude-skills`로 받아 둔 맥에서는 한 번만 아래를 실행합니다. GitHub가 옛 주소를 새 주소로 넘겨 주지만, 폴더 이름과 링크까지 맞추려면 필요합니다.

```bash
mv ~/Projects/my-claude-skills ~/Projects/my-dev-settings
~/Projects/my-dev-settings/install.sh
```

`install.sh`가 git remote를 새 주소로 바꾸고, 스킬 링크를 새 폴더로 다시 걸고, `~/.claude/CLAUDE.md`의 옛 import 블록을 새 블록으로 바꿉니다. 플러그인 방식으로 설치했다면 `claude plugin marketplace add HerrineKim/my-dev-settings`로 다시 추가합니다.

## 전역 CLAUDE.md 설정

모든 프로젝트에 적용할 공통 지시는 `global-claude.md`에 있습니다. `install.sh`가 `~/.claude/CLAUDE.md` 끝에 이 파일을 불러오는 `@…/global-claude.md` 한 줄(마커로 감싼 블록)을 한 번만 추가하므로, 이후 내용 수정은 `git pull`만으로 반영됩니다.

## 기기 이름

노션 기록 블록에는 기기 이름이 붙고, 재실행 시 같은 기기의 마지막 기록 이후만 추가합니다.
기본값은 호스트 이름이며 `DAILY_LOG_MACHINE` 환경변수로 바꿀 수 있습니다(예: `~/.zshrc`에 `export DAILY_LOG_MACHINE=회사맥`).

## 한계

- Claude Code(CLI·데스크톱 Code 탭) 기록만 읽습니다. claude.ai 웹/앱의 일반 채팅은 로컬에 남지 않아 수집되지 않습니다.
- Claude 기록은 각 맥북 로컬에만 있으므로, 맥북마다 한 번씩 실행해야 그 기기의 작업이 기록됩니다.
