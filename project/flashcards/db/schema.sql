DROP TABLE IF EXISTS cards;
DROP TABLE IF EXISTS decks;

CREATE TABLE decks(
  id serial PRIMARY KEY,
  category TEXT
);

CREATE TABLE cards(
id serial PRIMARY KEY,
question TEXT,
answer TEXT,
times_correct  INTEGER,
times_wrong INTEGER,
deck_id INTEGER References decks(id) NOT NULL
);
