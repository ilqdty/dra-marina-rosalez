# Guia de Deploy Seguro — Dra. Marina Rosalez

Este guia leva você passo a passo para colocar o site no ar na **Vercel**, com boas práticas de segurança.

---

## O que já está protegido

| Medida | Status |
|--------|--------|
| **HTTPS** | Automático na Vercel |
| **Headers de segurança** | Configurados em `vercel.json` |
| **Sem backend** | Site 100% estático — superfície de ataque mínima |
| **Sem senhas no código** | Chaves do Mailchimp são públicas por design |
| **Links externos** | `rel="noopener noreferrer"` onde necessário |

---

## Passo 1 — Criar conta no GitHub (se ainda não tiver)

1. Acesse [github.com](https://github.com) e crie uma conta gratuita
2. Confirme o e-mail

---

## Passo 2 — Subir o projeto para o GitHub

### Opção A — Pelo site (mais simples)

1. Acesse [github.com/new](https://github.com/new)
2. Nome do repositório: `dra-marina-rosalez` (ou outro de sua preferência)
3. Deixe como **Public**
4. **Não** marque "Add a README"
5. Clique em **Create repository**
6. Na tela seguinte, arraste toda a pasta do projeto (com `index.html`, `em-breve.html`, `assets/`, `vercel.json`, etc.) para a área de upload
7. Clique em **Commit changes**

### Opção B — Pelo terminal (se tiver Git instalado)

```bash
cd "C:\Users\alves\OneDrive\Negócios\Dra Marina\Landing Page"
git init
git add .
git commit -m "versão inicial do site"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/dra-marina-rosalez.git
git push -u origin main
```

Substitua `SEU-USUARIO` pelo seu nome de usuário do GitHub.

---

## Conectar pasta atual ao GitHub (push direto)

Se você já editou os arquivos localmente e quer fazer **push e deploy direto** sem criar nova pasta:

1. Abra o **Terminal** no Cursor (`Ctrl+`` ou **Terminal** → **New Terminal**)
2. Confirme que está na pasta do projeto (onde estão `index.html`, `assets/`, etc.)
3. Execute os comandos abaixo, um por vez:

```bash
git init
git add .
git commit -m "Conecta pasta ao repositório"
git branch -M main
git remote add origin https://github.com/mymindloops-spec/dra-marina-rosalez.git
git pull origin main --allow-unrelated-histories --no-edit
git push -u origin main
```

4. Se o `git pull` pedir mensagem de merge, salve e feche o editor (no Vim: `:wq`). Se houver conflitos, o Git avisará — nesse caso, abra os arquivos marcados, resolva e rode `git add .` e `git commit -m "Resolve merge"` antes do push.

**Depois disso:** sempre que editar, use **Source Control** (`Ctrl+Shift+G`) → **Commit** → **Sync Changes** (ou **Push**). A Vercel fará o deploy automático em ~1 minuto.

**Push rápido:** duplo-clique em `push.bat` na pasta do projeto para fazer add, commit e push de uma vez.

---

## Passo 3 — Criar conta na Vercel

1. Acesse [vercel.com](https://vercel.com)
2. Clique em **Sign Up**
3. Escolha **Continue with GitHub**
4. Autorize a Vercel a acessar sua conta GitHub (permissões necessárias para deploy)

---

## Passo 4 — Fazer o deploy

1. No painel da Vercel, clique em **Add New** → **Project**
2. Selecione o repositório `dra-marina-rosalez`
3. **Não altere** as configurações (Framework Preset: Other está correto)
4. Clique em **Deploy**
5. Aguarde ~30 segundos

O site estará no ar em uma URL como:  
`https://dra-marina-rosalez.vercel.app`

---

## Passo 5 — Configurar domínio próprio (opcional)

### Registrar domínio .com.br (Registro.br)

1. Acesse [registro.br](https://registro.br)
2. Pesquise o domínio (ex: `dramarinarosalez.com.br`)
3. Registre (~R$ 40/ano)
4. Guarde a senha em local seguro

### Conectar domínio à Vercel

1. No painel da Vercel, vá em **Settings** → **Domains**
2. Clique em **Add**
3. Digite o domínio (ex: `dramarinarosalez.com.br`)
4. A Vercel mostrará os registros DNS necessários
5. No Registro.br: **Meus domínios** → selecione o domínio → **Alterar zona**
6. Adicione os registros indicados pela Vercel (geralmente um tipo `A` e um `CNAME`)
7. Aguarde a propagação (até 24h; em muitos casos, minutos)

---

## Segurança — O que cada header faz

| Header | Função |
|--------|--------|
| **X-Frame-Options: DENY** | Impede que o site seja embutido em iframes (evita clickjacking) |
| **X-Content-Type-Options: nosniff** | Evita que o navegador interprete arquivos com tipo errado |
| **Referrer-Policy** | Controla quanto da URL é enviada em links externos |
| **Permissions-Policy** | Desativa câmera, microfone, geolocalização e rastreamento |
| **X-XSS-Protection** | Ativa filtro anti-XSS do navegador |
| **Strict-Transport-Security** | Força HTTPS por 1 ano (incluindo subdomínios) |

---

## Checklist pós-deploy

- [ ] Testar o site na URL da Vercel
- [ ] Testar o formulário de newsletter (cadastro real)
- [ ] Verificar links do Instagram e e-mail
- [ ] Se tiver domínio: testar com `www` e sem `www`
- [ ] Testar no celular (menu hamburger, formulário)

---

## Por que este site é seguro

1. **Estático** — Não há banco de dados, servidor ou API própria. Não há onde um atacante injetar código malicioso no backend.
2. **HTTPS** — Todo o tráfego é criptografado.
3. **Headers** — O `vercel.json` aplica proteções em todas as páginas.
4. **Mailchimp** — Os dados do formulário vão direto para os servidores do Mailchimp; não passam por servidor seu.
5. **Sem dependências** — Não há pacotes npm ou bibliotecas de terceiros que possam ter vulnerabilidades.

---

## Atualizações futuras

Para publicar alterações:

1. Edite os arquivos localmente
2. Faça commit e push para o GitHub (ou edite direto no GitHub)
3. A Vercel detecta a mudança e faz o deploy automaticamente em ~1 minuto

---

## Suporte

- [Documentação Vercel](https://vercel.com/docs)
- [Registro.br — Ajuda](https://registro.br/tecnologia/ajuda/)
