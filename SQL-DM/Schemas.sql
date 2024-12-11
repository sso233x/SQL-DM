--Part 1:

--1.
CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    disease_name TEXT
);

CREATE TABLE visits(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors(id),
    patient_id INTEGER REFERENCES patients(id),
    visit_date DATE
);

CREATE TABLE patient_diag(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits(id),
    disease_id INTEGER REFERENCES diseases(id)
);

--2.
CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    region_name TEXT,
    region_state TEXT
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username TEXT,
    region_id INTEGER REFERENCES regions(id)
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT,
    content TEXT,
    user_id INTEGER REFERENCES users(id),
    region_id INTEGER REFERENCES regions(id),
    location TEXT
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    category_name TEXT
);

CREATE TABLE post_categories(
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts(id),
    category_id INTEGER REFERENCES categories(id)
);

--3.
CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    team_name TEXT,
    team_region TEXT,
    points INTEGER DEFAULT 0
);

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    goals INTEGER,
    player_id INTEGER REFERENCES players(id),
    game_id INTEGER REFERENCES games(id)
);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    team_id INTEGER REFERENCES teams(id)
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE games(
    id SERIAL PRIMARY KEY,
    team1 INTEGER REFERENCES teams(id),
    team2 INTEGER REFERENCES teams(id),
    winner_id INTEGER REFERENCES teams(id),
    game_date DATE
);

CREATE TABLE game_referees(
    id SERIAL PRIMARY KEY, 
    game_id INTEGER REFERENCES games(id),  
    referee_id INTEGER REFERENCES referees(id) 
);

CREATE TABLE seasons(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);