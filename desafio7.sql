SELECT
  a.artist AS artista,
  alb.album AS album,
  COUNT(uaf.artist_id) AS seguidores
FROM SpotifyClone.artists_table AS a
INNER JOIN SpotifyClone.albums_table AS alb
  ON a.id = alb.artist_id
INNER JOIN SpotifyClone.user_artist_follows_table AS uaf
  ON a.id = uaf.artist_id
GROUP BY alb.id
ORDER BY seguidores DESC, artista, album