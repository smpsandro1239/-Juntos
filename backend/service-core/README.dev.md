# Desenvolvimento local - backend (service-core)

Este README explica como construir a aplicação localmente e executar uma imagem Docker que assume que já foi produzido o JAR pelo Gradle. Isto evita dependências de rede durante o docker build.

Pré-requisitos
- Java/Gradle ou Gradle wrapper disponível no host
- Docker Desktop em execução
- `docker compose -f ../../docker-compose.dev.yml up -d` para levantar Postgres e Redis

Passos rápidos

1) Construir o JAR localmente (dentro do diretório `backend/service-core`):

```bash
# na raiz do módulo backend/service-core
./gradlew clean build -x test
```

Isto gera o JAR em `build/libs/` (ex.: `service-core-0.0.1-SNAPSHOT.jar`).

2) Construir a imagem runtime que apenas copia o JAR (usa `Dockerfile.runtime`):

```bash
docker build -t juntos-backend:dev -f Dockerfile.runtime .
```

3) Executar o container ligado à network usada pelo docker-compose dev (nome: `juntos-dev-network`):

```bash
docker run --rm --name juntos-backend \
  -p 8080:8080 \
  --network juntos-dev-network \
  -e SPRING_DATASOURCE_URL=jdbc:postgresql://postgres:5432/juntos_dev \
  -e SPRING_DATASOURCE_USERNAME=juntos_user \
  -e SPRING_DATASOURCE_PASSWORD=juntos_pass \
  -e SPRING_REDIS_HOST=redis \
  juntos-backend:dev
```

Notas
- Ajuste o `JAR_FILE` no `Dockerfile.runtime` se o nome do JAR for diferente.
- A app irá ligar-se aos serviços `postgres` e `redis` pelo hostname tal como definidos no `docker-compose.dev.yml`.
- Se tiver problemas a correr `./gradlew` no Windows, pode usar o `gradle` instalado globalmente: `gradle clean build -x test`.

Docker-based helper (PowerShell vs Git Bash)

Windows PowerShell (recomendado):

```powershell
# a partir de backend/service-core
docker run --rm -v ${PWD}:/work -w /work gradle:8.6-jdk21 gradle wrapper
docker run --rm -v ${PWD}:/work -w /work gradle:8.6-jdk21 ./gradlew clean build -x test
```

Git Bash / MSYS: usar PowerShell para evitar problemas de montagem de volume ou converter o caminho para o formato do Docker (ex.: `/c/laragon/...`).

