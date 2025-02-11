WITH Rn AS (
    SELECT LAT_N
          ,ROW_NUMBER() OVER (ORDER BY LAT_N ASC) AS rk
          ,COUNT(*) OVER () AS total_row
    FROM Station
)
SELECT ROUND(AVG(LAT_N), 4) AS median
FROM Rn
WHERE rk IN (CEIL((total_row+1)/2), FLOOR((total_row+1)/2))
