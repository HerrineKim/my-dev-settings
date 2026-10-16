---
name: supabase-db-optimization
description: >
  Supabase/Postgres DB 작업(테이블·컬럼 생성/수정, 마이그레이션, supabase-js 또는 SQL 쿼리 작성,
  RLS 정책, 인덱스, 무거운 집계/DB 함수, Storage 조회, 검색창·필터 구현)을 할 때 반드시 이 스킬을
  먼저 참고해 성능·메모리·보안을 점검한다. "DB가 느리다 / 메모리가 부족하다 / 쿼리가 무겁다 /
  다운됐다" 같은 말이 나올 때, 인덱스·RLS·N+1·페이지네이션을 점검해야 할 때 사용한다.
  검색 기능(ILIKE 부분검색, or() 필터)을 만들 때는 와일드카드 이스케이프 규칙(8번)을 반드시 적용한다.
  사용자가 명시적으로 "최적화"라고 말하지 않아도 Supabase 테이블이나 쿼리가 관련되면 항상 적용할 것.
  Use whenever creating or modifying Supabase tables, writing queries (supabase-js or raw SQL),
  migrations, RLS policies, indexes, or search/filter UI — proactively check indexing, RLS
  performance, N+1, pagination, heavy aggregation, and memory impact even if the user never
  says "optimize".
---

# Supabase DB 최적화 점검 스킬

## 이 스킬을 쓰는 법 (Claude Code에게)

바이브코딩으로 만든 Supabase 앱은 처음엔 잘 돌지만, 데이터와 사용자가 늘면 **인덱스 누락 ·
N+1 쿼리 · 비효율 RLS · 무거운 집계**가 쌓여 DB가 메모리/디스크 I/O를 폭발시키고 다운된다.
이 스킬의 목적은 코드를 만들거나 고칠 때 그 사고를 **미리** 막는 것이다.

따라서 테이블·쿼리·마이그레이션 작업을 할 때는:

1. 아래 **빠른 체크리스트**를 코드에 대고 점검한다.
2. 문제가 보이면 그냥 고치지 말고 **"왜 문제인지" 한 줄로 설명**하고, **고친 코드**를 제시한다.
   (팀원 대부분이 비개발자라, 이유를 알아야 다음엔 스스로 피한다.)
3. 사용자가 "최적화"를 말하지 않아도, DB 관련 작업이면 자동으로 적용한다.

문서 구조: **1~6번은 코드를 쓸 때**, **7·9번은 이미 돌아가는 DB를 진단할 때**, **8번은 검색 기능을
만들 때** 본다. 맨 끝 사고 사례는 각 절이 왜 있는지에 대한 실제 증거다.

---

## 빠른 체크리스트 (코드 작성·리뷰 때 항상)

**인덱스 (→ 1번)**
- [ ] 새 테이블의 모든 **외래키(FK) 컬럼에 인덱스**가 있는가? (Postgres는 FK를 자동 인덱싱하지 않는다)
- [ ] **WHERE / ORDER BY / JOIN**에 쓰는 컬럼에 인덱스가 있는가?
- [ ] **ILIKE 검색**이 `%foo%`(선행 와일드카드)면 trigram 인덱스를 쓰거나 패턴을 바꿨는가?

**쿼리 (→ 2번)**
- [ ] **루프 안에서 쿼리를 돌리지** 않는가? (N+1 → JOIN이나 `IN` 한 번으로)
- [ ] `select('*')` 대신 **필요한 컬럼만** 가져오는가?
- [ ] 목록 조회에 **페이지네이션(`.range()`/limit)** 이 있는가? (전체 fetch 금지)
- [ ] `.range()` 없는 단발 조회가 **PostgREST 1000행 캡**에 조용히 잘릴 수 있지 않은가?
- [ ] 정렬에 **고유 컬럼 타이브레이크**를 붙였는가? (없으면 페이지 경계에서 행이 중복·누락된다)
- [ ] **큰 `IN (...)` 리스트**나 풀스캔 집계를 피했는가?
- [ ] `WHERE`/`ON`/`JOIN`/`lateral` 조건에 **`CASE` 식**을 쓰지 않는가? (CASE 는 인덱스를 못 타게 만든다 → 풀스캔)
- [ ] **`lateral`(상관 서브쿼리) 안에서 다중 조인 뷰**를 참조하지 않는가? (바깥 행마다 뷰 전체를 다시 빌드 = O(행수×뷰비용))

**검색창 입력 (→ 8번)**
- [ ] 검색창 입력을 ILIKE 패턴에 실을 때 `%`·`_`·`\`·`*` 를 **이스케이프**했는가? (안 하면 `%` 한 글자로 전 행이 매칭된다)
- [ ] `or()` 필터 문자열에 값을 꽂을 때 `,`·`(`·`)`·`"` 를 **제거**했는가? (필터 문법이 통째로 깨진다)

