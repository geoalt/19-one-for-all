SELECT
  s.song AS nome,
  COUNT(p.song_id) AS reproducoes
FROM SpotifyClone.songs_table AS s
INNER JOIN SpotifyClone.playback_history_table AS p
  ON s.id = p.song_id
INNER JOIN SpotifyClone.users_table AS u
  ON p.user_id = u.id
INNER JOIN SpotifyClone.plans_table AS pl
  ON u.plan_id = pl.id
WHERE pl.plan = 'gratuito'
  OR pl.plan = 'pessoal'
GROUP BY nome
ORDER BY nome