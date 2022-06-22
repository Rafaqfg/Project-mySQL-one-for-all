USE SpotifyClone;

SELECT
(SELECT COUNT(name) FROM song) AS cancoes,
(SELECT COUNT(name) FROM artist) AS artistas,
(SELECT COUNT(name) FROM album) AS albuns;

SELECT
	usr.name AS 'usuario',
    COUNT(hstry.song_id) AS 'qtde_musicas_ouvidas',
	ROUND(SUM(sng.length) / 60, 2) AS 'total_minutos'
FROM
  user AS usr
    INNER JOIN
  history AS hstry ON usr.id = hstry.user_id
    INNER JOIN
  song AS sng ON sng.id = hstry.song_id
GROUP BY usr.id
ORDER BY usr.name;

SELECT
  usr.name AS 'usuario',
    IF(MAX(hstry.date_rep) > '2021-01-01',
      'Usuário ativo',
      'Usuário inativo'
    ) AS 'condicao_usuario'
FROM
  user AS usr
    INNER JOIN
  history AS hstry ON usr.id = hstry.user_id
  GROUP BY hstry.user_id
ORDER BY usr.name;

SELECT
  sng.name AS 'cancao',
  COUNT(hstry.song_id) AS 'reproducoes'
FROM
  song as sng
INNER JOIN
  history AS hstry ON hstry.song_id = sng.id
GROUP BY sng.name
ORDER BY
  COUNT('reproducoes') DESC,
  sng.name ASC
LIMIT 2;

SELECT
  ROUND(MIN(price), 2) AS 'faturamento_minimo',
  ROUND(MAX(price), 2) AS 'faturamento_maximo',
  ROUND(AVG(price), 2) AS 'faturamento_medio',
  ROUND(SUM(price), 2) AS 'faturamento_total'
FROM plan
INNER JOIN
  user ON plan.id = user.plan_id;

SELECT
  artst.name AS 'artista',
  albm.name AS 'album',
  COUNT(usr_fllw.user_id) AS 'seguidores'
FROM
  artist AS artst
INNER JOIN
  album AS albm
INNER JOIN
  user_follow AS usr_fllw
ON
  artst.id = albm.artist_id
AND
  albm.artist_id = usr_fllw.artist_id
GROUP BY artst.name, albm.name
ORDER BY
  COUNT('seguidores') DESC, artst.name, albm.name;
  
SELECT
  artst.name AS 'artista',
  albm.name AS 'album'
FROM artist AS artst
INNER JOIN
  album AS albm ON artst.id = albm.artist_id
WHERE
  artst.name = 'Walter Phoenix';
  
SELECT
  COUNT(*) AS 'quantidade_musicas_no_historico'
FROM
  history
WHERE user_id = 3;

SELECT
  sng.name AS 'nome_musica',
CASE
  WHEN sng.name LIKE '%Streets' THEN REPLACE (sng.name, 'Streets', 'Code Review')
  WHEN sng.name LIKE '%Her Own' THEN REPLACE (sng.name, 'Her Own', 'Trybe')
  WHEN sng.name LIKE '%Inner Fire' THEN REPLACE (sng.name, 'Inner Fire', 'Project')
  WHEN sng.name LIKE '%Silly' THEN REPLACE (sng.name, 'Silly', 'Nice')
  WHEN sng.name LIKE '%Circus' THEN REPLACE (sng.name, "Circus", 'Pull Request')
  ELSE NULL
END AS novo_nome
FROM
  song AS sng
GROUP BY nome_musica
HAVING novo_nome IS NOT NULL;