**보안 — RLS·권한 (→ 4번, 9번)**
- [ ] 새 테이블에 **RLS를 켜고 정책을 만들었는가?** (기본값 OFF = anon 키로 전체 노출)
- [ ] RLS 정책에서 `auth.uid()`를 **`(select auth.uid())`로 감쌌는가?**
- [ ] **matview 를 만들거나 재생성**했다면 anon·authenticated 권한을 회수했는가? (matview 는 RLS 미적용)
- [ ] `create table ... as select` 로 만든 **백업/임시 테이블**에 RLS 를 켰는가? (기본 OFF + 기본권한 = 공개)
- [ ] `USING (true)` 정책의 **대상 롤**을 확인했는가? (`TO public` 은 anon 을 포함한다)

**집계 (→ 3번)**
- [ ] 요청마다 **무거운 집계를 매번 다시 계산**하지 않는가? (Materialized View/캐시/사전계산)
- [ ] Materialized View **refresh 가 느리면**, REFRESH 가 아니라 **정의 SELECT 를 EXPLAIN ANALYZE** 했는가?

---

## 1. 인덱스 — 가장 큰 레버

**원칙: 자주 조건으로 쓰는 컬럼엔 인덱스. 단, 안 쓰는 인덱스는 쓰기 비용·메모리만 잡아먹으니 정리.**

### 외래키(FK)는 자동 인덱싱되지 않는다
Postgres는 PK엔 자동 인덱스를 만들지만 **FK엔 안 만든다.** 조인·필터가 풀스캔으로 떨어지고,
부모 행 삭제/수정 시 자식 테이블 전체를 훑는다.
```sql
-- attendance_records.site_id 가 sites.id 를 참조하는 FK라면
create index on attendance_records (site_id);
```

### 복합 인덱스는 "등호 먼저, 범위·정렬 나중" 순서
`WHERE site_id = ? ORDER BY created_at` 같은 패턴엔 단일 인덱스 2개보다 **복합 인덱스 1개**가 낫다.
```sql
create index on attendance_records (site_id, created_at);
```

### ILIKE 부분검색은 일반 인덱스를 못 탄다
`col ILIKE '%foo%'` 처럼 **앞에 와일드카드**가 붙으면 B-tree 인덱스를 못 쓰고 풀스캔 + 정렬이 된다.
```sql
-- ❌ emp_no ILIKE '%123%' ORDER BY emp_no  → 풀스캔
-- ✅ 부분일치가 꼭 필요하면 trigram 인덱스
create extension if not exists pg_trgm;   -- ⚠️ public 스키마에 설치한다. extensions 스키마에만
                                          --    두면 gin_trgm_ops 를 못 찾아 인덱스 생성이 실패한다.
create index on gw_persons using gin (emp_no gin_trgm_ops);

-- ✅ 접두일치(앞부터 매칭)로 충분하면 와일드카드를 뒤로
--    emp_no ILIKE '123%'  → 일반 B-tree 인덱스 사용 가능
```
pg_trgm 은 **3글자 이상**부터 인덱스를 탄다 — 2글자 검색은 여전히 Seq Scan 이다.

인덱스와 **별개로**, 검색어를 패턴에 싣는 방법 자체에 함정이 있다 — 사용자가 친 `%` 가 와일드카드로 해석돼 전 행이 매칭된다. → **8번**

### 자주 거르는 조건은 부분(partial) 인덱스로 가볍게
```sql
-- 대부분 재직자만 조회한다면, 재직자만 담는 가벼운 인덱스
create index on gw_persons (emp_no) where not erp_is_retire;
```

### Supabase Advisor를 켜서 자동 진단
대시보드 **Database → Advisors**의 Performance/Security Advisor가 누락 인덱스·비효율 RLS를
자동으로 잡아준다. 주요 항목:

| 항목 | 잡아주는 것 | 관련 절 |
|---|---|---|
| `unindexed_foreign_keys` | FK 인덱스 누락 | 1번, 9-b |
| `auth_rls_initplan` | RLS 함수 미최적화 (`auth.uid()` 미포장) | 4번 |
| `multiple_permissive_policies` | 같은 테이블에 중복 정책 | 4번 |
| `unused_index` / `duplicate_index` | 안 쓰는·중복 인덱스 | 9-c |

**새 기능 만든 뒤 한 번씩 돌려보는 걸 습관화.**

---

## 2. 쿼리 패턴 — 바이브코딩 최대 함정

### N+1 (루프 안 쿼리) — 가장 흔하고 가장 치명적
```js
// ❌ 사이트 수만큼 쿼리가 나간다 (N+1)
for (const site of sites) {
  const { data } = await supabase.from('records').select().eq('site_id', site.id);
}

// ✅ 한 번에 IN 으로
const ids = sites.map(s => s.id);
const { data } = await supabase.from('records').select().in('site_id', ids);

// ✅ 또는 관계형 select 로 조인 (FK가 잡혀 있을 때)
const { data } = await supabase.from('sites').select('*, records(*)');
```

### 필요한 컬럼만 — `select('*')` 지양
```js
// ❌ 안 쓰는 컬럼·대용량 컬럼까지 다 끌어온다
supabase.from('gw_persons').select('*')
// ✅
supabase.from('gw_persons').select('id, emp_no, name, erp_company')
```

### 목록은 반드시 페이지네이션 — 전체 fetch 금지
```js
// ✅ 페이지 단위 (0~49번째)
supabase.from('records').select('id, title').range(0, 49)
```
- 총 개수가 필요하면 `count: 'exact'`는 **풀스캔**이라 무겁다. 가벼운 추정치인
  `count: 'estimated'`(또는 `'planned'`)를 쓴다.

