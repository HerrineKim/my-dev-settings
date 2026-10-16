
## 전역 실행: riverlog 레포 위치 (먼저 수행)

이 스킬은 어느 프로젝트에서 불러도 riverlog 레포에서 작업한다. 아래 순서로 처음 존재하는 경로를 `RL`로 정한다.

1. `$RIVERLOG_DIR`
2. `~/Projects/riverlog`
3. 둘 다 없으면 받아 온다: `gh repo clone HerrineKim/riverlog ~/Projects/riverlog` (`~/.cache/riverlog`는 읽기용 얕은 사본이라 쓰지 않는다)

시작 전에 상태를 확인한다.

```bash
git -C "$RL" status --short --branch   # 다른 사람이 손대던 변경이 있으면 사용자에게 알리고 진행 여부를 묻는다
git -C "$RL" pull --ff-only            # 실패하면 멈추고 보고한다
```

- 아래 본문의 `content/…`, `.claude/skills/note/…`, `next.config.ts` 경로는 모두 `$RL` 기준이다. 셸 작업 디렉터리는 명령마다 초기화될 수 있으므로 셸 명령은 항상 `cd "$RL" && <명령>` 형태로 실행한다(예: `cd "$RL" && node .claude/skills/note/scripts/check-note.mjs content/knowledge/<경로>.md`).
- 단, 재료로 받은 상대 경로 파일(`$ARGUMENTS`)은 `$RL`이 아니라 지금 프로젝트 기준으로 읽는다.
- 파일을 읽고 고칠 때는 `$RL/content/knowledge/…` 절대 경로를 쓴다.
- 커밋·푸시도 `git -C "$RL"`로 한다. 현재 작업 중인 프로젝트 레포에는 아무것도 커밋하지 않는다.
- 현재 프로젝트에서 얻은 재료라도 회사 내부 업무·코드·고객 정보는 노트에 넣지 않는다(사이트는 공개된다). 일반화한 개념만 남긴다.
