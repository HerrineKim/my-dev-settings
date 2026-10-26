// use_figma builder. Prepend: const JOBS=[{h:'<dataHash>',name:'..',x:0,y:0}], PAGE='<pageId>', IMGH={key:hash}
await figma.setCurrentPageAsync(await figma.getNodeByIdAsync(IMPORT_PAGE));const BYTES=[];for(const j of JOBS){const im=figma.getImageByHash(j.h);if(!im)throw new Error('missing '+j.name);BYTES.push(await im.getBytesAsync())}
const page=await figma.getNodeByIdAsync(PAGE);await figma.setCurrentPageAsync(page);
let FAM='Pretendard';const ST=['Regular','Medium','SemiBold','Bold','ExtraBold'];try{await Promise.all(ST.map(s=>figma.loadFontAsync({family:FAM,style:s})))}catch(e){FAM='Noto Sans KR';await Promise.all(['Regular','Medium','Bold','Black'].map(s=>figma.loadFontAsync({family:FAM,style:s})))}
let MONO=true;try{await figma.loadFontAsync({family:'IBM Plex Mono',style:'Regular'});await figma.loadFontAsync({family:'IBM Plex Mono',style:'Medium'})}catch(e){MONO=false}
const fst=w=>FAM==='Pretendard'?(w||'Regular'):({SemiBold:'Bold',Bold:'Black',ExtraBold:'Black',Black:'Black'}[w]||w||'Regular');
function unpack(b){const u32=o=>(b[o]<<24|b[o+1]<<16|b[o+2]<<8|b[o+3])>>>0;let o=8,W=0,H=0;const parts=[];
 while(o<b.length){const len=u32(o);const t=String.fromCharCode(b[o+4],b[o+5],b[o+6],b[o+7]);if(t==='IHDR'){W=u32(o+8);H=u32(o+12)}if(t==='IDAT')parts.push(b.subarray(o+8,o+8+len));o+=12+len}
 let tot=0;parts.forEach(p=>tot+=p.length);const z=new Uint8Array(tot);let q=0;parts.forEach(p=>{z.set(p,q);q+=p.length});
 let i=2;const ch=[];let rl=0;while(true){const f=z[i]&1;i++;const len=z[i]|z[i+1]<<8;i+=4;ch.push(z.subarray(i,i+len));rl+=len;i+=len;if(f)break}
 const r=new Uint8Array(rl);q=0;ch.forEach(c=>{r.set(c,q);q+=c.length});const rb=W*4;const pay=new Uint8Array(H*rb);for(let y=0;y<H;y++)pay.set(r.subarray(y*(rb+1)+1,(y+1)*(rb+1)),y*rb);
 const n=(pay[0]<<24|pay[1]<<16|pay[2]<<8|pay[3])>>>0;const bytes=pay.subarray(4,4+n);let s='';const parts2=[];
 for(let k=0;k<bytes.length;){let c=bytes[k++];if(c>=0xf0){c=((c&7)<<18)|((bytes[k++]&63)<<12)|((bytes[k++]&63)<<6)|(bytes[k++]&63)}else if(c>=0xe0){c=((c&15)<<12)|((bytes[k++]&63)<<6)|(bytes[k++]&63)}else if(c>=0xc0){c=((c&31)<<6)|(bytes[k++]&63)}parts2.push(String.fromCodePoint(c));if(parts2.length>4096){s+=parts2.join('');parts2.length=0}}
 return JSON.parse(s+parts2.join(''))}
function col(h){h=h.replace('#','');return {c:{r:parseInt(h.slice(0,2),16)/255,g:parseInt(h.slice(2,4),16)/255,b:parseInt(h.slice(4,6),16)/255},a:h.length>6?parseInt(h.slice(6,8),16)/255:1}}
const paint=h=>{const x=col(h);return {type:'SOLID',color:x.c,opacity:x.a}};
const soft=(h,w)=>{const x=col(h);const {r,g,b}=x.c;if(Math.max(r,g,b)-Math.min(r,g,b)>0.12)return h;const lum=(r+g+b)/3*x.a+(1-x.a);return lum<0.9?(w>=1.5?'#d1d6db':'#e5e8eb'):h};
// icon components live in a per-page library frame
let lib=page.children.find(n=>n.name==='_Icons');
if(!lib){lib=figma.createFrame();lib.name='_Icons';lib.fills=[];lib.clipsContent=false;page.appendChild(lib);lib.x=0;lib.y=-1200;lib.resize(10,10)}
const icoMap=new Map();for(const c of lib.children)if(c.type==='COMPONENT')icoMap.set(c.description,c);
function hashStr(s){let h=5381;for(let i=0;i<s.length;i++)h=(h*33^s.charCodeAt(i))>>>0;return h.toString(36)}
function iconComp(v,w,h){const key=hashStr(v)+':'+v.length;let c=icoMap.get(key);if(c)return c;
 const svg=figma.createNodeFromSvg(v);c=figma.createComponent();c.resize(Math.max(1,w),Math.max(1,h));c.fills=[];c.clipsContent=false;
 for(const k of [...svg.children])c.appendChild(k);svg.remove();c.name='icon/'+(icoMap.size+1);c.description=key;
 const n=lib.children.length;lib.appendChild(c);c.x=(n%30)*40;c.y=Math.floor(n/30)*40;icoMap.set(key,c);return c}
