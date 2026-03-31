# ConvertScriptDocs 📄

Conversor Universal Interativo de Documentos com suporte a múltiplos formatos. Converte documentos **de** e **para** Markdown, Word, PDF, PowerPoint, planilhas e muito mais!

## 🎯 Funcionalidades Principais

- ✅ **Conversão versátil**: Suporte a 10+ formatos de documentos
- ✅ **Conversão de planilhas**: Converte XLSX, XLS, CSV, ODS para Markdown com tabelas formatadas
- ✅ **PDF para Markdown**: Extrai texto e imagens de PDFs automaticamente
- ✅ **Modo monitoramento (Watchdog)**: Monitora uma pasta e converte novos arquivos automaticamente
- ✅ **Menu interativo**: Escolha destinos personalizados ao detectar Markdown
- ✅ **Multiplataforma**: Funciona em Windows, macOS e Linux
- ✅ **Suporte a imagens**: Extrai automaticamente imagens de documentos complexos

## 📋 Formatos Suportados

### Entrada
- Documentos: `.md`, `.docx`, `.odt`, `.rtf`, `.txt`, `.html`, `.htm`, `.pdf`, `.pptx`, `.ppt`
- Planilhas: `.xlsx`, `.xls`, `.csv`, `.ods`

### Saída
- Documentos: `.md`, `.docx`, `.pdf`, `.pptx`, `.odt`, `.rtf`, `.html`
- Planilhas: `.md` (convertidas em tabelas Markdown)

---

## 🚀 Como Usar

### Pré-requisitos

- **Python 3.7+** instalado
- **Git** (opcional, para clonar o repositório)

### Instalação por Sistema Operacional

#### 🐧 **Linux e macOS**

1. Clone ou baixe o repositório:
```bash
git clone https://github.com/amfreitas1981/ConvertScriptDocs.git
cd ConvertScriptDocs
```

2. **Opção 1: Usando ShellScript (recomendado)**
```bash
chmod +x setup_and_run.sh
./setup_and_run.sh -i /caminho/entrada -o /caminho/saída
```

3. **Opção 2: Rode Python diretamente**
```bash
# Criar e ativar ambiente virtual
python3 -m venv venv
source venv/bin/activate

# Instalar dependências
pip install -r requirements.txt

# Executar
python3 converter.py -i /caminho/entrada -o /caminho/saída
```

#### 🪟 **Windows**

1. Clone ou baixe o repositório:
```powershell
git clone https://github.com/amfreitas1981/ConvertScriptDocs.git
cd ConvertScriptDocs
```

2. **Opção 1: Usando PowerShell (recomendado)**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
.\setup_and_run.ps1 -input "C:\caminho\entrada" -output "C:\caminho\saída"
```

3. **Opção 2: Rode Python diretamente no CMD**
```cmd
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
python converter.py -i "C:\caminho\entrada" -o "C:\caminho\saída"
```

---

## 📖 Exemplos de Uso

### Conversão Simples (Um arquivo)

**Linux/macOS:**
```bash
./setup_and_run.sh -i documento.docx -o documento.md
```

**Windows (PowerShell):**
```powershell
.\setup_and_run.ps1 -input "documento.docx" -output "documento.md"
```

**Python direto (qualquer OS):**
```bash
python3 converter.py -i documento.docx -o documento.md
```

### Exemplos Práticos

```bash
# PDF para Markdown (extrai imagens automaticamente)
./setup_and_run.sh -i relatorio.pdf -o relatorio.md

# Planilha Excel para Markdown
./setup_and_run.sh -i dados.xlsx -o dados.md

# PowerPoint para PDF
./setup_and_run.sh -i apresentacao.pptx -o apresentacao.pdf

# Markdown para Word
./setup_and_run.sh -i documento.md -o documento.docx

# Markdown para PDF + Word + PowerPoint (via menu interativo)
./setup_and_run.sh --watch -i ./meus_docs -o ./saida
# Ao adicionar arquivo.md à pasta ./meus_docs, escolha as opções no menu
```

---

## 🔧 Argumentos e Opções

```
usage: converter.py [-h] [-i INPUT] [-o OUTPUT] [--watch]

Conversor Universal Interativo

optional arguments:
  -h, --help            Mostra esta mensagem de ajuda
  -i INPUT, --input INPUT
                        Caminho do arquivo ou pasta de entrada
  -o OUTPUT, --output OUTPUT
                        Caminho do arquivo ou pasta de saída
  --watch               Ativa modo de monitoramento (Watchdog)