### PostgREST 1000행 캡 — `.range()` 없는 조회는 조용히 잘린다
PostgREST 는 응답을 **기본 1000행**에서 자른다. 에러도 경고도 없다. "전부 가져와 캐시한다"는
단발 조회가 제일 위험하다 — 행이 1000건을 넘는 순간 목록·통계·필터 옵션이 **함께** 축소되는데,
숫자가 그럴듯해서 아무도 눈치채지 못한다.
```js
// ❌ 현장이 1000건을 넘으면 조용히 잘린다
const { data } = await supabase.from('sites').select('id, name, amount');

// ✅ 페이지 루프로 전부 긁는다
const all = [];
for (let from = 0; ; from += 1000) {
  const { data } = await supabase.from('sites')
    .select('id, name, amount').order('id').range(from, from + 999);
  all.push(...data);
  if (data.length < 1000) break;
}
```

### 페이지네이션엔 타이브레이크가 따라온다
정렬 컬럼에 **동률(특히 NULL)** 이 있으면 페이지마다 순서가 달라져, 같은 행이 두 번 나오거나
아예 빠진다. **고유 컬럼을 마지막 정렬키로** 고정한다.
```js
// ❌ amount 동률이 많으면 페이지 경계가 흔들린다
.order('amount', { ascending: false }).range(50, 99)
// ✅ 고유 컬럼으로 순서를 확정
.order('amount', { ascending: false }).order('id').range(50, 99)
```

### 큰 `IN (...)` 리스트 피하기
값 수십~수백 개를 `IN`에 직접 박으면(예: `WHERE name IN (... 68개)`) 비효율적이다.
- 가능하면 **조인**으로 바꾸거나, 값을 임시 테이블/배열로 넘긴다.
- 정 필요하면 적당한 크기로 **청크 분할**해서 여러 번 호출한다.

---

## 3. 무거운 집계 / DB 함수

월간·전사 집계 함수를 **요청이 올 때마다** 호출하면 매번 풀 계산이 돌아 메모리·CPU를 잡아먹는다
(예: `get_site_monthly_overview()`를 화면 로드마다 호출).

**선택지 (자주 바뀌는 정도에 따라):**

1. **Materialized View** — 결과를 미리 구워두고 주기적으로 갱신
   ```sql
   create materialized view site_monthly_overview as
   select site_id,
          date_trunc('month', work_date) as month,
          count(*) as cnt
   from attendance_records
   group by 1, 2;

   create unique index on site_monthly_overview (site_id, month);

   -- 갱신 (pg_cron 스케줄 또는 야간 배치에서). concurrently는 인덱스가 있어야 가능
   refresh materialized view concurrently site_monthly_overview;
   ```
2. **사전계산 테이블** — 일반 테이블에 결과를 저장하고 야간 배치로 갱신 (Materialized View가
   부담스러울 때).
3. **앱/Edge 레이어 캐싱** — 거의 안 바뀌는 집계는 애플리케이션에서 캐시.

원칙: **"읽을 때 계산"이 아니라 "쓸 때(또는 주기적으로) 계산"으로 옮긴다.**

### Materialized View refresh 가 느리다 = 정의 SELECT 가 느리다
`refresh materialized view [concurrently] ...` 의 비용은 곧 **그 뷰의 정의 SELECT 비용**이다.
refresh 자체를 EXPLAIN 할 수는 없으니, **정의 쿼리를 그대로 떼어 `EXPLAIN (ANALYZE, BUFFERS)`** 한다.
- `concurrently` 는 정의 SELECT 를 새로 굽고 **기존 본과 diff** 해 적용하므로(=unique 인덱스 필수)
  일반 refresh 보다 약간 더 비싸다. 하지만 대부분의 느림은 diff 가 아니라 **정의 SELECT** 다.
- refresh 시간을 직접 재려면 `clock_timestamp()` 로 감싼 임시 함수를 쓴다(첫 호출은 캐시 워밍이라 버린다):
```sql
create or replace function pg_temp.t() returns numeric language plpgsql as $$
declare s timestamptz := clock_timestamp();
begin perform my.refresh_fn(); return extract(epoch from (clock_timestamp()-s))*1000; end$$;
select pg_temp.t(), pg_temp.t(), pg_temp.t();  -- 2~3번째 값을 본다
```

