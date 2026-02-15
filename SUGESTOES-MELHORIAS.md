# Deep Dive — Sugestões de Melhorias
## Landing Page Dra. Marina Rosalez

Análise completa de copy, design, UX e UI com recomendações priorizadas.

---

## 1. COPY (Copywriting)

### Hero
| Atual | Sugestão | Motivo |
|-------|----------|--------|
| "Cuidar da saúde deveria ser rotina, não urgência." | Manter ou: "Sua saúde merece acompanhamento, não apenas emergências." | Headline forte; alternativa reforça o diferencial |
| "Acompanhamento médico contínuo e personalizado — de onde você estiver." | "Teleconsulta com tempo para escutar. Cuidado integral e longevidade." | Mais específico, destaca teleconsulta e escuta |
| "Quero agendar uma consulta" | "Agendar minha consulta" ou "Reservar meu horário" | Mais direto, foco na ação |

### Navegação
| Atual | Sugestão | Motivo |
|-------|----------|--------|
| "Consulta" (nav) | "Serviços" ou "O que ofereço" | Evita confusão com "Agendar consulta" |
| "Dúvidas" | "Perguntas frequentes" | Mais claro para quem não conhece |

### Seção Serviços
| Atual | Sugestão | Motivo |
|-------|----------|--------|
| "O que posso fazer por você." | "Como posso cuidar da sua saúde." | Mais pessoal e alinhado ao cuidado |
| "Exames de rotina" | "Check-up e prevenção" | Termo mais reconhecido |
| "Acompanhamento contínuo (cuidado integral)" | "Acompanhamento contínuo" + subtítulo "Cuidado integral ao longo do tempo" | Título mais limpo |

### Newsletter
| Atual | Sugestão | Motivo |
|-------|----------|--------|
| "Receba conteúdos sobre saúde e longevidade." | "Receba dicas de saúde direto no seu e-mail." | Mais direto |
| "Quero receber" | "Quero receber as dicas" ou "Cadastrar" | Deixa claro o benefício |

### CTA Final
| Atual | Sugestão | Motivo |
|-------|----------|--------|
| "Sua saúde merece mais atenção." | Manter | Bom |
| "Ainda tem dúvidas?" | "Prefere falar primeiro?" | Mais acolhedor |
| "Fale conosco pelo WhatsApp" | "Falar no WhatsApp" | Mais curto e direto |

### O que falta (copy)
- **Prova social:** Depoimentos ou "X pacientes atendidos"
- **Objeções:** FAQ pode incluir "A teleconsulta é segura?" e "Como funciona tecnicamente?"
- **Urgência leve:** Ex.: "Vagas limitadas por mês para acompanhamento contínuo"
- **Lead magnet:** "Cadastre-se e receba o guia: 5 hábitos para longevidade" (se houver material)

---

## 2. DESIGN

### Pontos fortes
- Paleta sage/cream coerente
- Cormorant + Outfit bem combinados
- Hierarquia visual clara
- Elementos decorativos discretos

### Sugestões de design

| Área | Sugestão | Impacto |
|------|----------|---------|
| **Hero** | Adicionar um badge sutil: "Teleconsulta · CRM 225.167" | Aumenta credibilidade |
| **Foto** | Garantir `loading="lazy"` e `aspect-ratio` para evitar layout shift | Melhora performance e CLS |
| **Cards de serviço** | Ícone ou ilustração mais marcante | Diferenciação visual |
| **Seção Newsletter** | Gradiente mais suave ou padrão sutil (ex.: folhas) | Reforça identidade |
| **Footer** | Transição menos abrupta do sage para o preto (ex.: gradiente) | Fluxo visual mais natural |
| **Botões** | Micro-animação no hover (ex.: seta que se move) | Feedback mais claro |
| **FAQ** | Ícone de +/− mais visível ou animado | Melhora usabilidade |
| **Tags (Sobre mim)** | Hover leve ou agrupamento por tipo (credenciais vs. especialidades) | Organização visual |

