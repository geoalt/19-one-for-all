SELECT
  s.song AS nome_musica,
  CASE 
    WHEN s.song LIKE '%Bard%' THEN REPLACE(s.song, 'Bard', 'QA')
    WHEN s.song LIKE '%Amar%' THEN REPLACE(s.song, 'Amar', 'Code Review')
    WHEN s.song LIKE '%Pais%' THEN REPLACE(s.song, 'Pais', 'Pull Requests')
    WHEN s.song LIKE '%SOUL%' THEN REPLACE(s.song, 'SOUL', 'CODE')
    WHEN s.song LIKE '%SUPERSTAR%' THEN REPLACE(s.song, 'SUPERSTAR', 'SUPERDEV')
  END AS novo_nome
FROM SpotifyClone.songs_table AS s
HAVING novo_nome IS NOT NULL
ORDER BY novo_nome DESC