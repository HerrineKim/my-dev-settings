---
name: figma-artifact-import
description: HTML 프로토타입(Claude 아티팩트, 정적 HTML, 로컬 웹앱)의 화면 수십~수백 개를 Figma MCP로 Figma 파일에 편집 가능한 레이어로 옮길 때 쓴다. use_figma 50k 코드 제한·fetch 없음을 PNG 데이터 채널로 우회하고, 디자인 시스템 색 치환·글꼴 문제·변환 버그 검수까지 다룬다. "아티팩트를 피그마에 반영", "HTML을 피그마로", "화면 전부 피그마로 옮겨", "프로토타입을 정본으로 피그마 갱신" 요청에 사용.
---

# HTML 화면 → Figma 대량 반영 (Figma MCP)

taply-pg-front(2026-10)에서 v4 아티팩트 77화면 × 데스크톱/모바일 = 프레임 155개를 Figma로 옮기며 정리한 방법과 시사점이다. `scripts/`는 그때 쓴 참고 구현이다. 대상 앱 구조에 맞게 고쳐 쓴다.

## 언제 이 방법을 쓰나
- 화면이 많고(대략 10개 이상) 원본이 브라우저에서 렌더되는 HTML일 때.
- 몇 화면뿐이면 `/figma-use` + `/figma-generate-design`로 컴포넌트를 써서 손으로 짓는 게 낫다(디자인 시스템 인스턴스로 연결됨).
- 결과물은 절대 좌표 프레임 트리 + 페이지별 아이콘 컴포넌트다. 오토 레이아웃·DS 컴포넌트 인스턴스로 연결되지는 않는다. 필요하면 사용자에게 이 한계를 먼저 말한다.

## 파이프라인
1. **렌더**: `scripts/run.mjs` — playwright-core + 로컬 Chrome(`channel:'chrome'`)으로 각 화면을 열고, 스크롤 영역을 펼쳐 전체 높이로 만든 뒤 `ser.js`로 직렬화. 참고 PNG도 같이 찍는다. 화면 전환은 원본 앱의 함수(예: `openEntry(i)`, `dev='m'`)를 `page.evaluate` 문자열로 호출.
2. **직렬화**: `scripts/ser.js` — DOM → `{t:'F'|'T'|'S'|'I', x,y,w,h, ...}` 트리. 배경·테두리·그림자가 있는 요소만 프레임으로 남기고 투명 래퍼는 납작하게 편다.
3. **포장**: `scripts/pngpack.js` — JSON 바이트를 RGBA PNG에 **stored(level 0) deflate**로 담는다. Figma가 원본 바이트를 그대로 보관하므로(imageHash = 파일 SHA1) 샌드박스에서 inflate 없이 풀 수 있다.
4. **업로드**: `upload_assets(count≤60)`로 1회용 URL을 받고 `scripts/up.sh`로 curl POST. 해시는 로컬에서 SHA1로 계산하므로 응답을 기다릴 필요가 없다. URL은 10분 안에 써야 한다.
5. **빌드**: `scripts/builder.js` — `const JOBS=[{h,name,x,y}],PAGE,IMPORT_PAGE,IMGH` 한 줄을 앞에 붙여 `use_figma`로 실행. 한 번에 ~220KB 데이터(6~12프레임). 같은 이름 프레임은 지우고 다시 만든다.
6. **배치**: 서브에이전트(sonnet)에 페이지별로 배치를 나눠 맡기면 병렬로 빠르다. "JOBS 줄 + builder.js(첫 줄 제외)를 그대로 복사"만 시킨다.
7. **정리**: 임시 데이터 페이지 삭제, 페이지 라벨·설명 섹션 추가.

## 꼭 알아야 할 제약 (실제로 부딪힌 것)
- `use_figma`에는 **fetch가 없다**, 코드는 **50k자 제한**. 데이터를 코드에 붙여 넣으면 출력 토큰이 폭발하고 LLM이 base64를 옮겨 적다 틀린다 → PNG 채널을 쓴다.
- `figma.getImageByHash(h)`는 **이미지가 있는 페이지로 먼저 `setCurrentPageAsync`** 해야 null이 아니다. 빌더는 임시 페이지에서 바이트를 다 읽은 뒤 대상 페이지로 넘어간다.
- **MCP는 서버에서 실행돼 로컬 글꼴을 못 본다.** Pretendard처럼 Google Fonts에 없는 글꼴은 Mac에 설치해도, Figma를 재시작해도 `loadFontAsync`가 실패한다. 해법: Noto Sans KR의 다른 굵기를 표식으로 넣고(500→Medium, 600→Bold, 700→Black) `figma-font-swap/` 로컬 플러그인으로 데스크톱 앱에서 일괄 치환. (Figma → Plugins → Development → Import plugin from manifest → 실행)
  - 디자인 시스템처럼 Noto Sans KR이 표식이 아니라 진짜 글꼴인 파일은 `figma-ds-font-swap/`을 쓴다. 굵기를 그대로 옮기고(Bold → Bold), 글꼴 변수(FONT_FAMILY · FONT_STYLE)와 텍스트 스타일까지 바꾼다. 표식 파일에 쓰면 Bold가 SemiBold로 안 바뀌니 둘을 섞지 않는다.
  - Figma의 Noto Sans KR에는 SemiBold가 없다(Thin · Light · DemiLight · Regular · Medium · Bold · Black). 기존 Pretendard 글자를 MCP로 다시 만들 때는 SemiBold → Bold, Bold → Black 표식으로 넣는다.
