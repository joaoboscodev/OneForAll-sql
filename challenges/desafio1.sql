DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans(
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(100) NOT NULL,
    plan_price DOUBLE NOT NULL,
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    user_age INT NOT NULL,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans(plan_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists(
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(100) NOT NULL,
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(100) NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  song_name VARCHAR(100) NOT NULL,
  song_duration INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.histories(
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  PRIMARY KEY (user_id, song_id)
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id)
  FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs(song_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.followers(
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY (user_id, artist_id)
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id)
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;


INSERT INTO SpotifyClone.plans (plan_name, plan_price) VALUES
  ('gratuito', '0'),
	('universitário', '5.99'),
	('pessoal', '6.99'),
	('familiar', '7.99');

INSERT INTO SpotifyClone.users (user_name, user_age, plan_id) VALUES
  ('Barbara Liskov', '82', '1'),
	('Robert Cecil Martin', '58', '1'),
	('Ada Lovelace', '37', '4'),
	('Martin Fowler', '46', '4'),
	('Sandi Metz', '58', '4'),
	('Paulo Freire', '19', '2'),
	('Bell Hooks', '26', '2'),
	('Christopher Alexander', '85', '3'),
	('Judith Butler', '45', '3'),
	('Jorge Amado', '58', '3');

INSERT INTO SpotifyClone.artists (artist_name) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

INSERT INTO SpotifyClone.albums (album_name, artist_id) VALUES
('Renaissance', '1'),
('Jazz', '2'),
('Hot Space', '2'),
('Falso Brilhante', '3'),
('Vento de Maio', '3'),
('QVVJFA?', '4'),
('Somewhere Far Beyond', '5'),
('I Put A Spell On You', '6',);

INSERT INTO SpotifyClone.songs (song_name, song_duration, album_id) VALUES
	('BREAK MY SOUL', '279', '1'),
	("VIRGO'S GROOVE", '369', '1'),
	('ALIEN SUPERSTAR', '116', '1'),
	("Don't Stop Me Now", '203', '2'),
	('Under Pressure', '152', '3'),
	('Como Nossos Pais', '105', '4'),
	('O Medo de Amar é o Medo de Ser Livre', '207', '5'),
	('Samba em Paris', '267', '6'),
	("The Bard's Song", '244', '7'),
	('Feeling Good', '100', '8');

INSERT INTO SpotifyClone.histories (user_id, song_id) VALUES
  ('1', '8'),
	('1', '2'),
	('1', '10'),
	('2', '10'),
	('2', '7'),
	('3', '10'),
	('3', '2'),
	('4', '8'),
	('5', '8'),
	('5', '5'),
	('6', '7'),
	('6', '1'),
	('7', '4'),
	('8', '4'),
	('9', '9'),
	('10', '3');

INSERT INTO SpotifyClone.followers (user_id, artist_id) VALUES
	(1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);