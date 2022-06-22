SELECT
  artst.name AS 'artista',
  albm.name AS 'album'
FROM artist AS artst
INNER JOIN
  album AS albm ON artst.id = albm.artist_id
WHERE
  artst.name = 'Walter Phoenix';