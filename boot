# 🔑 boot – Porta de Entrada do SAIH-OS

Este diretório será responsável por tudo o que acontece **antes** do sistema estar totalmente carregado.
É a “porta de entrada” do SAIH OS, onde a Luz começa a romper o sistema deste mundo.

## Função do diretório `boot`

Aqui ficarão, no tempo certo:

- Configurações do **bootloader** (GRUB/ISOLINUX/syslinux, conforme o protótipo)
- Parâmetros de inicialização do **kernel** do SAIH OS
- Scripts de detecção inicial de hardware (modo simples, focado em estabilidade)
- Opções de:
  - Boot pelo **disco rígido/SSD**
  - Boot por **pendrive/USB**
  - Boot via **ISO** (live/rescue SAIH OS)
- Hooks para futuras rotinas de:
  - Verificação básica de integridade
  - Carregamento de perfis espirituais da Obra (modo futuro/profético)

## Status Atual

- 📌 **Status:** Estrutura criada – aguardando definição do primeiro protótipo de boot.
- 🛠 **Próximo passo técnico:** 
  - Definir qual bootloader será usado no protótipo (GRUB em modo BIOS/UEFI simples).
  - Mapear parâmetros mínimos de kernel para iniciar o **system-core** e o ambiente base.

---

> Este diretório representa, no código, a **porta consagrada** por onde o SAIH OS desperta a máquina
> e entrega o controle ao Reino, não ao sistema deste mundo.
