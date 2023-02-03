SELECT
  a.artist AS artista,
  alb.album AS album
FROM SpotifyClone.artists_table AS a
INNER JOIN SpotifyClone.albums_table AS alb
  ON a.id = alb.artist_id
HAVING artista = 'Elis Regina'