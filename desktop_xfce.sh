#!/usr/bin/env bash
# ==========================================================
# SAIH OS – Desktop XFCE (Fase C – Protótipo)
# Instala ambiente gráfico leve XFCE dentro do rootfs SAIH.
# Base: Debian/Ubuntu
# ==========================================================

set -euo pipefail

ROOTFS_DIR="output/rootfs-saih"

if [ ! -d "$ROOTFS_DIR" ]; then
  echo "✖ RootFS não encontrado."
  echo "  Execute primeiro:  sudo bash build-rootfs.sh"
  exit 1
fi

echo "✅ RootFS encontrado em: $ROOTFS_DIR"
echo "▶ Iniciando instalação do XFCE dentro do chroot..."

sudo chroot "$ROOTFS_DIR" /bin/bash << 'EOF'
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

echo "▶ [chroot] Atualizando repositórios..."
apt-get update

echo "▶ [chroot] Instalando base gráfica (Xorg + XFCE + LightDM)..."
apt-get install -y \
  xorg dbus-x11 \
  xfce4 xfce4-goodies \
  lightdm lightdm-gtk-greeter \
  network-manager network-manager-gnome \
  firefox-esr \
  file-roller thunar-archive-plugin \
  fonts-dejavu fonts-liberation

# Display manager padrão
echo "/usr/sbin/lightdm" > /etc/X11/default-display-manager

# Garantir NetworkManager ativo (se systemd estiver presente)
if command -v systemctl >/dev/null 2>&1; then
  systemctl enable NetworkManager || true
fi

# Criar pasta Desktop para o usuário root (por enquanto)
USER_HOME="/root"
mkdir -p "$USER_HOME/Desktop"
chmod 755 "$USER_HOME/Desktop"

echo "▶ [chroot] XFCE instalado. Ambiente gráfico básico pronto."
EOF

echo "▶ Fora do chroot: registrando atalhos .desktop da Obra..."

APPS_DIR="$ROOTFS_DIR/usr/share/applications"
DESKTOP_DIR="$ROOTFS_DIR/root/Desktop"

sudo mkdir -p "$APPS_DIR" "$DESKTOP_DIR"

# Copiar todos os .desktop da raiz do projeto para dentro do rootfs
for f in *.desktop; do
  if [ -f "$f" ]; then
    echo "  • Copiando $f para /usr/share/applications..."
    sudo cp "$f" "$APPS_DIR/"
  fi
done

# Copiar também para a área de trabalho do root
sudo cp "$APPS_DIR"/*.desktop "$DESKTOP_DIR"/ 2>/dev/null || true

# Garantir permissão de execução
sudo chmod +x "$APPS_DIR"/*.desktop "$DESKTOP_DIR"/*.desktop 2>/dev/null || true

echo "✅ XFCE + atalhos SAIH OS configurados no rootfs."
echo "Próximo passo: gerar imagem/VM usando este rootfs e testar o login gráfico."
