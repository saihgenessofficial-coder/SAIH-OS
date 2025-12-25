#!/usr/bin/env bash
# ===============================================================
# 🕊️ SAIH OS - Instalador Base de Rootfs (Protótipo v0.1)
# Cria um rootfs Debian/Ubuntu mínimo consagrado ao SAIH OS.
# ===============================================================

# Requisitos na máquina hospedeira:
#  - Linux Debian/Ubuntu
#  - sudo
#  - debootstrap

# Uso (no host):
# sudo bash build/debian_base/build-rootfs.sh
# ===============================================================

set -euo pipefail

### CONFIGURAÇÃO BÁSICA ########################################

# Release base (pode ajustar depois: bookworm, jammy, etc.)
RELEASE="bookworm"

# Mirror padrão Debian (pode trocar por um mais próximo)
MIRROR="http://deb.debian.org/debian"

# Diretórios do projeto
PROJECT_ROOT="$(cd \"$(dirname \"${BASH_SOURCE[0]}\")/../../\" && pwd)"
ROOTFS_DIR=\"${PROJECT_ROOT}/output/rootfs-saih\"

mkdir -p \"$ROOTFS_DIR\"

echo \"🚀 Iniciando criação do RootFS base para SAIH OS...\"

sudo debootstrap \
    --arch=amd64 \
    \"$RELEASE\" \
    \"$ROOTFS_DIR\" \
    \"$MIRROR\"

echo \"============================================================\"
echo \"🎉 RootFS base gerado com sucesso!\"
echo \"📁 Local: $ROOTFS_DIR\"
echo \"Agora prossiga para integração do sistema-core e pacotes.\"
echo \"============================================================\"
