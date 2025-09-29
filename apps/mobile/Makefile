# +JUNTOS
# Ficheiro: apps/mobile/Makefile
# Descrição: Scripts de desenvolvimento Flutter
# Autor: (+JUNTOS team)
# Locale: pt_PT

.PHONY: help get gen watch build-dev build-stg build-prod clean test

help: ## Mostra esta ajuda
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

get: ## Instala dependências
	flutter pub get

gen: ## Gera código (build_runner)
	flutter packages pub run build_runner build --delete-conflicting-outputs

watch: ## Observa mudanças e gera código automaticamente
	flutter packages pub run build_runner watch --delete-conflicting-outputs

build-dev: ## Build APK desenvolvimento
	flutter build apk --flavor dev --debug

build-stg: ## Build APK staging
	flutter build apk --flavor stg --release

build-prod: ## Build APK produção
	flutter build apk --flavor prod --release

build-ios-dev: ## Build iOS desenvolvimento
	flutter build ios --flavor dev --debug

build-ios-prod: ## Build iOS produção
	flutter build ios --flavor prod --release

clean: ## Limpa cache e builds
	flutter clean
	flutter pub get

test: ## Executa testes
	flutter test --coverage

test-integration: ## Executa testes de integração
	flutter drive --target=test_driver/app.dart

analyze: ## Analisa código
	flutter analyze

format: ## Formata código
	dart format lib/ test/

l10n: ## Gera localizações
	flutter gen-l10n

run-dev: ## Executa app em modo desenvolvimento
	flutter run --flavor dev --debug

run-stg: ## Executa app em modo staging
	flutter run --flavor stg --release

install-dev: ## Instala APK desenvolvimento
	flutter install --flavor dev

doctor: ## Verifica instalação Flutter
	flutter doctor -v