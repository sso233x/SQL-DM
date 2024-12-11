-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE producers(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  album_name TEXT,
  release_date DATE
);

CREATE TABLE songs(
  id SERIAL PRIMARY KEY,
  title TEXT,
  duration_in_seconds INTEGER,
  release_date DATE,
  album_id INTEGER REFERENCES albums(id)
);

CREATE TABLE song_artists(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs(id),
  artist_id INTEGER REFERENCES artists(id)
);

CREATE TABLE song_producers(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs(id),
  producer_id INTEGER REFERENCES producers(id)
);
