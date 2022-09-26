SELECT
    COUNT(*) AS quantidade_musicas_no_historico
FROM
	SpotifyClone.user AS us,
    SpotifyClone.user_history AS uh
WHERE
	uh.user_id = 1 AND us.user_id = uh.user_id;