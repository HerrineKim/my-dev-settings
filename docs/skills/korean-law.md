# korean-law

법제처 Open API를 쓰는 korean-law MCP 서버로 법령·판례·행정규칙·자치법규·조약·해석례를 조회하고, 조문·판례 인용이 실제로 있는지 검증한다. 스킬은 어떤 MCP 도구를 언제 부를지 안내한다. 출처: [chrisryugj/korean-law-mcp](https://github.com/chrisryugj/korean-law-mcp) (MIT). 원문 README: [`../upstream/korean-law/README.md`](../upstream/korean-law/README.md)

## 준비
- MCP 서버는 `install.sh`가 user 스코프로 등록한다: `claude mcp add -s user --transport http korean-law https://mcp.gomdori.app/law`
- 키 없이 공용 한도로 동작한다. 본인 한도로 쓰려면 [open.law.go.kr](https://open.law.go.kr)에서 인증키(OC)를 무료 발급받아 다시 등록한다:
  ```bash
  claude mcp remove -s user korean-law
  claude mcp add -s user --transport http korean-law https://mcp.gomdori.app/law --header "apikey: 발급받은키"
  ```
- claude.ai 웹·앱에서도 쓰려면 커스텀 커넥터에 `https://mcp.gomdori.app/law?oc=발급받은키` 추가

## 사용 예
- "근로기준법 제74조 알려줘"
- "민법 제750조 관련 판례 찾아서 아직 유효한지 확인해 줘"
- "이 계약서에 인용된 조문들 실제로 있는지 검증해 줘"

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (1개)

### `/korean-law`

Use this skill when the user asks about Korean law through the korean-law MCP server, such as statutes (법령), precedents (판례), administrative rules (행정규칙), local ordinances (자치법규·조례), treaties, legal interpretations, or checking whether article and case citations are real. It explains which tool to call and how to treat the text the tools return.

- 호출: `/korean-law` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [chrisryugj/korean-law-mcp](https://github.com/chrisryugj/korean-law-mcp/tree/HEAD/skills/korean-law)
- 이 레포 사본: [`plugins/korean-law/skills/korean-law/SKILL.md`](../../plugins/korean-law/skills/korean-law/SKILL.md)
