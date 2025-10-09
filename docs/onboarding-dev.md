# +JUNTOS - Guia de Onboarding para Developers

**Objetivo:** Configurar e executar o projeto +JUNTOS localmente em menos de 15 minutos.

## 🚀 Início Rápido (4 passos)

### 1. Instalar Dependências do Sistema
```bash
# Clonar repositório (se ainda não tiver)
git clone https://github.com/smpsandro1239/-Juntos.git
cd +Juntos

# Instalar todas as dependências do sistema automaticamente
make install
```

### 2. Configurar Variáveis de Ambiente
```bash
# Copiar arquivos de exemplo
cp backend/.env.example backend/.env
cp apps/admin/.env.example apps/admin/.env
cp apps/mobile/.env.example apps/mobile/.env

# Editar os arquivos .env com suas configurações
```

### 3. Iniciar Infraestrutura
```bash
# Iniciar PostgreSQL e Redis
make docker-up

# Verificar se os serviços estão funcionando
make status
```

### 4. Executar Aplicações
```bash
# Em terminais separados:
make backend-run    # Backend Kotlin (porta 8080)
make admin-dev      # Admin React (porta 3000)
make flutter-run    # App móvel (emulador/dispositivo)
```

## 🐳 Infraestrutura Docker

O projeto utiliza Docker para gerenciar os serviços de desenvolvimento:

### Serviços Disponíveis
- **PostgreSQL + PostGIS:** Base de dados principal (porta 5432)
- **Redis:** Cache e sessões (porta 6379)
- **Adminer:** Interface web para PostgreSQL (porta 8081)
- **Redis Commander:** Interface web para Redis (porta 8082)

### Comandos Úteis
```bash
# Ver logs de todos os serviços
make logs

# Parar todos os serviços
make docker-down

# Reset completo (limpa volumes)
make dev-reset
```

##  Verificação Rápida

Após a instalação, verifique se tudo está a funcionar:

- **Backend API:** http://localhost:8080/swagger-ui.html
- **Admin Panel:** http://localhost:3000
- **Adminer (DB):** http://localhost:8081
- **Redis Commander:** http://localhost:8082
- **App Móvel:** Emulador Android/iOS ou dispositivo físico

## 🛠 Comandos Úteis

```bash
make help           # Ver todos os comandos disponíveis
make test           # Executar todos os testes
make build          # Compilar todos os componentes
make clean          # Limpar caches e builds
make status         # Ver estado dos serviços
```

## 📱 Desenvolvimento Flutter

```bash
cd apps/mobile
make get            # Instalar dependências
make gen            # Gerar código (l10n, riverpod, etc.)
make watch          # Observar mudanças e gerar código
make run-dev        # Executar em modo desenvolvimento
```

## ⚛️ Desenvolvimento Admin React

```bash
cd apps/admin
npm run dev         # Servidor de desenvolvimento
npm run build       # Build de produção
npm run lint        # Verificar código
```

## 🔧 Desenvolvimento Backend Kotlin

```bash
cd backend/service-core
./gradlew bootRun           # Executar aplicação
./gradlew test              # Executar testes
./gradlew build             # Compilar
./gradlew jacocoTestReport  # Relatório de cobertura
```

## 🏗 Infraestrutura (GCP)

```bash
cd infra/terraform/envs/dev
cp terraform.tfvars.example terraform.tfvars
# Editar terraform.tfvars com os seus valores

terraform init      # Inicializar
terraform plan      # Planear mudanças
terraform apply     # Aplicar infraestrutura
```

## 🐛 Resolução de Problemas

### Flutter não encontrado
```bash
export PATH="$PATH:$HOME/flutter/bin"
source ~/.bashrc  # ou ~/.zshrc no macOS
```

### Erro de permissões Docker (Linux)
```bash
sudo usermod -aG docker $USER
# Fazer logout/login
```

### Erro de compilação Gradle
```bash
cd backend/service-core
./gradlew clean build --no-daemon
```

### Base de dados não conecta
```bash
# Verificar se PostgreSQL está a correr
docker-compose -f docker-compose.dev.yml ps
docker-compose -f docker-compose.dev.yml logs postgres
```

## 📚 Documentação Adicional

- **API:** [OpenAPI Spec](../api/openapi.yaml) | [Swagger UI](http://localhost:8080/swagger-ui.html)
- **Arquitetura:** [ADR-001](adr/0001-architecture.md)
- **Base de Dados:** [Schema](db/schema.md)

## 🆘 Suporte

- **Issues:** [GitHub Issues](https://github.com/smpsandro1239/-Juntos/issues)
- **Discussões:** [GitHub Discussions](https://github.com/smpsandro1239/-Juntos/discussions)
- **Email:** dev@juntos.pt

---

**Próximos Passos:**
1. Explorar o código em `apps/mobile/lib/` (Flutter)
2. Ver endpoints em `backend/service-core/src/main/kotlin/pt/juntos/core/web/`
3. Testar API com Postman/Insomnia usando a spec OpenAPI
4. Contribuir seguindo as [guidelines de contribuição](../CONTRIBUTING.md)
