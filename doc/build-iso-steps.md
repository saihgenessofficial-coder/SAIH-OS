# 🏗 Guia de Construção da ISO – SAIH OS

Documento técnico que registra **cada passo real para gerar a ISO Live do SAIH OS**, baseado no rootfs já criado e no ambiente com XFCE.

Será atualizado conforme evolução.

---

## 🔧 Requisitos para Builder

### Sistema recomendado
- Linux Ubuntu/Debian 20+ ou WSL2
- 20GB livres em disco
- sudo habilitado

### Pacotes essenciais

```bash
sudo apt update && sudo apt install -y \
  debootstrap squashfs-tools xorriso grub-pc-bin grub-efi-amd64-bin \
  mtools isolinux syslinux-utils live-build
