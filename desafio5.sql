SELECT
  s.song AS cancao,
  COUNT(p.song_id) AS reproducoes
FROM SpotifyClone.songs_table AS s
INNER JOIN SpotifyClone.playback_history_table AS p
  ON s.id = p.song_id
GROUP BY s.song
ORDER BY 
	reproducoes DESC,
  s.song
LIMIT 2