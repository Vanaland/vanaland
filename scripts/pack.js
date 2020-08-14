const compressing = require("compressing");
const path = require("path");

const source = path.join(__dirname, "../out/win-unpacked");
const dist = path.join(__dirname, "../out/vanaland.zip");

compressing.zip.compressDir(source, dist);
