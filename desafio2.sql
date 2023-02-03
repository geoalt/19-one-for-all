SELECT
COUNT(DISTINCT s.id) AS cancoes,
COUNT(DISTINCT a.artist_id ) AS artistas,
COUNT(DISTINCT a.album) AS albuns
FROM SpotifyClone.albums_table AS a
INNER JOIN SpotifyClone.songs_table AS s