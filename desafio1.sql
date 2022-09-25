DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plan(
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  plan_name VARCHAR(200) NOT NULL,
  plan_value DECIMAL(5, 2) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.plan (plan_id, plan_name, plan_value)
VALUES
  (1, 'gratuito', 0.00),
  (2, 'familiar', 7.99),
  (3, 'universitário', 5.99),
  (4, 'pessoal', 6.99);

CREATE TABLE SpotifyClone.user(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    signature_date DATETIME,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plan(plan_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.user (user_id, user_name, age, signature_date, plan_id)
VALUES
  (1, 'Barbara Liskov', 82, '2019-10-20', 1),
  (2, 'Robert Cecil Martin', 58, '2017-01-06', 1),
  (3, 'Ada Lovelace', 37, '2017-12-30', 2),
  (4, 'Martin Fowler', 46, '2017-01-17', 2),
  (5, 'Sandi Metz', 58, '2018-04-29', 2),
  (6, 'Paulo Freire', 19, '2018-02-14', 3),
  (7, 'Bell Hooks', 26, '2018-01-05', 3),
  (8, 'Christopher Alexander', 85, '2019-06-05', 4),
  (9, 'Judith Butler', 45, '2020-05-13', 4),
  (10, 'Jorge Amado', 58, '2017-02-17', 4);

CREATE TABLE SpotifyClone.artist(
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(200) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.artist (artist_id, artist_name)
VALUES
  (1, 'Beyoncé'),
  (2, 'Queen'),
  (3, 'Elis Regina'),
  (4, 'Baco Exu do Blues'),
  (5, 'Blind Guardian'),
  (6, 'Nina Simone');

CREATE TABLE SpotifyClone.album(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(200) NOT NULL,
  year_release INT NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.album (album_id, album_name, year_release, artist_id)
VALUES
  (1, 'Renaissance', 2022, 1),
  (2, 'Jazz', 1978, 2),
  (3, 'Hot Space', 1982, 2),
  (4, 'Falso Brilhante', 1998, 3),
  (5, 'Vento de Maio', 2001, 3),
  (6, 'QVVJFA?', 2003, 4),
  (7, 'Somewhere Far Beyond', 2007, 5),
  (8, 'I Put A Spell On You', 2012, 6);

CREATE TABLE SpotifyClone.songs(
    songs_id INT PRIMARY KEY AUTO_INCREMENT,
    songs_name VARCHAR(200) NOT NULL,
    duration_seconds INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.songs (songs_id, songs_name, album_id, duration_seconds)
VALUES
  (1, 'BREAK MY SOUL', 1, 279),
  (2, 'VIRGO`S GROOVE', 1, 369),
  (3, 'ALIEN SUPERSTAR', 1, 116),
  (4, 'Don`t Stop Me Now', 2, 203),
  (5, 'Under Pressure', 3, 152),
  (6, 'Como Nossos Pais', 4, 105),
  (7, 'O Medo de Amar é o Medo de Ser Livre', 5, 207),
  (8, 'Samba em Paris', 6, 267),
  (9, 'The Bard`s Song', 7, 244),
  (10, 'Feeling Good', 8, 100);

CREATE TABLE SpotifyClone.user_history(
  play_date DATETIME,
  songs_id INT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (songs_id) REFERENCES SpotifyClone.songs(songs_id),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(user_id),
  CONSTRAINT PRIMARY KEY(songs_id, user_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.user_history (play_date, songs_id, user_id)
VALUES
  ('2022-02-28 10:45:55', 8, 1),
  ('2020-05-02 05:30:35', 2, 1),
  ('2020-03-06 11:22:33', 10, 1),
  ('2022-08-05 08:05:17', 10, 2),
  ('2020-01-02 07:40:33', 7, 2),
  ('2020-11-13 16:55:13', 10, 3),
  ('2020-12-05 18:38:30', 2, 3),
  ('2021-08-15 17:10:10', 8, 4),
  ('2022-01-09 01:44:33', 8, 5),
  ('2020-08-06 15:23:43', 5, 5),
  ('2017-01-24 00:31:17', 7, 6),
  ('2017-10-12 12:35:20', 1, 6),
  ('2011-12-15 22:30:49', 4, 7),
  ('2012-03-17 14:56:41', 4, 8),
  ('2022-02-24 21:14:22', 9, 9),
  ('2015-12-13 08:30:22', 3, 10);

CREATE TABLE SpotifyClone.songs_album(
  songs_id INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (songs_id) REFERENCES SpotifyClone.songs(songs_id),
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.songs_album (songs_id, album_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (5, 3),
  (6, 4),
  (7, 5),
  (8, 6),
  (9, 7),
  (10, 8);

CREATE TABLE SpotifyClone.music_artist(
  songs_id INT NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (songs_id) REFERENCES SpotifyClone.songs(songs_id),
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.music_artist (songs_id, artist_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (5, 2),
  (6, 3),
  (7, 3),
  (8, 4),
  (9, 5),
  (10, 6);

CREATE TABLE SpotifyClone.album_artist(
  album_id INT NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id),
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.album_artist (album_id, artist_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 2),
  (4, 3),
  (5, 3),
  (6, 4),
  (7, 5),
  (8, 6);

CREATE TABLE SpotifyClone.followers_artist(
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY(user_id, artist_id),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(user_id),
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)  
) engine = InnoDB;

INSERT INTO SpotifyClone.followers_artist (user_id, artist_id)
VALUES
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