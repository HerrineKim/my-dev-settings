# android-reverse-engineering

APK·XAPK·JAR·AAR을 jadx(또는 Vineflower)로 디컴파일하고, UI에서 네트워크 계층까지 호출 흐름을 따라가 앱이 쓰는 HTTP API(Retrofit·OkHttp·Volley)를 정리한다. 출처: [SimoneAvogadro/android-reverse-engineering-skill](https://github.com/SimoneAvogadro/android-reverse-engineering-skill) (Apache-2.0). 원문 README: [`../upstream/android-reverse-engineering/README.md`](../upstream/android-reverse-engineering/README.md)

## 준비
`apps/Brewfile`에 들어 있다(`apps-sync`로 설치).

| 도구 | 필수 | 설치 |
|---|---|---|
| Java 17+ | 필수 | `brew install openjdk@17` |
| jadx | 필수 | `brew install jadx` |
| Vineflower | 선택(복잡한 Java 코드 출력 개선) | `brew install vineflower` |
| dex2jar | 선택(APK에 Vineflower 쓸 때) | `brew install dex2jar` |
| apktool | 선택(리소스 디코딩) | `brew install apktool` |
| adb | 선택(기기에서 APK 꺼내기) | `brew install --cask android-platform-tools` |

점검: `bash ~/.claude/skills/android-reverse-engineering/scripts/check-deps.sh`

## 사용 예
- "~/Downloads/app.apk 디컴파일해서 쓰는 API 엔드포인트 정리해 줘"
- "로그인 버튼부터 네트워크 호출까지 흐름 따라가 줘"

`/decompile` 커맨드는 `${CLAUDE_PLUGIN_ROOT}`를 써서 플러그인으로 설치했을 때만 생긴다. 심볼릭 링크 설치에서는 위처럼 자연어로 요청하면 스킬이 같은 스크립트를 쓴다.

본인 소유이거나 분석 권한이 있는 앱에만 쓴다.

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (1개)

### `/android-reverse-engineering`

Decompile Android APK, XAPK, JAR, and AAR files using jadx or Fernflower/Vineflower. Reverse engineer Android apps, extract HTTP API endpoints (Retrofit, OkHttp, Volley), and trace call flows from UI to network layer. Use when the user wants to decompile, analyze, or reverse engineer Android packages, find API endpoints, or follow call flows. 中文触发词：反编译APK、安卓逆向、提取API、分析安卓应用、反编译安卓、逆向工程、追踪调用链、提取接口

- 호출: `/android-reverse-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`, `scripts/`
- 원조 GitHub: [SimoneAvogadro/android-reverse-engineering-skill](https://github.com/SimoneAvogadro/android-reverse-engineering-skill/tree/HEAD/plugins/android-reverse-engineering/skills/android-reverse-engineering)
- 이 레포 사본: [`plugins/android-reverse-engineering/skills/android-reverse-engineering/SKILL.md`](../../plugins/android-reverse-engineering/skills/android-reverse-engineering/SKILL.md)
