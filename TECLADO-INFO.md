# Meu teclado — MTKB W-SOFLE (split sem fio)

> Documento de referência sobre o teclado, o diagnóstico do lado direito e como
> rodar/configurar. Atualizado em 25/06/2026.

## O que é o teclado

- **Modelo:** MTKB **W-SOFLE** — um **Sofle** split (dividido em duas metades).
- **Conexão:** **2.4 GHz sem fio**, com um **dongle USB receptor** (incluso). *Não* é Bluetooth, *não* é ZMK.
- **Também funciona com fio:** cada metade tem porta **USB-C** (faz dados **e** carga).
- **Bateria:** **1200 mAh** por metade (recarregável), uma em cada lado.
- **Layout:** 64 teclas, switches MX, hot-swap.
- **Firmware:** **QMK + compatível com Vial** — mas **fechado**: a fabricante (PandaKB) entrega pré-gravado e **não disponibiliza o firmware/código-fonte**.

### Identidade técnica (lida do teclado pelo USB)

| Campo | Valor |
|---|---|
| USB VID:PID | `55D4:0664` |
| Serial | `vial:f64c2b3c` |
| Fabricante / Produto | `MTKB` / `W-SOFLE` |
| vial_protocol | 6 |
| keyboard_id | `0x362ff631af2847f7` |
| Matriz | rows=5, cols=16, layers=8 |
| Papéis | esquerda = central; direita = periférico |

## Problema: lado DIREITO não funciona

Apenas a **metade esquerda** funciona. Diagnóstico feito lendo o teclado direto pelo USB:

- ✅ **Mapa de teclas da direita está correto** (32 teclas, 0 vazias) → **não é configuração**.
- ✅ **Controlador da direita liga e é reconhecido** no USB (chip vivo, USB-C dela faz dados).
- ❌ **Teclas da direita nunca chegam** ao teclado (`matrix_poll` = 0 em todos os testes), nem com a direita plugada sozinha. A esquerda registra normal.

### Conclusão

A falha está **isolada na entrega das teclas da metade direita**. Não é o app, nem o mapa, nem o computador. Restam **duas causas**, a confirmar com ação física:

- **(A) Bateria/pareamento sem fio** — direita sem carga e/ou não pareada (com a esquerda ou com o dongle 2.4G). *Suspeito nº 1.*
- **(B) Hardware da metade direita** — solda/diodo/switch.

## Próximos passos (manutenção)

1. **Usar o dongle USB 2.4G** que veio com o teclado e ver se a direita conecta por ele. ← caminho mais promissor (ainda não testado)
2. **Carregar a metade direita** (1200 mAh) por 30–60 min, ligar (chave em ON), e testar no modo sem fio (esquerda no USB/dongle, direita na bateria, perto).
3. Se não voltar → **falar com a PandaKB** (suporte/garantia), pois o firmware é fechado.

### O que NÃO fazer

- ❌ **Não regravar firmware** com o QMK Toolbox: não existe firmware oficial pra baixar, e gravar um Sofle genérico **quebraria o 2.4G** (que é custom). O QMK Toolbox serve aqui só pra **diagnóstico** (ver se a metade entra em bootloader).

## Como configurar as teclas (funciona hoje)

- **App Vial** instalado em **Aplicativos** (ícone no Launchpad) — abre direto.
- Alternativa por código-fonte: `cd ~/Desktop/teclado-split && ./run.sh`.
- Mudanças vão pro teclado **em tempo real**; use **Save** pra gravar permanente.
- Como só a esquerda funciona, foi montada uma **layer 1** (acessada por um polegar esquerdo com `MO(1)`/`TG(1)`) com setas e atalhos de Mac (⌘C, ⌘V, ⌘Tab, ⌘W, ⌘F etc.) pra compensar o lado direito.

## Apps instalados nesta máquina

- **Vial.app** (`/Applications`) — configurar o teclado. Era Intel/não-assinado; instalado com xattr limpos + assinatura ad-hoc.
- **QMK Toolbox.app** (`/Applications`) — só diagnóstico de firmware. Universal (arm64+x86_64).

## Fontes

- PandaKB — página do W-SOFLE: https://pandakb.com/shop/keyboard-kit/w-sofle-split-keyboard-sofle-based-2-4g-wireless-w-usb-receiver-vial-programmabledistributed/
- Vial: https://get.vial.today/
