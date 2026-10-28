# figma-artifact-import

HTML 프로토타입(아티팩트·웹앱) 화면 수십~수백 개를 Figma MCP로 편집 가능한 레이어로 옮긴다. 직접 만든 스킬.

## 준비
- claude.ai Figma 커넥터(또는 Figma MCP)
- Pretendard 치환을 쓰려면 스킬 폴더의 로컬 Figma 플러그인(`figma-ds-font-swap/`)을 Figma 데스크톱에서 개발 플러그인으로 불러온다

## 사용 예
- "이 아티팩트 화면들 Figma 파일 <URL>로 옮겨 줘"

PNG 데이터 채널, 디자인 시스템 색 치환, 변환 버그 검수 체크리스트는 SKILL.md에 있다.

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (1개)

### `/figma-artifact-import`

HTML 프로토타입(Claude 아티팩트, 정적 HTML, 로컬 웹앱)의 화면 수십~수백 개를 Figma MCP로 Figma 파일에 편집 가능한 레이어로 옮길 때 쓴다. use_figma 50k 코드 제한·fetch 없음을 PNG 데이터 채널로 우회하고, 디자인 시스템 색 치환·글꼴 문제·변환 버그 검수까지 다룬다. "아티팩트를 피그마에 반영", "HTML을 피그마로", "화면 전부 피그마로 옮겨", "프로토타입을 정본으로 피그마 갱신" 요청에 사용.

- 호출: `/figma-artifact-import` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `figma-ds-font-swap/`, `figma-font-swap/`, `scripts/`
- 원조 GitHub: [HerrineKim/my-dev-settings](https://github.com/HerrineKim/my-dev-settings/tree/HEAD/plugins/figma-artifact-import/skills/figma-artifact-import) (이 레포에서 만듦)
- 이 레포 사본: [`plugins/figma-artifact-import/skills/figma-artifact-import/SKILL.md`](../../plugins/figma-artifact-import/skills/figma-artifact-import/SKILL.md)
