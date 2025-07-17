-- Limpiar las tablas antes de cargar datos
DELETE FROM matches;
DELETE FROM teams;

-- Reiniciar el contador de la tabla matches
ALTER SEQUENCE matches_id_seq RESTART WITH 1;

-- Cargar datos desde teams.csv
-- Asegurarse de que el archivo esté en la ruta correcta
COPY teams (
    team,
    players_used,
    avg_age,
    possession,
    games,
    goals,
    assists,
    cards_yellow,
    cards_red
) FROM '/data/teams.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ';',
    QUOTE '"',
    ESCAPE '"'
);


-- Cargar datos desde matches.csv
COPY matches (
    team1,
    team2,
    goals_team1,
    goals_team2,
    stage
) FROM '/data/matches.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ';',
    QUOTE '"',
    ESCAPE '"'
);