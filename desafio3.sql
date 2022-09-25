SELECT
u.user_name AS usuario,
COUNT(uh.user_id) AS qt_de_musicas_ouvidas,
ROUND(SUM(s.duration_seconds) / 60, 2) AS total_minutos
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.user_history AS uh
ON uh.user_id = u.user_id
INNER JOIN SpotifyClone.songs AS s
ON uh.songs_id = s.songs_id
GROUP BY usuario
ORDER BY usuario ASC;