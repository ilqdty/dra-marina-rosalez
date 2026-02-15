# Push automatico para GitHub - Dra. Marina Rosalez
# Pasta do projeto: C:\Users\alves\OneDrive\Negócios\Dra Marina\Landing Page
# Duplo-clique em push.bat OU: powershell -ExecutionPolicy Bypass -File push.ps1 "mensagem"

$ErrorActionPreference = "Stop"
$scriptDir = if ($PSScriptRoot) { $PSScriptRoot } else { Split-Path -Parent $MyInvocation.MyCommand.Path }
if ($scriptDir) { Set-Location $scriptDir }

Write-Host "Pasta: $scriptDir" -ForegroundColor Cyan
Write-Host ""

# Verificar se e um repo git
if (-not (Test-Path ".git")) {
    Write-Host "Inicializando Git..." -ForegroundColor Yellow
    git init
    git branch -M main
    git remote add origin https://github.com/ilqdty/dra-marina-rosalez.git
}

# Status
$status = git status --porcelain
if (-not $status) {
    Write-Host "Nenhuma alteracao para enviar." -ForegroundColor Green
    exit 0
}

Write-Host "Alteracoes detectadas:" -ForegroundColor Yellow
git status --short
Write-Host ""

# Add, commit, push
git add .
$msg = if ($args[0]) { $args[0] } else { "Atualizacao automatica" }
git commit -m $msg
git push origin main

Write-Host ""
Write-Host "Push concluido!" -ForegroundColor Green
