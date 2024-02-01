SELECT DISTINCT f1.x, f1.y
FROM Functions AS f1
    INNER JOIN (SELECT x, y
                FROM Functions
                GROUP BY x, y
                HAVING x != y OR COUNT(*) >= 2) AS f2
         ON f1.x = f2.y AND f2.x = f1.y
WHERE f1.x <= f1.y
ORDER BY f1.x
