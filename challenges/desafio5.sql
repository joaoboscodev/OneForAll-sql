SELECT
  s.song_name AS cancao,
  COUNT(h.song_id) AS reproducoes
FROM 
  SpotifyClone.songs s
INNER JOIN 
  SpotifyClone.histories h ON s.song_id = h.song_id
GROUP BY
  s.song_id
ORDER BY
  reproducoes DESC, cancao ASC
LIMIT 2;