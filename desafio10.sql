SELECT
	  so.songs_name AS nome,
    COUNT(uh.user_id) AS reproducoes
FROM
	  SpotifyClone.songs AS so,
    SpotifyClone.user_history AS uh
WHERE
	  uh.user_id IN (1, 2, 8, 9, 10) AND so.songs_id = uh.songs_id
GROUP BY nome
ORDER BY nome ASC;
