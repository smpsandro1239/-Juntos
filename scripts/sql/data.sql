-- +JUNTOS
-- Ficheiro: scripts/sql/data.sql
-- Descrição: Dados de exemplo para desenvolvimento
-- Autor: (+JUNTOS team)
-- Locale: pt_PT

-- ===========================================
-- DADOS DE DESENVOLVIMENTO
-- ===========================================

-- Utilizador admin para desenvolvimento
INSERT INTO juntos.users (email, password_hash, nome, role, ativo, email_verificado) VALUES
('admin@juntos.pt', '$2a$10$8K3dVzJcQX8zJcQX8zJcQX8zJcQX8zJcQX8zJcQX8zJcQX8zJcQX8', 'Administrador', 'ADMIN', true, true),
('user@juntos.pt', '$2a$10$8K3dVzJcQX8zJcQX8zJcQX8zJcQX8zJcQX8zJcQX8zJcQX8zJcQX8', 'Utilizador Teste', 'USER', true, true);

-- POIs de exemplo em Lisboa
INSERT INTO juntos.pois (nome, descricao, categoria, idade_min, idade_max, preco_min, preco_max, latitude, longitude, morada, codigo_postal, cidade, distrito, telefone, website, acessibilidade, estacionamento, wc, cafetaria, interior, exterior, ativo) VALUES
('Parque Eduardo VII', 'Grande parque urbano com jardins, lago e zona de recreio infantil. Perfeito para piqueniques e brincadeiras.', 'Parque', 0, 12, 0, 0, 38.7375, -9.1534, 'Avenida da Liberdade', '1050-099', 'Lisboa', 'Lisboa', '+351 217 932 700', 'https://www.cm-lisboa.pt', true, true, true, false, false, true, true),
('Oceanário de Lisboa', 'Aquário moderno com milhares de espécies marinhas. Exposições interativas sobre oceanos.', 'Museu', 3, 12, 15, 20, 38.7633, -9.0939, 'Esplanada Dom Carlos I s/n', '1990-005', 'Lisboa', 'Lisboa', '+351 218 917 000', 'https://www.oceanario.pt', true, true, true, true, true, false, true),
('Jardim Zoológico de Lisboa', 'Zoológico com animais de todo o mundo. Viveiros temáticos e espetáculos diários.', 'Zoológico', 2, 12, 22, 25, 38.7417, -9.1694, 'Praça Marechal Humberto Delgado 1', '1549-004', 'Lisboa', 'Lisboa', '+351 217 232 900', 'https://www.zoo.pt', true, true, true, true, true, false, true),
('Museu dos Coches', 'Museu com uma das maiores coleções de carruagens do mundo. Exposições permanentes e temporárias.', 'Museu', 5, 12, 8, 10, 38.6972, -9.2078, 'Belém', '1449-003', 'Lisboa', 'Lisboa', '+351 210 732 319', 'https://www.museudoscoches.pt', true, true, true, false, true, false, true),
('Parque Infantil do Monteiro-Mor', 'Parque infantil com equipamentos modernos e zona de merendas. Ideal para famílias.', 'Parque', 0, 10, 0, 0, 38.7486, -9.1234, 'Rua do Monteiro-Mor', '1500-327', 'Lisboa', 'Lisboa', NULL, NULL, true, false, true, false, false, true, true);