### `lateral` 안에서 다중 조인 뷰를 참조하면 — 바깥 행마다 뷰를 통째로 재빌드
가장 잘 안 보이는 함정. `left join lateral (select ... from some_view where 상관조건 limit 1)` 에서
`some_view` 가 **여러 테이블의 조인 뷰**면, 옵티마이저는 바깥 행 1건당 `some_view` 를 **처음부터 다시 빌드**한다.
바깥 N행이면 뷰 빌드가 N번 → **O(N × 뷰비용)**. 데이터가 적을 땐 안 보이다가, 행이 늘면 선형으로 터진다.
```sql
-- ❌ 프로필 1건당 gw_persons(7-조인 뷰)를 통째로 재빌드 (114명 × c_emp 풀스캔)
left join lateral (
  select gp.* from assign.gw_persons gp
  where case when up.key is not null then gp.key = up.key else gp.name = up.name end
  limit 1
) erp on true

-- ✅ 무거운 뷰를 `as materialized` 로 딱 한 번만 굽고(최적화 펜스), 해시 조인으로 붙인다
with gw as materialized (        -- 8177행을 1번만 평가 → 이후엔 이 결과를 조인만
  select key, name, col1, col2 from assign.gw_persons
)
select ...
from assign.user_profiles up
left join gw ek on up.key is not null and ek.key = up.key          -- 키 매칭(인덱스/해시)
left join gw en on up.key is null and en.name = up.name            -- 이름 매칭(상호배타)
```
- `with x as materialized (...)` 는 **최적화 펜스**다. 비싼 서브쿼리를 여러 번 참조할 때 1회 평가를 강제한다.
- 복잡도가 **O(N × 뷰) → O(N + 뷰)** 로 바뀐다. (실측 수치는 아래 2026-06 사례)

### `CASE` 식을 조건절에 쓰면 인덱스를 못 탄다 (sargable 깨짐)
`where case when ... then a = ? else b = ? end` 처럼 조건을 `CASE` 로 감싸면, `a`/`b` 에 인덱스가 있어도
**못 쓰고 풀스캔**한다. **상호배타 조건으로 풀어** 쓴다(위 예시의 ek/en 두 조인처럼). 그래야 각 분기가
sargable 해져 인덱스/해시 조인을 탄다.

---

## 4. RLS (Row Level Security) — 성능과 보안 둘 다

> 정책을 **쓰는 법**은 이 절, 실제로 열려 있는지 **확인하는 법**은 9번 절(정기 감사)이다.
> 정책이 있다는 것과 안전하다는 것은 다르다 — `TO public` 은 anon 을 포함하고, matview 는 RLS 를 안 받는다.

### 보안 먼저: 새 테이블은 RLS가 기본 OFF다
RLS를 안 켜면 공개 anon 키로 **테이블 전체가 읽힌다.** AI 빌더로 만든 Supabase 앱에서
가장 흔한 사고 유형이다.
```sql
alter table my_table enable row level security;
-- ⚠️ RLS만 켜고 정책이 없으면 "전부 차단"이 된다. 정책을 반드시 추가한다.
```
> 대시보드 **Authentication → Policies**의 "Enable RLS on new tables" 토글을 켜두면
> 새 테이블이 자동으로 RLS ON 상태로 생성된다.

### 성능: auth 함수를 `select`로 감싼다
RLS 정책은 **행마다** 평가된다. `auth.uid()`를 그냥 쓰면 행마다 함수가 호출되지만,
`(select ...)`로 감싸면 옵티마이저가 한 번만 평가(initPlan 캐싱)한다.
```sql
-- ❌ 행마다 호출
using ( auth.uid() = user_id )
-- ✅ 한 번만 평가 — 큰 테이블에서 100배 이상 빨라진 사례가 보고됨 (Supabase 공식 문서)
using ( (select auth.uid()) = user_id )
```
- RLS에 쓰는 컬럼(`user_id` 등)엔 **인덱스**를 건다.
- 클라이언트에서도 **같은 조건을 명시**하면 옵티마이저가 인덱스를 타기 쉽다:
  `.eq('user_id', userId)`

### 조인 기반 정책은 재작성 + security definer 함수
```sql
-- ❌ 조인 테이블에 행마다 부담
--    auth.uid() in (select user_id from team_user where team_id = t.team_id)
-- ✅ 방향을 뒤집어 user 기준으로 한 번에 모은다
--    team_id in (select team_id from team_user where user_id = auth.uid())

-- 더 좋게: security definer 함수로 빼고 select 로 감싼다
create or replace function user_team_ids()
returns setof uuid language sql security definer stable as $$
  select team_id from team_user where user_id = auth.uid();
$$;
-- 정책에서:  team_id in (select user_team_ids())
```
> 점검은 Performance Advisor 의 `auth_rls_initplan` · `multiple_permissive_policies` 항목으로 (→ 1번 표).

---

## 5. 마이그레이션 / 스키마 캐시

운영 중에 테이블·컬럼을 **자주 바꾸면**(잦은 DDL) PostgREST의 스키마 캐시가 리로드되고,
그때마다 `pg_available_extensions`, `pg_timezone_names`, 함수 정의 조회 같은
**무거운 카탈로그 쿼리**가 돈다. 메모리가 빠듯하면 이게 압박을 키운다.

- 마이그레이션은 **모아서 한 번에**, 가능하면 **트래픽 적은 시간**에 적용한다.
- 운영 인스턴스에서 **대시보드를 계속 열어두면** introspection 쿼리가 반복된다.
  메모리가 빠듯할 땐 작업 후 닫아둔다.

---

## 6. 커넥션

- `supabase-js`(REST/PostgREST)만 쓰면 풀링은 알아서 처리된다. 하지만
  **Python 등으로 DB에 직접 연결**(pgvector 파이프라인 등)하거나 **서버리스**라면
  커넥션 풀러(Supavisor)를 반드시 쓴다.
- **서버리스·다중 인스턴스 → transaction mode (port 6543).** 짧은 연결을 많이 처리하며,
  session mode(port 5432)보다 많은 클라이언트를 수용한다.
