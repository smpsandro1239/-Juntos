CREATE TABLE poi (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT NOT NULL, -- parque, museu, praia, trilho...
  lat DOUBLE PRECISION NOT NULL,
  lon DOUBLE PRECISION NOT NULL,
  geom GEOMETRY(POINT, 4326),
  address TEXT,
  postcode TEXT,
  price_indoor INT, -- Em cêntimos
  price_outdoor INT, -- Em cêntimos
  age_min INT,
  age_max INT,
  open_hours JSONB,
  closed_days INT[],
  verified BOOLEAN DEFAULT FALSE,
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  -- Campos para suporte multilingue
  description_pt TEXT,
  description_en TEXT,
  description_es TEXT,
  description_fr TEXT
);

CREATE INDEX idx_poi_geom ON poi USING GIST (geom);
CREATE INDEX idx_poi_fts_pt ON poi USING GIN (to_tsvector('portuguese', name || ' ' || COALESCE(description_pt,'')));
CREATE INDEX idx_poi_fts_en ON poi USING GIN (to_tsvector('english', name || ' ' || COALESCE(description_en,'')));

-- Adicionar mais tabelas como users, events, suppliers, reviews, etc. posteriormente.
