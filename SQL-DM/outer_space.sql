-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets(
  id SERIAL PRIMARY KEY,
  planet_name TEXT,
  galaxy TEXT,
  orbital_period_in_years FLOAT,
  orbits_around TEXT
);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  moon_name TEXT,
  planet_id INTEGER REFERENCES planets(id)
);
