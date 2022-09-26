SELECT
	ar.artist_name AS artista,
    al.album_name AS album,
    COUNT(fa.artist_id) AS seguidores
FROM
	SpotifyClone.artist AS ar,
	SpotifyClone.album AS al,
	SpotifyClone.followers_artist AS fa
WHERE ar.artist_id = al.artist_id AND ar.artist_id = fa.artist_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista ASC, album ASC;