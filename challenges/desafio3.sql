SELECT u.user_name AS pessoa_usuaria,
       COUNT(h.song_id) AS musicas_ouvidas,
       ROUND(SUM(s.song_duration) / 60, 2) AS total_minutos
FROM SpotifyClone.users u
INNER JOIN SpotifyClone.histories h ON u.user_id = h.user_id
INNER JOIN SpotifyClone.songs s ON h.song_id = s.song_id
GROUP BY u.user_name
ORDER BY u.user_name ASC;