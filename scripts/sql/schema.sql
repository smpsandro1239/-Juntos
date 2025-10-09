-- +JUNTOS
-- Ficheiro: scripts/sql/schema.sql
-- Descrição: Estrutura das tabelas da base de dados
-- Autor: (+JUNTOS team)
-- Locale: pt_PT

-- ===========================================
-- TABELA: users (Utilizadores)
-- ===========================================
CREATE TABLE juntos.users (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255),
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    data_nascimento DATE,
    role VARCHAR(50) DEFAULT 'USER' CHECK (role IN ('USER', 'ADMIN')),
    ativo BOOLEAN DEFAULT true,
    email_verificado BOOLEAN DEFAULT false,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    ultimo_login TIMESTAMP WITH TIME ZONE
);

-- ===========================================
-- TABELA: pois (Pontos de Interesse)
-- ===========================================
CREATE TABLE juntos.pois (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    categoria VARCHAR(100) NOT NULL,
    idade_min INTEGER DEFAULT 0 CHECK (idade_min >= 0),
    idade_max INTEGER DEFAULT 12 CHECK (idade_max >= idade_min),
    preco_min DECIMAL(10,2) DEFAULT 0 CHECK (preco_min >= 0),
    preco_max DECIMAL(10,2) DEFAULT 0 CHECK (preco_max >= preco_min),
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    morada VARCHAR(500),
    codigo_postal VARCHAR(20),
    cidade VARCHAR(100),
    distrito VARCHAR(100),
    telefone VARCHAR(20),
    website VARCHAR(500),
    email VARCHAR(255),
    horario_abertura VARCHAR(255),
    horario_fecho VARCHAR(255),
    acessibilidade BOOLEAN DEFAULT false,
    estacionamento BOOLEAN DEFAULT false,
    wc BOOLEAN DEFAULT false,
    cafetaria BOOLEAN DEFAULT false,
    interior BOOLEAN DEFAULT false,
    exterior BOOLEAN DEFAULT false,
    ativo BOOLEAN DEFAULT true,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    -- Índices para performance
    CONSTRAINT pois_coord_check CHECK (latitude BETWEEN -90 AND 90 AND longitude BETWEEN -180 AND 180)
);

-- Índice geoespacial para consultas por proximidade
CREATE INDEX idx_pois_location ON juntos.pois USING gist (ST_Point(longitude, latitude));
CREATE INDEX idx_pois_categoria ON juntos.pois (categoria);
CREATE INDEX idx_pois_idade ON juntos.pois (idade_min, idade_max);
CREATE INDEX idx_pois_ativo ON juntos.pois (ativo);

-- ===========================================
-- TABELA: events (Eventos)
-- ===========================================
CREATE TABLE juntos.events (
    id BIGSERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    poi_id BIGINT REFERENCES juntos.pois(id) ON DELETE CASCADE,
    data_inicio TIMESTAMP WITH TIME ZONE NOT NULL,
    data_fim TIMESTAMP WITH TIME ZONE,
    preco DECIMAL(10,2) DEFAULT 0 CHECK (preco >= 0),
    capacidade INTEGER,
    inscricoes INTEGER DEFAULT 0,
    ativo BOOLEAN DEFAULT true,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_events_poi ON juntos.events (poi_id);
CREATE INDEX idx_events_data ON juntos.events (data_inicio, data_fim);

-- ===========================================
-- TABELA: albums (Álbuns de fotos)
-- ===========================================
CREATE TABLE juntos.albums (
    id BIGSERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    poi_id BIGINT REFERENCES juntos.pois(id) ON DELETE CASCADE,
    user_id BIGINT REFERENCES juntos.users(id) ON DELETE CASCADE,
    publico BOOLEAN DEFAULT true,
    ativo BOOLEAN DEFAULT true,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_albums_poi ON juntos.albums (poi_id);
CREATE INDEX idx_albums_user ON juntos.albums (user_id);

-- ===========================================
-- TABELA: photos (Fotos dos álbuns)
-- ===========================================
CREATE TABLE juntos.photos (
    id BIGSERIAL PRIMARY KEY,
    album_id BIGINT REFERENCES juntos.albums(id) ON DELETE CASCADE,
    url VARCHAR(1000) NOT NULL,
    thumbnail_url VARCHAR(1000),
    legenda VARCHAR(500),
    ordem INTEGER DEFAULT 0,
    ativo BOOLEAN DEFAULT true,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_photos_album ON juntos.photos (album_id);

-- ===========================================
-- TABELA: reviews (Avaliações)
-- ===========================================
CREATE TABLE juntos.reviews (
    id BIGSERIAL PRIMARY KEY,
    poi_id BIGINT REFERENCES juntos.pois(id) ON DELETE CASCADE,
    user_id BIGINT REFERENCES juntos.users(id) ON DELETE CASCADE,
    rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comentario TEXT,
    visita_data DATE,
    util BOOLEAN DEFAULT false,
    ativo BOOLEAN DEFAULT true,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    UNIQUE(poi_id, user_id) -- Um user só pode avaliar um POI uma vez
);

CREATE INDEX idx_reviews_poi ON juntos.reviews (poi_id);
CREATE INDEX idx_reviews_user ON juntos.reviews (user_id);

-- ===========================================
-- TABELA: favorites (Favoritos)
-- ===========================================
CREATE TABLE juntos.favorites (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES juntos.users(id) ON DELETE CASCADE,
    poi_id BIGINT REFERENCES juntos.pois(id) ON DELETE CASCADE,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    UNIQUE(user_id, poi_id) -- Um user não pode favoritar o mesmo POI duas vezes
);

CREATE INDEX idx_favorites_user ON juntos.favorites (user_id);
CREATE INDEX idx_favorites_poi ON juntos.favorites (poi_id);

-- ===========================================
-- TABELA: subscriptions (Subscrições)
-- ===========================================
CREATE TABLE juntos.subscriptions (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    categorias TEXT[], -- Array de categorias preferidas
    distritos TEXT[], -- Array de distritos preferidos
    idade_min INTEGER DEFAULT 0,
    idade_max INTEGER DEFAULT 12,
    ativo BOOLEAN DEFAULT true,
    token_verificacao UUID DEFAULT uuid_generate_v4(),
    verificado BOOLEAN DEFAULT false,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- ===========================================
-- TRIGGERS para atualizar campo atualizado_em
-- ===========================================
CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE ON juntos.users
    FOR EACH ROW EXECUTE FUNCTION juntos.update_updated_at_column();

CREATE TRIGGER update_pois_updated_at
    BEFORE UPDATE ON juntos.pois
    FOR EACH ROW EXECUTE FUNCTION juntos.update_updated_at_column();

CREATE TRIGGER update_events_updated_at
    BEFORE UPDATE ON juntos.events
    FOR EACH ROW EXECUTE FUNCTION juntos.update_updated_at_column();

CREATE TRIGGER update_albums_updated_at
    BEFORE UPDATE ON juntos.albums
    FOR EACH ROW EXECUTE FUNCTION juntos.update_updated_at_column();

CREATE TRIGGER update_reviews_updated_at
    BEFORE UPDATE ON juntos.reviews
    FOR EACH ROW EXECUTE FUNCTION juntos.update_updated_at_column();

CREATE TRIGGER update_subscriptions_updated_at
    BEFORE UPDATE ON juntos.subscriptions
    FOR EACH ROW EXECUTE FUNCTION juntos.update_updated_at_column();
