
-- +JUNTOS
-- Ficheiro: backend/service-core/src/main/resources/db/migration/V4__add_deleted_to_poi.sql
-- Descrição: Adiciona a coluna 'deleted' à tabela de POIs
-- Autor: (+JUNTOS team)
-- Locale: pt_PT

ALTER TABLE pois ADD COLUMN deleted BOOLEAN NOT NULL DEFAULT FALSE;
