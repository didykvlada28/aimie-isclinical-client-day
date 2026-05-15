# После авторизации: gh auth login
# Запуск из корня проекта:  powershell -ExecutionPolicy Bypass -File scripts/publish.ps1

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location -LiteralPath $root

$gh = "${env:ProgramFiles}\GitHub CLI\gh.exe"
if (-not (Test-Path -LiteralPath $gh)) {
  Write-Host "GitHub CLI не найден. Установите: winget install GitHub.cli"
  exit 1
}

$auth = & $gh auth status 2>&1
if ($LASTEXITCODE -ne 0) {
  Write-Host "Сначала выполните в этом же терминале:"
  Write-Host "  gh auth login"
  Write-Host "Выберите GitHub.com -> HTTPS -> авторизация через браузер."
  exit 1
}

$repo = "aimie-isclinical-client-day"
$user = (& $gh api user --jq .login).Trim()
if (-not $user) {
  Write-Host "Не удалось определить логин GitHub. Выполните: gh auth login"
  exit 1
}

$exists = & $gh repo view "$user/$repo" 2>&1
if ($LASTEXITCODE -ne 0) {
  Write-Host "Создаю репозиторий $user/$repo ..."
  & $gh repo create $repo --public --description "Aimie iS Clinical Client Day landing"
}

$remoteUrl = "https://github.com/$user/$repo.git"
$current = git remote get-url origin 2>$null
if ($current -ne $remoteUrl) {
  git remote remove origin 2>$null
  git remote add origin $remoteUrl
}

Write-Host "Отправляю main на GitHub..."
git push -u origin main

Write-Host ""
Write-Host "Готово: https://github.com/$user/$repo"
Write-Host ""
Write-Host "Дальше: Vercel.com -> Add New Project -> импорт этого репозитория"
Write-Host "  Framework: Other | Build: npm run build | Output: dist"