- **렌더 글꼴 = 최종 글꼴**이어야 한다. 위치를 Pretendard 폭으로 재고 Noto로 그리면 글자끼리 겹치고 "·" 간격이 무너진다. 최종 글꼴(치환 후)로 렌더한다.
- 폰트 링크 때문에 `load` 이벤트가 안 올 수 있다 → `waitUntil:'domcontentloaded'` + `document.fonts.ready`에 타임아웃.
- 문구 치환(예: em dash)을 HTML 소스 전체에 `replaceAll` 하면 JS가 깨져 페이지가 멈출 수 있다 → 직렬화 단계에서 글자 단위로 바꾼다.
- `zsh`에서 `for u in $U`는 단어 분리가 안 된다 → bash 스크립트로.

## 직렬화에서 놓치기 쉬운 것 (검수에서 실제로 나온 버그)
- **한쪽 테두리 색**: 두께 0인 면의 `border-color`는 글자색(거의 검정)이다. 두께 > 0인 면의 색만 쓴다. 안 그러면 표 구분선이 전부 검게 나온다.
- **`display:contents`**: `checkVisibility()`가 false를 돌려준다. contents면 그 검사를 건너뛴다(dl 그리드 행이 통째로 빠짐).
- **접힌 `<details>`**: 숨은 내용이 그려진다 → `checkVisibility({contentVisibilityAuto:true, visibilityProperty:true})`로 거른다.
- **가상 요소**: 높이 0 + `border-top: dashed`인 절취선, `radial-gradient(circle at …)`로 판 반원 홈, 회전한 두 면 테두리로 그린 꺾쇠(▾), 인라인 상태 점(●)은 따로 처리한다. 점은 글자 첫 줄 바로 앞에 붙이되, 부모가 flex면 `column-gap`만큼 띄운다(칸 왼쪽 기준이면 오른쪽 정렬 글과 겹치고, gap을 빼먹으면 점이 글자에 붙음).
- **그리기 순서**: `position` 있는 요소(드롭다운·메뉴·툴팁)는 형제 중 뒤에 그린다(z-index 순). 그래도 부모(사이드바·헤더) 밖으로 튀어나온 팝오버는 뒤에 오는 형제 영역에 덮인다 → 빌드 후 그림자 있는 오버레이 중 부모 밖으로 넘친 것은 화면 최상위로 꺼내 맨 앞에 둔다.
- **그라데이션**: 단색이 아니면 배경으로 칠하지 않는다(차트 격자가 회색 판이 됨). 딱 끊기는 `linear-gradient`(진행 막대)는 구간 사각형으로.
- **줄바꿈**: 브라우저가 실제로 끊은 위치에 `\n`을 넣고 Figma는 자동 너비로 둔다(Figma는 한국어 `keep-all`을 모른다).
- **말줄임**: 범위 rect는 잘린 뒤가 아니라 전체 폭이다 → `text-overflow: ellipsis`면 요소 안쪽 폭으로 자르고 `textTruncation='ENDING'`.
- **회전**: 측정 전에 `transform`을 풀고 각도를 기록, Figma에서 중심 기준으로 `rotation`·위치를 되돌린다.
- `list-style` 글머리 점, `<img>`의 배경·테두리, monospace 글꼴(→ IBM Plex Mono)도 따로 챙긴다.
- 비밀번호 입력은 값 대신 `•`로.

## 디자인 시스템 색으로 바꿀 때
- 원본 색을 DS 토큰으로 옮기는 규칙을 먼저 사용자와 정한다(예: "레이아웃은 아티팩트, 색은 DS").
- 브랜드 역할(주요 버튼, 선택 컨트롤, 포커스, 차트 강조)만 CSS 오버라이드로 브랜드 색을 준다. 배지·카운트·활성 내비까지 파랑으로 칠하면 촌스러워진다.
- 무채색은 직렬화에서 DS 회색 축으로 옮기고, 선은 아주 연한 회색(#E5E8EB, 컨트롤 테두리 #D1D6DB)으로 일괄 완화한다.
- 하드코딩된 차트 색(JS 안 배열 등)은 소스 문자열을 패치한다.

## 검수
- 빌드 뒤 반드시 원본 PNG와 Figma 스크린샷을 프레임마다 비교한다. 페이지별로 opus 서브에이전트를 나눠 "의도된 차이(글꼴·회색 톤)는 빼고, 빠짐·겹침·잘림·순서·색 역할만" 보고하게 한다. 원인 추정까지 묶어서 받으면 변환기를 한 번에 고칠 수 있다.
- 고친 뒤에는 **내용이 바뀐 화면만** 다시 올린다: 새 JSON과 이전 JSON을 비교해 바뀐 해시만 업로드·빌드.
- 빌드 후 추가 작업(둥근 숫자 배지 같은 후처리)은 재빌드하면 사라진다. 후처리 스크립트를 따로 두고 다시 돌린다.

## 사용자와 일할 때
- 오래 걸리는 작업이다. 단계마다 한두 문장으로 진행 상황을 알린다.
- 기존 페이지는 "(이전 v1)"로 이름을 바꿔 보존하고, 사용자가 지우라고 할 때 지운다.
- 문서·UI 문구에 em dash를 쓰지 않는다.
