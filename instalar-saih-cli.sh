#!/bin/bash
# Instalador do SAIH-CLI – SAIH OS
# Fase B – Protótipo de Servidor (CLI)

set -e

echo "========================================"
echo "  Instalador do SAIH-CLI (saih)"
echo "========================================"

# Pasta do script atual (raiz do repositório)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ORIG="$SCRIPT_DIR/CLI/saih-cli.sh"
DEST="/usr/local/bin/saih"

if [ ! -f "$ORIG" ]; then
  echo "ERRO: Não encontrei o arquivo CLI/saih-cli.sh"
  echo "Verifique se o repositório foi clonado corretamente."
  exit 1
fi

echo "Tornando o script executável..."
chmod +x "$ORIG"

echo "Instalando em $DEST (pode pedir senha sudo)..."
sudo cp "$ORIG" "$DEST"
sudo chmod 755 "$DEST"

echo
echo "✅ SAIH-CLI instalado com sucesso!"
echo
echo "Agora você pode usar:"
echo "  saih help"
echo "  saih versao"
echo "  saih sobre"
echo
echo "Shalom. SAIH OS – Sistema Operacional Espiritual Universal."
