#!/bin/bash
# +JUNTOS
# Script para lançar o backend Spring Boot
# Uso: ./start-backend.sh

echo "🚀 A lançar backend +JUNTOS..."
echo ""

# Verificar se PostgreSQL está a correr
if ! docker ps | grep -q juntos-postgres; then
    echo "❌ PostgreSQL não está a correr!"
    echo "Execute: docker-compose -f docker-compose.dev.yml up -d postgres redis"
    exit 1
fi

echo "✅ PostgreSQL está a correr"
echo "✅ A iniciar backend..."
echo ""

# Navegar para a pasta do backend
cd "$(dirname "$0")/backend/service-core"

# Verificar se existe o JAR compilado
if [ ! -d "build/libs" ] || [ -z "$(ls -A build/libs/*.jar 2>/dev/null)" ]; then
    echo "⚠️  JAR não encontrado. A compilar projeto..."

    # Tentar compilar com Gradle (se disponível)
    if command -v gradle &> /dev/null; then
        gradle clean build -x test
    else
        echo "❌ Gradle não está instalado!"
        echo ""
        echo "Por favor, compile o projeto usando uma das seguintes opções:"
        echo "1. Abra o projeto no IntelliJ IDEA e execute 'Build > Build Project'"
        echo "2. Instale o Gradle: https://gradle.org/install/"
        echo "3. Use o Maven Wrapper se disponível: ./mvnw clean package"
        exit 1
    fi
fi

# Encontrar o JAR
JAR_FILE=$(ls build/libs/*.jar | head -n 1)

if [ -z "$JAR_FILE" ]; then
    echo "❌ Não foi possível encontrar o ficheiro JAR!"
    exit 1
fi

echo "📦 A executar: $JAR_FILE"
echo ""

# Executar o backend
java -jar "$JAR_FILE" \
    --spring.datasource.url=jdbc:postgresql://localhost:5432/juntos_dev \
    --spring.datasource.username=juntos_user \
    --spring.datasource.password=juntos_pass \
    --spring.redis.host=localhost \
    --spring.redis.port=6379 \
    --spring.profiles.active=dev
