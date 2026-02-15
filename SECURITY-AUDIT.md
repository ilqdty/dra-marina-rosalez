# Auditoria de Segurança — Dra. Marina Rosalez

Relatório de análise de segurança do código para acesso via domínio online em produção.

---

## Resumo executivo

| Categoria | Status | Observações |
|-----------|--------|-------------|
| Headers HTTP | OK | X-Frame-Options, HSTS, X-Content-Type-Options, etc. |
| Links externos | OK | `rel="noopener noreferrer"` em todos os `target="_blank"` |
| Formulário | OK | `encodeURIComponent` para dados; `textContent` para erros |
| Parâmetros URL | OK | `em-breve.html` usa comparação estrita, sem injeção |
| CSP | Melhorado | Content-Security-Policy adicionada |
| innerHTML | Corrigido | Substituído por DOM API para evitar risco futuro |

---

## 1. Headers de segurança (vercel.json)

**Já configurados:**
- `X-Frame-Options: DENY` — impede embedding em iframe (clickjacking)
- `X-Content-Type-Options: nosniff` — evita MIME sniffing
- `Referrer-Policy: strict-origin-when-cross-origin` — controla vazamento de URL
- `Permissions-Policy` — desativa câmera, microfone, geolocalização
- `X-XSS-Protection: 1; mode=block` — filtro XSS do navegador
- `Strict-Transport-Security` — força HTTPS por 1 ano

**Adicionado:**
- `Content-Security-Policy` — restringe origens de scripts, estilos, fontes e conexões

---

## 2. Análise de código

### 2.1 Formulário Mailchimp (index.html)

- **Entrada do usuário:** `fname`, `lname`, `email` passam por `encodeURIComponent` antes de ir na URL — correto
- **Exibição de erro:** `data.msg` do Mailchimp é atribuído via `textContent`, não `innerHTML` — evita XSS
- **Chaves Mailchimp:** `u`, `id`, `dc` são públicas por design (formulário embutido)

### 2.2 Links externos

- Instagram: `target="_blank"` com `rel="noopener noreferrer"` — evita `window.opener` e vazamento de referrer
- `mailto:` e links internos: não precisam de `noopener`

### 2.3 Parâmetros URL (em-breve.html)

- `tipo` é lido com `URLSearchParams.get('tipo')`
- Uso restrito a `=== 'agendamento'` ou `=== 'whatsapp'`
- Sem concatenação com DOM — sem risco de XSS via query string

### 2.4 innerHTML

- **Antes:** `btn.innerHTML = 'Quero receber <svg>...'` — string estática, sem dados do usuário
- **Depois:** uso de `createElementNS` e `createTextNode` — elimina uso de `innerHTML` nesse fluxo

---

## 3. Recursos externos

| Recurso | Domínio | Uso |
|---------|---------|-----|
| Google Fonts (CSS) | fonts.googleapis.com | Estilos |
| Google Fonts (fontes) | fonts.gstatic.com | Arquivos de fonte |
| Mailchimp (JSONP) | *.list-manage.com | Cadastro de e-mail |

Todos permitidos explicitamente na CSP.

---

## 4. Checklist de produção

- [x] HTTPS (Vercel)
- [x] Headers de segurança
- [x] CSP configurada
- [x] Links externos com `noopener noreferrer`
- [x] Formulário com sanitização
- [x] Sem `eval`, `document.write` ou padrões perigosos
- [x] `.gitignore` evita arquivos sensíveis
- [x] Favicon (SVG inline, evita 404)
- [x] `robots.txt` (permite indexação)

---

## 5. Manutenção

1. **Mailchimp:** ao trocar de Audience, atualizar `u`, `id` e `dc` em `index.html`
2. **Novos recursos externos:** incluir domínios na CSP em `vercel.json`
3. **Novos formulários:** usar sempre `encodeURIComponent` e `textContent` para saída

---

*Auditoria realizada em [data]. Revisar após alterações significativas.*
