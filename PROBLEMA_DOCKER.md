# ⚠️ Problema Identificado: Build Docker Falha com Erros de Rede

## Diagnóstico

O build do backend via Docker está a falhar consistentemente devido a problemas de conectividade com o Maven Central:

```
Could not GET 'https://repo.maven.apache.org/maven2/...'
> repo.maven.apache.org
```

### Causa Provável
- **Firewall/Proxy**: O Docker pode estar bloqueado por firewall ou proxy corporativo
- **DNS**: Problemas de resolução DNS dentro do container
- **Timeout**: Maven Central pode estar lento ou inacessível temporariamente

## ✅ Soluções Alternativas

### Opção 1: IntelliJ IDEA (RECOMENDADO)

Esta é a solução mais confiável e rápida:

1. **Abra o IntelliJ IDEA**
2. **File → Open** → Selecione `backend/service-core`
3. **Aguarde** o IntelliJ fazer download das dependências (usa cache local)
4. **Localize** `JuntosApplication.kt`
5. **Clique direito** → Run 'JuntosApplicationKt'

**Vantagens:**
- ✅ Usa cache local de dependências Maven
- ✅ Não depende de rede dentro do Docker
- ✅ Hot reload funciona
- ✅ Debug completo disponível

### Opção 2: Compilar Localmente e Usar JAR no Docker

Se tiver JDK 21 instalado localmente:

```bash
cd backend/service-core

# Compilar localmente (fora do Docker)
gradle clean build -x test

# Executar o JAR com Docker
docker run -p 8080:8080 \
  -e SPRING_DATASOURCE_URL=jdbc:postgresql://host.docker.internal:5432/juntos_dev \
  -e SPRING_DATASOURCE_USERNAME=juntos_user \
  -e SPRING_DATASOURCE_PASSWORD=juntos_pass \
  -e SPRING_REDIS_HOST=host.docker.internal \
  -e SPRING_REDIS_PORT=6379 \
  -v $(pwd)/build/libs:/app \
  eclipse-temurin:21-jre \
  java -jar /app/*.jar
```

### Opção 3: Resolver Problemas de Rede Docker (Avançado)

#### 3.1 Configurar Proxy (se aplicável)
Edite `~/.docker/config.json`:
```json
{
  "proxies": {
    "default": {
      "httpProxy": "http://proxy.example.com:8080",
      "httpsProxy": "http://proxy.example.com:8080"
    }
  }
}
```

#### 3.2 Usar Mirror Maven
Crie `backend/service-core/init.gradle`:
```groovy
allprojects {
    repositories {
        maven { url 'https://maven.aliyun.com/repository/public/' }
        maven { url 'https://repo.spring.io/release' }
        mavenCentral()
    }
}
```

E atualize o Dockerfile:
```dockerfile
RUN gradle clean build -x test --no-daemon --init-script init.gradle
```

#### 3.3 Aumentar Timeout
Edite `backend/service-core/gradle.properties`:
```properties
systemProp.http.connectionTimeout=60000
systemProp.http.socketTimeout=60000
```

## 🎯 Recomendação Final

**Para desenvolvimento:** Use **IntelliJ IDEA** (Opção 1)
- Mais rápido
- Mais confiável
- Melhor experiência de desenvolvimento

**Para produção/deploy:** Resolva os problemas de rede Docker (Opção 3) ou use CI/CD com cache de dependências

## 📊 Estado Atual

✅ **PostgreSQL** - A correr em Docker (porta 5432)
✅ **Redis** - A correr em Docker (porta 6379)
❌ **Backend** - Falha no build Docker (problemas de rede Maven)
✅ **Admin** - A correr localmente (porta 5173)

## 🚀 Próximos Passos

1. **Abra o IntelliJ IDEA**
2. **Execute o backend** via IDE
3. **Teste o login** em `http://localhost:5173/login`
4. **Use credenciais:** `admin@juntos.pt` / `teste123`
