#!/bin/bash
# +JUNTOS
# Ficheiro: scripts/install-deps.sh
# Descrição: Script de instalação de dependências
# Autor: (+JUNTOS team)
# Locale: pt_PT

set -e

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Funções auxiliares
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Detectar sistema operativo
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
        if command -v apt-get &> /dev/null; then
            DISTRO="ubuntu"
        elif command -v yum &> /dev/null; then
            DISTRO="centos"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
    else
        log_error "Sistema operativo não suportado: $OSTYPE"
        exit 1
    fi
    
    log_info "Sistema detectado: $OS"
}

# Instalar Flutter
install_flutter() {
    log_info "A instalar Flutter SDK..."
    
    if command -v flutter &> /dev/null; then
        log_warning "Flutter já está instalado"
        flutter --version
        return
    fi
    
    FLUTTER_DIR="$HOME/flutter"
    
    if [ ! -d "$FLUTTER_DIR" ]; then
        log_info "A descarregar Flutter SDK..."
        git clone https://github.com/flutter/flutter.git -b stable "$FLUTTER_DIR"
    fi
    
    # Adicionar ao PATH
    if [[ "$OS" == "macos" ]]; then
        SHELL_RC="$HOME/.zshrc"
    else
        SHELL_RC="$HOME/.bashrc"
    fi
    
    if ! grep -q "flutter/bin" "$SHELL_RC"; then
        echo 'export PATH="$PATH:$HOME/flutter/bin"' >> "$SHELL_RC"
        log_info "Flutter adicionado ao PATH em $SHELL_RC"
    fi
    
    export PATH="$PATH:$HOME/flutter/bin"
    
    log_success "Flutter instalado com sucesso"
    flutter --version
}

# Instalar Docker
install_docker() {
    log_info "A instalar Docker..."
    
    if command -v docker &> /dev/null; then
        log_warning "Docker já está instalado"
        docker --version
        return
    fi
    
    if [[ "$OS" == "macos" ]]; then
        log_info "Por favor, instale Docker Desktop manualmente: https://docs.docker.com/desktop/mac/install/"
    elif [[ "$OS" == "linux" && "$DISTRO" == "ubuntu" ]]; then
        curl -fsSL https://get.docker.com -o get-docker.sh
        sudo sh get-docker.sh
        sudo usermod -aG docker $USER
        rm get-docker.sh
        log_success "Docker instalado. Faça logout/login para usar sem sudo"
    fi
}

# Instalar Terraform
install_terraform() {
    log_info "A instalar Terraform..."
    
    if command -v terraform &> /dev/null; then
        log_warning "Terraform já está instalado"
        terraform version
        return
    fi
    
    if [[ "$OS" == "macos" ]]; then
        if command -v brew &> /dev/null; then
            brew tap hashicorp/tap
            brew install hashicorp/tap/terraform
        else
            log_error "Homebrew não encontrado. Instale manualmente: https://www.terraform.io/downloads"
            return
        fi
    elif [[ "$OS" == "linux" ]]; then
        wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
        sudo apt update && sudo apt install terraform
    fi
    
    log_success "Terraform instalado com sucesso"
    terraform version
}

# Instalar kubectl
install_kubectl() {
    log_info "A instalar kubectl..."
    
    if command -v kubectl &> /dev/null; then
        log_warning "kubectl já está instalado"
        kubectl version --client
        return
    fi
    
    if [[ "$OS" == "macos" ]]; then
        if command -v brew &> /dev/null; then
            brew install kubectl
        else
            curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
            chmod +x kubectl
            sudo mv kubectl /usr/local/bin/
        fi
    elif [[ "$OS" == "linux" ]]; then
        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
        chmod +x kubectl
        sudo mv kubectl /usr/local/bin/
    fi
    
    log_success "kubectl instalado com sucesso"
    kubectl version --client
}

# Instalar ferramentas auxiliares
install_tools() {
    log_info "A instalar ferramentas auxiliares..."
    
    if [[ "$OS" == "macos" ]]; then
        if command -v brew &> /dev/null; then
            brew install jq yq helm
        else
            log_warning "Homebrew não encontrado. Instale manualmente: jq, yq, helm"
        fi
    elif [[ "$OS" == "linux" && "$DISTRO" == "ubuntu" ]]; then
        sudo apt update
        sudo apt install -y jq
        
        # yq
        sudo wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
        sudo chmod +x /usr/local/bin/yq
        
        # helm
        curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
        sudo apt-get update
        sudo apt-get install helm
    fi
    
    log_success "Ferramentas auxiliares instaladas"
}

# Verificar instalações
verify_installations() {
    log_info "A verificar instalações..."
    
    TOOLS=("flutter" "docker" "terraform" "kubectl" "jq" "yq" "helm")
    
    for tool in "${TOOLS[@]}"; do
        if command -v "$tool" &> /dev/null; then
            log_success "$tool ✓"
        else
            log_warning "$tool ✗ (não encontrado)"
        fi
    done
}

# Função principal
main() {
    log_info "=== Instalador de Dependências +JUNTOS ==="
    log_info "Este script irá instalar todas as dependências necessárias"
    
    detect_os
    
    install_flutter
    install_docker
    install_terraform
    install_kubectl
    install_tools
    
    verify_installations
    
    log_success "=== Instalação concluída ==="
    log_info "Reinicie o terminal ou execute: source ~/.bashrc (Linux) ou source ~/.zshrc (macOS)"
    log_info "Para começar a desenvolver, execute: make dev-setup"
}

# Executar se chamado diretamente
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi