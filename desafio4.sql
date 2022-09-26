SELECT
	u.user_name AS usuario,
    IF (MAX(YEAR(uh.play_date)) >= 2021, 'Usuário ativo', 'Usuário inativo' ) AS status_usuario
FROM SpotifyClone.user AS u, SpotifyClone.user_history AS uh
WHERE u.user_id = uh.user_id
GROUP BY usuario
ORDER BY usuario;