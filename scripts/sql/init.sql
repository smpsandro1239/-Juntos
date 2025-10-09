-- +JUNTOS
-- Ficheiro: scripts/sql/init.sql
-- Descrição: Configurações iniciais da base de dados
-- Autor: (+JUNTOS team)
-- Locale: pt_PT

-- Criar extensão PostGIS para funcionalidades geoespaciais
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;
CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder;

-- Criar extensão para UUIDs
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Configurar timezone para Portugal
SET timezone = 'Europe/Lisbon';

-- Criar schema principal se não existir
CREATE SCHEMA IF NOT EXISTS juntos;

-- Conceder permissões no schema
GRANT USAGE ON SCHEMA juntos TO juntos_user;
GRANT CREATE ON SCHEMA juntos TO juntos_user;

-- Configurar search_path padrão
ALTER DATABASE juntos_dev SET search_path TO juntos, public;

-- Criar função para atualizar campo atualizado_em automaticamente
CREATE OR REPLACE FUNCTION juntos.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.atualizado_em = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Comentários
COMMENT ON DATABASE juntos_dev IS '+JUNTOS - Aplicação para atividades familiares em Portugal';
COMMENT ON SCHEMA juntos IS 'Schema principal da aplicação +JUNTOS';
