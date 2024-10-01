SELECT CASE
        WHEN MAX(num) IS NOT NULL THEN MAX(num)
        ELSE null
       END AS num
FROM (
    SELECT *
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS SUB
