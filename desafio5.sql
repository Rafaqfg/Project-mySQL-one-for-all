SELECT
  sng.name AS 'cancao',
  COUNT(hstry.song_id) AS 'reproducoes'
FROM
  song as sng
INNER JOIN
  history AS hstry ON hstry.song_id = sng.id
GROUP BY sng.name
ORDER BY
  COUNT(hstry.song_id) DESC,
  sng.name ASC
LIMIT 2;
