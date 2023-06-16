SELECT 
  a.artist_name AS artista, 
  al.album_name AS album, 
  COUNT(f.user_id) AS pessoas_seguidoras
FROM SpotifyClone.artists a
JOIN SpotifyClone.albums al ON a.artist_id = al.artist_id
LEFT JOIN SpotifyClone.followers f ON a.artist_id = f.artist_id
GROUP BY a.artist_id, al.album_id
ORDER BY COUNT(f.user_id) DESC, artista ASC, album ASC;