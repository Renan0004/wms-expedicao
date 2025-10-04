# 👁️ Preview do Sistema de Gestão de Expedição

## 🖥️ Versão Desktop (> 900px)

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║  Gestão de Expedição                                    📦 8 pedidos          ║
╠═══════════════════════════════════════════════════════════════════════════════╣
║                                                                               ║
║  🔍 [Buscar pedido, destino ou transportadora...               ] [x]         ║
║                                                                               ║
║  [ Status ▼ ]  [ Prioridade ▼ ]  [ Transportadora ▼ ]  [ Limpar ]           ║
║                                                                               ║
╠═══╦══════════╦════════════════════╦══════════════════╦═════════╦══════════════╣
║ P ║ Pedido   ║ Destino            ║ Transportadora   ║ Status  ║ Ações        ║
╠═══╬══════════╬════════════════════╬══════════════════╬═════════╬══════════════╣
║ 🔴 ║ #12345   ║ São Paulo          ║ Logística XYZ    ║ Pronto  ║ 👁️ ⏸️ ✅    ║
║   ║          ║ SP                 ║                  ║         ║              ║
╟───╫──────────╫────────────────────╫──────────────────╫─────────╫──────────────╢
║ 🟡 ║ #12346   ║ Rio de Janeiro     ║ Expresso Transp. ║ Pronto  ║ 👁️ ⏸️ ✅    ║
║   ║          ║ RJ                 ║                  ║         ║              ║
╟───╫──────────╫────────────────────╫──────────────────╫─────────╫──────────────╢
║ 🟢 ║ #12347   ║ Curitiba           ║ Rápida Logística ║ Pendente║ 👁️ ⏸️ ✅    ║
║   ║          ║ PR                 ║                  ║         ║              ║
╟───╫──────────╫────────────────────╫──────────────────╫─────────╫──────────────╢
║ 🟡 ║ #12348   ║ Belo Horizonte     ║ Logística XYZ    ║ Retido  ║ 👁️ ⏸️ ✅    ║
║   ║          ║ MG                 ║                  ║         ║              ║
╟───╫──────────╫────────────────────╫──────────────────╫─────────╫──────────────╢
║ 🟢 ║ #12349   ║ Porto Alegre       ║ Expresso Transp. ║ Enviado ║ 👁️ ⏸️ ✅    ║
║   ║          ║ RS                 ║                  ║         ║              ║
╟───╫──────────╫────────────────────╫──────────────────╫─────────╫──────────────╢
║ 🔴 ║ #12350   ║ Brasília           ║ Rápida Logística ║ Pronto  ║ 👁️ ⏸️ ✅    ║
║   ║          ║ DF                 ║                  ║         ║              ║
╟───╫──────────╫────────────────────╫──────────────────╫─────────╫──────────────╢
║ 🟢 ║ #12351   ║ Salvador           ║ Logística XYZ    ║ Pendente║ 👁️ ⏸️ ✅    ║
║   ║          ║ BA                 ║                  ║         ║              ║
╟───╫──────────╫────────────────────╫──────────────────╫─────────╫──────────────╢
║ 🟡 ║ #12352   ║ Fortaleza          ║ Expresso Transp. ║ Pronto  ║ 👁️ ⏸️ ✅    ║
║   ║          ║ CE                 ║                  ║         ║              ║
╚═══╩══════════╩════════════════════╩══════════════════╩═════════╩══════════════╝
```

### Legenda de Ações:
- 👁️ **Ver Detalhes**: Visualizar informações completas
- ⏸️ **Reter**: Abrir modal para reter pedido
- ✅ **Enviar**: Marcar como enviado

---

## 📱 Versão Mobile (< 900px)

```
┌─────────────────────────────────────┐
│  ☰  Gestão de Expedição             │
│                      📦 8 pedidos    │
├─────────────────────────────────────┤
│                                     │
│  🔍 Buscar...                  [x]  │
│                                     │
│  [Status ▼] [Prio ▼] [Transp ▼]   │
│                                     │
├─────────────────────────────────────┤
│                                     │
│  ┌───────────────────────────────┐  │
│  │ 🔴 #12345         [Pronto]    │  │
│  │                               │  │
│  │ 📍 São Paulo - SP            │  │
│  │ 🚚 Logística XYZ             │  │
│  │ ⏰ 03/10/2025 14:30          │  │
│  │ 15 itens • 45.5kg            │  │
│  │                               │  │
│  │ [  ⏸️ Reter  ] [ ✅ Enviar ] │  │
│  └───────────────────────────────┘  │
│                                     │
│  ┌───────────────────────────────┐  │
│  │ 🟡 #12346         [Pronto]    │  │
│  │                               │  │
│  │ 📍 Rio de Janeiro - RJ       │  │
│  │ 🚚 Expresso Transportes      │  │
│  │ ⏰ 03/10/2025 12:30          │  │
│  │ 8 itens • 22.3kg             │  │
│  │                               │  │
│  │ [  ⏸️ Reter  ] [ ✅ Enviar ] │  │
│  └───────────────────────────────┘  │
│                                     │
│  ┌───────────────────────────────┐  │
│  │ 🟢 #12347       [Pendente]    │  │
│  │                               │  │
│  │ 📍 Curitiba - PR             │  │
│  │ 🚚 Rápida Logística          │  │
│  │ ⏰ 03/10/2025 10:30          │  │
│  │ 12 itens • 35.7kg            │  │
│  │                               │  │
│  │ [  ⏸️ Reter  ] [ ✅ Enviar ] │  │
│  └───────────────────────────────┘  │
│                                     │
│           [⬇️ Scroll ⬇️]            │
│                                     │
└─────────────────────────────────────┘
         [  📷 Escanear  ]