- 풀 사이즈는 session/transaction 모드가 **공유**한다. 연결은 쓰고 나면 **반드시 닫는다**
  (안 닫힌 연결이 쌓여 한도를 채우면 신규 연결이 거부된다).

---

## 7. 성능 진단 쿼리 — "지금 느리다" 를 볼 때

Supabase SQL Editor에 붙여넣어 돌린다. (Advisor가 자동 점검을 해주지만, 직접 확인할 때 유용)
보안·인덱스 위생 점검은 **9번 절**이다.

**캐시 적중률 (Cache Hit Rate) — 99% 이상이 건강**
```sql
select sum(heap_blks_hit)
       / nullif(sum(heap_blks_hit) + sum(heap_blks_read), 0) as cache_hit_ratio
from pg_statio_user_tables;
```
95% 근처면 데이터를 메모리 캐시에서 자주 못 찾고 디스크에서 읽는다는 뜻 → 메모리 압박·IOwait 상승.

**가장 무거운 쿼리 Top 20**
```sql
select query, calls, total_exec_time, mean_exec_time, rows
from pg_stat_statements
order by total_exec_time desc
limit 20;
```

**테이블/인덱스 용량 Top 20**
```sql
select relname, pg_size_pretty(pg_total_relation_size(relid)) as total_size
from pg_catalog.pg_statio_user_tables
order by pg_total_relation_size(relid) desc
limit 20;
```

**특정 쿼리 실행계획 확인** — 큰 테이블에 `Seq Scan`이 뜨면 인덱스를 검토한다.
```sql
explain analyze
select * from gw_persons where emp_no ilike '123%' order by emp_no;
```

---

## 8. 검색창 입력을 안전하게 필터에 싣기

**원칙: 검색창 입력은 "이 문자열을 포함하는 행"이라는 값이지, 패턴 문법이 아니다.**

`ilike '%{입력}%'` 에 사용자 입력을 그대로 이어붙이면 입력 안의 특수문자가 패턴으로 해석된다.

```python
# ❌ 사용자가 검색창에 `%` 한 글자를 치면 → 패턴이 '%%%' → 전 행 매칭
q = q.ilike("name", f"%{search}%")
```

**SQL 인젝션은 아니다.** PostgREST 가 값으로 전달하므로 DB 가 뚫리지는 않는다. 대신 **에러 없이
결과만 조용히 틀린다** — 검색이 "되긴 하는데" 엉뚱하게 넓어지므로 발견이 매우 늦다.

### 문자별 처리 — 경로에 따라 다르다

`.ilike()` 메서드에 값을 넘길 때와, `.or_()` 문자열 안에 값을 꽂을 때가 다르다.

| 문자 | 왜 위험한가 | `.ilike(col, 값)` | `.or_("col.ilike.패턴,…")` |
|---|---|---|---|
| `%` | LIKE 와일드카드(0글자 이상) | `\%` 로 이스케이프 | `\%` 로 이스케이프 |
| `_` | LIKE 와일드카드(정확히 1글자) | `\_` 로 이스케이프 | `\_` 로 이스케이프 |
| `\` | 이스케이프 문자 자신 | `\\` 로 **먼저** 처리 | `\\` 로 **먼저** 처리 |
| `*` | PostgREST 가 `%` 의 별칭으로 취급 | `\*` 로 이스케이프 | **제거** (리터럴로 감쌀 문법이 없다) |
| `,` `(` `)` `"` | or() 의 조건 구분자·그룹핑·인용 | 무해(값으로 전달) | **제거** (안 하면 쿼리 전체가 깨진다) |

와일드카드는 **지우지 말고 이스케이프**한다 — 사람이 실제로 칠 수 있는 문자라 뜻을 보존하는 편이
낫다. 반면 구조를 깨는 문자는 검색어로서 의미가 없으므로 제거가 맞다.

### 규칙은 문서가 아니라 코드로 강제한다

레포마다 **공용 헬퍼 하나**를 세우고 모든 `.ilike()` 호출부를 그리로 경유시킨다. 같은 규칙을
호출부마다 복붙해두면 나중에 추가되는 경로에서 **반드시** 빠진다(→ 2026-08 검색 사례).

Python (supabase-py):

```python
# `str.maketrans` 는 한 번에 매핑하므로 .replace() 연쇄와 달리 재이스케이프 사고가 없다.
_ILIKE_WILDCARDS = str.maketrans({"\\": "\\\\", "%": "\\%", "_": "\\_", "*": "\\*"})


def ilike_contains(term: str | None) -> str | None:
    """부분 일치 ilike 패턴(`%term%`). 비었으면 None — 호출부는 필터를 걸지 않는다."""
    stripped = (term or "").strip()
    if not stripped:
        return None
    return f"%{stripped.translate(_ILIKE_WILDCARDS)}%"


# 사용
pattern = ilike_contains(search)
if pattern:
    q = q.ilike("name", pattern)
```

TypeScript (supabase-js) — `or()` 경로까지 함께 처리하는 판:

