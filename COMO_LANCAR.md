# Como Lançar a Aplicação +JUNTOS

## Situação Atual

✅ **PostgreSQL** - A correr em Docker (porta 5432)
✅ **Redis** - A correr em Docker (porta 6379)
❌ **Backend** - Falhou build Docker (problemas de rede Maven)
❌ **Admin** - Dependente do backend

## Solução: Execução Híbrida

### 1. Manter PostgreSQL e Redis em Docker (já a correr)

```bash
# Verificar status
docker ps

# Deverá ver:
# - juntos-postgres (porta 5432)
# - juntos-redis (porta 6379)
```

### 2. Executar Backend Localmente

**Opção A: Via IDE (Recomendado)**
1. Abra `backend/service-core` no IntelliJ IDEA
2. Localize a classe `Application.kt` ou `ServiceCoreApplication.kt`
3. Clique com o botão direito → Run/Debug
4. O backend irá:
   - Conectar ao PostgreSQL em Docker (localhost:5432)
   - Aplicar migrações Flyway (incluindo V6 com utilizadores de teste)
   - Iniciar em `http://localhost:8080`

**Opção B: Via Linha de Comandos**
```bash
cd backend/service-core

# Se tiver Gradle instalado
gradle bootRun

# Ou usar Maven (se disponível)
mvn spring-boot:run
```

### 3. Executar Admin Localmente

```bash
cd apps/admin

# Já tem dependências instaladas (npm install foi feito antes)
npm run dev
```

O Admin irá iniciar em `http://localhost:5173`

## Testar a Aplicação

### 1. Verificar Backend
```bash
curl http://localhost:8080/actuator/health
```

Deverá retornar: `{"status":"UP"}`

### 2. Testar Login no Admin

1. Aceda a `http://localhost:5173/login`
2. Use as credenciais de teste:
   - **Email:** `admin@juntos.pt`
   - **Password:** `teste123`

### 3. Verificar Migrações

As migrações Flyway serão aplicadas automaticamente ao iniciar o backend.
Verifique os logs para confirmar:

```
Flyway: Migrating schema "juntos" to version "6 - insert test users"
```

## Configuração de Ambiente

### Backend
O backend está configurado para conectar ao PostgreSQL em Docker via `application.yml`:

```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/juntos_dev
    username: juntos_user
    password: juntos_pass
```

### Admin
O Admin está configurado para conectar ao backend via `.env`:

```
VITE_API_URL=http://localhost:8080/v1
```

## Troubleshooting

### Backend não inicia
- Verifique se PostgreSQL está a correr: `docker ps | grep postgres`
- Verifique logs do PostgreSQL: `docker logs juntos-postgres`
- Confirme que a porta 8080 está livre

### Admin não conecta ao Backend
- Verifique se o backend está a correr em `http://localhost:8080`
- Confirme o ficheiro `.env` no Admin
- Verifique a consola do browser para erros CORS

### Migrações não aplicadas
- Verifique a tabela `flyway_schema_history` no PostgreSQL
- Execute manualmente se necessário:
  ```bash
  docker exec -it juntos-postgres psql -U juntos_user -d juntos_dev
  \i /caminho/para/V6__insert_test_users.sql
  ```

## Parar Serviços

### Docker (PostgreSQL e Redis)
```bash
docker-compose -f docker-compose.dev.yml down
```

### Backend e Admin
Pressione `Ctrl+C` nos terminais respetivos

## Próximos Passos

1. ✅ Lançar backend via IDE
2. ✅ Lançar admin via `npm run dev`
3. ✅ Testar login com `admin@juntos.pt` / `teste123`
4. ✅ Verificar gestão de POIs
5. 🔄 Resolver build Docker do backend (opcional, para deploy futuro)
