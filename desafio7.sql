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