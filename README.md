# +JUNTOS

**Slogan:** "Descobre tudo o que podes fazer com a família, onde quer que estejas."

Este é o repositório oficial da aplicação **+JUNTOS**, a plataforma digital para atividades familiares em Portugal.

## Visão

Tornar-se na caixa de Pandora digital das actividades familiares em Portugal, mostrando **tudo** o que se pode fazer com crianças 0-12 anos, **onde quer que se esteja**, **em 3 toques**, **offline ou online**.

## Stack Tecnológica

- **Backend**: Kotlin, Spring Boot 3.2, PostgreSQL, Redis, Spring Security (JWT).
- **Frontend (Admin)**: React, Vite, TypeScript, Material UI.
- **Mobile**: Flutter.

## Funcionalidades Implementadas

### Backend
- **Autenticação**: Registo e Login com JWT (`AuthController`, `UserService`).
- **POIs**: Gestão completa de Pontos de Interesse com caching Redis (`PoiController`, `PoiService`).
- **Segurança**: Proteção de endpoints e validação de tokens.

### Frontend (Admin)
- **Login**: Página de autenticação integrada (`LoginPage.tsx`).
- **API**: Cliente Axios configurado com interceptors para gestão de tokens (`api.ts`).

## Instalação e Execução Local

Para configurar e executar o projeto localmente em menos de 15 minutos, siga as instruções no nosso guia de onboarding:

> **[Guia de Onboarding para Novos Developers](docs/onboarding-novo-dev.md)**

## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE).