-- POIs de exemplo no Porto
INSERT INTO juntos.pois (nome, descricao, categoria, idade_min, idade_max, preco_min, preco_max, latitude, longitude, morada, codigo_postal, cidade, distrito, telefone, website, acessibilidade, estacionamento, wc, cafetaria, interior, exterior, ativo) VALUES
('Jardins do Palácio de Cristal', 'Jardins históricos com lago, estufas e zona infantil. Local perfeito para passeios em família.', 'Parque', 0, 12, 0, 0, 41.1486, -8.6258, 'Rua Dom Manuel II', '4050-414', 'Porto', 'Porto', '+351 225 324 200', 'https://www.cm-porto.pt', true, true, true, true, false, true, true),
('SEA LIFE Porto', 'Aquário moderno com túnel subaquático e exposições interativas sobre a vida marinha.', 'Aquário', 3, 12, 16, 18, 41.1417, -8.6111, 'Rua Particular de Entre-os-Rios 20', '4300-516', 'Porto', 'Porto', '+351 223 394 730', 'https://www.visitsealife.com', true, true, true, true, true, false, true),
('Museu do Carro Elétrico', 'Museu dedicado à história dos transportes elétricos no Porto. Carros antigos e interativos.', 'Museu', 4, 12, 6, 8, 41.1458, -8.6106, 'Alameda Basílio Teles 51', '4050-127', 'Porto', 'Porto', '+351 225 158 185', 'https://www.museudocarroeletrico.pt', true, true, true, false, true, false, true),
('Parque da Cidade do Porto', 'Grande parque urbano com lago artificial, jardins e zona infantil. Atividades ao ar livre.', 'Parque', 0, 12, 0, 0, 41.1622, -8.6750, 'Via Panorâmica Edgar Cardoso', '4100-180', 'Porto', 'Porto', '+351 225 324 200', 'https://www.cm-porto.pt', true, true, true, false, false, true, true);

-- POIs de exemplo em Coimbra
INSERT INTO juntos.pois (nome, descricao, categoria, idade_min, idade_max, preco_min, preco_max, latitude, longitude, morada, codigo_postal, cidade, distrito, telefone, website, acessibilidade, estacionamento, wc, cafetaria, interior, exterior, ativo) VALUES
('Universidade de Coimbra', 'Universidade histórica com Biblioteca Joanina e jardins. Visitas guiadas disponíveis.', 'Universidade', 6, 12, 15, 20, 40.2072, -8.4258, 'Paço das Escolas', '3004-531', 'Coimbra', 'Coimbra', '+351 239 242 744', 'https://www.uc.pt', true, true, true, false, true, false, true),
('Quinta das Lágrimas', 'Jardins românticos com lago e grutas. Ambiente mágico para famílias.', 'Parque', 0, 12, 0, 0, 40.2094, -8.4306, 'Rua António Augusto Gonçalves', '3045-214', 'Coimbra', 'Coimbra', '+351 239 802 380', 'https://www.quintadaslagrimas.pt', true, true, true, true, false, true, true);

-- Eventos de exemplo
INSERT INTO juntos.events (titulo, descricao, poi_id, data_inicio, data_fim, preco, capacidade, ativo) VALUES
('Festival de Verão no Parque Eduardo VII', 'Festival com atividades infantis, música e animação.', 1, '2024-07-15 10:00:00+01', '2024-07-15 18:00:00+01', 0, 500, true),
('Noite Europeia dos Museus', 'Portas abertas com visitas guiadas especiais para famílias.', 2, '2024-05-18 18:00:00+01', '2024-05-18 23:00:00+01', 0, 200, true),
('Páscoa no Zoo', 'Atividades especiais de Páscoa com caça aos ovos e animação.', 3, '2024-04-20 10:00:00+01', '2024-04-20 17:00:00+01', 5, 300, true);

-- Reviews de exemplo
INSERT INTO juntos.reviews (poi_id, user_id, rating, comentario, visita_data, ativo) VALUES
(1, 2, 5, 'Parque incrível! As crianças adoraram os equipamentos e o lago.', '2024-03-15', true),
(2, 2, 4, 'Muito educativo e divertido. Os tubarões são impressionantes!', '2024-02-20', true),
(3, 2, 5, 'Dia perfeito em família. Os animais estão bem tratados.', '2024-01-10', true);

-- Favoritos de exemplo
INSERT INTO juntos.favorites (user_id, poi_id) VALUES
(2, 1),
(2, 3),
(2, 5);

-- Subscrições de exemplo
INSERT INTO juntos.subscriptions (email, categorias, distritos, idade_min, idade_max, verificado, ativo) VALUES
('familia.silva@email.pt', ARRAY['Parque', 'Museu'], ARRAY['Lisboa', 'Porto'], 2, 8, true, true),
('pai.martins@email.pt', ARRAY['Zoológico', 'Aquário'], ARRAY['Lisboa'], 0, 12, true, true);

-- ===========================================
-- FIM DOS DADOS DE DESENVOLVIMENTO
-- ===========================================
