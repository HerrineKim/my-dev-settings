// node run.mjs <artifact.html> <outDir> [only indices comma]
import { chromium } from 'playwright-core';
import fs from 'node:fs';
import path from 'node:path';
const [,, src, out, only] = process.argv;
fs.mkdirSync(out, { recursive: true });
const dir = path.dirname(new URL(import.meta.url).pathname);
let html = fs.readFileSync(src, 'utf8');
const css = fs.readFileSync(path.join(dir, 'override.css'), 'utf8');
const ser = fs.readFileSync(path.join(dir, 'ser.js'), 'utf8');
const fontLink = '<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=block">';
// 문구: em dash 대신 가운뎃점, 슈퍼어드민 이름
html = html.replaceAll('이도현', '김혜린').replaceAll('dohyun.l**', 'hyerin.k**');
// 차트 색: 아티팩트 잉크 → DS 브랜드 블루
html = html.replace("const MCOL7=['#1A1A1A','#4A4A47','#9A9A96','#D6D6D2','#85857F','#ADADA9','#E2E2DF']", "const MCOL7=['#3182F6','#64A8FF','#90C2FF','#C9E2FF','#1B64DA','#4593FC','#E8F3FF']");
html = html.replace("background:${on?'#1A1A1A':'#D6D6D2'", "background:${on?'#3182F6':'#D6D6D2'");
{ const a = html.indexOf('function lchart'), b = html.indexOf('const _V_home_v4');
  if (a > 0 && b > a) html = html.slice(0, a) + html.slice(a, b).replaceAll("'#1A1A1A'", "'#3182F6'").replaceAll('"#1A1A1A"', '"#3182F6"').replaceAll('rgba(26,26,26,.05)', 'rgba(49,130,246,.08)') + html.slice(b); }
const shellCss = '.side,.notes,.topbar,.fx-dock{display:none!important}.app{display:block!important}#wrap{height:auto!important;overflow:visible!important;width:auto!important}.stage{overflow:visible!important;padding:0!important}.lgd i{border-top-color:#3182f6!important}';
html = html.replace('</body>', `<style>${shellCss}</style></body>`);
html = html.replace('</body>',`${fontLink}<style>${css}</style><script>${ser}</script></body>`);
if (!html.includes('</body>')) html += `${fontLink}<style>${css}</style><script>${ser}</script>`;
const tmp = path.join(out, '_page.html');
fs.writeFileSync(tmp, html);
const browser = await chromium.launch({ channel: 'chrome', headless: true });
const page = await browser.newPage({ viewport: { width: 1800, height: 1100 }, deviceScaleFactor: 1 });
page.on('pageerror', e => console.error('pageerror', e.message));
await page.goto('file://' + tmp, { waitUntil: 'domcontentloaded', timeout: 60000 });
await Promise.race([page.evaluate(() => document.fonts.ready), new Promise(r=>setTimeout(r,15000))]);
await page.waitForTimeout(1500);
const entries = await page.evaluate('ENTRIES.map((e,i)=>({i,g:e.g,n:e.n,s:e.s,p:e.p,fig:e.fig}))');
fs.writeFileSync(path.join(out, 'entries.json'), JSON.stringify(entries, null, 1));
const idx = only ? only.split(',').map(Number) : entries.map(e => e.i);
for (const i of idx) {
  for (const d of ['d', 'm']) {
    try {
      await page.evaluate(`dev='${d}';openEntry(${i});`);
      await page.waitForTimeout(250);
      const res = await page.evaluate(() => {
        const sc = document.querySelector('#scaler'); sc.style.transform = 'none';
        const root = sc.querySelector('.scr') || sc.firstElementChild;
        root.querySelectorAll('.stage *').forEach(()=>{});
        if (root.classList.contains('phone')) { root.style.height = 'auto'; root.style.minHeight = '812px'; }
        for (let k = 0; k < 3; k++) root.querySelectorAll('*').forEach(el => { const cs = getComputedStyle(el); if (/(auto|scroll)/.test(cs.overflowY) && el.scrollHeight > el.clientHeight + 1) { el.style.overflowY = 'visible'; el.style.overflowX = 'visible'; el.style.height = 'auto'; el.style.maxHeight = 'none'; el.style.flex = 'none'; } });
        if (root.classList.contains('phone')) { root.style.overflow = 'visible'; }
        root.querySelectorAll('*').forEach(el => { const t = getComputedStyle(el).transform; const m = t && t.match(/matrix\(([^)]+)\)/); if (m && !el.classList.contains('spin')) { const [a, b] = m[1].split(',').map(Number); const deg = Math.atan2(b, a) * 180 / Math.PI; if (Math.abs(deg) > 0.5 && Math.abs(deg) < 89.5) { el.dataset.rot = deg.toFixed(2); el.style.transform = 'none'; } } });
        const r = root.getBoundingClientRect();
        return { tree: window.__ser(root), w: r.width, h: r.height, cls: root.className };
      });
      fs.writeFileSync(path.join(out, `${i}-${d}.json`), JSON.stringify(res.tree));
      const el = await page.$('#scaler > *');
      await el.screenshot({ path: path.join(out, `${i}-${d}.png`) });
      console.log(i, d, Math.round(res.w), Math.round(res.h), res.cls, fs.statSync(path.join(out, `${i}-${d}.json`)).size);
    } catch (e) { console.error('ERR', i, d, e.message.slice(0, 200)); }
  }
}
fs.writeFileSync(path.join(out, 'imgs.json'), JSON.stringify(await page.evaluate('__imgs()')));
await browser.close();
