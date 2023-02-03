SELECT
  u.user AS usuario,
  COUNT(p.user_id) AS qt_de_musicas_ouvidas,
  ROUND(SUM(s.length_seg) / 60, 2) AS total_minutos
FROM SpotifyClone.users_table AS u
INNER JOIN SpotifyClone.playback_history_table AS p
  ON u.id = p.user_id
INNER JOIN SpotifyClone.songs_table AS s
  ON p.song_id = s.id
GROUP BY u.user
ORDER BY u.user;