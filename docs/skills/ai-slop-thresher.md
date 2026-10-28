# ai-slop-thresher

한국어 초안의 상투어·과잉 설명·반복 수사·장식 서식을 덜어내 윤문한다. 사실·조건·유보·말투는 보존. 출처: [Burntgogi/ai-slop-thresher](https://github.com/Burntgogi/ai-slop-thresher) (Apache-2.0). 원문 README: [`../upstream/ai-slop-thresher/README.md`](../upstream/ai-slop-thresher/README.md)

## 사용 예
- `/ai-slop-thresher` + 붙여 넣은 초안
- `/thresh` (단축 호출, 직접 불렀을 때만 동작)
- "이 글 AI 티 좀 빼 줘"

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (2개)

### `/ai-slop-thresher`

AI Slop 탈곡기. 한국어 초안의 상투어, 과잉 설명, 반복 수사와 장식 서식을 줄여 자연스럽게 윤문한다. 탈곡기, 휴머나이저, AI 티 줄이기, 사람 글처럼 다듬기, 번역투 개선, 앞 문장을 불필요하게 부정하거나 문제를 축소하는 재정의 표현의 개선을 요청할 때 사용한다. 원문의 정정·책임·조건·유보와 저자의 평가는 보존한다. 단순 맞춤법 검사와 내용 확장은 주된 용도가 아니다.

- 호출: `/ai-slop-thresher [다듬을 글 또는 파일 경로]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `references/`
- 원조 GitHub: [Burntgogi/ai-slop-thresher](https://github.com/Burntgogi/ai-slop-thresher/tree/HEAD/plugins/ai-slop-thresher/skills/ai-slop-thresher)
- 이 레포 사본: [`plugins/ai-slop-thresher/skills/ai-slop-thresher/SKILL.md`](../../plugins/ai-slop-thresher/skills/ai-slop-thresher/SKILL.md)

### `/thresh`

AI Slop 탈곡기의 짧은 호출 이름. 사용자가 thresh를 직접 불러($thresh, /thresh 등) 한국어 글의 AI 말투·과잉 설명·불필요한 부정과 재정의 표현을 다듬도록 요청할 때만 사용하며 ai-slop-thresher의 지침을 적용한다. 호출 문법은 하네스에 따른다. 이름 없이 윤문을 요청하면 이 스킬 대신 ai-slop-thresher를 사용한다.

- 호출: `/thresh [다듬을 글 또는 파일 경로]` (직접 불렀을 때만 동작)
- 원조 GitHub: [Burntgogi/ai-slop-thresher](https://github.com/Burntgogi/ai-slop-thresher/tree/HEAD/plugins/ai-slop-thresher/skills/thresh)
- 이 레포 사본: [`plugins/ai-slop-thresher/skills/thresh/SKILL.md`](../../plugins/ai-slop-thresher/skills/thresh/SKILL.md)
