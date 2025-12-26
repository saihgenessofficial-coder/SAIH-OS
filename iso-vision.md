# 📀 SAIH OS – Visão da ISO Live & Instalável
Documento oficial de planejamento e execução técnica para geração da primeira ISO do **SAIH OS**, contendo ambiente gráfico XFCE, suporte Live e estrutura inicial para instalação futura.

---

## 🎯 Objetivo Inicial da ISO

- Criar a primeira imagem **Live** do SAIH OS
- Bootável por **BIOS/UEFI**
- Com desktop **XFCE**
- Capaz de rodar em RAM via `toram` (modo leve e missões remotas)
- Base para futuras versões instaláveis

---

## 📌 Estrutura do Projeto

| Componente | Status | Descrição |
|----------|--------|-----------|
| `build-rootfs.sh` | ✔ feito | Gera o rootfs principal |
| `system-core` | ✔ feito | Configura serviços essenciais, rede, base OS |
| `desktop_xfce.sh` | ✔ feito | Instala XFCE dentro do rootfs |
| `build-iso.sh` | 🕒 aguardando execução | Script que monta a ISO final |
| `iso-vision.md` | ✔ este documento | Planejamento e roadmap da ISO |

---

## 📁 Estrutura esperada da ISO

