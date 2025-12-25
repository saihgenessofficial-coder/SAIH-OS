# SAIH OS – Visão da Interface Gráfica (Fase C)

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
- Um **ponto de missão** para escolas, igrejas, ONGs, escritórios simples e lares.

---

## 2. Linha visual (tema profético)

- **Tema padrão**:  
  - Fundo escuro (tons de azul profundo / roxo muito escuro)  
  - Detalhes em **ouro** (barras, acentos, ícones principais)
- **Mensagem visual**:
  - “A Luz que Rompe o Sistema deste Mundo”.
  - Nada de imagens que gerem idolatria – sempre criação, natureza e justiça.
- **Elementos planejados**:
  - Papel de parede oficial SAIH OS (selo + frase profética).
  - Pacote de ícones simples, com ênfase em clareza.
  - Tela de bloqueio com textos breves de esperança e justiça.

---

## 3. Ambientes gráficos alvo

### 3.1 XFCE – Edição Leve (primeiro alvo)

- Motivo: rápido, leve, funciona bem em máquinas antigas.
- Uso alvo:
  - Escolas simples
  - Centros comunitários
  - Computadores com pouca RAM / CPU
- Componentes principais:
  - xfce4, xfce4-goodies
  - lightdm (como gerenciador de sessão)
  - thunar (gerenciador de arquivos)
  - terminal xfce4-terminal

### 3.2 GNOME – Edição Completa (futuro)

- Motivo: experiência mais moderna e integrada.
- Uso alvo:
  - Escritórios da Obra
  - Estações de trabalho de criadores e levitas
- Componentes principais:
  - gnome-shell, gnome-session, gdm3
  - Nautilus, GNOME Terminal, configurações integradas

---

## 4. Aplicações mínimas recomendadas

**Comum às duas edições (XFCE / GNOME):**

- Navegador web (Firefox ou outro livre)
- Editor de texto (gedit, mousepad ou similar)
- Visualizador de PDFs
- Ferramentas de compressão (zip, tar, etc.)
- Ferramentas de rede básicas (ping, traceroute, net-tools)
- Cliente de terminal (para uso do `saih` via CLI)

**Aplicações ligadas à Obra (planejamento):**

- **SAIH HUB Desktop** (atalho para portal da Obra)
- **Painel SAIHCHAIN** (atalho web / app para rede profética)
- **Atalho BANTU** (entrada para conta e relatórios consagrados)
- Ferramenta própria de **atualização SAIH OS** (scripts + interface simples)

---

## 5. Estrutura técnica planejada

> *Tudo isso será implementado FUTURAMENTE, a partir do rootfs base já criado.*

### 5.1 Metapacotes / grupos

Criar metapacotes ou scripts que instalem “grupos”:

- `saih-desktop-xfce`
  - Instala XFCE, lightdm e apps mínimos.
- `saih-desktop-gnome`
  - Instala GNOME, gdm3 e apps mínimos.
- `saih-desktop-common`
  - Aplica tema, papel de parede, ícones, mensagens MOTD, etc.

### 5.2 Scripts de pós-instalação

- Aplicar:
  - Tema escuro + detalhes em ouro.
  - Papel de parede padrão da Obra.
  - Mensagem MOTD do terminal:
    - “SAIH OS – Sistema Operacional Espiritual Universal”
    - “A Luz que Rompe o Sistema deste Mundo”
- Criar atalhos na área de trabalho:
  - “SAIH HUB”
  - “SAIHCHAIN – Explorer”
  - “BANTU – Painel”

---

## 6. Experiência do usuário

- **Ao ligar o sistema**:
  - Tela de login simples: logotipo SAIH OS + frase curta.
- **Após login**:
  - Boas-vindas com texto curto:
    - “Bem-vindo ao SAIH OS – este ambiente é consagrado para servir povos e nações.”
- **Foco**:
  - Nada de distrações desnecessárias.
  - Rápido, limpo e organizado.
  - Fácil de usar mesmo para pessoas sem experiência em tecnologia.

---

## 7. Próximos passos práticos

1. **Prototipar em VM (VirtualBox / KVM):**
   - Usar o rootfs base criado pelo `build-rootfs.sh`.
   - Instalar XFCE manualmente e anotar comandos.
2. **Transformar roteiro em script:**
   - Criar `build/desktop_xfce.sh` com todos os passos.
3. **Documentar comandos finais em `docs/desktop-vision.md`:**
   - Adicionar logs, dificuldades, decisões técnicas.
4. **Planejar ISO Live / Instalador gráfico:**
   - Integrar com o trabalho dos scripts `build-rootfs.sh` e `system-core`.

---

### Nota final

Esta visão é apenas o **começo** da Fase C.  
Cada detalhe será amadurecido com sabedoria, para que o SAIH OS seja:

> “Um sistema operacional espiritual, simples, estável e preparado para impactar povos e nações.”
