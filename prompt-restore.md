# 📁 Projeto: +JUNTOS (preenchido automaticamente)

## 🎯 Objetivo do Site
Plataforma para descobrir e organizar atividades familiares em Portugal (0-12 anos), com pesquisa geográfica, filtros por categoria/idade, e painel de administração.

---

## 🧱 Tecnologias Usadas
### Frontend
- Framework: React (Vite)
- Estilização: Material UI (MUI)
- Estado: React Query
- Roteamento: React Router

### Backend
- Runtime: JVM (Java 21)
- Framework: Spring Boot (WebFlux) + Kotlin
- Autenticação: JWT (jjwt)
- API: REST (reactive)

### Base de Dados
- Tipo: PostgreSQL com PostGIS
- Localização: Docker Compose dev (service `postgres` no `docker-compose.dev.yml`)
- Schema atual: carregado via `scripts/sql/schema.sql` (ver `docker-compose.dev.yml` mounts)

---

## 📂 Estrutura do Projeto (GitHub ou Local)
- Repositório: (local) C:/laragon/www/+Juntos/juntos
- Branch atual: main
- Último commit: consulte `git log` localmente
- Pasta raiz: C:/laragon/www/+Juntos/juntos

---

## ✅ O que está implementado (alto nível)
- [x] Backend em Kotlin + Spring WebFlux com endpoints de POIs
- [x] Repositório customizado para pesquisa filtrada (+geo)
- [x] Cache Redis reativo para endpoint paginado
- [x] Admin frontend (React + MUI) com DataGrid e suporte a paginação do servidor
- [x] Docker Compose dev com Postgres (PostGIS), Redis, Adminer, Redis-Commander
- [x] Dockerfile.runtime e README.dev.md para construir e correr runtime image
- [x] Integração básica de testes e workflow CI (Testcontainers)

---

## ❗ O que falta implementar / pendente
- [ ] Gerar JAR localmente (Gradle) e arrancar imagem runtime localmente
- [ ] Adicionar testes de integração adicionais (invalid inputs, cache hit/miss, invalidação)
- [ ] Melhorar estratégia de invalidação seletiva do cache
- [ ] Expor métricas do cache via Micrometer/Actuator e tornar TTL configurável
- [ ] Incluir backend/admin no `docker-compose.dev.yml` para dev e preparar Terraform para Redis gerido

---

## 🧪 Ambiente de Desenvolvimento
### Requisitos
- Java 21 (JRE/JDK) para correr o JAR
- Docker Desktop (para postgres/redis e para construir com container Gradle se necessário)
- Gradle (ou usar o wrapper `./gradlew`)

### Comandos para rodar o projeto (dev)
```bash
# Levantar infra (Postgres + Redis) a partir da raiz do repo
docker compose -f docker-compose.dev.yml up -d

# Na pasta backend/service-core: gerar wrapper (opcional) e construir JAR
# Recomenda-se PowerShell no Windows para evitar problemas de montagem
docker run --rm -v ${PWD}:/work -w /work gradle:8.6-jdk21 gradle wrapper
docker run --rm -v ${PWD}:/work -w /work gradle:8.6-jdk21 ./gradlew clean build -x test

# Construir runtime image e arrancar (liga-se à network do compose)
docker build -t juntos-backend:dev -f backend/service-core/Dockerfile.runtime backend/service-core

docker run --rm --name juntos-backend \
  -p 8080:8080 \
  --network juntos-dev-network \
  -e SPRING_DATASOURCE_URL=jdbc:postgresql://postgres:5432/juntos_dev \
  -e SPRING_DATASOURCE_USERNAME=juntos_user \
  -e SPRING_DATASOURCE_PASSWORD=juntos_pass \
  -e SPRING_REDIS_HOST=redis \
  juntos-backend:dev
```

---

## 📦 Ficheiros-chave
- `README.md` (raiz) — visão e onboarding
- `docker-compose.dev.yml` — infra dev (postgres/postgis, redis, adminer, redis-commander)
- `backend/service-core/build.gradle.kts` — build do serviço core (Kotlin, Spring Boot)
- `backend/service-core/Dockerfile.runtime` — imagem runtime que copia o JAR
- `backend/service-core/README.dev.md` — instruções dev específicas do backend

---

## 🧠 Instrução Final para a IA
Assim que este prompt for carregado, por favor:
1. Verifica se o repositório está acessível (paths locais ou GitHub remote).
2. Confirma que o `.env`/variáveis de ambiente estão configuradas ou pede o `.env.example`.
3. Lista os ficheiros mais recentes e confirma o estado do projeto (builds, containers).
4. Sugere o próximo passo lógico com base no que falta (priorizar build e run localmente para ver a app).
5. Se for um novo computador, guia-me na instalação do ambiente completo (Java, Docker, Gradle wrapper).

---

> Nota: este ficheiro foi gerado automaticamente a partir do estado atual do repositório. Atualiza os campos (ex.: versão do JAR, últimos commits) quando alterares o ambiente.
