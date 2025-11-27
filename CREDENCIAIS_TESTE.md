# Credenciais de Teste - +JUNTOS

## Utilizadores de Teste

Após executar as migrações da base de dados, os seguintes utilizadores estarão disponíveis para testes:

### 1. Administrador
- **Email:** `admin@juntos.pt`
- **Password:** `teste123`
- **Role:** `ADMIN`
- **Descrição:** Acesso total ao sistema, incluindo gestão de utilizadores, POIs e eventos.

### 2. Utilizador Normal
- **Email:** `user@juntos.pt`
- **Password:** `teste123`
- **Role:** `USER`
- **Descrição:** Utilizador padrão com permissões limitadas.

### 3. Utilizador Adicional
- **Email:** `maria.silva@juntos.pt`
- **Password:** `teste123`
- **Role:** `USER`
- **Descrição:** Segundo utilizador para testes de múltiplos utilizadores.

## Como Usar

1. **Backend:** Certifique-se de que o backend está a correr e as migrações foram executadas.
2. **Admin:** Aceda a `http://localhost:5173/login` e use as credenciais acima.
3. **API:** Use os endpoints `/v1/auth/login` com as credenciais para obter um token JWT.

## Notas de Segurança

> **⚠️ IMPORTANTE:** Estas credenciais são apenas para ambiente de desenvolvimento/teste.
> **Nunca use estas passwords em produção!**

## Alteração de Password

Para alterar a password de um utilizador de teste, pode:
1. Usar a API de registo para criar novos utilizadores
2. Atualizar diretamente na base de dados com um novo hash BCrypt
3. Implementar funcionalidade de "esqueci-me da password" (futuro)
