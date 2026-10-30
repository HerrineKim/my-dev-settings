
## 전역 실행: 경로와 도구 이름 (먼저 수행)

이 스킬은 어느 프로젝트에서 불러도 아래 값을 쓴다. 원문 절차에 나오는 상대 경로·도구 이름은 이 값으로 바꿔 읽는다.

- `SKILL_DIR`: 이 SKILL.md가 있는 폴더(`~/.claude/skills/pdf-to-wiki`). 원문의 `scripts/notebook_registry.py`, `config/notebooks.example.json`은 이 폴더 기준이다.
- `OUTPUT_DIR`: `$PDF_TO_WIKI_OUTPUT_DIR`, 없으면 `~/Documents/Obsidian Vault/AI_Generated`. 원문의 `~/vault/00_Wiki/`는 `OUTPUT_DIR`이 속한 vault 루트로 읽는다. 폴더가 없으면 `mkdir -p`로 만든다.
- `REGISTRY`: `$PDF_TO_WIKI_REGISTRY`, 없으면 `~/.config/pdf-to-wiki/notebooks.json`, 그것도 없으면 `SKILL_DIR/config/notebooks.example.json`. 노트북 ID가 들어가는 개인 파일이므로 레포 안에 만들지 않는다. helper는 항상 `--registry "$REGISTRY"`로 부른다(기본값이 현재 폴더 기준이라).

```bash
SKILL_DIR=~/.claude/skills/pdf-to-wiki
REGISTRY="${PDF_TO_WIKI_REGISTRY:-$HOME/.config/pdf-to-wiki/notebooks.json}"
[ -f "$REGISTRY" ] || REGISTRY="$SKILL_DIR/config/notebooks.example.json"
python3 "$SKILL_DIR/scripts/notebook_registry.py" "{drive_url_or_file_id}" --title "{wiki_title}" --registry "$REGISTRY"
```

- NotebookLM 도구: `nlm setup add claude-code`가 등록한 MCP 서버 `gemini-notebook-mcp`의 `notebook_create`·`source_add`·`notebook_query` 등. 도구가 안 보이면 `claude mcp list`로 연결을 확인하고, 인증 오류면 사용자에게 터미널에서 `nlm login`을 실행해 달라고 한다.
- Google Drive 도구: 원문의 `mcp__claude_ai_Google_Drive__*`는 claude.ai Google Drive 커넥터의 같은 이름 도구(`get_file_metadata`, `search_files`)를 뜻한다. `download_file_content`·`read_file_content`로 PDF 본문을 읽지 않는다.
