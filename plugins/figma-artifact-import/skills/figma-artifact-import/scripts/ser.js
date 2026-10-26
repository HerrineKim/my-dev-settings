// Runs in the page. window.__ser(rootEl) -> compact tree for the Figma builder.
(function(){
const R2=v=>Math.round(v*2)/2;
const KNOWN=[ // warm artifact hues -> DS tokens
 [[176,42,42],[228,41,57]],[[196,47,47],[228,41,57]],[[217,61,61],[240,68,82]],
 [[20,108,67],[2,147,89]],[[26,135,84],[3,178,108]],[[154,88,0],[221,125,2]],[[245,165,36],[255,195,66]],
];
function parse(c){const m=c&&c.match(/rgba?\(([^)]+)\)/);if(!m)return null;const p=m[1].split(/[ ,/]+/).filter(Boolean).map(Number);return [p[0],p[1],p[2],p.length>3?p[3]:1]}
const lerp=(a,b,t)=>a.map((v,i)=>Math.round(v+(b[i]-v)*t));
function mapc(c){const p=parse(c);if(!p||p[3]===0)return null;let [r,g,b,a]=p;
 for(const [k,v] of KNOWN){if(Math.abs(k[0]-r)+Math.abs(k[1]-g)+Math.abs(k[2]-b)<24){[r,g,b]=v;return hx(r,g,b,a)}}
 const mx=Math.max(r,g,b),mn=Math.min(r,g,b);
 if(mx-mn<=12&&!(r===255&&g===255&&b===255)&&!(mx===0)){
  if(a<1&&mx<80){[r,g,b]=[0,23,51]} // translucent ink -> DS dark base
  else{const v=(r+g+b)/3;let col;if(v<=242)col=lerp([25,31,40],[242,244,246],Math.max(0,(v-26)/216));else col=lerp([242,244,246],[255,255,255],(v-242)/13);[r,g,b]=col}
 }
 return hx(r,g,b,a)}
function hx(r,g,b,a){const h='#'+[r,g,b].map(v=>Math.round(v).toString(16).padStart(2,'0')).join('');return a<1?h+Math.round(a*255).toString(16).padStart(2,'0'):h}
function px(v){return parseFloat(v)||0}
function shadows(s){if(!s||s==='none')return [];const out=[];const parts=s.split(/,(?![^(]*\))/);for(const p of parts){const col=(p.match(/rgba?\([^)]+\)/)||[])[0];const rest=p.replace(col,'').trim();const ins=/inset/.test(rest);const n=rest.replace('inset','').trim().split(/\s+/).map(px);const c=mapc(col);if(!c)continue;out.push({i:ins?1:0,x:n[0]||0,y:n[1]||0,b:n[2]||0,s:n[3]||0,c})}return out}
const W={100:'Regular',200:'Regular',300:'Regular',400:'Regular',500:'Medium',600:'Bold',650:'Bold',700:'Bold',800:'Bold',900:'Black'};
function fw(w){w=+w;return w>=800?'ExtraBold':w>=700?'Bold':w>=600?'SemiBold':w>=500?'Medium':'Regular'}
function visible(cs){return cs.display!=='none'&&cs.visibility!=='hidden'&&+cs.opacity>0}
function svgStr(svg,w,h){const c=svg.cloneNode(true);const src=svg.querySelectorAll('*'),dst=c.querySelectorAll('*');
 const fix=(s,d)=>{const cs=getComputedStyle(s);for(const k of ['fill','stroke']){const v=cs[k];if(v&&v!=='none'){const m=mapc(v);d.setAttribute(k,m?m.slice(0,7):'none');const a=parse(v);if(a&&a[3]<1)d.setAttribute(k+'-opacity',a[3])}else if(v==='none')d.setAttribute(k,'none')}
  for(const k of ['stroke-width','stroke-linecap','stroke-linejoin','opacity','fill-rule','stroke-dasharray']){const v=cs[k==='stroke-width'?'strokeWidth':k.replace(/-(\w)/g,(_,x)=>x.toUpperCase())];if(v&&v!=='normal'&&v!=='none'&&!(k==='opacity'&&v==='1')&&!(k==='fill-rule'&&v==='nonzero'))d.setAttribute(k,k==='stroke-width'?px(v):v)}
  d.removeAttribute('class');d.removeAttribute('style')};
 fix(svg,c);src.forEach((s,i)=>fix(s,dst[i]));c.setAttribute('width',w);c.setAttribute('height',h);c.setAttribute('xmlns','http://www.w3.org/2000/svg');
 if(!c.getAttribute('viewBox'))c.setAttribute('viewBox',`0 0 ${w} ${h}`);
 return c.outerHTML.replace(/\s+/g,' ')}
