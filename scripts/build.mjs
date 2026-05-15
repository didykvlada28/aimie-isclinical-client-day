import { cpSync, mkdirSync, rmSync, existsSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const out = join(root, "public");

if (existsSync(out)) {
  rmSync(out, { recursive: true, force: true });
}
mkdirSync(out, { recursive: true });

cpSync(join(root, "index.html"), join(out, "index.html"));
cpSync(join(root, "images"), join(out, "images"), { recursive: true });

console.log("Build OK → public/ (index.html + images/)");
