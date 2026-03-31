#!/bin/bash

# Cores para o terminal
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}🚀 Iniciando Conversor Universal (Linux/MacOS)...${NC}"

# 1. Verifica se o Python está instalado
if ! command -v python3 &> /dev/null; then
    echo "❌ Erro: Python3 não encontrado. Por favor, instale-o antes de continuar."
    exit 1
fi

# 2. Cria ambiente virtual se não existir
if [ ! -d "venv" ]; then
    echo "📦 Criando ambiente virtual Python..."
    python3 -m venv venv
fi

# 3. Ativa o ambiente e instala dependências
source venv/bin/activate
echo "py Instalando/Atualizando dependências..."
pip install --upgrade pip -q
pip install -r requirements.txt -q

# 4. Executa o script passando todos os argumentos recebidos
python3 converter.py "$@"

# Desativa o ambiente ao terminar
deactivate
