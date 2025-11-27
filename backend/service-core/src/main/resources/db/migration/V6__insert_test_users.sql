-- +JUNTOS
-- Ficheiro: backend/service-core/src/main/resources/db/migration/V6__insert_test_users.sql
-- Descrição: Insere utilizadores de teste para cada role
-- Autor: (+JUNTOS team)
-- Locale: pt_PT

-- ===========================================
-- UTILIZADORES DE TESTE
-- ===========================================
-- Passwords (todas): "teste123"
-- Hash BCrypt: $2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy

-- Utilizador ADMIN
INSERT INTO juntos.users (
    email,
    password_hash,
    nome,
    telefone,
    role,
    ativo,
    email_verificado
) VALUES (
    'admin@juntos.pt',
    '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
    'Administrador Sistema',
    '+351 912 345 678',
    'ADMIN',
    true,
    true
) ON CONFLICT (email) DO NOTHING;

-- Utilizador USER (normal)
INSERT INTO juntos.users (
    email,
    password_hash,
    nome,
    telefone,
    role,
    ativo,
    email_verificado
) VALUES (
    'user@juntos.pt',
    '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
    'Utilizador Teste',
    '+351 913 456 789',
    'USER',
    true,
    true
) ON CONFLICT (email) DO NOTHING;

-- Utilizador USER adicional (para testes de múltiplos utilizadores)
INSERT INTO juntos.users (
    email,
    password_hash,
    nome,
    telefone,
    role,
    ativo,
    email_verificado
) VALUES (
    'maria.silva@juntos.pt',
    '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
    'Maria Silva',
    '+351 914 567 890',
    'USER',
    true,
    true
) ON CONFLICT (email) DO NOTHING;

-- ===========================================
-- COMENTÁRIOS
-- ===========================================
COMMENT ON COLUMN juntos.users.password_hash IS 'Hash BCrypt da password. Utilizadores de teste usam "teste123"';
