CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE artist(
	id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE plan(
	id INT PRIMARY KEY AUTO_INCREMENT,
  category VARCHAR(20) NOT NULL,
  price DOUBLE NOT NULL
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
  id INT PRIMARY KEY AUTO_INCREMENT,
  date_rep DATETIME NOT NULL,
  user_id INT NOT NULL,
  song_id INT NOT NULL,
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
  VALUES ('gratuito', 0),
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