const IMG={};let imgN=0;
function isTextBlock(el){for(const n of el.childNodes){if(n.nodeType===3)continue;if(n.nodeType!==1)return false;const cs=getComputedStyle(n);if(cs.display!=='inline'||n.tagName==='svg'||n.tagName==='IMG'||n.tagName==='BR'&&false)return false;if(!isTextBlock(n))return false;const bg=parse(cs.backgroundColor);if(bg&&bg[3]>0)return false}return true}
function textRuns(el,runs){for(const n of el.childNodes){if(n.nodeType===3){runs.push([n,n.parentElement])}else if(n.nodeType===1){if(n.tagName==='BR')runs.push(['BR',el]);else textRuns(n,runs)}}return runs}
function tnode(el,ox,oy,runsIn){const runs=runsIn||textRuns(el,[]);const cs=getComputedStyle(el);const pre=/pre/.test(cs.whiteSpace);
 const SC=new Map();const sty=p=>{if(!SC.has(p)){const pc=getComputedStyle(p);SC.set(p,[fw(pc.fontWeight),mapc(pc.color),px(pc.fontSize),pc.textDecorationLine.includes('underline')?1:0,pc.textTransform==='uppercase'])}return SC.get(p)};
 const ch=[];let sp=true;
 for(const [node,p] of runs){if(node==='BR'){ch.push({c:'\n',p});sp=true;continue}const v=node.nodeValue;const S=sty(p);
  for(let i=0;i<v.length;i++){let c=v[i];if(!pre&&/\s/.test(c)){if(sp)continue;c=' ';sp=true}else sp=false;if(S[4])c=c.toUpperCase();if(c==='\u2014')c='\u00b7';ch.push({c,node,off:i,p})}}
 while(ch.length&&/\s/.test(ch[0].c))ch.shift();while(ch.length&&/\s/.test(ch[ch.length-1].c))ch.pop();if(!ch.length)return null;
 const rg=document.createRange();rg.selectNodeContents(el);const rects=[...rg.getClientRects()].filter(r=>r.width>0);if(!rects.length)return null;
 let x1=1e9,y1=1e9,x2=-1e9,y2=-1e9;for(const r of rects){x1=Math.min(x1,r.left);y1=Math.min(y1,r.top);x2=Math.max(x2,r.right);y2=Math.max(y2,r.bottom)}
 const fs=px(cs.fontSize);const lh=cs.lineHeight==='normal'?Math.round(fs*1.45):px(cs.lineHeight);
 let lines=Math.max(1,Math.round((y2-y1)/lh));
 const ell=cs.textOverflow==='ellipsis'&&cs.overflowX!=='visible'&&el.scrollWidth>el.clientWidth+1;
 // reproduce the browser's line breaks so Figma wraps exactly where the page did
 const out=[];
 if(lines>1&&!ell){let last=null;const r1=document.createRange();
  for(const o of ch){if(o.c==='\n'){out.push(o);last=null;continue}
   if(o.node){r1.setStart(o.node,o.off);r1.setEnd(o.node,o.off+1);const q=r1.getClientRects()[0];
    if(q&&q.width>0){const top=q.top;if(last!==null&&top>last+lh*0.5){const prev=out[out.length-1];if(prev&&prev.c===' ')prev.c='\n';else out.push({c:'\n',p:o.p});}if(last===null||top>last+lh*0.5)last=top}}
   if(o.c===' '&&out.length&&out[out.length-1].c==='\n')continue;out.push(o)}}
 else out.push(...ch);
 const txt=out.map(o=>o.c).join('');lines=txt.split('\n').length;
 const ranges=[];let cur=null;out.forEach((o,i)=>{const S=sty(o.p);const k=S.slice(0,4).join('|');if(cur&&cur.k===k){cur.b=i+1}else{cur={k,a:i,b:i+1,S};ranges.push(cur)}});
 const base=ranges[0].S;
 const mono=/mono|Menlo|Consolas|Courier/i.test(cs.fontFamily);
 const al=cs.textAlign==='center'?'C':(cs.textAlign==='right'||cs.textAlign==='end')?'R':'L';
 const o={t:'T',x:R2(x1-ox),y:R2(y1-oy),w:R2(x2-x1),h:R2(y2-y1),s:txt,f:base[2],w8:base[0],c:base[1],lh:R2(lh),ls:px(cs.letterSpacing)||0,al,ln:lines};
 if(ell){o.el=1;const er=el.getBoundingClientRect();const cw=el.clientWidth-px(cs.paddingLeft)-px(cs.paddingRight);o.w=R2(Math.max(10,Math.min(o.w,cw)));o.x=R2(er.left+px(cs.borderLeftWidth)+px(cs.paddingLeft)-ox);o.ln=1}
 if(base[3])o.u=1;if(mono)o.mono=1;
 const diff=ranges.filter(r=>r.S[0]!==base[0]||r.S[1]!==base[1]||r.S[2]!==base[2]||r.S[3]!==base[3]).map(r=>[r.a,r.b,r.S[0],r.S[1],r.S[2],r.S[3]]);if(diff.length)o.r=diff;
 return o}
