CREATE ROLE "user" LOGIN PASSWORD 'password';

-- Creating the table for publishers
CREATE TABLE IF NOT EXISTS publishers (
	id SERIAL PRIMARY KEY,
	name varchar(50) NOT NULL
); 

-- Creating the enum (essentially a datatype) for roles 
CREATE TYPE user_role AS ENUM (
	'ADMIN',
	'USER'
);

-- Creating the table for users
CREATE TABLE IF NOT EXISTS users (
	id SERIAL PRIMARY KEY,
	username varchar(50) UNIQUE NOT NULL,
	password CHAR(40) NOT NULL,
 	role user_role NOT NULL DEFAULT 'USER',
	email varchar(50) UNIQUE, 
	name varchar(50),
	mobile varchar(50)
);

-- Creating the table for games
CREATE TABLE IF NOT EXISTS games (
    id SERIAL PRIMARY KEY,
	name varchar(50) NOT NULL,
	price NUMERIC(10, 2) NOT NULL,
	rating varchar(8),
	publisher INTEGER REFERENCES publishers(id)
);

-- Creating the table for game game_ownership
CREATE TABLE IF NOT EXISTS game_ownership (
	game_id INTEGER REFERENCES games(id),
	user_id INTEGER REFERENCES users(id),
	date_purchased date NOT NULL,
	PRIMARY KEY (game_id, user_id)
);

-- Allowing access to the server to view/edit all the tables
GRANT ALL PRIVILEGES ON TABLE publishers TO "user";
GRANT ALL PRIVILEGES ON TABLE users TO "user";
GRANT ALL PRIVILEGES ON TABLE games TO "user";
GRANT ALL PRIVILEGES ON TABLE game_ownership TO "user";

-- Publishers
INSERT INTO publishers (name) VALUES
('Nintendo'),
('Electronic Arts'),
('Ubisoft'),
('Rockstar Games'),
('Bethesda'),
('CD Projekt Red'),
('Valve'),
('SEGA');

-- Users
INSERT INTO users (username, password, role, email, name, mobile) VALUES
('admin', 'a1b2c3d4e5f6789012345678901234567890abcd', 'ADMIN', null, null, null),
('alice', 'b1c2d3e4f5a6789012345678901234567890abcd', 'USER', 'alice@example.com', 'Alice Smith', '07234567890'),
('bob', 'c1d2e3f4a5b6789012345678901234567890abcd', 'USER', 'bob@example.com', 'Bob Jones', '07345678901'),
('charlie', 'd1e2f3a4b5c6789012345678901234567890abcd', 'USER', 'charlie@example.com', 'Charlie Brown', null),
('david', 'e1f2a3b4c5d6789012345678901234567890abcd', 'USER', 'david@example.com', 'David Wilson', '07567890123'),
('emma', 'f1a2b3c4d5e6789012345678901234567890abcd', 'USER',  null,'Emma Taylor', '07678901234'),
('frank', 'a2b3c4d5e6f789012345678901234567890abcd', 'USER', null, 'Frank Thomas', null),
('grace', 'b2c3d4e5f6a789012345678901234567890abcd', 'USER', 'grace@example.com', 'Grace Martin', '07890123456'),
('henry', 'c2d3e4f5a6b789012345678901234567890abcd', 'USER', null, null, '07901234567'),
('isabel', 'd2e3f4a5b6c789012345678901234567890abcd', 'USER', 'isabel@example.com', 'Isabel Clark', '07012345678');

-- Games
INSERT INTO games (name, price, rating, publisher) VALUES
('The Legend of Zelda: Breath of the Wild', 49.99, 'PEGI 12', 1),
('Super Mario Odyssey', 39.99, 'PEGI 7', 1),
('Mario Kart 8 Deluxe', 44.99, 'PEGI 3', 1),
('FIFA 25', 59.99, 'PEGI 3', 2),
('The Sims 4', 0.00, 'PEGI 12', 2),
('Assassins Creed Valhalla', 29.99, 'PEGI 18', 3),
('Far Cry 6', 34.99, 'PEGI 18', 3),
('Grand Theft Auto V', 24.99, 'PEGI 18', 4),
('Red Dead Redemption 2', 39.99, 'PEGI 18', 4),
('The Elder Scrolls V: Skyrim', 19.99, 'PEGI 18', 5),
('Fallout 4', 14.99, 'PEGI 18', 5),
('The Witcher 3: Wild Hunt', 29.99, 'PEGI 18', 6),
('Cyberpunk 2077', 49.99, 'PEGI 18', 6),
('Counter-Strike 2', 0.00, 'PEGI 18', 7),
('Sonic Frontiers', 34.99, 'PEGI 7', 8);

INSERT INTO game_ownership (game_id, user_id, date_purchased) VALUES
-- Alice
(1, 2, '2026-01-25'),
(4, 2, '2026-03-21'),
(5, 2, '2026-05-10'),
(14, 2, '2026-08-04'),

-- Bob
(3, 3, '2026-01-03'),
(6, 3, '2026-02-17'),
(7, 3, '2026-05-29'),
(10, 3, '2026-09-12'),

-- Charlie
(8, 4, '2026-01-19'),
(9, 4, '2026-03-25'),
(11, 4, '2026-06-14'),
(13, 4, '2026-10-08'),

-- David
(2, 5, '2026-02-09'),
(3, 5, '2026-04-11'),
(10, 5, '2026-07-16'),
(12, 5, '2026-10-20'),

-- Emma
(4, 6, '2026-01-01'),
(5, 6, '2026-03-23'),
(14, 6, '2026-07-09'),
(15, 6, '2026-10-15'),

-- Frank
(6, 7, '2026-01-08'),
(7, 7, '2026-04-19'),
(8, 7, '2026-06-02'),
(9, 7, '2026-09-27'),

-- Grace
(1, 8, '2026-02-14'),
(11, 8, '2026-04-26'),
(12, 8, '2026-07-13'),
(13, 8, '2026-10-05'),

-- Henry
(2, 9, '2026-01-22'),
(5, 9, '2026-03-16'),
(10, 9, '2026-06-07'),
(15, 9, '2026-09-18'),

-- Isabel
(3, 10, '2026-02-09'),
(4, 10, '2026-04-28'),
(9, 10, '2026-08-20'),
(13, 10, '2026-11-09'),

-- Alice
(2, 2, '2026-04-12'),
(9, 2, '2026-09-22'),

-- Bob
(1, 3, '2026-03-08'),
(13, 3, '2026-08-16'),

-- Charlie
(2, 4, '2026-02-11'),
(14, 4, '2026-07-25'),

-- David
(1, 5, '2026-03-19'),
(8, 5, '2026-08-28'),

-- Emma
(1, 6, '2026-02-14'),
(12, 6, '2026-08-07'),

-- Frank
(2, 7, '2026-03-21'),
(13, 7, '2026-08-12'),

-- Grace
(3, 8, '2026-03-17'),
(15, 8, '2026-09-02'),

-- Henry
(1, 9, '2026-02-26'),
(8, 9, '2026-07-19'),

-- Isabel
(2, 10, '2026-03-13'),
(11, 10, '2026-09-25');
