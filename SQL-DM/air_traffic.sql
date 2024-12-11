-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines(
  id SERIAL PRIMARY KEY,
  airline_name TEXT
);

CREATE TABLE locations(
  id SERIAL PRIMARY KEY,
  city TEXT,
  country TEXT
);

CREATE TABLE passengers(
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT
);

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers(id),
  seat TEXT,
  departure TIMESTAMP,
  arrival TIMESTAMP,
  airline_id INTEGER REFERENCES airlines(id),
  from_location_id INTEGER REFERENCES locations(id),
  to_location_id INTEGER REFERENCES locations(id)
);
