SELECT
(SELECT COUNT(name) FROM song) AS cancoes,
(SELECT COUNT(name) FROM artist) AS artistas,
(SELECT COUNT(name) FROM album) AS albuns;