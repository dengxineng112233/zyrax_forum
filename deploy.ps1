param(
  [string]$WorkerName = "cloudforum"
)

$ErrorActionPreference = "Stop"
Set-Location -LiteralPath $PSScriptRoot

Write-Host "[1/4] Installing dependencies..." -ForegroundColor Cyan
npm install

Write-Host "[2/4] Checking Wrangler login..." -ForegroundColor Cyan
npx wrangler whoami

Write-Host "[3/4] Applying remote D1 migrations..." -ForegroundColor Cyan
npm run d1:migrate:auth-plus:remote

Write-Host "[4/4] Deploying Worker: $WorkerName" -ForegroundColor Cyan
npx wrangler deploy --name $WorkerName
