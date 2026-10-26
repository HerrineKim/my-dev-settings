const fs=require('fs'),cp=require('child_process'),crypto=require('crypto'),path=require('path');
const S=process.argv[2],out=S+'/out',pack=S+'/pack';fs.rmSync(pack,{recursive:true,force:true});fs.mkdirSync(pack);
const E=JSON.parse(fs.readFileSync(out+'/entries.json'));
const sha=f=>crypto.createHash('sha1').update(fs.readFileSync(f)).digest('hex');
const pageOf=i=>i<=30?'A':i<=45?'B':i<=51?'D':'C';
const files=[];const pages={A:[],B:[],C:[],D:[]};const cnt={A:0,B:0,C:0,D:0};
for(const e of E){const pg=pageOf(e.i);cnt[pg]++;const code=pg+String(cnt[pg]).padStart(2,'0');
 const devs=e.i===76?['m']:['d','m'];const item={i:e.i,code,n:e.n.replace(/^· /,'결제 · '),s:e.s,fig:e.fig,f:{}};
 for(const d of devs){const j=`${out}/${e.i}-${d}.json`;const t=JSON.parse(fs.readFileSync(j));const p=`${pack}/${code}-${d}.png`;cp.execFileSync('node',[S+'/pw/pngpack.js',j,p]);item.f[d]={png:p,h:sha(p),w:t.w,hh:t.h};files.push(p)}
 pages[pg].push(item)}
// images
const imgs=JSON.parse(fs.readFileSync(out+'/imgs.json'));const IMGH={};
for(const [src,k] of Object.entries(imgs)){const m=src.match(/^data:image\/(png|jpeg|webp);base64,(.*)$/);if(!m)continue;const p=`${pack}/img-${k}.${m[1]==='jpeg'?'jpg':m[1]}`;fs.writeFileSync(p,Buffer.from(m[2],'base64'));IMGH[k]=sha(p);files.push(p)}
// layout
const L={};for(const pg of 'ABCD'){let x=0,maxH=0;const jobs=[];for(const it of pages[pg]){if(it.f.d){maxH=Math.max(maxH,it.f.d.hh)}}
 const my=Math.ceil((maxH+400)/100)*100;
 for(const it of pages[pg]){if(it.f.d)jobs.push({h:it.f.d.h,name:`${it.code} ${it.n} / Desktop`,x,y:0,w:it.f.d.w,hh:it.f.d.hh});
  if(it.f.m)jobs.push({h:it.f.m.h,name:`${it.code} ${it.n} / Mobile`,x,y:my,w:375,hh:it.f.m.hh});x+=it.f.d?1600:455}
 L[pg]={mobileY:my,jobs}}
fs.writeFileSync(S+'/plan.json',JSON.stringify({L,IMGH,files},null,1));
console.log(files.length,'files',Object.keys(IMGH).length,'imgs',Object.fromEntries(Object.entries(L).map(([k,v])=>[k,[v.jobs.length,v.mobileY]])));
