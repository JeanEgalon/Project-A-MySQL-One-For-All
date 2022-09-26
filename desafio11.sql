#Trocar a palavra "Bard" do nome da música por "QA"

#Trocar a palavra "Amar" do nome da música por "Code Review"

#Trocar a palavra "Pais" no final do nome da música por "Pull Requests"

#Trocar a palavra "SOUL" no final do nome da música por "CODE"

#Trocar a palavra "SUPERSTAR" no final do nome da música por "SUPERDEV"

SELECT
	so.songs_name AS nome_musica,
    CASE
		WHEN so.songs_id = 9 THEN REPLACE('The Bard’s Song', 'Bard', 'QA')
        WHEN so.songs_id = 7 THEN REPLACE('O Medo de Amar é o Medo de Ser Livre', 'Amar', 'Code Review')
        WHEN so.songs_id = 6 THEN REPLACE('Como Nossos Pais', 'Pais', 'Pull Requests')
        WHEN so.songs_id = 1 THEN REPLACE('BREAK MY SOUL', 'SOUL', 'CODE')
        WHEN so.songs_id = 3 THEN REPLACE('ALIEN SUPERSTAR', 'SUPERSTAR', 'SUPERDEV')
    END AS novo_nome
FROM
	SpotifyClone.songs AS so
WHERE
	so.songs_id IN (9, 7, 6, 1 ,3)
ORDER BY nome_musica DESC;