let count=0;
function build(n,parent){count++;
 if(n.t==='T'){const t=figma.createText();t.fontName=n.mono&&MONO?{family:'IBM Plex Mono',style:n.w8==='Regular'||!n.w8?'Regular':'Medium'}:{family:FAM,style:fst(n.w8)};t.characters=n.s;t.fontSize=n.f;if(n.c)t.fills=[paint(n.c)];
  t.lineHeight={unit:'PIXELS',value:n.lh};if(n.ls)t.letterSpacing={unit:'PIXELS',value:n.ls};t.textAlignHorizontal=n.al==='C'?'CENTER':n.al==='R'?'RIGHT':'LEFT';
  if(n.u)t.textDecoration='UNDERLINE';
  for(const [a,b,w,c,f,u] of (n.r||[])){if(w)t.setRangeFontName(a,b,{family:FAM,style:fst(w)});if(c)t.setRangeFills(a,b,[paint(c)]);if(f)t.setRangeFontSize(a,b,f);t.setRangeTextDecoration(a,b,u?'UNDERLINE':'NONE')}
  parent.appendChild(t);
  if(n.el){t.textAutoResize='HEIGHT';t.resize(Math.max(1,n.w),n.h);t.textTruncation='ENDING';t.maxLines=1;t.x=n.x;t.y=n.y}
  else if(n.ln<=1||n.s.includes('\n')){t.textAutoResize='WIDTH_AND_HEIGHT';const dx=n.al==='R'?n.w-t.width:n.al==='C'?(n.w-t.width)/2:0;t.x=n.x+dx;t.y=n.ln>1?n.y:n.y+(n.h-t.height)/2}
  else{t.resize(n.w+2,n.h);t.textAutoResize='HEIGHT';t.x=n.x;t.y=n.y}
  t.name=n.s.slice(0,40);return t}
 if(n.t==='S'){let node;if(n.v.length<2500&&n.w<=64&&n.h<=64){node=iconComp(n.v,n.w,n.h).createInstance()}else{node=figma.createNodeFromSvg(n.v);node.name='graphic'}
  parent.appendChild(node);node.x=n.x;node.y=n.y;if(Math.abs(node.width-n.w)>0.5||Math.abs(node.height-n.h)>0.5)node.resize(Math.max(1,n.w),Math.max(1,n.h));return node}
 if(n.t==='I'){const r=figma.createRectangle();r.resize(Math.max(1,n.w),Math.max(1,n.h));r.name='image';const hsh=IMGH[n.k];r.fills=hsh?[{type:'IMAGE',imageHash:hsh,scaleMode:'FILL'}]:[paint('#e5e8eb')];if(n.r)r.cornerRadius=n.r[0];parent.appendChild(r);r.x=n.x;r.y=n.y;return r}
 const f=figma.createFrame();f.name=n.n||'box';f.resize(Math.max(0.01,n.w),Math.max(0.01,n.h));f.fills=n.bg?[paint(n.bg)]:[];f.clipsContent=!!n.cl;
 if(n.dashLine){f.fills=[];f.strokes=[paint(soft(n.bg,1))];f.strokeWeight=0;f.strokeTopWeight=n.h;f.strokeBottomWeight=0;f.strokeLeftWeight=0;f.strokeRightWeight=0;f.dashPattern=[4,3];f.resize(Math.max(0.01,n.w),Math.max(n.h,1))}
 if(n.r){if(n.r.every(v=>v===n.r[0]))f.cornerRadius=n.r[0];else{f.topLeftRadius=n.r[0];f.topRightRadius=n.r[1];f.bottomRightRadius=n.r[2];f.bottomLeftRadius=n.r[3]}}
 const effects=[];let strokeSet=false;
 if(n.st){f.strokes=[paint(soft(n.st,n.sw||1))];f.strokeAlign='INSIDE';if(n.sws){f.strokeTopWeight=n.sws[0];f.strokeRightWeight=n.sws[1];f.strokeBottomWeight=n.sws[2];f.strokeLeftWeight=n.sws[3]}else f.strokeWeight=n.sw;if(n.dash)f.dashPattern=n.dash===2?[2,2]:[4,3];strokeSet=true}
 for(const s of (n.sh||[])){const x=col(s.i&&!s.x&&!s.y&&!s.b?soft(s.c,s.s):s.c);if(s.i&&!s.x&&!s.y&&!s.b&&!strokeSet&&s.s>0){f.strokes=[{type:'SOLID',color:x.c,opacity:x.a}];f.strokeAlign='INSIDE';f.strokeWeight=s.s;strokeSet=true;continue}
  effects.push({type:s.i?'INNER_SHADOW':'DROP_SHADOW',color:{...x.c,a:x.a},offset:{x:s.x,y:s.y},radius:s.b,spread:s.s,visible:true,blendMode:'NORMAL'})}
 if(effects.length)f.effects=effects;if(n.o!=null)f.opacity=n.o;
 if(parent){parent.appendChild(f);f.x=n.x;f.y=n.y;if(n.rot){const ph=n.rot*Math.PI/180,c=Math.cos(ph),s2=Math.sin(ph),cx=n.x+n.w/2,cy=n.y+n.h/2;f.rotation=-n.rot;f.x=cx-(c*n.w/2-s2*n.h/2);f.y=cy-(s2*n.w/2+c*n.h/2)}}
 for(const k of (n.k||[]))build(k,f);return f}
const out=[];
for(const [ji,j] of JOBS.entries()){const tree=unpack(BYTES[ji]);
 const old=page.children.find(c=>c.name===j.name&&c.type==='FRAME');if(old)old.remove();
 const root=build(tree,null);root.name=j.name;root.clipsContent=true;page.appendChild(root);root.x=j.x;root.y=j.y;out.push({id:root.id,n:j.name.slice(0,4),h:Math.round(root.height)})}
return {font:FAM,out,nodes:count,icons:icoMap.size};
