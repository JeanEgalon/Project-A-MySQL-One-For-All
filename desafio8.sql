SELECT
	ar.artist_name AS artista,
    al.album_name AS album
FROM SpotifyClone.artist AS ar, SpotifyClone.album AS al
WHERE ar.artist_name = 'Elis Regina' AND ar.artist_id = al.artist_id;