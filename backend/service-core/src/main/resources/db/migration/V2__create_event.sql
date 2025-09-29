
-- +JUNTOS
-- Ficheiro: backend/service-core/src/main/resources/db/migration/V2__create_event.sql
-- Descrição: Cria a tabela de Eventos
-- Autor: (+JUNTOS team)
-- Locale: pt_PT

CREATE TABLE events (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    poi_id UUID REFERENCES pois(id),
    start_date TIMESTAMPTZ NOT NULL,
    end_date TIMESTAMPTZ NOT NULL,
    price NUMERIC(10, 2) DEFAULT 0.00,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
