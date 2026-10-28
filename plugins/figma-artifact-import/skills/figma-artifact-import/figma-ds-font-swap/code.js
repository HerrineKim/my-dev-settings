// 디자인 시스템 파일처럼 Noto Sans KR이 "진짜 글꼴"인 파일을 Pretendard로 옮긴다.
// figma-font-swap(굵기 표식 치환)과 달리 굵기를 그대로 옮긴다: Regular → Regular, Bold → Bold.
// 순서: 글꼴 변수(FONT_FAMILY · FONT_STYLE) → 텍스트 스타일 → 스타일 · 변수에 묶이지 않은 텍스트.
// MCP(use_figma)는 로컬 글꼴을 못 불러서 데스크톱 앱에서 이 플러그인으로 돌린다.
const FROM = 'Noto Sans KR';
const TO = 'Pretendard';
// Noto에만 있는 DemiLight는 Pretendard Light로
const MAP = { Thin: 'Thin', Light: 'Light', DemiLight: 'Light', Regular: 'Regular', Medium: 'Medium', SemiBold: 'SemiBold', Bold: 'Bold', ExtraBold: 'ExtraBold', Black: 'Black' };
// 토큰 이름과 값이 어긋난 굵기 변수 (Noto에 SemiBold가 없어 Medium으로 넣어 둔 값)
const WEIGHT_FIX = { Semibold: 'SemiBold', SemiBold: 'SemiBold' };
const to = (style) => ({ family: TO, style: MAP[style] || 'Regular' });

(async () => {
  try {
    await Promise.all([...new Set(Object.values(MAP))].map((style) => figma.loadFontAsync({ family: TO, style })));
  } catch (e) {
    figma.closePlugin(`${TO} 글꼴을 불러오지 못했어요. 이 Mac에 Pretendard 전체 굵기가 설치돼 있는지 확인해 주세요.`);
    return;
  }
  await Promise.all(Object.keys(MAP).map((style) => figma.loadFontAsync({ family: FROM, style }).catch(() => null)));
  await figma.loadAllPagesAsync();

  // 1) 변수
  let vars = 0;
  for (const v of await figma.variables.getLocalVariablesAsync('STRING')) {
    for (const [modeId, val] of Object.entries(v.valuesByMode)) {
      if (typeof val !== 'string') continue;
      if (v.scopes.includes('FONT_FAMILY') && val === FROM) {
        v.setValueForMode(modeId, TO);
        vars++;
      } else if (v.scopes.includes('FONT_STYLE')) {
        const last = v.name.split('/').pop();
        const next = WEIGHT_FIX[last] || MAP[val];
        if (next && next !== val) {
          v.setValueForMode(modeId, next);
          vars++;
        }
      }
    }
  }

  // 2) 텍스트 스타일 (변수에 묶인 스타일은 1)에서 이미 바뀐다)
  let styles = 0;
  for (const s of await figma.getLocalTextStylesAsync()) {
    if (s.fontName.family !== FROM) continue;
    const bound = s.boundVariables || {};
    if (bound.fontFamily) continue;
    s.fontName = to(s.fontName.style);
    styles++;
  }

  // 3) 남은 텍스트 (인스턴스 안 덮어쓰기 포함)
  let nodes = 0, ranges = 0, missing = 0;
  for (const page of figma.root.children) {
    for (const t of page.findAllWithCriteria({ types: ['TEXT'] })) {
      if (t.hasMissingFont) { missing++; continue; }
      let touched = false;
      for (const seg of t.getStyledTextSegments(['fontName'])) {
        if (seg.fontName.family !== FROM) continue;
        t.setRangeFontName(seg.start, seg.end, to(seg.fontName.style));
        ranges++;
        touched = true;
      }
      if (touched) nodes++;
    }
  }
  const skip = missing ? `, 글꼴이 없는 텍스트 ${missing}개는 건너뜀` : '';
  figma.closePlugin(`변수 ${vars}개 · 텍스트 스타일 ${styles}개 · 텍스트 ${nodes}개(${ranges}구간)를 ${TO}로 바꿨어요${skip}.`);
})();