function pseudo(el,which,ox,oy,er,cs0){const cs=getComputedStyle(el,which);if(!cs||cs.content==='none'||cs.content==='normal'||cs.display==='none')return null;
 const bg=mapc(cs.backgroundColor);const bw=px(cs.borderTopWidth);const bc=bw?mapc(cs.borderTopColor):null;const sh=shadows(cs.boxShadow);
 const rad=[...(cs.backgroundImage||'').matchAll(/radial-gradient\(circle at (\S+) (\S+), (rgba?\([^)]+\)) (\d+(?:\.\d+)?)px/g)];
 if(!bg&&!bc&&!sh.length&&!rad.length)return null;
 const w=px(cs.width),h=px(cs.height)||(bc?bw:0);if(!w||!h)return null;
 let x,y;const bl=px(cs0.borderLeftWidth),bt=px(cs0.borderTopWidth);
 if(cs.position==='absolute'){x=cs.left!=='auto'?px(cs.left)+bl:er.width-px(cs0.borderRightWidth)-px(cs.right)-w;y=cs.top!=='auto'?px(cs.top)+bt:er.height-px(cs0.borderBottomWidth)-px(cs.bottom)-h}else{const rg=document.createRange();rg.selectNodeContents(el);const rs=[...rg.getClientRects()].filter(q=>q.width>0);if(rs.length&&(/inline/.test(cs.display)||/flex/.test(cs0.display))){if(which==='::before'){const fg=/flex|grid/.test(cs0.display)?px(cs0.columnGap):0;x=rs[0].left-er.left-Math.max(px(cs.marginRight),fg)-w}else if(/flex/.test(cs0.display)&&/space-between|flex-end|end/.test(cs0.justifyContent)){x=er.width-px(cs0.paddingRight)-px(cs0.borderRightWidth)-px(cs.marginRight)-w}else{const l=rs[rs.length-1];x=l.right-er.left+px(cs.marginLeft)}y=(rs[0].top+rs[0].bottom)/2-er.top-h/2}else{x=bl+px(cs0.paddingLeft);y=bt+px(cs0.paddingTop)}}
 const n={t:'F',n:which.replace('::',''),x:R2(er.left-ox+x),y:R2(er.top-oy+y),w:R2(w),h:R2(h)};
 const brw=px(cs.borderRightWidth),bbw=px(cs.borderBottomWidth);if(cs.transform!=='none'&&brw&&bbw&&!px(cs.borderTopWidth)){const m=cs.transform.match(/matrix\(([^)]+)\)/);const [a,b]=m?m[1].split(',').map(Number):[1,0];const cx=w/2,cy=h/2;const rot=([X,Y])=>[cx+(X-cx)*a-(Y-cy)*b,cy+(X-cx)*b+(Y-cy)*a];const pts=[[w,0],[w,h],[0,h]].map(rot);const pad=2,S2=Math.ceil(Math.max(w,h)*1.5)+pad*2;const off=(S2-w)/2;const col=(mapc(cs.borderRightColor)||'#191f28').slice(0,7);return {t:'S',x:R2(er.left-ox+x-off),y:R2(er.top-oy+y-off),w:S2,h:S2,v:`<svg xmlns="http://www.w3.org/2000/svg" width="${S2}" height="${S2}" viewBox="0 0 ${S2} ${S2}"><polyline points="${pts.map(([X,Y])=>(X+off).toFixed(2)+','+(Y+off).toFixed(2)).join(' ')}" fill="none" stroke="${col}" stroke-width="${brw}" stroke-linecap="round" stroke-linejoin="round"/></svg>`}}if(bg)n.bg=bg;
 const rr=[cs.borderTopLeftRadius,cs.borderTopRightRadius,cs.borderBottomRightRadius,cs.borderBottomLeftRadius].map(v=>v.includes('%')?Math.min(w,h)*parseFloat(v)/100:px(v));if(rr.some(Boolean))n.r=rr;
 if(bc){if(!px(cs.height)){n.bg=bc;n.h=bw;if(/dash|dot/.test(cs.borderTopStyle))n.dashLine=1}else{n.st=bc;n.sw=bw;if(/dash|dot/.test(cs.borderTopStyle))n.dash=1}}if(sh.length)n.sh=sh;
 if(rad.length){n.k=[];for(const m of rad){const rr=+m[4];const cx=m[1].includes('%')?w*parseFloat(m[1])/100:px(m[1]);const cy=m[2].includes('%')?h*parseFloat(m[2])/100:px(m[2]);n.k.push({t:'F',n:'notch',x:R2(cx-rr),y:R2(cy-rr),w:rr*2,h:rr*2,bg:mapc(m[3]),r:[rr,rr,rr,rr]})}}return n}