```

---

## 🎯 Modal de Retenção de Pedido

```
┌─────────────────────────────────────────────┐
│  ⏸️ Reter Pedido #12345                    │
├─────────────────────────────────────────────┤
│                                             │
│  Selecione o motivo da retenção:           │
│                                             │
│  ○ Documentação pendente                   │
│  ○ Produto em falta                        │
│  ○ Endereço incompleto                     │
│  ○ Aguardando pagamento                    │
│  ○ Solicitação do cliente                  │
│  ● Outro motivo                            │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ Descreva o motivo:                  │   │
│  │                                     │   │
│  │ Cliente solicitou adiamento da     │   │
│  │ entrega para próxima semana        │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
├─────────────────────────────────────────────┤
│              [ Cancelar ]  [ ⏸️ Reter Pedido ]│
└─────────────────────────────────────────────┘
```

---

## 🔍 Exemplo de Busca em Tempo Real

### Digite: "São"
```
Resultados: 1 pedido

┌──────────────────────────────────┐
│ 🔴 #12345        [Pronto]        │
│ 📍 São Paulo - SP               │
│ 🚚 Logística XYZ                │
└──────────────────────────────────┘
```

### Digite: "Urgente" (filtro de prioridade)
```
Resultados: 3 pedidos

🟡 #12346 - Rio de Janeiro - RJ
🟡 #12348 - Belo Horizonte - MG
🟡 #12352 - Fortaleza - CE
```

---

## ✅ Fluxo de Ação: Marcar como Enviado

### Antes:
```
┌──────────────────────────────────┐
│ 🔴 #12345        [Pronto]        │
│ 📍 São Paulo - SP               │
│ [  ⏸️ Reter  ] [ ✅ Enviar ]    │
└──────────────────────────────────┘
```

### Clica em "✅ Enviar"

### Feedback Visual (SnackBar):
```
╔════════════════════════════════════╗
║ ✅ Pedido #12345 marcado como     ║
║    enviado                         ║
╚════════════════════════════════════╝
```

### Depois:
```
┌──────────────────────────────────┐
│ 🔴 #12345       [Enviado] ✓      │
│ 📍 São Paulo - SP               │
│ [  ⏸️ Reter  ] [ ✅ Enviar ]    │
└──────────────────────────────────┘
```

---

## 🎨 Paleta de Cores

```
┌─────────────────────────────────────┐
│  Primária (AppBar)                  │
│  #1976D2 ████████████████           │
│  Azul profissional                  │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│  Sucesso (Enviado)                  │
│  #4CAF50 ████████████████           │
│  Verde                              │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│  Alerta (Urgente)                   │
│  #FF9800 ████████████████           │
│  Laranja                            │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│  Crítico (Erro)                     │
│  #F44336 ████████████████           │
│  Vermelho                           │
└─────────────────────────────────────┘
```

---

## 📊 Estados dos Pedidos

### Status:
- **Pendente**: ⚪ Cinza - Em preparação
- **Pronto**: 🔵 Azul - Aguardando expedição
- **Enviado**: 🟢 Verde - Completado com sucesso
- **Retido**: 🔴 Vermelho - Bloqueado/problema

### Prioridade:
- **Normal**: 🟢 Verde - Fluxo padrão
- **Urgente**: 🟡 Laranja - Prazo apertado
- **Crítico**: 🔴 Vermelho - Atenção imediata

---

## 🔄 Responsividade em Ação

### Breakpoint: 900px

```
Desktop (> 900px)          Mobile (< 900px)
┌──────────────┐           ┌────────┐
│              │           │        │
│   TABELA     │    →      │ CARDS  │
│              │           │        │
│ ╔══════════╗ │           │ ┌────┐ │
│ ║ Linha 1  ║ │           │ │Card│ │
│ ║ Linha 2  ║ │           │ │Card│ │
│ ║ Linha 3  ║ │           │ │Card│ │
│ ╚══════════╝ │           │ └────┘ │
│              │           │        │
└──────────────┘           └────────┘
```

---

## 🎯 Interações Principais

### 1. Buscar Pedido
```
Digita "12345" → Filtra em tempo real → Mostra 1 resultado
```

### 2. Filtrar por Status
```
Clica [Status ▼] → Seleciona "Pronto" → Lista atualiza
```

### 3. Enviar Pedido (1 clique)
```
Clica [✅ Enviar] → Confirmação → Status muda para "Enviado"
```

### 4. Reter Pedido (2-3 cliques)
```
Clica [⏸️ Reter] → Modal abre → Seleciona motivo → Confirma
```

### 5. Limpar Filtros
```
Clica [Limpar] → Todos os filtros resetam → Lista completa
```

---

## 📈 Dados Mock (8 Pedidos)

| # | Pedido | Cidade | Estado | Transportadora | Status | Prioridade |
|---|--------|--------|--------|----------------|--------|------------|
| 1 | #12345 | São Paulo | SP | Logística XYZ | Pronto | 🔴 Crítico |
| 2 | #12346 | Rio de Janeiro | RJ | Expresso | Pronto | 🟡 Urgente |
| 3 | #12347 | Curitiba | PR | Rápida | Pendente | 🟢 Normal |
| 4 | #12348 | Belo Horizonte | MG | Logística XYZ | Retido | 🟡 Urgente |
| 5 | #12349 | Porto Alegre | RS | Expresso | Enviado | 🟢 Normal |
| 6 | #12350 | Brasília | DF | Rápida | Pronto | 🔴 Crítico |
| 7 | #12351 | Salvador | BA | Logística XYZ | Pendente | 🟢 Normal |
| 8 | #12352 | Fortaleza | CE | Expresso | Pronto | 🟡 Urgente |

---

## 💡 Tecnologias

- **Flutter 3.x**: Framework multiplataforma
- **Provider**: Gerenciamento de estado
- **Material Design 3**: Sistema de design
- **Google Fonts (Inter)**: Tipografia profissional

---

**🚀 Para ver funcionando de verdade, instale o Flutter e execute:**

```bash
cd flutter_app
flutter pub get
flutter run -d chrome
```
