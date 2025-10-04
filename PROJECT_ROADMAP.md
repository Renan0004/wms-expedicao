# Projeto de Teste – Designer Front-End (Prototipação e Flutter)

## 📋 Resumo do Desafio

Criar um protótipo de tela para sistema WMS/TMS de **Gestão de Expedição** com design moderno, intuitivo e compatível com boas práticas de UX/UI.

---

## 🎯 Objetivos

### 1. Prototipação (OBRIGATÓRIO)
- ✅ Criar protótipo navegável em Figma/Adobe XD
- ✅ Design responsivo (mobile e desktop)
- ✅ Incluir todos os elementos funcionais

### 2. Implementação Flutter (OPCIONAL/DIFERENCIAL)
- ⚡ Implementar o design em Flutter
- ⚡ Código limpo e bem estruturado
- ⚡ Responsividade funcional

---

## 📱 Requisitos da Tela

### Elementos Obrigatórios

#### 1. **Lista de Pedidos para Expedição**
Cada pedido deve mostrar:
- 📦 Número do pedido
- 📍 Destino (cidade/estado)
- 🚚 Transportadora
- 📊 Status atual (pendente, pronto, enviado, retido)
- ⏰ Data/hora
- 🎯 Prioridade visual

#### 2. **Filtros e Busca**
- 🔍 Campo de busca (por número, destino, transportadora)
- 🎚️ Filtros por:
  - Status
  - Transportadora
  - Prioridade
  - Período (data)

#### 3. **Ações Rápidas**
- ✅ Marcar como enviado
- ⏸️ Reter pedido (com motivo)
- 👁️ Ver detalhes
- 🖨️ Imprimir etiqueta

#### 4. **Indicador de Prioridade**
- 🟢 Normal (verde)
- 🟡 Urgente (amarelo/laranja)
- 🔴 Crítico (vermelho)

---

## 📐 Estrutura do Design

### Versão Mobile
```
┌─────────────────────────┐
│  ☰  Gestão Expedição   │
├─────────────────────────┤
│  🔍 Buscar...          │
│  [Filtros ▼]           │
├─────────────────────────┤
│ ┌─────────────────────┐ │
│ │ 🔴 #12345          │ │
│ │ São Paulo - SP      │ │
│ │ 🚚 Logística XYZ   │ │
│ │ [Enviar] [Reter]   │ │
│ └─────────────────────┘ │
│ ┌─────────────────────┐ │
│ │ 🟡 #12346          │ │
│ │ ...                 │ │
│ └─────────────────────┘ │
└─────────────────────────┘
```

### Versão Desktop
```
┌────────────────────────────────────────────────────────┐
│  Gestão de Expedição                    👤 Admin       │
├────────────────────────────────────────────────────────┤
│  🔍 Buscar...        [Status ▼] [Prioridade ▼] [...] │
├──────┬─────────┬──────────────┬──────────┬────────────┤
│ Prio │ Pedido  │ Destino      │ Transp.  │ Ações      │
├──────┼─────────┼──────────────┼──────────┼────────────┤
│  🔴  │ #12345  │ São Paulo-SP │ Log. XYZ │ ✅ ⏸️ 👁️ │
│  🟡  │ #12346  │ Rio de Jan.  │ Expresso │ ✅ ⏸️ 👁️ │
│  🟢  │ #12347  │ Curitiba-PR  │ Rápida   │ ✅ ⏸️ 👁️ │
└──────┴─────────┴──────────────┴──────────┴────────────┘
```

---

## 🎨 Entregáveis

### 1. Protótipo Navegável
- **Formato**: Link do Figma/Adobe XD
- **Conteúdo**:
  - Tela principal (desktop)
  - Tela principal (mobile)
  - Modal de retenção de pedido
  - Estados de hover/interação
  - Fluxo de navegação funcional

### 2. Justificativa de Design
Documento explicando:
- **Escolhas de cores**: Por que cada cor foi escolhida
- **Tipografia**: Fontes e hierarquia visual
- **Layout**: Organização dos elementos
- **UX**: Decisões de usabilidade
- **Responsividade**: Adaptações mobile/desktop
- **Acessibilidade**: Contraste, tamanhos, etc.

### 3. Implementação Flutter (Opcional)
- Código fonte completo
- README com instruções
- Screenshots/GIFs da aplicação

---

## ✅ Checklist de Entrega

### Design
- [ ] Protótipo mobile criado
- [ ] Protótipo desktop criado
- [ ] Interações e navegação funcionais
- [ ] Componentes de UI definidos
- [ ] Paleta de cores documentada
- [ ] Tipografia definida
- [ ] Justificativa de design escrita

### Funcionalidades
- [ ] Lista de pedidos exibida
- [ ] Busca implementada (protótipo)
- [ ] Filtros implementados (protótipo)
- [ ] Ações rápidas visíveis
- [ ] Indicadores de prioridade claros
- [ ] Modal de retenção de pedido
- [ ] Estados visuais (hover, active, disabled)

### Flutter (Opcional)
- [ ] Projeto Flutter inicializado
- [ ] Modelos de dados criados
- [ ] Tela principal implementada
- [ ] Responsividade funcional
- [ ] Interações básicas funcionando

---

## 🚀 Próximos Passos

1. **Pesquisa**: Estudar sistemas WMS/TMS existentes
2. **Wireframe**: Esboçar estrutura básica
3. **Design**: Criar protótipo de alta fidelidade
4. **Documentação**: Escrever justificativa
5. **Implementação**: (Opcional) Desenvolver em Flutter
6. **Revisão**: Verificar todos os requisitos

---

## 📚 Recursos Úteis

### Inspiração de Design
- Sistemas WMS: Oracle WMS, SAP WMS, Manhattan Associates
- Material Design Guidelines
- Apple Human Interface Guidelines

### Ferramentas
- **Design**: Figma (recomendado), Adobe XD, Sketch
- **Ícones**: Material Icons, Font Awesome, Lucide
- **Cores**: Coolors.co, Adobe Color
- **Flutter**: flutter.dev

---

## 💡 Dicas

1. **Simplicidade**: WMS deve ser rápido e eficiente
2. **Contraste**: Status e prioridades devem ser óbvios
3. **Ações rápidas**: Minimizar cliques para tarefas comuns
4. **Feedback visual**: Usuário deve saber o estado do sistema
5. **Mobile first**: Muitos operadores usam tablets/celulares
6. **Acessibilidade**: Considere daltônicos e baixa visão