```ts
const STRUCTURE_CHARS = /[,()"*]/g;              // 지운다
const WILDCARDS: [RegExp, string][] = [          // 이스케이프한다 (백슬래시가 먼저)
  [/\\/g, "\\\\"],
  [/%/g, "\\%"],
  [/_/g, "\\_"],
];

export function ilikeContains(term: string, minLength = 1): string | null {
  const stripped = term.trim().replace(STRUCTURE_CHARS, "");
  if (stripped.length < Math.max(1, minLength)) {
    return null;
  }
  const escaped = WILDCARDS.reduce((acc, [re, to]) => acc.replace(re, to), stripped);
  return `*${escaped}*`;
}
```

### 함정 3가지

1. **백슬래시를 먼저 처리하지 않으면 재이스케이프된다.** `.replace()` 를 연쇄로 쓰면 `%` → `\%` 로
   바꾼 뒤 백슬래시 치환이 그 `\` 를 다시 잡아 `\\%` 가 된다. `str.maketrans`(py) 나 순서를 고정한
   배열(ts) 로 **한 번에** 매핑하라.
2. **최소 글자 수 검사는 이스케이프 _전_ 에 하라.** "2자 미만 검색 금지" 같은 정책이 있을 때,
   이스케이프 후 길이를 재면 `%`(1자)가 `\%`(2자)가 되어 통과한다 — 정책이 그대로 뚫린다.
3. **빈 검색어에 `%%` 를 보내지 마라.** 전 행 스캔이다. 헬퍼가 `None`/`null` 을 돌려주고 호출부가
   필터 자체를 걸지 않게 한다.

### 인덱스와는 별개 문제다

이스케이프는 **정확성**, trigram 인덱스는 **속도** 문제다. 둘 다 필요하다(→ 1번의 ILIKE 소절).

**검증법:** 검색창에 `%` 와 `_` 를 실제로 쳐 보고 결과 수를 확인한다. 전체 명단이 나오면 이스케이프가
빠진 것이다.

---

## 9. 정기 감사 — 5분짜리 진단 쿼리 묶음

코드 리뷰로는 안 잡히는 것들이 있다. **권한은 코드에 안 적혀 있고**, 인덱스 중복은 에러를 내지
않으며, 백업 테이블은 아무도 다시 보지 않는다. 아래를 분기에 한 번, 그리고 큰 마이그레이션
직후에 돌린다. 전부 읽기 전용이다.

### 9-a. anon 키로 실제로 읽히는 것 (가장 중요)

`anon` 키는 **프론트 번들에 실려 공개된 값**이다. 아래 세 갈래가 전부 "정책은 있는데 열려 있는"
상태를 만든다.

```sql
-- ① materialized view — RLS 자체가 적용되지 않는다. 권한이 붙어 있으면 통째로 읽힌다.
select c.relnamespace::regnamespace::text, c.relname,
       has_table_privilege('anon', c.oid,'select') as anon
  from pg_class c where c.relkind='m' and has_table_privilege('anon', c.oid,'select');

-- ② RLS 가 꺼진 채 권한만 있는 테이블 (`create table ... as select` 백업이 대표적)
select n.nspname, c.relname
  from pg_class c join pg_namespace n on n.oid=c.relnamespace
 where c.relkind='r' and not c.relrowsecurity
   and has_table_privilege('anon', c.oid,'select');

-- ③ USING (true) 정책이 anon 에게 열려 있는 테이블
select p.schemaname, p.tablename, p.policyname, p.roles::text
  from pg_policies p
 where p.permissive='PERMISSIVE' and p.cmd in ('SELECT','ALL')
   and coalesce(p.qual,'true')='true'
   and (p.roles::text ~ '(public|anon|authenticated)')
   and has_table_privilege('anon', (p.schemaname||'.'||p.tablename)::regclass, 'select');
```

**판정은 쿼리가 아니라 실제 호출로 한다.** 위 목록은 후보일 뿐이라 반드시 anon 키로 찔러 본다.

```bash
curl -s "$URL/rest/v1/<table>?select=*&limit=1" \
  -H "apikey: $ANON_KEY" -H "Authorization: Bearer $ANON_KEY" -H "Accept-Profile: <schema>"
# 데이터가 나오면 노출, []/42501 이면 막힌 것
```

세 가지 함정:

- **`RLS ON` + 정책 0개 = deny-all 이다.** 안전하다는 뜻이니 경보로 세지 말 것. 내부 동기화
  테이블에서 흔한 정상 패턴이다. 위험한 건 `RLS OFF` + 권한, 그리고 matview 다.
- **`TO public` 은 anon 을 포함한다.** `"Service role full access"` 같은 이름을 달고 `TO public
  USING (true)` 로 걸린 정책이 실제로는 전면 공개다. 이름은 아무것도 보장하지 않는다.
  `service_role` 은 `rolbypassrls=true` 라 **정책이 없어도 통과**하므로, 대상을 `TO service_role`
  로 좁혀도 백엔드는 멀쩡하다.
- **권한은 재생성 때 되살아난다.** `alter default privileges ... on tables` 는 테이블·뷰·
  **matview 를 모두 포함**한다. drop 후 재생성하는 마이그레이션은 끝에서 다시 회수할 것.

고치기 전에 **그 테이블을 anon 으로 읽는 코드가 있는지** 반드시 확인한다
(`grep -rn "\.from(" 프론트`). 로그인 전 공개 목록처럼 정당한 anon 읽기가 있으면 회수가 아니라
**정책을 좁히는 것**(`using (is_public)`, `using ((select auth.uid()) = id)`)이 답이다.

### 9-b. 인덱스 없는 FK

```sql
select n.nspname, t.relname, c.conname
  from pg_constraint c
  join pg_class t on t.oid=c.conrelid
  join pg_namespace n on n.oid=t.relnamespace
 where c.contype='f' and n.nspname not in ('pg_catalog','information_schema')
   and not exists (
     select 1 from pg_index i
      where i.indrelid=c.conrelid
        and (i.indkey::int2[])[0:array_length(c.conkey,1)-1] = c.conkey);
