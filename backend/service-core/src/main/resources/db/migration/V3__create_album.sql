
-- +JUNTOS
-- Ficheiro: backend/service-core/src/main/resources/db/migration/V3__create_album.sql
-- Descrição: Cria a tabela de Albuns
-- Autor: (+JUNTOS team)
-- Locale: pt_PT

CREATE TABLE albums (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    cover_image_url VARCHAR(255),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
