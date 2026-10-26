// node pngpack.js <in.json|txt> <out.png> : payload bytes stored losslessly in an RGBA PNG (stored deflate blocks)
const fs = require('fs');
const zlib = require('zlib');
const [, , inp, outp] = process.argv;
const data = fs.readFileSync(inp);
const payload = Buffer.concat([Buffer.alloc(4), data]);
payload.writeUInt32BE(data.length, 0);
const W = 512, rowBytes = W * 4;
const H = Math.max(1, Math.ceil(payload.length / rowBytes));
const raw = Buffer.alloc((rowBytes + 1) * H);
for (let y = 0; y < H; y++) {
  raw[y * (rowBytes + 1)] = 0;
  payload.copy(raw, y * (rowBytes + 1) + 1, y * rowBytes, Math.min(payload.length, (y + 1) * rowBytes));
}
// alpha must not be 0 for safety? keep raw; set nothing
const crcTable = (() => { const t = []; for (let n = 0; n < 256; n++) { let c = n; for (let k = 0; k < 8; k++) c = c & 1 ? 0xedb88320 ^ (c >>> 1) : c >>> 1; t[n] = c >>> 0 } return t })();
const crc = b => { let c = 0xffffffff; for (const x of b) c = crcTable[(c ^ x) & 255] ^ (c >>> 8); return (c ^ 0xffffffff) >>> 0 };
const chunk = (type, d) => { const l = Buffer.alloc(4); l.writeUInt32BE(d.length); const td = Buffer.concat([Buffer.from(type), d]); const c = Buffer.alloc(4); c.writeUInt32BE(crc(td)); return Buffer.concat([l, td, c]) };
const ihdr = Buffer.alloc(13); ihdr.writeUInt32BE(W, 0); ihdr.writeUInt32BE(H, 4); ihdr[8] = 8; ihdr[9] = 6; ihdr[10] = 0; ihdr[11] = 0; ihdr[12] = 0;
const idat = zlib.deflateSync(raw, { level: 0 });
fs.writeFileSync(outp, Buffer.concat([Buffer.from([137, 80, 78, 71, 13, 10, 26, 10]), chunk('IHDR', ihdr), chunk('IDAT', idat), chunk('IEND', Buffer.alloc(0))]));
console.log(outp, data.length, 'bytes ->', W + 'x' + H);
