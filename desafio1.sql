DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

  CREATE TABLE SpotifyClone.plans_table(
    id INT PRIMARY KEY AUTO_INCREMENT,
    plan VARCHAR(45) NOT NULL,
    price DECIMAL(5,2) NOT NULL
  ) engine = InnoDB;


  CREATE TABLE SpotifyClone.artists_table(
    id INT PRIMARY KEY AUTO_INCREMENT,
    artist VARCHAR(45) NOT NULL
  ) engine = InnoDB;


  CREATE TABLE SpotifyClone.users_table(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user VARCHAR(90) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    signature_date DATE NOT NULL,

    FOREIGN KEY(plan_id) REFERENCES plans_table(id)
  ) engine = InnoDB;


  CREATE TABLE SpotifyClone.albums_table(
    id INT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(90) NOT NULL,
    artist_id INT NOT NULL,
    release_year YEAR,

    FOREIGN KEY(artist_id) REFERENCES artists_table(id)
  ) engine = InnoDB;


  CREATE TABLE SpotifyClone.songs_table(
    id INT PRIMARY KEY AUTO_INCREMENT,
    song VARCHAR(90) NOT NULL,
    album_id INT NOT NULL,
    length_seg INT NOT NULL,

    FOREIGN KEY(album_id) REFERENCES albums_table(id)
  ) engine = InnoDB;


  CREATE TABLE SpotifyClone.user_artist_follows_table(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    active TINYINT NOT NULL,

    CONSTRAINT PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY(user_id) REFERENCES users_table(id),
    FOREIGN KEY(artist_id) REFERENCES artists_table(id)
  ) engine = InnoDB;


  CREATE TABLE SpotifyClone.playback_history_table(
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    historic_date DATETIME NOT NULL,

    CONSTRAINT PRIMARY KEY(user_id, song_id),
    FOREIGN KEY(user_id) REFERENCES users_table(id),
    FOREIGN KEY(song_id) REFERENCES songs_table(id)
  ) engine = InnoDB;

  
INSERT INTO SpotifyClone.plans_table(plan,price) VALUES
  ('gratuito', 0.00),
  ('universitario', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

INSERT INTO SpotifyClone.artists_table(artist) VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Nina Simone'),
  ('Blind Guardian');

INSERT INTO SpotifyClone.users_table(user, age, plan_id, signature_date) VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 4, '2017-12-30'),
  ('Martin Fowler',46, 4, '2017-01-17'),
  ('Sandi Metz',58, 4, '2018-04-29'),
  ('Paulo Freire',19, 2, '2018-02-14'),
  ('Bell Hooks',26, 2, '2018-01-05'),
  ('Christopher Alexander',85, 3, '2019-06-05'),
  ('Judith Butler',45, 3, '2020-05-13'),
  ('Jorge Amado',58, 3, '2017-02-17');

INSERT INTO SpotifyClone.albums_table(album, artist_id, release_year) VALUES
  ('Renaissance', 1, 2022),
  ('Jazz', 2, 1978),
  ('Hot Space', 2, 1982),
  ('Falso Brilhante', 3, 1998),
  ('Vento de Maio', 3, 2001),
  ('QVVJFA?', 4, 2003),
  ('Somewhere Far Beyond', 6, 2007),
  ('I Put A Spell On You', 5, 2012);

INSERT INTO SpotifyClone.songs_table(song, length_seg, album_id) VALUES
  ('BREAK MY SOUL', 279, 1),
  ('VIRGOS GROOVE', 369, 1),
  ('ALIEN SUPERSTAR', 116, 1),
  ('Don’t Stop Me Now', 203, 2),
  ('Under Pressure', 152, 2),
  ('Como Nossos Pais', 105, 3),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 3),
  ('Samba em Paris', 267, 4),
  ('The Bard’s Song', 244, 5),
  ('Feeling Good', 100, 6);

INSERT INTO SpotifyClone.user_artist_follows_table(user_id, artist_id, active) VALUES
  (1, 1, 1),
  (1, 2, 1),
  (1, 3, 1),
  (2, 1, 1),
  (2, 3, 1),
  (3, 2, 1),
  (4, 4, 1),
  (5, 6, 1),
  (5, 5, 1),
  (6, 5, 1),
  (6, 1, 1),
  (7, 5, 1),
  (9, 3, 1),
  (10, 2, 1);

INSERT INTO SpotifyClone.playback_history_table(song_id, user_id, historic_date) VALUES
  (8, 1,'2022-02-28 10:45:55'),
  (2, 1,'2020-05-02 05:30:35'),
  (10, 1,'2020-03-06 11:22:33'),
  (10, 2,'2022-08-05 08:05:17'),
  (7, 2,'2020-01-02 07:40:33'),
  (10, 3,'2020-11-13 16:55:13'),
  (2, 3,'2020-12-05 18:38:30'),
  (8, 4,'2021-08-15 17:10:10'),
  (8, 5,'2022-01-09 01:44:33'),
  (5, 5,'2020-08-06 15:23:43'),
  (7, 6,'2017-01-24 00:31:17'),
  (1, 6,'2017-10-12 12:35:20'),
  (4, 7,'2011-12-15 22:30:49'),
  (4, 8,'2012-03-17 14:56:41'),
  (9, 9,'2022-02-24 21:14:22'),
  (3, 10,'2015-12-13 08:30:22');