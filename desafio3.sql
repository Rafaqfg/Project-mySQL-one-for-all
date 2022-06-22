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