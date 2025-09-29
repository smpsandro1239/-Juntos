
-- +JUNTOS
-- Ficheiro: backend/service-core/src/main/resources/db/migration/V1__create_poi.sql
-- Descrição: Cria a tabela de Pontos de Interesse (POIs)
-- Autor: (+JUNTOS team)
-- Locale: pt_PT

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE pois (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(2) NOT NULL DEFAULT 'PT',
    website VARCHAR(255),
    phone VARCHAR(50),
    price NUMERIC(10, 2) DEFAULT 0.00,
    min_age INT DEFAULT 0,
    max_age INT DEFAULT 99,
    indoor BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_pois_location ON pois USING GIST (ST_MakePoint(longitude, latitude));
