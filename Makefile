# +JUNTOS
# Ficheiro: Makefile
# Descrição: Scripts principais de desenvolvimento
# Autor: (+JUNTOS team)
# Locale: pt_PT

.PHONY: help install dev-setup backend-build backend-test flutter-setup admin-setup infra-plan infra-apply clean

help: ## Mostra esta ajuda
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Instala todas as dependências
	@echo "🚀 A instalar dependências..."
	chmod +x scripts/install-deps.sh
	./scripts/install-deps.sh

dev-setup: ## Configuração inicial para desenvolvimento
	@echo "⚙️ Configuração inicial..."
	$(MAKE) backend-setup
	$(MAKE) flutter-setup
	$(MAKE) admin-setup
	@echo "✅ Configuração concluída!"

backend-setup: ## Configura backend Kotlin
	@echo "🔧 A configurar backend..."
	cd backend/service-core && ./gradlew build --no-daemon

backend-build: ## Compila backend
	cd backend/service-core && ./gradlew build --no-daemon

backend-test: ## Executa testes do backend
	cd backend/service-core && ./gradlew test jacocoTestReport --no-daemon

backend-run: ## Executa backend localmente
	cd backend/service-core && ./gradlew bootRun --no-daemon

flutter-setup: ## Configura Flutter
	@echo "📱 A configurar Flutter..."
	cd apps/mobile && flutter pub get
	cd apps/mobile && flutter gen-l10n

flutter-build: ## Compila Flutter
	cd apps/mobile && flutter build apk --flavor dev

flutter-test: ## Executa testes Flutter
	cd apps/mobile && flutter test --coverage

admin-setup: ## Configura admin React
	@echo "⚛️ A configurar admin..."
	cd apps/admin && npm install

admin-build: ## Compila admin
	cd apps/admin && npm run build

admin-dev: ## Executa admin em modo desenvolvimento
	cd apps/admin && npm run dev

lint-openapi: ## Valida especificação OpenAPI
	@echo "📋 A validar OpenAPI..."
	@if command -v swagger-codegen &> /dev/null; then \
		swagger-codegen validate -i docs/api/openapi.yaml; \
	else \
		echo "⚠️ swagger-codegen não encontrado. Instale: npm install -g swagger-codegen-cli"; \
	fi

infra-init: ## Inicializa Terraform
	cd infra/terraform/envs/dev && terraform init

infra-plan: ## Planeia infraestrutura
	cd infra/terraform/envs/dev && terraform plan

infra-apply: ## Aplica infraestrutura
	cd infra/terraform/envs/dev && terraform apply

infra-destroy: ## Destrói infraestrutura
	cd infra/terraform/envs/dev && terraform destroy

test: ## Executa todos os testes
	$(MAKE) backend-test
	$(MAKE) flutter-test

build: ## Compila todos os componentes
	$(MAKE) backend-build
	$(MAKE) flutter-build
	$(MAKE) admin-build

clean: ## Limpa builds e caches
	@echo "🧹 A limpar..."
	cd backend/service-core && ./gradlew clean || true
	cd apps/mobile && flutter clean || true
	cd apps/admin && rm -rf node_modules dist || true

docker-build: ## Constrói imagens Docker
	docker build -t juntos-backend:dev -f backend/service-core/Dockerfile backend/service-core
	docker build -t juntos-admin:dev -f apps/admin/Dockerfile apps/admin

docker-up: ## Inicia serviços Docker
	docker-compose -f docker-compose.dev.yml up -d

docker-down: ## Para serviços Docker
	docker-compose -f docker-compose.dev.yml down

logs: ## Mostra logs dos serviços
	docker-compose -f docker-compose.dev.yml logs -f

status: ## Mostra estado dos serviços
	@echo "📊 Estado dos serviços:"
	@docker-compose -f docker-compose.dev.yml ps || echo "Docker Compose não está a correr"

dev-reset: ## Reset completo do ambiente de desenvolvimento
	$(MAKE) clean
	$(MAKE) docker-down
	$(MAKE) dev-setup