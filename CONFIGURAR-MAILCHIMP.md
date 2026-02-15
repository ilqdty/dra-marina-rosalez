# Configurar Mailchimp — Guia em Português

O formulário de newsletter da landing page já está integrado com o Mailchimp. Siga estes passos para ativar.

---

## Passo 1 — Criar conta no Mailchimp

1. Acesse [mailchimp.com](https://mailchimp.com)
2. Clique em **Sign Up Free**
3. Preencha e-mail, nome de usuário e senha
4. Confirme seu e-mail

---

## Passo 2 — Configurar em português (opcional)

1. No canto inferior esquerdo do painel, clique no seu nome
2. Vá em **Account & Billing** → **Settings**
3. Em **Language**, selecione **Português (Brasil)**

---

## Passo 3 — Criar Audience (lista de contatos)

1. No menu lateral: **Audience** → **All contacts**
2. Clique em **Create Audience**
3. Preencha:
   - **Nome da empresa:** Dra. Marina Rosalez (ou o que preferir)
   - **E-mail:** seu e-mail profissional
   - **Endereço:** para e-mails transacionais (obrigatório)
4. Aceite os termos e clique em **Save**

---

## Passo 4 — Obter os dados do formulário

1. No menu: **Audience** → **Signup forms**
2. Clique em **Embedded forms**
3. Na página que abrir, role até ver o código HTML do formulário
4. Procure a linha que começa com `<form action="https://...`
5. A URL será algo como:
   ```
   https://gmail.us21.list-manage.com/subscribe/post?u=a1b2c3d4e5f6g7h8i9j0&id=1234567890
   ```

**Extraia os valores:**
- **u** = tudo após `u=` até o `&` → ex: `a1b2c3d4e5f6g7h8i9j0`
- **id** = tudo após `id=` → ex: `1234567890`
- **dc** = a parte do datacenter na URL → ex: `us21` (vem de `gmail.us21.list-manage.com`)

---

## Passo 5 — Configurar no index.html

1. Abra o arquivo `index.html` no Cursor
2. Localize o objeto `MAILCHIMP` (por volta da linha 1085)
3. Substitua os valores:

```javascript
const MAILCHIMP = {
  u: 'COLE_SEU_USER_ID_AQUI',
  id: 'COLE_SEU_AUDIENCE_ID_AQUI',
  dc: 'us21'   // use o datacenter da sua URL (us1, us2, us21, etc.)
};
```

4. Salve o arquivo

---

## Passo 6 — E-mail de confirmação em português

Por padrão, o Mailchimp envia um e-mail de confirmação (double opt-in). Para traduzir:

1. **Audience** → **Signup forms** → **Form builder**
2. Clique em **Translate** (ou **Traduzir**)
3. Selecione **Português (Brasil)**
4. Ou edite manualmente os textos em **Form fields** e **Confirmation email**

---

## Testar

1. Abra o site no navegador
2. Preencha o formulário de newsletter (nome + e-mail)
3. Clique em **Quero receber**
4. Verifique em **Audience** → **All contacts** se o cadastro apareceu
5. O visitante receberá o e-mail de confirmação do Mailchimp

---

## Plano gratuito

- Até **500 contatos**
- Até **500 e-mails/mês** em campanhas
- Sem cartão de crédito
