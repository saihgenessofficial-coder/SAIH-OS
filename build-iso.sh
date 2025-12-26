#!/usr/bin/env bash
# =============================================================
# SAIH OS – Construtor de ISO Live (Protótipo v0.1)
# Gera uma ISO básica a partir do rootfs em output/rootfs-saih.
# Base: Debian/Ubuntu no host.
# =============================================================

set -euo pipefail

# Diretórios principais
ROOTFS_DIR="output/rootfs-saih"        # Onde o rootfs já foi montado
WORK_DIR="output/iso-build"           # Pasta temporária de trabalho
ISO_ROOT="$WORK_DIR/iso-root"         # Estrutura que vira a ISO
IMAGE_NAME="saih-os-xfce"             # Nome lógico da imagem
ISO_FILE="output/${IMAGE_NAME}.iso"   # Caminho final da ISO

# -------------------------------------------------------------
# Função para checar comandos
# -------------------------------------------------------------
need_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "❌ Falta o comando obrigatório: $1"
    echo "   Instale com: sudo apt install $1"
    exit 1
  fi
}

echo "🔍 Verificando requisitos no host..."

need_cmd mksquashfs
need_cmd grub-mkrescue
need_cmd xorriso

# -------------------------------------------------------------
# Verificar se rootfs existe
# -------------------------------------------------------------
if [ ! -d "$ROOTFS_DIR" ]; then
  echo "❌ RootFS não encontrado em: $ROOTFS_DIR"
  echo "   Execute antes:"
  echo "     1) sudo bash build-rootfs.sh"
  echo "     2) sudo bash system-core"
  echo "     3) sudo bash desktop_xfce.sh"
  exit 1
fi

echo "✅ RootFS encontrado em: $ROOTFS_DIR"

# -------------------------------------------------------------
# Preparar diretórios de trabalho
# -------------------------------------------------------------
echo "🧹 Limpando diretório de trabalho..."
sudo rm -rf "$WORK_DIR"
mkdir -p "$ISO_ROOT/live"
mkdir -p "$ISO_ROOT/boot/grub"

# -------------------------------------------------------------
# Localizar kernel e initrd dentro do rootfs
# -------------------------------------------------------------
echo "🔎 Localizando kernel e initrd dentro do rootfs..."

KERNEL="$(sudo find "$ROOTFS_DIR/boot" -maxdepth 1 -name 'vmlinuz-*' | sort | tail -n 1 || true)"
INITRD="$(sudo find "$ROOTFS_DIR/boot" -maxdepth 1 \( -name 'initrd.img-*' -o -name 'initrd-*' \) | sort | tail -n 1 || true)"

if [ -z "$KERNEL" ] || [ -z "$INITRD" ]; then
  echo "❌ Não foi possível encontrar vmlinuz-* ou initrd* em $ROOTFS_DIR/boot."
  echo "   Certifique-se de que o kernel foi instalado dentro do rootfs."
  exit 1
fi

echo "   Kernel: $KERNEL"
echo "   Initrd: $INITRD"

echo "📦 Copiando kernel e initrd para a estrutura da ISO..."
sudo cp "$KERNEL" "$ISO_ROOT/live/vmlinuz"
sudo cp "$INITRD" "$ISO_ROOT/live/initrd"

# -------------------------------------------------------------
# Criar squashfs do rootfs
# -------------------------------------------------------------
echo "🧱 Gerando filesystem.squashfs (pode demorar um pouco)..."

sudo mksquashfs "$ROOTFS_DIR" "$ISO_ROOT/live/filesystem.squashfs" -e boot

# -------------------------------------------------------------
# Criar configuração mínima do GRUB
# -------------------------------------------------------------
echo "📝 Criando configuração mínima do GRUB..."

sudo tee "$ISO_ROOT/boot/grub/grub.cfg" >/dev/null << 'EOF'
set default=0
set timeout=5

menuentry "SAIH OS XFCE (Live)" {
    linux /live/vmlinuz boot=live toram quiet
    initrd /live/initrd
}
EOF

# -------------------------------------------------------------
# Gerar ISO com grub-mkrescue
# -------------------------------------------------------------
echo "💿 Gerando ISO com grub-mkrescue..."

mkdir -p "$(dirname "$ISO_FILE")"

sudo grub-mkrescue -o "$ISO_FILE" "$ISO_ROOT" 2>&1 | tee "$WORK_DIR/grub-mkrescue.log"

echo
echo "✅ ISO gerada com sucesso!"
echo "   Caminho: $ISO_FILE"
echo
echo "Próximo passo: testar a imagem em uma VM (VirtualBox, QEMU/KVM, etc.)."
echo "Exemplo:"
echo "   qemu-system-x86_64 -m 2048 -cdrom $ISO_FILE"
