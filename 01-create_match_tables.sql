-- Crear tabla teams
CREATE TABLE teams (
    team VARCHAR(100) PRIMARY KEY,
    players_used INTEGER,
    avg_age DECIMAL(4,2),
    possession DECIMAL(5,2),
    games INTEGER,
    goals INTEGER,
    assists INTEGER,
    cards_yellow INTEGER,
    cards_red INTEGER
);

-- Crear tabla matches
CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team1 VARCHAR(100),
    team2 VARCHAR(100),
    goals_team1 INTEGER,
    goals_team2 INTEGER,
    stage VARCHAR(50),
    FOREIGN KEY (team1) REFERENCES teams(team),
    FOREIGN KEY (team2) REFERENCES teams(team)
);