# Instruções para Reiniciar o Backend

## Problema
O Gradle não está disponível no sistema (nem wrapper nem instalação global), pelo que não consigo reiniciar o backend automaticamente.

## Solução Manual

### Opção 1: Usar IDE (IntelliJ IDEA / Eclipse)
1. Abra o projeto `backend/service-core` na sua IDE
2. Localize a classe principal (provavelmente `Application.kt` ou `ServiceCoreApplication.kt`)
3. Clique com o botão direito e selecione "Run" ou "Debug"
4. A aplicação irá iniciar e aplicar automaticamente a migração V6

### Opção 2: Instalar Gradle Wrapper
1. Navegue para a pasta do backend:
   ```bash
   cd c:/laragon/www/+Juntos/juntos/backend/service-core
   ```

2. Gere o Gradle wrapper:
   ```bash
   gradle wrapper
   ```

3. Execute o backend:
   ```bash
   ./gradlew bootRun
   ```

### Opção 3: Docker (se disponível)
1. Navegue para a pasta do backend:
   ```bash
   cd c:/laragon/www/+Juntos/juntos/backend/service-core
   ```

2. Construa e execute com Docker:
   ```bash
   docker build -t juntos-backend .
   docker run -p 8080:8080 juntos-backend
   ```

## Verificação da Migração

Após iniciar o backend, verifique os logs para confirmar que a migração V6 foi aplicada:

```
Flyway: Migrating schema "juntos" to version "6 - insert test users"
```

## Testar Login

Após o backend estar a correr, teste o login no Admin:
1. Aceda a `http://localhost:5173/login`
2. Use as credenciais:
   - **Email:** `admin@juntos.pt`
   - **Password:** `teste123`

## Troubleshooting

### Erro de Conexão à Base de Dados
- Verifique se o PostgreSQL está a correr
- Confirme as credenciais em `application.yml` ou variáveis de ambiente

### Migração não Aplicada
- Verifique a tabela `flyway_schema_history` na base de dados
- Se necessário, execute manualmente o SQL em `V6__insert_test_users.sql`