### Acessibilidade
- Contraste: verificar texto `--text-light` em fundos claros
- Focus visible: garantir outline em todos os elementos interativos
- Tamanho mínimo de fonte: manter 0.88rem+ em textos importantes

---

## 3. UX (Experiência do Usuário)

### Fluxo
| Ponto | Sugestão | Motivo |
|-------|----------|--------|
| **Scroll** | Manter smooth scroll | Já implementado |
| **CTAs** | Manter múltiplos pontos de agendamento | Bom para conversão |
| **Formulário** | Considerar 2 campos (nome completo + e-mail) em versão simplificada | Menos fricção |
| **em-breve.html** | Página contextual: "Agendamento em breve" + "Deixe seu e-mail para avisarmos" | Reduz frustração e captura leads |

### Mobile
| Ponto | Sugestão | Motivo |
|-------|----------|--------|
| **Menu** | Garantir que o hamburger funcione em todos os dispositivos | Já corrigido |
| **Formulário** | `inputmode="email"` no campo de e-mail | Melhora teclado no mobile |
| **Botões** | Manter min-height 48px | Bom para touch |
| **Sticky CTA** | Considerar barra fixa "Agendar" após scroll no mobile | Aumenta conversão |

### Feedback
| Ponto | Sugestão | Motivo |
|-------|----------|--------|
| **Erro no formulário** | Trocar `alert()` por mensagem inline estilizada | UX mais profissional |
| **Sucesso** | Manter animação do check | Já bom |
| **Loading** | Spinner ou skeleton no botão | Feedback visual claro |

### Navegação
- Logo no header: fazer scroll para o topo em vez de `href="#"` (evita âncora vazia)
- Links âncora: adicionar `scroll-margin-top` para compensar header fixo

---

## 4. UI (Interface)

### Componentes
| Componente | Sugestão | Motivo |
|------------|----------|--------|
| **Inputs** | Label visível além do placeholder (acessibilidade) | Placeholder some ao digitar |
| **Botão submit** | Estado disabled mais evidente (ex.: opacidade 0.6) | Evita cliques duplos |
| **FAQ** | Transição suave ao abrir/fechar | Experiência mais fluida |
| **Cards** | `will-change: transform` no hover (com cuidado) | Pode melhorar performance da animação |

### Consistência
- Todos os botões primários: mesmo padding, border-radius e transição
- Espaçamento entre seções: usar variáveis CSS (ex.: `--section-gap`)
- Ícones: tamanho padronizado (ex.: 20px em overlays, 16px em footer)

### Microinterações
- Botão "Quero receber": seta que se move no hover (já existe)
- Links do menu: underline animado no hover
- Cards de serviço: leve scale no hover (já existe)

---

## 5. Priorização

### Alta prioridade (rápido, alto impacto)
1. Trocar `alert()` por mensagem de erro inline no formulário
2. Adicionar `scroll-margin-top` nos IDs das seções
3. Logo: scroll para topo em vez de `#`
4. `em-breve.html`: mensagem contextual para agendamento
5. `inputmode="email"` no campo de e-mail

### Média prioridade
1. Revisar copy do Hero e CTAs
2. Badge de credencial no Hero
3. Transição mais suave no footer
4. Simplificar formulário (2 campos em versão alternativa)
5. Adicionar 1–2 FAQs (teleconsulta segura, como funciona)

### Baixa prioridade (refinamento)
1. Depoimentos ou prova social
2. Padrão decorativo na newsletter
3. Sticky CTA no mobile
4. Micro-animações extras
5. Lead magnet (se houver material)

---

## 6. Checklist de Qualidade

- [ ] Todos os links funcionais (WhatsApp, agendamento)
- [ ] Formulário testado em produção
- [ ] Teste em iPhone e Android
- [ ] Lighthouse: Performance, Acessibilidade, SEO
- [ ] Meta description e Open Graph para compartilhamento
- [ ] Favicon configurado
- [ ] Página em-breve com fallback de captura de lead

---

*Documento gerado para guiar melhorias incrementais. Priorize conforme tempo e recursos.*
