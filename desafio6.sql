SELECT
	ROUND(MIN(p.plan_value), 2) AS faturamento_minimo,
    ROUND(MAX(p.plan_value), 2) AS faturamento_maximo,
    ROUND(AVG(p.plan_value), 2) AS faturamento_medio,
    ROUND(SUM(CASE	
		WHEN u.plan_id = 1 THEN 0.00
        WHEN u.plan_id = 2 THEN 7.99
        WHEN u.plan_id = 3 THEN 5.99
        WHEN u.plan_id = 4 THEN 6.99
	END), 2) AS faturamento_total
FROM SpotifyClone.user AS u, SpotifyClone.plan AS p
WHERE u.plan_id = p.plan_id;