# Guia Rápido: Lançar Backend +JUNTOS

## ⚠️ Problema Identificado

O utilizador tentou executar `npm run dev` no backend, mas o backend é **Kotlin/Spring Boot**, não Node.js!

## ✅ Solução: Usar IntelliJ IDEA (Mais Fácil)

### Passo 1: Abrir Projeto no IntelliJ
1. Abra o IntelliJ IDEA
2. File → Open → Selecione `c:/laragon/www/+Juntos/juntos/backend/service-core`
3. Aguarde o IntelliJ indexar o projeto e fazer download das dependências

### Passo 2: Executar a Aplicação
1. Localize o ficheiro `JuntosApplication.kt` em:
   ```
   src/main/kotlin/pt/juntos/core/JuntosApplication.kt
   ```
2. Clique com o botão direito no ficheiro
3. Selecione **"Run 'JuntosApplicationKt'"** ou **"Debug 'JuntosApplicationKt'"**

### Passo 3: Aguardar Inicialização
O backend irá:
- ✅ Conectar ao PostgreSQL (Docker)
- ✅ Aplicar migrações Flyway (incluindo utilizadores de teste)
- ✅ Iniciar em `http://localhost:8080`

Procure no console por:
```
Started JuntosApplication in X.XXX seconds
```

## 🔧 Alternativa: Linha de Comandos (Avançado)

Se preferir usar a linha de comandos:

### Opção 1: Compilar e Executar
```bash
cd backend/service-core

# Compilar (se tiver Gradle instalado)
gradle clean build -x test

# Executar
java -jar build/libs/*.jar
```

### Opção 2: Usar Script (se disponível)
```bash
./start-backend.sh
```

## 🧪 Testar Backend

Após o backend iniciar, teste:

```bash
# Verificar saúde
curl http://localhost:8080/actuator/health

# Deverá retornar: {"status":"UP"}
```

## 🎯 Testar Login no Admin

1. O Admin já está a correr em `http://localhost:5173`
2. Aceda a `http://localhost:5173/login`
3. Use as credenciais:
   - **Email:** `admin@juntos.pt`
   - **Password:** `teste123`

## ❌ Troubleshooting

### "Gradle não encontrado"
- Use o IntelliJ IDEA (recomendado)
- Ou instale o Gradle: https://gradle.org/install/

### "Erro de conexão ao PostgreSQL"
```bash
# Verificar se PostgreSQL está a correr
docker ps | grep postgres

# Se não estiver, iniciar:
docker-compose -f docker-compose.dev.yml up -d postgres redis
```

### "Porta 8080 já em uso"
```bash
# Windows: encontrar processo
netstat -ano | findstr :8080

# Matar processo (substitua PID)
taskkill /PID <PID> /F
```

## 📝 Resumo

**Backend = Kotlin/Spring Boot** → Use IntelliJ IDEA
**Admin = React/Vite** → Use `npm run dev` ✅ (já a correr)

O erro aconteceu porque tentou executar `npm run dev` no backend (Kotlin), quando deveria usar o IntelliJ ou Gradle.