function walk(el,ox,oy,kids){
 const cs=getComputedStyle(el);if(!visible(cs))return;if(cs.display!=='contents'&&el.checkVisibility&&!el.checkVisibility({contentVisibilityAuto:true,visibilityProperty:true}))return;
 const r=el.getBoundingClientRect();if(r.width===0&&r.height===0&&cs.overflow!=='visible')return;
 const tag=el.tagName;
 if(tag==='svg'||tag==='SVG'){if(r.width&&r.height)kids.push({t:'S',x:R2(r.left-ox),y:R2(r.top-oy),w:R2(r.width),h:R2(r.height),v:svgStr(el,R2(r.width),R2(r.height))});return}
 if(tag==='IMG'){const src=el.currentSrc||el.src;if(src.startsWith('data:image/svg')){let s;try{s=src.includes('base64,')?decodeURIComponent(escape(atob(src.split('base64,')[1]))):decodeURIComponent(src.split(',')[1])}catch(e){s=null}
   if(s){const d=new DOMParser().parseFromString(s,'image/svg+xml').documentElement;d.setAttribute('width',R2(r.width));d.setAttribute('height',R2(r.height));kids.push({t:'S',x:R2(r.left-ox),y:R2(r.top-oy),w:R2(r.width),h:R2(r.height),v:d.outerHTML.replace(/\s+/g,' ')})}}
  else{if(!(src in IMG))IMG[src]='i'+(imgN++);const n={t:'I',x:R2(r.left-ox),y:R2(r.top-oy),w:R2(r.width),h:R2(r.height),k:IMG[src]};const rr=px(cs.borderTopLeftRadius);if(rr)n.r=[rr,rr,rr,rr];const ibg=mapc(cs.backgroundColor),ish=shadows(cs.boxShadow);if(ibg||ish.length){const f={t:'F',n:'img-box',x:n.x,y:n.y,w:n.w,h:n.h,k:[Object.assign({},n,{x:0,y:0})]};if(ibg)f.bg=ibg;if(ish.length)f.sh=ish;if(rr)f.r=[rr,rr,rr,rr];f.cl=1;kids.push(f)}else kids.push(n)}return}
 if(tag==='INPUT'||tag==='TEXTAREA'||tag==='SELECT'){/* render as box + value text */}
 const bg=mapc(cs.backgroundColor);
 const bws=['Top','Right','Bottom','Left'].map(s=>px(cs['border'+s+'Width'])*(cs['border'+s+'Style']==='none'?0:1));
 const bcs=['Top','Right','Bottom','Left'].map(s=>mapc(cs['border'+s+'Color']));
 const sh=shadows(cs.boxShadow);
 const clip=cs.overflow!=='visible'&&(cs.overflowX!=='visible');
 const rr=[cs.borderTopLeftRadius,cs.borderTopRightRadius,cs.borderBottomRightRadius,cs.borderBottomLeftRadius].map(v=>v.includes('%')?Math.min(r.width,r.height)*parseFloat(v)/100:px(v));
 const vis=bg||bws.some((w,i)=>w&&bcs[i])||sh.length||(clip&&rr.some(Boolean))||+cs.opacity<1||(cs.backgroundImage!=='none'&&/^linear-gradient/.test(cs.backgroundImage)&&/%|px/.test(cs.backgroundImage))||!!(el.dataset&&el.dataset.rot);
 let target=kids,nx=ox,ny=oy;
 if(vis){const n={t:'F',x:R2(r.left-ox),y:R2(r.top-oy),w:R2(r.width),h:R2(r.height)};const cl=(el.className&&el.className.baseVal===undefined?el.className:'')||'';n.n=(cl.split(' ')[0]||tag.toLowerCase());
  if(bg)n.bg=bg;if(rr.some(Boolean))n.r=rr.map(R2);
  if(bws.some(Boolean)){if(['Top','Right','Bottom','Left'].some(sd=>/dash|dot/.test(cs['border'+sd+'Style'])))n.dash=/dot/.test(cs.borderTopStyle+cs.borderBottomStyle)?2:1;const live=bws.map((w,i)=>w?bcs[i]:null);const same=bws.every(w=>w===bws[0])&&live.every(c=>c===live[0]);if(same){n.st=live[0];n.sw=bws[0]}else{n.st=live.find(Boolean);n.sws=bws}}
  if(sh.length)n.sh=sh;if(clip)n.cl=1;if(+cs.opacity<1)n.o=+cs.opacity;
  if(cs.backgroundImage!=='none'&&/^linear-gradient/.test(cs.backgroundImage)){const gi=cs.backgroundImage;const g=gi.match(/rgba?\([^)]+\)/g);if(g&&!bg&&g.every(c=>c===g[0]))n.bg=mapc(g[0]);
   else{const horiz=/to right|90deg/.test(gi);const st=[...gi.matchAll(/(rgba?\([^)]+\))\s+(-?[\d.]+)(%|px)/g)].map(m=>({c:m[1],p:m[3]==='%'?+m[2]/100:+m[2]/(horiz?r.width:r.height)}));
    if(st.length>=2){n.k=n.k||[];n.seg=[];const add=(c,a,b)=>{const m=mapc(c);if(!m||b<=a)return;n.seg.push(horiz?{t:'F',n:'fill',x:R2(r.width*a),y:0,w:R2(r.width*(b-a)),h:R2(r.height),bg:m}:{t:'F',n:'fill',x:0,y:R2(r.height*a),w:R2(r.width),h:R2(r.height*(b-a)),bg:m})};
     if(st[0].p>0)add(st[0].c,0,st[0].p);for(let i=0;i<st.length-1;i++)if(st[i].c===st[i+1].c)add(st[i].c,st[i].p,st[i+1].p);if(st[st.length-1].p<1)add(st[st.length-1].c,st[st.length-1].p,1)}}}
  if(el.dataset&&el.dataset.rot)n.rot=+el.dataset.rot;
  kids.push(n);n.k=n.seg||[];delete n.seg;target=n.k;nx=r.left;ny=r.top}
 if(cs.display==='list-item'&&cs.listStyleType!=='none'){const rg=document.createRange();rg.selectNodeContents(el);const q=[...rg.getClientRects()].find(z=>z.width>0);if(q){const fs=px(cs.fontSize);const d=Math.max(3,Math.round(fs*0.3));const col=mapc(cs.color)||'#191f28';const lx=cs.listStylePosition==='inside'?q.left-d-6:r.left-Math.round(fs*0.9);target.push({t:'F',n:'bullet',x:R2(lx-nx),y:R2((q.top+q.bottom)/2-d/2-ny),w:d,h:d,bg:col,r:[d/2,d/2,d/2,d/2]})}}
 const b4=pseudo(el,'::before',nx,ny,r,cs);if(b4)target.push(b4);
 if(tag==='INPUT'||tag==='TEXTAREA'){const v=(el.type==='password'&&el.value)?'•'.repeat(el.value.length):(el.value||el.placeholder);if(v){const ph=!el.value;const fs=px(cs.fontSize);const lh=cs.lineHeight==='normal'?Math.round(fs*1.45):px(cs.lineHeight);const pl=px(cs.paddingLeft)+px(cs.borderLeftWidth),pt=px(cs.paddingTop)+px(cs.borderTopWidth);
   const ih=r.height-pt-px(cs.paddingBottom)-px(cs.borderBottomWidth);const ty=tag==='INPUT'?pt+(ih-lh)/2:pt;
   const pcs=ph?getComputedStyle(el,'::placeholder'):cs;target.push({t:'T',x:R2(r.left-nx+pl),y:R2(r.top-ny+ty),w:R2(r.width-pl-px(cs.paddingRight)),h:R2(lh),s:v,f:fs,w8:fw(cs.fontWeight),c:mapc(pcs.color)||'#00132b94',lh:R2(lh),ls:px(cs.letterSpacing)||0,al:cs.textAlign==='center'?'C':cs.textAlign==='right'?'R':'L',ln:tag==='TEXTAREA'?2:1})}}
 else if(tag==='SELECT'){const o=el.options[el.selectedIndex];if(o){const fs=px(cs.fontSize);const lh=Math.round(fs*1.45);target.push({t:'T',x:R2(r.left-nx+px(cs.paddingLeft)+px(cs.borderLeftWidth)),y:R2(r.top-ny+(r.height-lh)/2),w:R2(r.width-40),h:lh,s:o.text,f:fs,w8:fw(cs.fontWeight),c:mapc(cs.color),lh,ls:0,al:'L',ln:1})}}
 else if(isTextBlock(el)&&el.textContent.trim()){const t=tnode(el,nx,ny);if(t)target.push(t)}
 else{const kids=[...el.childNodes];const zi=n=>{if(n.nodeType!==1)return 0;const c=getComputedStyle(n);return c.position==='static'?0:c.zIndex==='auto'?0.25:(+c.zIndex||0)+0.5};kids.sort((a,b)=>zi(a)-zi(b));for(const n of kids){if(n.nodeType===1)walk(n,nx,ny,target);else if(n.nodeType===3&&n.nodeValue.trim()){const sp=document.createElement('span');sp.style.cssText='all:unset';n.parentNode.insertBefore(sp,n);sp.appendChild(n);const t=tnode(sp,nx,ny,[[n,el]]);if(t){Object.assign(t,{});target.push(t)}}}}
 const af=pseudo(el,'::after',nx,ny,r,cs);if(af)target.push(af);
}
window.__ser=function(root){const r=root.getBoundingClientRect();const cs=getComputedStyle(root);const n={t:'F',n:'root',x:0,y:0,w:R2(r.width),h:R2(r.height),bg:mapc(cs.backgroundColor)||'#ffffff',k:[]};
 for(const c of root.childNodes){if(c.nodeType===1)walk(c,r.left,r.top,n.k)}return n};
window.__imgs=()=>IMG;
})();
