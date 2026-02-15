# Dra. Marina Rosalez — Site Institucional

Site de teleconsulta médica com foco em cuidado integral e longevidade.

## Estrutura do projeto

```
dra-marina-rosalez/
├── index.html              ← Página principal (single-page)
├── assets/
│   └── foto-marina.jpeg    ← Foto profissional
├── README.md               ← Este arquivo
└── .gitignore
```

## Como colocar no ar

**Guia completo com foco em segurança:** veja `DEPLOY-SEGURO.md`.

### Passo 1 — Criar repositório no GitHub

1. Acesse [github.com/new](https://github.com/new)
2. Nome do repositório: `dra-marina-rosalez`
3. Deixe como **Public**
4. Clique em **Create repository**
5. Faça upload de todos os arquivos desta pasta (arraste para a página do GitHub ou use git)

**Via terminal (se tiver git instalado):**
```bash
cd dra-marina-rosalez
git init
git add .
git commit -m "versão inicial do site"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/dra-marina-rosalez.git
git push -u origin main
```

### Passo 2 — Deploy na Vercel (grátis)

1. Acesse [vercel.com](https://vercel.com) e faça login com sua conta GitHub
2. Clique em **Add New → Project**
3. Selecione o repositório `dra-marina-rosalez`
4. Clique em **Deploy** (sem alterar nenhuma configuração)
5. Em ~30 segundos o site estará no ar com uma URL tipo `dra-marina-rosalez.vercel.app`

### Passo 3 — Domínio próprio

**Registrar domínio .com.br:**
1. Acesse [registro.br](https://registro.br)
2. Pesquise `dramarinarosalez.com.br` (ou variação disponível)
3. Registre (~R$40/ano)

**Conectar ao Vercel:**
1. No painel da Vercel, vá em **Settings → Domains**
2. Adicione o domínio (ex: `dramarinarosalez.com.br`)
3. A Vercel mostrará os registros DNS necessários
4. No Registro.br, vá em **Configurar zona DNS** e adicione os registros indicados
5. Aguarde propagação (até 24h, geralmente minutos)

## Placeholders para configurar

| Item | Onde trocar | O que colocar |
|------|------------|---------------|
| WhatsApp | Buscar `wa.me/5500000000000` | Substituir pelo número Business real |
| Link agendamento | Buscar `href="#agendar"` nos botões | Substituir pela URL do Calendly, Doctoralia, etc. |
| Instagram | Buscar `instagram.com/dramarinarosalez` | Confirmar que o @ está correto |
| Email marketing | Ver `MAILCHIMP` no `<script>` do index.html | Configurar u, id e dc do Mailchimp |

## Configurar Mailchimp (cadastro de e-mails)

O formulário de newsletter já está integrado com o Mailchimp. **Guia completo em português:** veja o arquivo `CONFIGURAR-MAILCHIMP.md`.

**Resumo rápido:**
1. Crie conta em [mailchimp.com](https://mailchimp.com)
2. Crie uma **Audience** e vá em **Signup forms** → **Embedded forms**
3. Copie a URL do formulário e extraia `u`, `id` e `dc`
4. No `index.html`, preencha o objeto `MAILCHIMP` (linha ~1085)
5. Configure o idioma do painel e do e-mail de confirmação para português no Mailchimp

### WhatsApp Business + Bot
Quando tiver o número Business:
1. Substitua todos os `wa.me/5500000000000` pelo número real
2. Opcionalmente, adicione mensagem pré-preenchida: `wa.me/55XXXXXXXXXXX?text=Olá, gostaria de agendar uma consulta`

### Lead magnet (material gratuito)
Quando tiver o PDF/material pronto:
1. Coloque o arquivo na pasta `assets/`
2. Edite o texto da seção de newsletter para mencionar o material
3. Após o submit do formulário, redirecione para download ou envie por e-mail via automação

## Tecnologias

- HTML + CSS + JS vanilla (zero dependências)
- Google Fonts: Cormorant Garamond + Outfit
- Hospedagem: Vercel (recomendado) ou Netlify
- Sem backend — 100% estático
