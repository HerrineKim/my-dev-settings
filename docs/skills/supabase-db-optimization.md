# supabase-db-optimization

Supabase/Postgres 테이블·쿼리·마이그레이션·RLS·인덱스·검색 필터 작업 시 성능·메모리·보안을 점검한다. 출처: HerrineKim/claude-skills(비공개).

## 사용 예
- Supabase 관련 작업을 하면 자동으로 적용
- "이 쿼리 느린데 봐 줘", "검색창 만들어 줘(ILIKE 와일드카드 이스케이프 포함)"

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (1개)

### `/supabase-db-optimization`

Supabase/Postgres DB 작업(테이블·컬럼 생성/수정, 마이그레이션, supabase-js 또는 SQL 쿼리 작성, RLS 정책, 인덱스, 무거운 집계/DB 함수, Storage 조회, 검색창·필터 구현)을 할 때 반드시 이 스킬을 먼저 참고해 성능·메모리·보안을 점검한다. "DB가 느리다 / 메모리가 부족하다 / 쿼리가 무겁다 / 다운됐다" 같은 말이 나올 때, 인덱스·RLS·N+1·페이지네이션을 점검해야 할 때 사용한다. 검색 기능(ILIKE 부분검색, or() 필터)을 만들 때는 와일드카드 이스케이프 규칙(8번)을 반드시 적용한다. 사용자가 명시적으로 "최적화"라고 말하지 않아도 Supabase 테이블이나 쿼리가 관련되면 항상 적용할 것. Use whenever creating or modifying Supabase tables, writing queries (supabase-js or raw SQL), migrations, RLS policies, indexes, or search/filter UI — proactively check indexing, RLS performance, N+1, pagination, heavy aggregation, and memory impact even if the user never says "optimize".

- 호출: `/supabase-db-optimization` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 원조 GitHub: [HerrineKim/claude-skills](https://github.com/HerrineKim/claude-skills/tree/HEAD/skills/supabase-db-optimization)
- 이 레포 사본: [`plugins/supabase-db-optimization/skills/supabase-db-optimization/SKILL.md`](../../plugins/supabase-db-optimization/skills/supabase-db-optimization/SKILL.md)
