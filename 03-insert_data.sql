-- Insertar datos de ejemplo en la tabla teams
INSERT INTO teams (team, players_used, avg_age, possession, games, goals, assists, cards_yellow, cards_red) VALUES
('Argentina', 20, 28.5, 55.2, 7, 15, 12, 8, 1),
('Brasil', 22, 26.8, 58.3, 7, 18, 15, 6, 2),
('España', 21, 29.1, 62.1, 6, 12, 18, 4, 0),
('Francia', 19, 27.3, 51.8, 6, 14, 11, 9, 1),
('Inglaterra', 23, 26.9, 49.7, 5, 11, 9, 7, 0),
('Alemania', 20, 28.7, 56.4, 5, 10, 13, 5, 1),
('Italia', 18, 30.2, 53.6, 4, 8, 7, 6, 2),
('Portugal', 21, 29.8, 50.9, 4, 9, 8, 8, 0);

-- Insertar datos de ejemplo en la tabla matches
INSERT INTO matches (team1, team2, goals_team1, goals_team2, stage) VALUES
('Argentina', 'Brasil', 2, 1, 'Final'),
('España', 'Francia', 1, 2, 'Semifinal'),
('Argentina', 'España', 3, 0, 'Semifinal'),
('Brasil', 'Francia', 1, 0, 'Semifinal'),
('Inglaterra', 'Alemania', 2, 0, 'Cuartos'),
('Italia', 'Portugal', 1, 1, 'Cuartos'),
('Argentina', 'Inglaterra', 2, 1, 'Cuartos'),
('Brasil', 'Italia', 3, 1, 'Cuartos'),
('España', 'Alemania', 1, 0, 'Octavos'),
('Francia', 'Portugal', 2, 1, 'Octavos');