```

---

## 👁️ Modo Watchdog (Monitoramento Automático)

Monitora uma pasta e converte arquivos automaticamente quando são criados:

**Linux/macOS:**
```bash
./setup_and_run.sh --watch -i ./documentos_entrada -o ./documentos_saida
```

**Windows:**
```powershell
.\setup_and_run.ps1 -input "C:\documentos_entrada" -output "C:\documentos_saida" -watch
```

### Comportamento do Watchdog:

1. **Faz varredura inicial** em todos os arquivos da pasta
2. **Converte arquivos automaticamente** quando novos são adicionados
3. **Para arquivos Markdown**: Exibe menu interativo para escolher formatos
4. **Para outros formatos**: Converte automaticamente para Markdown
5. **Pressione Ctrl+C** para parar o monitoramento

### Menu Interativo Exemplo:

```
==================================================
📄 ARQUIVO MD DETECTADO: meu_documento.md
Escolha o destino (números separados por espaço):
1. PDF | 2. Word | 3. PPTX | 4. Todos | 0. Pular
Opção (ou Ctrl+C para sair): 1 2
✅ MD -> PDF: meu_documento.pdf
✅ MD -> Word: meu_documento.docx
```

---

## 📦 Dependências

O projeto utiliza as seguintes bibliotecas Python:

| Biblioteca | Função |
|-----------|--------|
| `pypandoc` | Conversão universal entre formatos (motor principal) |
| `pymupdf4llm` | Extração de PDF para Markdown com imagens |
| `pandas` | Processamento de planilhas (XLSX, CSV, ODS) |
| `openpyxl` | Suporte a arquivos Excel modernos |
| `xlrd` | Leitura de arquivos XLS antigos |
| `odfpy` | Suporte a formatos OpenDocument |
| `watchdog` | Monitoramento de mudanças em arquivos |
| `weasyprint` | Motor para geração de PDF (opcional) |

Todas são instaladas automaticamente via `requirements.txt`.

---

## 🐛 Troubleshooting

### Erro: "Python não encontrado" (Windows/Linux/macOS)

**Solução**: Instale Python 3.7 ou superior
- Windows: [python.org/downloads](https://www.python.org/downloads/)
- macOS: `brew install python3`
- Linux: `sudo apt install python3`

### Erro: "Pandoc não encontrado"

**Solução**: Instale Pandoc (dependência de `pypandoc`)
- Windows: `choco install pandoc` ou baixe em [pandoc.org](https://pandoc.org/)
- macOS: `brew install pandoc`
- Linux: `sudo apt install pandoc`

### Permissão negada no script (Linux/macOS)

```bash
chmod +x setup_and_run.sh
./setup_and_run.sh -i entrada -o saida
```

### Erro ao converter PDF com imagens

Certifique-se que `pymupdf4llm` está instalado:
```bash
pip install pymupdf4llm --upgrade
```

---

## 📝 Estrutura do Projeto

```
ConvertScriptDocs/
├── converter.py              # Script principal em Python
├── requirements.txt          # Dependências do projeto
├── setup_and_run.sh         # Script automático para Linux/macOS
├── setup_and_run.ps1        # Script automático para Windows
└── README.md                # Esta documentação
```

---

## 💡 Dicas e Boas Práticas

1. **Use caminhos absolutos**: Evita problemas com localização de arquivos
   ```bash
   ./setup_and_run.sh -i /home/usuario/documentos -o /home/usuario/saida
   ```

2. **Mantenha a pasta de saída separada**: Evita loops de conversão no watchdog
   ```bash
   ./setup_and_run.sh --watch -i ./entrada -o ./saida
   ```

3. **Para PDFs com muitas imagens**: Pode levar tempo, seja paciente ⏳

4. **Pressione Ctrl+C graciosamente**: O programa fecha com segurança sem erros

---

## 🤝 Contribuindo

Para sugestões, melhorias ou bugs, abra uma [issue](https://github.com/amfreitas1981/ConvertScriptDocs/issues) no repositório.

---

## 📄 Licença

Este projeto é fornecido como-é para fins educacionais e comerciais.

---

## 📞 Suporte

Para dúvidas ou problemas, entre em contato ou abra uma issue no GitHub.

**Desenvolvido com ❤️ para facilitarc a conversão de documentos**
