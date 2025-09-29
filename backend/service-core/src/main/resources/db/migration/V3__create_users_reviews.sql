-- +JUNTOS
-- Ficheiro: src/main/resources/db/migration/V3__create_users_reviews.sql
-- Descrição: Criação das tabelas users e reviews
-- Autor: (+JUNTOS team)
-- Locale: pt_PT

CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    firebase_uid VARCHAR(128) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    nome VARCHAR(255) NOT NULL,
    idades_criancas TEXT NOT NULL, -- JSON: [3,7,10]
    cidade VARCHAR(100),
    distrito VARCHAR(50),
    premium BOOLEAN NOT NULL DEFAULT false,
    premium_expira TIMESTAMP,
    idioma VARCHAR(10) NOT NULL DEFAULT 'pt_PT',
    notificacoes BOOLEAN NOT NULL DEFAULT true,
    ativo BOOLEAN NOT NULL DEFAULT true,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ultimo_login TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reviews (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    poi_id BIGINT REFERENCES pois(id) ON DELETE CASCADE,
    event_id BIGINT REFERENCES events(id) ON DELETE CASCADE,
    classificacao INTEGER NOT NULL CHECK (classificacao >= 1 AND classificacao <= 5),
    comentario TEXT,
    acessibilidade_ok BOOLEAN,
    estacionamento_ok BOOLEAN,
    wc_ok BOOLEAN,
    urls_fotos TEXT, -- JSON array
    aprovado BOOLEAN NOT NULL DEFAULT false,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT reviews_entity_check CHECK (
        (poi_id IS NOT NULL AND event_id IS NULL) OR 
        (poi_id IS NULL AND event_id IS NOT NULL)
    )
);

CREATE INDEX idx_users_firebase ON users (firebase_uid);
CREATE INDEX idx_users_email ON users (email);
CREATE INDEX idx_reviews_poi ON reviews (poi_id);
CREATE INDEX idx_reviews_event ON reviews (event_id);
CREATE INDEX idx_reviews_user ON reviews (user_id);
CREATE INDEX idx_reviews_aprovado ON reviews (aprovado);