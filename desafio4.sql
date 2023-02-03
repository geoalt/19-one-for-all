SELECT
  u.user AS usuario,
IF (MAX(YEAR(p.historic_date)) < 2021, 
  'Usuário inativo',
  'Usuário ativo') AS condicao_usuario
FROM SpotifyClone.users_table AS u
INNER JOIN SpotifyClone.playback_history_table AS p
  ON u.id = p.user_id
GROUP BY u.user
ORDER BY u.user