# 🧾 Checklist Antes de Gerar ISO – SAIH OS

### 🔧 Preparação do ambiente
- [ ] Linux Ubuntu/Debian ou WSL2 configurado
- [ ] 20GB livres
- [ ] Live-build e pacotes instalados
- [ ] Rootfs gerado e funcionando

### 🏗 Build da ISO
- [ ] Rodar `build-iso.sh`
- [ ] Confirmar squashfs gerado
- [ ] Kernel e initrd copiados para a ISO
- [ ] grub.cfg criado corretamente

### 🚀 Testes
- [ ] Boot no QEMU
- [ ] Boot no VirtualBox (opcional)
- [ ] Registrar o resultado em `iso-test-log.md`
