-- +JUNTOS
-- Ficheiro: src/main/resources/db/migration/V2__create_events.sql
-- Descrição: Criação da tabela events
-- Autor: (+JUNTOS team)
-- Locale: pt_PT

CREATE TABLE events (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    idade_min INTEGER NOT NULL DEFAULT 0,
    idade_max INTEGER NOT NULL DEFAULT 12,
    preco DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    data_inicio TIMESTAMP NOT NULL,
    data_fim TIMESTAMP NOT NULL,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    morada TEXT NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    distrito VARCHAR(50) NOT NULL,
    lotacao_maxima INTEGER,
    lotacao_atual INTEGER NOT NULL DEFAULT 0,
    reserva_obrigatoria BOOLEAN NOT NULL DEFAULT false,
    url_reserva VARCHAR(500),
    telefone_reserva VARCHAR(20),
    ativo BOOLEAN NOT NULL DEFAULT true,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_events_location ON events USING GIST (ST_Point(longitude, latitude));
CREATE INDEX idx_events_data ON events (data_inicio, data_fim);
CREATE INDEX idx_events_categoria ON events (categoria);
CREATE INDEX idx_events_idade ON events (idade_min, idade_max);