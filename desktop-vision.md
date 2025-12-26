# 🖥️ SAIH OS – Visão da Interface Gráfica (Fase C)

> **Fase C – Versão Desktop com Interface (GNOME / XFCE)**  
> Base: Debian/Ubuntu – ambiente leve, estável e preparado para a Obra SAIH GENESS.

---

## 1. Propósito da versão Desktop

A versão Desktop do **SAIH OS** não é apenas um sistema bonito.  
Ela será:

- Um **ambiente de trabalho consagrado**, onde tudo lembra o propósito da Obra.
- Uma **porta de entrada** para criadores, levitas, ministérios e povos acessarem:
  - SAIHCHAIN (rede profética)
  - Banco BANTU (justiça financeira)
  - SAIH HUB & Aplicações Universais
- Um **ponto de missão digital** para escolas, igrejas, ONGs, escritórios simples e lares.

---

## 2. Linha visual (tema profético)

- **Tema padrão**
  - Fundo escuro (tons de azul profundo / roxo muito escuro)
  - Detalhes em **ouro** (acentos, ícones e elementos-chave)
- **Mensagem visual principal**
  - “A Luz que Rompe o Sistema deste Mundo”
- **Diretrizes importantes**
  - Sem imagens de idolatria — foco em criação, justiça e esperança
  - Ilustrações que lembrem realeza, soberania e paz
- **Elementos planejados**
  - Papel de parede oficial SAIH OS (selo + frase profética)
  - Tema de ícones simples e claros
  - Tela de bloqueio com mensagens curtas de força e fé

---

## 3. Ambientes gráficos alvo

### 3.1 XFCE – Edição Leve (primeiro alvo)

- Motivo: rápido, leve, ideal para máquinas simples
- Indicado para:
  - Escolas
  - Centros comunitários
  - Computadores com pouca RAM/CPU
- Componentes base:
  - `xfce4`, `xfce4-goodies`
  - `lightdm` (gerenciador de sessão)
  - `thunar` (arquivos)
  - `xfce4-terminal`

### 3.2 GNOME – Edição Completa (futuro)

- Motivo: interface moderna e integrada
- Indicado para:
  - Escritórios
  - Criadores e levitas
- Componentes base:
  - `gnome-shell`, `gnome-session`, `gdm3`
  - `nautilus`, `gnome-terminal`

---

## 4. Aplicações mínimas recomendadas

**Comuns às duas edições:**

- Navegador Web (Firefox ou outro livre)
- Editor de texto (gedit / mousepad)
- Visualizador de PDF
- Ferramentas de compressão (zip, tar, etc.)
- Ferramentas de rede (ping, traceroute, net-tools)
- Terminal para uso do `saih`

**Aplicações ligadas à Obra:**

- **SAIH HUB Desktop**
- **Painel SAIHCHAIN**
- **Atalho Banco BANTU**
- Ferramenta de atualização SAIH OS

---

## 5. Estrutura técnica planejada

> A partir do rootfs base já criado, esta será a próxima etapa.

### 5.1 Metapacotes / Grupos

- `saih-desktop-xfce` → XFCE + apps mínimos
- `saih-desktop-gnome` → GNOME + apps mínimos
- `saih-desktop-common` → ícones, temas, papel de parede, MOTD

### 5.2 Pós-instalação automática

- Aplicar tema escuro + ouro
- Definir papel de parede oficial
- Mensagem MOTD do terminal:

