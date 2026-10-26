// MCP(use_figma)는 서버에서 돌아 로컬 글꼴(Pretendard)을 못 쓴다. 그래서 빌더는 Noto Sans KR의
// 서로 다른 굵기를 "표식"으로 넣고, 이 로컬 플러그인이 데스크톱 앱에서 진짜 굵기로 바꾼다.
//   Noto Regular → Pretendard Regular · Medium → Medium · Bold → SemiBold · Black → Bold
const FROM = 'Noto Sans KR';
const TO = 'Pretendard';
const MAP = { Regular: 'Regular', Medium: 'Medium', Bold: 'SemiBold', Black: 'Bold' };

(async () => {
  try {
    await Promise.all(Object.values(MAP).map(style => figma.loadFontAsync({ family: TO, style })));
  } catch (e) {
    figma.closePlugin(`${TO} 글꼴을 불러오지 못했어요. 이 Mac에 설치돼 있는지 확인해 주세요.`);
    return;
  }
  await Promise.all(Object.keys(MAP).map(style => figma.loadFontAsync({ family: FROM, style }).catch(() => null)));
  await figma.loadAllPagesAsync();
  let nodes = 0, ranges = 0;
  for (const page of figma.root.children) {
    for (const t of page.findAllWithCriteria({ types: ['TEXT'] })) {
      if (t.hasMissingFont) continue;
      let touched = false;
      for (const seg of t.getStyledTextSegments(['fontName'])) {
        if (seg.fontName.family !== FROM) continue;
        const style = MAP[seg.fontName.style] || 'Regular';
        t.setRangeFontName(seg.start, seg.end, { family: TO, style });
        ranges++; touched = true;
      }
      if (touched) nodes++;
    }
  }
  figma.closePlugin(`텍스트 ${nodes}개(${ranges}구간)를 ${TO}로 바꿨어요.`);
})();
