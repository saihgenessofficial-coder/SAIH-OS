#!/usr/bin/env bash
# SAIH OS – Desktop XFCE Installer (Protótipo v0.1)
# Instala o ambiente gráfico leve (XFCE) dentro do rootfs do SAIH OS.

set -euo pipefail

ROOTFS_DIR="output/rootfs-saih"

echo "🧩 SAIH OS – Instalação do Desktop XFCE"
echo "---------------------------------------"

# 1. Verifica se o rootfs existe
if [ ! -d "$ROOTFS_DIR" ]; then
  echo "❌ RootFS não encontrado em: $ROOTFS_DIR"
  echo "   Execute primeiro: sudo bash build-rootfs.sh"
  exit 1
fi

echo "✅ RootFS encontrado em: $ROOTFS_DIR"
echo

# 2. Entra no rootfs e instala o XFCE
sudo chroot "$ROOTFS_DIR" /bin/bash << 'EOF'
set -e

echo "🛠 Atualizando repositórios dentro do rootfs..."
export DEBIAN_FRONTEND=noninteractive
apt-get update

echo "📦 Instalando ambiente XFCE mínimo..."
apt-get install -y --no-install-recommends \
  xfce4 xfce4-goodies \
  lightdm lightdm-gtk-greeter \
  network-manager-gnome \
  firefox-esr \
  mousepad \
  thunar-archive-plugin \
  p7zip-full unzip

echo "⚙ Configurando sessão gráfica padrão..."
systemctl set-default graphical.target || true

# Opcional: garantir LightDM como display manager
if [ -f /usr/sbin/dpkg-reconfigure ]; then
  echo "⚙ Ajustando display manager para lightdm (se necessário)..."
  echo "lightdm shared/default-x-display-manager select lightdm" | debconf-set-selections || true
fi

echo "✅ XFCE instalado dentro do rootfs do SAIH OS."
EOF

echo
echo "✨ Desktop XFCE configurado no rootfs."
echo "Próximos passos sugeridos:"
echo " 1) Rodar o script system-core (se ainda não rodou)."
echo " 2) Montar/bootar esse rootfs em VM (QEMU/VirtualBox/KVM)."
echo " 3) Depois criaremos o script para aplicar temas, ícones e atalhos (HUB/CHAIN/BANTU)."
echo "---------------------------------------"
echo "Shalom. Fase C – SAIH OS Desktop (XFCE) em preparação."
