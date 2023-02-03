SELECT
  COUNT(p.user_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.playback_history_table AS p
INNER JOIN SpotifyClone.users_table AS u
  ON p.user_id = u.id
WHERE u.user = 'Barbara Liskov'