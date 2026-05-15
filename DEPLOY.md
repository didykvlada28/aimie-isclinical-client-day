# Публикация (2 минуты после входа в GitHub)

## 1. Один раз: войти в GitHub CLI

Откройте **PowerShell** или **Terminal** и выполните:

```powershell
cd "C:\Users\shitz\is clinical"
gh auth login
```

- **GitHub.com** → **HTTPS** → **Login with a web browser** — подтвердите в браузере.

Проверка:

```powershell
gh auth status
```

## 2. Создать репозиторий и отправить код

Из той же папки проекта:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\publish.ps1
```

Скрипт создаст публичный репозиторий **`aimie-isclinical-client-day`** (если его ещё нет), настроит `origin` и выполнит **`git push`**.

## 3. Vercel

1. Откройте [vercel.com](https://vercel.com) → войдите через GitHub.  
2. **Add New…** → **Project** → выберите **`aimie-isclinical-client-day`**.  
3. Настройки:
   - **Framework:** Other  
   - **Build Command:** `npm run build`  
   - **Output Directory:** `public`  
4. **Deploy**. Ссылка вида `https://aimie-isclinical-client-day.vercel.app` появится после сборки.

## Если логин GitHub не `tzahishimkin`

Перед шагом 2 удалите старый remote или скрипт сам подставит URL от `gh api user`.

```powershell
 git remote -v
```
