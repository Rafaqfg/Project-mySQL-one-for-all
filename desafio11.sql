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
