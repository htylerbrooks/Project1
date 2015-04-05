DROP TABLE IF EXISTS cells;
DROP TABLE IF EXISTS ships;
DROP TABLE IF EXISTS oceans;


CREATE TABLE oceans(
  id                        SERIAL PRIMARY KEY NOT NULL,
  name                   TEXT NOT NULL
);

CREATE TABLE ships(
  id                        SERIAL PRIMARY KEY,
  name                   TEXT,
  sunk_status         BOOLEAN,
  ocean_id             INTEGER references oceans(id)
);

CREATE TABLE cells(
  id                        SERIAL PRIMARY KEY,
  x                         TEXT,
  y                         INTEGER,
  hit                      BOOLEAN,
  ship_id              INTEGER references ships(id),
  ocean_id           INTEGER references oceans(id)
);
