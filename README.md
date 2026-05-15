# aimie-isclinical-client-day

Static landing: **iS Clinical Client Day** at **Aimie** (Limassol, May 29).  
RU/EN language switch, all CTAs → WhatsApp.

## Local preview

```bash
node scripts/build.mjs
npx --yes serve@14 public -l 3000
```

Or with npm (when available):

```bash
npm run build
npm run preview
```

Opens `public/` on port 3000.

## Deploy (GitHub + Vercel)

Кратко: **[DEPLOY.md](./DEPLOY.md)** и **`scripts/publish.ps1`** (один раз выполните `gh auth login`).

1. Push this repo to GitHub (или запустите `publish.ps1`).
2. In Vercel: **New Project** → import the repo.
3. **Framework preset:** Other (static).
4. **Settings:**  
   - **Install Command:** `npm install` (optional; no deps)  
   - **Build Command:** `npm run build`  
   - **Output Directory:** `public`
5. Deploy. Use the default `*.vercel.app` URL (e.g. `aimie-isclinical-client-day.vercel.app` if that project name is free).

## Assets

Product and brand images live in `images/`. After changing `index.html` or `images/`, run `npm run build` before checking `public/`.
