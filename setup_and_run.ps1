# Script de automação para Windows
Write-Host "🚀 Iniciando Conversor Universal (Windows)..." -ForegroundColor Green

# 1. Verifica Python
if (!(Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Erro: Python não encontrado no PATH." -ForegroundColor Red
    exit
}

# 2. Cria ambiente virtual
if (!(Test-Path "venv")) {
    Write-Host "📦 Criando ambiente virtual..." -ForegroundColor Cyan
    python -m venv venv
}

# 3. Ativa e instala dependências
.\venv\Scripts\Activate.ps1
Write-Host "🐍 Instalando dependências..." -ForegroundColor Cyan
pip install --upgrade pip -q
pip install -r requirements.txt -q

# 4. Executa o script com os argumentos passados
python converter.py $args

deactivate
