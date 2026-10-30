# jscpd

중복 코드 탐지 jscpd 사용법과 DRY 리팩터링·코드베이스 비교·마이그레이션·정리 스킬 5개(jscpd CLI 별도 설치)

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (5개)

### `/code-migration`

Move code from one implementation to another function by function, tests first and code second, and check two implementations of one app for parity, with jscpd --compare as the progress measure and a coverage map binding each function to its tests. Use when porting a library or app to another language or framework (Java to Kotlin, JavaScript to Rust, a Python library to TypeScript, an iOS app to Android), when asked what is left to port, or when comparing the Android and iOS versions of an app.

- 호출: `/code-migration` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [kucherenko/jscpd](https://github.com/kucherenko/jscpd/tree/HEAD/skills/code-migration)
- 이 레포 사본: [`plugins/jscpd/skills/code-migration/SKILL.md`](../../plugins/jscpd/skills/code-migration/SKILL.md)

### `/codebase-refactoring`

Three-part workflow to improve overall codebase health with jscpd — find and fix duplicated code, find and remove or refactor dead code, then find and simplify the largest/most complex files. Starts from --dashboard/--health to prioritize and ends by re-measuring the score.

- 호출: `/codebase-refactoring` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [kucherenko/jscpd](https://github.com/kucherenko/jscpd/tree/HEAD/skills/codebase-refactoring)
- 이 레포 사본: [`plugins/jscpd/skills/codebase-refactoring/SKILL.md`](../../plugins/jscpd/skills/codebase-refactoring/SKILL.md)

### `/compare-codebases`

Compare two folders function by function with jscpd --compare, in the same language or across languages, and explain the result. Use when asked how two codebases relate, which functions one implementation has and the other lacks, how far a port has come, whether the iOS and Android versions of an app match, or which function in one folder corresponds to a function in the other.

- 호출: `/compare-codebases` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [kucherenko/jscpd](https://github.com/kucherenko/jscpd/tree/HEAD/skills/compare-codebases)
- 이 레포 사본: [`plugins/jscpd/skills/compare-codebases/SKILL.md`](../../plugins/jscpd/skills/compare-codebases/SKILL.md)

### `/dry-refactoring`

Guided workflow to eliminate copy-paste duplication detected by jscpd. Refactor exact, renamed and near-miss clones using extract function, parameterize, module, constant, or base class strategies, starting from the hotspots the summary ranks.

- 호출: `/dry-refactoring` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [kucherenko/jscpd](https://github.com/kucherenko/jscpd/tree/HEAD/skills/dry-refactoring)
- 이 레포 사본: [`plugins/jscpd/skills/dry-refactoring/SKILL.md`](../../plugins/jscpd/skills/dry-refactoring/SKILL.md)

### `/jscpd`

Copy-paste detector for 220+ languages. Detect exact, renamed and near-miss duplicated code, measure duplication percentages, and find refactoring hotspots with the codebase summary.

- 호출: `/jscpd` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [kucherenko/jscpd](https://github.com/kucherenko/jscpd/tree/HEAD/skills/jscpd)
- 이 레포 사본: [`plugins/jscpd/skills/jscpd/SKILL.md`](../../plugins/jscpd/skills/jscpd/SKILL.md)
