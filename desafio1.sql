CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE artist(
	id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE plan(
	id INT PRIMARY KEY AUTO_INCREMENT,
  category VARCHAR(20) NOT NULL,
  price DECIMAL(4, 2) NOT NULL
);

CREATE TABLE user(
	id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  age INT NOT NULL,
  sign_date date NOT NULL,
  plan_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (plan_id) REFERENCES plan(id)
);

CREATE TABLE user_follow(
	id INT AUTO_INCREMENT,
  user_id INT,
  artist_id INT,
  PRIMARY KEY (id, user_id, artist_id),
  CONSTRAINT FOREIGN KEY (user_id) REFERENCES user(id),
  CONSTRAINT FOREIGN KEY (artist_id) REFERENCES artist(id)
);

CREATE TABLE album(
	id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  release_year YEAR NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (artist_id) REFERENCES artist(id)
);

CREATE TABLE song(
	id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  length INT NOT NULL,
  album_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (album_id) REFERENCES album(id)
);

CREATE TABLE history(
  id INT AUTO_INCREMENT,
  date_rep DATETIME NOT NULL,
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  PRIMARY KEY (id, user_id, song_id),
  CONSTRAINT FOREIGN KEY (user_id) REFERENCES user(id),
  CONSTRAINT FOREIGN KEY (song_id) REFERENCES song(id)
);

INSERT INTO artist(name)
  VALUES ('Walter Phoenix'),
         ('Peter Strong'),
         ('Lance Day'),
         ('Freedie Shannon'),
         ('Tyler Isle'),
         ('Fog');

INSERT INTO plan(category, price)
  VALUES ('gratuito', 0.00),
         ('familiar', 7.99),
         ('universitário', 5.99),
         ('pessoal', 6.99);

INSERT INTO user(name, age, sign_date, plan_id)
  VALUES ('Thati',23, '2019-10-20' ,1),
         ('Cintia',35, '2017-12-30', 2),
         ('Bill',20, '2019-06-05', 3),
         ('Roger',45, '2020-05-13', 4),
         ('Norman',58, '2017-02-17', 4),
         ('Patrick',33, '2017-01-06', 2),
         ('Vivian',26, '2018-01-05', 3),
         ('Carol',19, '2018-02-14', 3),
         ('Angelina',42, '2018-04-29', 2),
         ('Paul',46, '2017-01-17', 2);

INSERT INTO user_follow(user_id, artist_id)
  VALUES (1, 1),
         (1, 4),
         (1, 3),
         (2, 1),
         (2, 3),
         (3, 2),
         (3, 1),
         (4, 4),
         (5, 5),
         (5, 6),
         (6, 6),
         (6, 3),
         (6, 1),
         (7, 2),
         (7, 5),
         (8, 1),
         (8, 5),
         (9, 6),
         (9, 4),
         (9, 3),
         (10, 2),
         (10, 6);

INSERT INTO album(name, release_year, artist_id)
  VALUES ('Envious', '1990', 1),
         ('Exuberant', '1993', 1),
         ('Hallowed Steam', '1995', 2),
         ('Incandescent', '1998', 3),
         ('Temporary Culture', '2001', 4),
         ('Library of liberty', '2003', 4),
         ('Chained Down', '2007', 5),
         ('Cabinet of fools', '2012', 5),
         ('No guarantees', '2015', 5),
         ('Apparatus', '2015', 6);

INSERT INTO song(name, length, album_id)
  VALUES  ('Soul For Us', 200, 1),
          ('Reflections Of Magic', 163, 1),
          ('Dance With Her Own', 116, 1),
          ('Troubles Of My Inner Fire', 203, 2),
          ('Time Fireworks', 152, 2),
          ('Magic Circus', 105, 3),
          ('Honey, So Do I', 207, 3),
          ('Sweetie, Lets Go Wild', 139, 3),
          ('She Knows', 244, 3),
          ('Fantasy For Me', 100, 4),
          ('Celebration Of More', 146, 4),
          ('Rock His Everthing', 223, 4),
          ('Home Forever', 231, 4),
          ('Diamond Power', 241, 4),
          ('Let''s Be Silly', 132, 4),
          ('Thang of Thunder', 240, 5),
          ('Words Of Her Life', 185, 5),
          ('Without My Streets', 176, 5),
          ('Need Of the Evening', 190, 6),
          ('History of My Roses', 222, 6),
          ('Without My Love', 111, 6),
          ('Walking And Game', 123, 6),
          ('Young And Father', 197, 6),
          ('Finding My Traditions', 179, 7),
          ('Walking And Man', 229, 7),
          ('Hard And Time', 135, 7),
          ('Honey, Im A Lone Wolf', 150, 7),
          ('She Thinks I Wont Stay Tonight', 166, 8),
          ('He Heard Youre Bad For Me', 154, 8),
          ('He Hopes We Cant Stay', 210, 8),
          ('I Know I Know', 117, 8),
          ('Hes Walking Away', 159, 9),
          ('Hes Trouble', 138, 9),
          ('I Heard I Want To Be Alone', 120, 9),
          ('I Ride Alone', 151, 9),
          ('Honey', 79, 10),
          ('You Cheated On Me', 95, 10),
          ('Wouldnt It Be Nice', 213, 10),
          ('Baby', 136, 10),
          ('You Make Me Feel So..', 83, 10);

INSERT INTO history(date_rep, user_id, song_id)
  VALUES  ("2020-02-28 10:45:55", 1 , 36),
          ("2020-05-02 05:30:35", 1 , 25),
          ("2020-03-06 11:22:33", 1 , 23),
          ("2020-08-05 08:05:17", 1 , 14),
          ("2020-09-14 16:32:22" ,1 , 15),
          ("2020-01-02 07:40:33", 2 , 34),
          ("2020-05-16 06:16:22", 2 , 24),
          ("2020-10-09 12:27:48", 2 , 21),
          ("2020-09-21 13:14:46", 2 , 39),
          ("2020-11-13 16:55:13", 3 , 6),
          ("2020-12-05 18:38:30", 3 , 3),
          ("2020-07-30 10:00:00", 3 , 26),
          ("2021-08-15 17:10:10", 4 , 2),
          ("2021-07-10 15:20:30", 4 , 35),
          ("2021-01-09 01:44:33", 4 , 27),
          ("2020-07-03 19:33:28", 5 , 7),
          ("2017-02-24 21:14:22", 5 , 12),
          ("2020-08-06 15:23:43", 5 , 14),
          ("2020-11-10 13:52:27", 5 , 1),
          ("2019-02-07 20:33:48", 6 , 38),
          ("2017-01-24 00:31:17", 6 , 29),
          ("2017-10-12 12:35:20", 6 , 30),
          ("2018-05-29 14:56:41", 6 , 22),
          ("2018-05-09 22:30:49", 7 , 5),
          ("2020-07-27 12:52:58", 7 , 4),
          ("2018-01-16 18:40:43", 7 , 11),
          ("2018-03-21 16:56:40", 8 , 39),
          ("2020-10-18 13:38:05", 8 , 40),
          ("2019-05-25 08:14:03", 8 , 32),
          ("2021-08-15 21:37:09", 8 , 33),
          ("2021-05-24 17:23:45", 9 , 16),
          ("2018-12-07 22:48:52", 9 , 17),
          ("2021-03-14 06:14:26", 9 , 8),
          ("2020-04-01 03:36:00", 9 , 9),
          ("2017-02-06 08:21:34", 10 , 20),
          ("2017-12-04 05:33:43", 10 , 21),
          ("2017-12-04 05:33:43", 10 , 12),
          ("2017-12-25 01:03:57", 10 , 13);
