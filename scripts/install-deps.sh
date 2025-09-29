
#!/bin/bash
# +JUNTOS
# Ficheiro: scripts/install-deps.sh
# Descrição: Script para instalar dependências de desenvolvimento
# Autor: (+JUNTOS team)
# Locale: pt_PT

set -e

echo "A instalar dependências..."

# Detect OS
if [[ "$(uname)" == "Darwin" ]]; then
  # macOS
  echo "A instalar dependências para macOS..."
  brew install flutter docker tfenv kubectl helm jq yq mkcert
elif [[ "$(uname)" == "Linux" ]]; then
  # Linux
  echo "A instalar dependências para Linux..."
  sudo apt-get update
  sudo apt-get install -y flutter docker.io terraform kubectl helm jq yq mkcert
else
  echo "Sistema operativo não suportado."
  exit 1
fi

echo "Dependências instaladas com sucesso."
