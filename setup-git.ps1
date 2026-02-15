# Conecta a pasta atual ao repositório GitHub dra-marina-rosalez
# Execute este script na pasta do projeto (onde está index.html)

$ErrorActionPreference = "Stop"
$repoPath = $PSScriptRoot

Write-Host "Pasta do projeto: $repoPath" -ForegroundColor Cyan
if (-not (Test-Path "$repoPath\index.html")) {
    Write-Host "ERRO: index.html nao encontrado. Execute este script na pasta do projeto." -ForegroundColor Red
    exit 1
}

Set-Location $repoPath

# Remove .git antigo se existir (de tentativa anterior)
if (Test-Path ".git") {
    Write-Host "Removendo .git existente..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force .git
}

Write-Host "`n1. Inicializando Git..." -ForegroundColor Green
git init

Write-Host "`n2. Configurando identidade..." -ForegroundColor Green
git config user.email "mymindloops-spec@users.noreply.github.com"
git config user.name "mymindloops-spec"

Write-Host "`n3. Adicionando arquivos..." -ForegroundColor Green
git add .

Write-Host "`n4. Fazendo commit..." -ForegroundColor Green
git commit -m "Conecta pasta ao repositório"

Write-Host "`n5. Conectando ao GitHub..." -ForegroundColor Green
git branch -M main
git remote add origin https://github.com/mymindloops-spec/dra-marina-rosalez.git

Write-Host "`n6. Sincronizando com o repositório remoto..." -ForegroundColor Green
git pull origin main --allow-unrelated-histories --no-edit

Write-Host "`n7. Enviando para o GitHub..." -ForegroundColor Green
git push -u origin main

Write-Host "`nConcluido! Agora use Source Control (Ctrl+Shift+G) para Commit e Push." -ForegroundColor Cyan
