SELECT
	s.songs_name AS cancao,
    COUNT(uh.songs_id) AS reproducoes
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.user_history AS uh
ON s.songs_id = uh.songs_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;