-- Tabla principal de quejas
CREATE TABLE IF NOT EXISTS complaints (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre      TEXT NOT NULL,
  email       TEXT,
  categoria   TEXT NOT NULL DEFAULT 'general',
  prioridad   TEXT NOT NULL DEFAULT 'media' CHECK (prioridad IN ('baja','media','alta')),
  mensaje     TEXT NOT NULL,
  estado      TEXT NOT NULL DEFAULT 'nueva' CHECK (estado IN ('nueva','en_revision','resuelta')),
  creada_en   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_complaints_prioridad ON complaints(prioridad);
CREATE INDEX IF NOT EXISTS idx_complaints_creada_en ON complaints(creada_en DESC);
