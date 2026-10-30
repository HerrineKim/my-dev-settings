# notebooklm-wiki-pipeline

/pdf-to-wiki: Drive PDF를 NotebookLM MCP로 읽혀 Obsidian Wiki 노트로 저장(nlm CLI·MCP 별도 설치)

## 준비 (맥마다 한 번)

`install.sh`가 `uv tool install notebooklm-mcp-cli`로 `nlm`을 받고 `nlm setup add claude-code`로 MCP `gemini-notebook-mcp`를 user 스코프에 등록합니다. 나머지는 직접:

1. `nlm login`: 브라우저로 Google 계정 인증. 쿠키 기반이라 2~4주마다 다시 해야 함(`nlm login --check`로 확인)
2. claude.ai → Settings → Connectors에서 Google Drive 연결(파일명·ID 확인용, 본문은 읽지 않음)
3. 주제별 노트북을 재사용하려면 registry를 만들어 노트북 ID를 채움

```bash
mkdir -p ~/.config/pdf-to-wiki
cp ~/.claude/skills/pdf-to-wiki/config/notebooks.example.json ~/.config/pdf-to-wiki/notebooks.json
```

- 저장 위치: `~/Documents/Obsidian Vault/AI_Generated`. 바꾸려면 `export PDF_TO_WIKI_OUTPUT_DIR=...`
- NotebookLM Free tier는 쿼리 하루 약 50회
- MCP가 비공식 NotebookLM 내부 API 기반이라 깨질 수 있음. 이상하면 `nlm doctor`, `uv tool upgrade notebooklm-mcp-cli`
- 원문 사용 문서: [`docs/upstream/notebooklm-wiki-pipeline/README.ko.md`](../upstream/notebooklm-wiki-pipeline/README.ko.md)

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (1개)

### `/pdf-to-wiki`

Google Drive의 대용량 PDF를 Claude 컨텍스트에 넣지 않고 NotebookLM(MCP)이 읽게 한 뒤, 분석 결과만 받아 Obsidian Wiki 노트로 저장한다. 주제별 NotebookLM 노트북을 재사용하되 질의는 대상 PDF source 하나로 한정한다. "PDF를 위키 노트로", "드라이브 PDF 정리", "NotebookLM으로 요약해서 옵시디언에" 요청에 사용.

- 호출: `/pdf-to-wiki <drive_url_or_file_id> [wiki_title] [--topic topic_id]` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `config/`, `scripts/`
- 원조 GitHub: [capitalparser/notebooklm-wiki-pipeline](https://github.com/capitalparser/notebooklm-wiki-pipeline/tree/HEAD/commands/pdf-to-wiki.md)
- 이 레포 사본: [`plugins/notebooklm-wiki-pipeline/skills/pdf-to-wiki/SKILL.md`](../../plugins/notebooklm-wiki-pipeline/skills/pdf-to-wiki/SKILL.md)
