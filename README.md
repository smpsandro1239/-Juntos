# +JUNTOS - Atividades em Família

![Banner +JUNTOS](https://imgur.com/gallery/bgAolpP)

**Descobre tudo o que podes fazer com a família, onde quer que estejas.**

+JUNTOS é uma aplicação móvel nativa (iOS/Android) desenhada para ajudar progenitores em Portugal a encontrar atividades offline e online para crianças dos 0 aos 12 anos, de forma rápida e intuitiva. O nosso objetivo é que, em apenas 3 toques, qualquer família encontre a atividade perfeita, mesmo sem ligação à internet.

## ✨ Funcionalidades Principais

- **Descoberta Inteligente:** Um algoritmo de recomendação ("Momento") que sugere atividades com base na tua localização, idades dos filhos, clima local e histórico de preferências.
- **Acesso Offline:** Acesso a centenas de atividades essenciais mesmo sem rede, garantindo que nunca ficas sem ideias.
- **Filtros Avançados:** Pesquisa por idade, tipo de atividade (interior/exterior), preço (gratuito/pago), acessibilidade e duração.
- **Experiência de Utilizador Polida:** Interface rápida e fluida com animações, feedback tátil e um design limpo e acessível.
- **Conteúdo de Qualidade:** Todas as atividades são curadas e validadas para garantir informação completa e atualizada, incluindo descrições, fotos, preços e coordenadas GPS.
- **Privacidade Primeiro:** Controlo total sobre os teus dados, com um gestor de consentimento transparente (CMP IAB TCF 2.2) e respeito pelas diretrizes da Apple (ATT).

## 🚀 Tecnologias Utilizadas

Este é um monorepo que contém as várias componentes do ecossistema +JUNTOS:

- **📱 Aplicação Móvel (`/apps/mobile`):**
  - **Framework:** Flutter 3.x
  - **Gestão de Estado:** `flutter_riverpod`
  - **Navegação:** `go_router`
  - **Base de Dados Local:** `drift` (SQLite)
  - **Rede:** `dio` & `retrofit`
  - **Cache de Imagens:** `cached_network_image`
  - **Monitorização:** Firebase (Analytics, Crashlytics) & Sentry

- **⚙️ Backend (`/backend/service-core`):**
  - **Linguagem:** Kotlin
  - **Framework:** Spring Boot
  - **Base de Dados:** PostgreSQL
  - **Autenticação:** JWT

- **🖥️ Painel de Administração (`/apps/admin`):**
  - **Framework:** React / Next.js
  - **UI Kit:** Material-UI (MUI)

- **🏗️ Infraestrutura (`/infra`):**
  - **Provisionamento:** Terraform
  - **Cloud:** Google Cloud Platform (GCP)
  - **CI/CD:** GitHub Actions

## ⚙️ Como Começar (Desenvolvimento da App Móvel)

Para configurar o ambiente de desenvolvimento da aplicação Flutter, segue estes passos:

**Pré-requisitos:**
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (versão 3.x)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

**1. Clonar o Repositório**
```bash
git clone https://github.com/seu-usuario/mais-juntos.git
cd mais-juntos
```

**2. Instalar Dependências do Projeto**
Este projeto inclui um script para facilitar a instalação de todas as ferramentas necessárias (como o Flutter SDK na versão correta).

```bash
# Dar permissão de execução ao script
chmod +x scripts/install-deps.sh

# Executar o script
./scripts/install-deps.sh

# Atualizar o PATH na tua sessão de terminal
source ~/.bashrc
```

**3. Configurar a Aplicação Flutter**
Com as dependências instaladas, podes agora configurar a aplicação móvel.

```bash
# Navegar para a pasta da app
cd apps/mobile

# Obter as dependências do Flutter
flutter pub get

# Gerar os ficheiros de localização
flutter gen-l10n

# Gerar o código necessário (para Drift, Retrofit, etc.)
flutter pub run build_runner build --delete-conflicting-outputs
```

**4. Executar a Aplicação**
Agora estás pronto para executar a aplicação num emulador ou dispositivo físico.

```bash
# Certifica-te que estás na pasta /apps/mobile
cd apps/mobile

# Executar a app
flutter run
```

## 🤝 Como Contribuir

Agradecemos o teu interesse em contribuir para o +JUNTOS! Atualmente, estamos a finalizar a v1.0 e não estamos a aceitar pull requests externos. No entanto, podes abrir *Issues* para reportar bugs ou sugerir novas funcionalidades.

## 📜 Licença

O código-fonte da aplicação é distribuído sob duas licenças:
- **MIT License:** Para o nosso UI kit open-source.
- **Proprietary License:** Para o nosso algoritmo de recomendação e backend.

Consulta o ficheiro `LICENSE` para mais detalhes.