```

**전부 다 만들지는 말 것.** 인덱스는 쓰기 비용이라, 붙일 값어치는 두 가지로 판단한다:
행수가 의미 있는가, 그리고 **그 컬럼이 실제로 필터·조인에 쓰이는가**(코드에서 `.eq(...)` 를
찾아본다). 부모 삭제가 잦은 관계면 그것만으로도 이유가 된다.

### 9-c. 안 쓰는 인덱스 · 중복 인덱스

```sql
-- 한 번도 안 쓰인 인덱스 (정리 후보)
select relname, indexrelname, idx_scan
  from pg_stat_user_indexes
 where idx_scan = 0
 order by relname;

-- 중복 인덱스
select t.relname, string_agg(c.relname, ', ') as dups
  from pg_index i
  join pg_class c on c.oid=i.indexrelid
  join pg_class t on t.oid=i.indrelid
  join pg_namespace n on n.oid=t.relnamespace
 where n.nspname = 'your_schema'
 group by t.relname, i.indkey::text, c.relam, i.indisunique,
          i.indpred is not null, i.indexprs is not null
having count(*) > 1;
```

`c.relam`(접근 방식)까지 묶어야 한다 — 같은 컬럼의 btree 와 GIN trgm 은 **중복이 아니라 역할이
다른 짝**이다(등호·정렬 vs `%부분%`). 이걸 빼먹으면 멀쩡한 인덱스를 지우게 된다.

중복이 생기는 경로는 하나다: **이름 없이** `create index on t (col)` 을 여러 번 돌리면 Postgres 가
`_idx1`, `_idx2` 로 이름을 바꿔 **새로** 만들고 에러도 내지 않는다. 항상 이름을 명시하고
`if not exists` 를 붙인다.

---

## 사고 사례 아카이브

각 절의 규칙이 어디서 나왔는지에 대한 실제 증거다. 규칙 자체는 위 절에 있으니, 여기서는
**무엇이 어떻게 터졌고 얼마나 나아졌는지**만 남긴다.

### 2025-06 · 1GB 인스턴스 다운 (내부)

일주일 내내 스왑이 발생하다가, 가장 심해진 순간에 IOwait가 폭발하며 시스템이 다운됐다.
근본 원인은 **리소스 부족 + 무거운 쿼리**의 결합이었다.

당시 확인된 패턴:
- `gw_persons`의 `emp_no ILIKE` + 정렬 → 인덱스 미스로 풀스캔/정렬 (→ 1번)
- `get_site_monthly_overview()` 월간 집계 함수를 고빈도 호출 → 매번 풀 계산 (→ 3번)
- `storage.objects`를 `WHERE name IN (68개)`로 조회 + 버킷 용량 `sum()` 풀스캔 (→ 2번)
- 잦은 스키마 변경으로 PostgREST 카탈로그 쿼리 폭증 (→ 5번)
- Cache Hit Rate 94.96% (99% 미만 = 디스크 의존 ↑) (→ 7번)

**교훈: 메모리 증설은 응급처치다.** 위 패턴들을 코드 단계에서 제거하는 것이 근본 처방이다.

### 2026-06 · assign matview refresh 가 선형 악화 (→ 3번)

`assign.refresh_engineer_list_summary()` 가 dev 114명 규모에서 이미 ~330ms, prod 규모로는 선형
악화 예정이었다. matview 정의가 `gw_persons`(common.c_emp + c_dept×3 + c_position + c_comp 의
**7-조인 뷰**)를 `left join lateral (... limit 1)` 로 프로필 행마다 재전개하고, 매칭 조건이
`CASE`(키 있으면 사번, 없으면 이름)라 **sargable 이 깨져** c_emp 를 매 loop 풀스캔했다.
→ O(프로필 × c_emp). 처방은 3번 절의 두 소절 그대로(`with ... as materialized` 1회 물질화 +
CASE 를 상호배타 조인 둘로 분리 → 키 매칭이 `c_emp_pkey(emp_no)` index scan).

| | before | after |
|---|---|---|
| 정의 SELECT | 221ms (buffers 20237) | **49ms** (~490) |
| refresh 함수 | ~330ms | **~57ms** |
| 복잡도 | O(N × c_emp) | O(N + c_emp) |

기존 matview 와 `EXCEPT` 양방향 0건으로 완전 동치 검증.
마이그레이션: `supabase/migrations/20260617_engineer_list_summary_matview_optimize.sql`.

**교훈: "refresh 가 느리다"의 진짜 범인은 거의 항상 정의 SELECT 다.** lateral×다중조인뷰 + 조건절
CASE 두 패턴이 겹치면 데이터가 적을 땐 안 보이다가 행이 늘면 터진다.

### 2026-08 · 5개 레포 검색 경로 전수 점검 (→ 2번, 8번)

같은 Supabase 를 쓰는 5개 앱(assign · career · concrete · ax-portal · Site-Info)의 검색 경로를
한 번에 훑었더니, **핵심 패턴은 일관됐는데 이스케이프만 레포마다 갈라져 있었다.**

일관됐던 것: 300ms 디바운스, 검색어 서버 푸시다운, 페이지 경계 안정 정렬(타이브레이크),
무거운 조인의 TTL 캐시 + 락 + 명시적 무효화, 필요한 곳의 trigram 인덱스.

갈라졌던 것 — 같은 규칙을 레포마다 따로 구현한 결과:

| | `%` `_` | `,` `(` `)` | `*` |
|---|---|---|---|
| concrete | 이스케이프 | 제거 | 제거 |
| ax-portal | **누락** | 제거 | 제거 |
| career (목록) | **누락** | — | **누락** |
| career (순위) | `%` 만 제거, `_` **누락** | 제거 | 제거 |
| assign | **누락** | — | **누락** |

증상은 전부 같다. 검색창에 `%` 를 치면 명단 전체가 나오고, `_` 를 치면 한 글자 와일드카드가 된다.
에러가 안 나서 아무도 몰랐다. 함께 발견된 두 건도 성격이 같다 — assign 은 **관리자 검색이
클라이언트가 받은 첫 25명 안에서만** 동작했고, Site-Info 의 현장 캐시는 `.range()` 없는 단발
조회라 현장이 1000건을 넘으면 금액 작은 순으로 조용히 잘릴 상태였다(당시 400여 건이라 미발현).

처방: 레포마다 **공용 헬퍼 하나**를 세우고 모든 `.ilike()` 호출부를 경유시켰다
(assign `repositories/_query.ilike_contains`, career `app/core/search.ilike_contains`,
ax-portal `lib/ilike-search.ilikeContains`, concrete 는 기존 `_escape_ilike_term` 유지).
Site-Info 는 페이지 루프 + 고유 컬럼 2차 정렬키로 고쳤다.

**교훈: 에러가 안 나는 버그가 제일 오래 산다.** 이스케이프 누락도, 1000행 절단도, "첫 페이지만
검색"도 전부 예외 없이 조용히 틀린 결과를 낸다.

### 2026-08 · 5개 앱 공유 DB 권한 감사 (→ 9번)

9번 절 쿼리로 권한을 훑고 **후보마다 anon 키로 직접 찔러** 확인했다. 코드 리뷰로는 한 건도 안
잡혔을 것들이다. 실제로 공개된 anon 키로 읽히던 것:

| 대상 | 무엇이 읽혔나 | 왜 |
|---|---|---|
| `assign.engineer_list_summary` (matview) | 기술자 전원 이름·회사·부서·자격증 | matview 는 **RLS 미적용**. 명부 이관 때 drop+create 하면서 기본 권한이 다시 붙었다 |
| `career_evaluation.batch_items` | **지원자 실명**(label) 245행 | `"Service role full access"` 라는 이름의 정책이 실제로는 `TO public` |
| `career_evaluation.feedbacks` | 피드백 본문 + applicant_id | `TO anon USING (true)` — 과거의 의도적 공개가 SSO 전환 후에도 남음 |
| `career_evaluation.contractor_rankings_published` | 도급순위 2,784행 + 대표자·주소 | 위와 같은 `TO public` |
| `concrete._backup_20260806_*` 6개 | 현장명·user_id·role·타설기록 | `create table ... as select` 백업은 **RLS 가 꺼진 채** 생기고 기본 권한이 붙는다 |

**세 경로가 전부 "정책은 있는데 열려 있는" 형태였다.** 반면 `assign` 의 나머지 테이블은
`TO authenticated USING (true)` 라 anon 조회가 빈 배열로 막혔다 — 같은 `USING (true)` 라도
**대상 롤이 판정을 가른다.**

처방과 검증: career 는 정책 대상을 `TO service_role` 로 좁히고 익명 공개 정책 제거, concrete
백업은 RLS 켜고 권한 회수, assign matview 는 권한 회수. 셋 다 적용 후 anon 재호출이 빈 배열/42501
인 것과, service_role·앱 정상 경로가 200 인 것을 **양쪽 다** 확인했다.

건드리지 않은 것: `concrete.sites`(로그인 전 공개 현장 목록)와 `common.user_profiles`(다른 앱
프론트가 본인 행을 읽는다)는 anon/authenticated 읽기가 **실제로 쓰이고 있어서**, 회수가 아니라
정책을 좁히는 게 답이다 — 앱 동작이 바뀌므로 별도 작업으로 남겼다.

같은 감사에서 중복 인덱스도 나왔다(→ 9-c) — `common.c_dept` 의 btree(dept_code) **3벌**,
`c_sync_fail_log` 의 btree(run_id) **2벌**. 이름 없이 `create index` 를 여러 번 돌린 흔적이고,
조회는 하나도 안 빨라지면서 쓰기 비용만 늘리고 있었다.
