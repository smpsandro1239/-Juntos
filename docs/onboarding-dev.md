
# +JUNTOS
# Ficheiro: docs/onboarding-dev.md
# Descrição: Guia de onboarding para novos developers
# Autor: (+JUNTOS team)
# Locale: pt_PT

# Onboarding de Novo Developer

Bem-vindo à equipa +JUNTOS! Este guia irá ajudá-lo a configurar o seu ambiente de desenvolvimento e a começar a contribuir para o projeto.

## 1. Instalar Dependências

Execute o seguinte script para instalar todas as dependências necessárias:

```bash
./scripts/install-deps.sh
```

## 2. Configurar o Ambiente

### Backend

O backend é uma aplicação Spring Boot. Pode executá-la a partir da sua IDE ou através da linha de comandos:

```bash
cd backend/service-core
./gradlew bootRun
```

### Frontend (Mobile)

A aplicação móvel é construída com Flutter. Para a executar, use os seguintes comandos:

```bash
cd apps/mobile
flutter run
```

### Frontend (Admin)

A aplicação de administração é construída com React. Para a executar, use os seguintes comandos:

```bash
cd apps/admin
npm install
npm run dev
```

## 3. Links Úteis

- [Documentação do Flutter](https://flutter.dev/docs)
- [Documentação do Kotlin](https://kotlinlang.org/docs/home.html)
- [Documentação do Terraform](https://www.terraform.io/docs)
