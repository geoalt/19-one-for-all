SELECT
  MIN(p.price) AS faturamento_minimo,
  MAX(p.price) AS faturamento_maximo,
  FORMAT(AVG(p.price), 2) AS faturamento_medio,
  SUM(p.price) AS faturamento_total
FROM SpotifyClone.plans_table AS p
INNER JOIN SpotifyClone.users_table AS u
  ON p.id = u.plan_id
