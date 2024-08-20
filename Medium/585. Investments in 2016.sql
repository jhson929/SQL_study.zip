-- 1. tiv_2015 값이 같은 행이 최소 1개 이상 있을 것 (즉 토탈 2개 이상)
-- 2. 같은 도시에 위치해있지 않을 것(lat, lon)
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE 
    tiv_2015 IN (
        SELECT tiv_2015 -- 조건1
        FROM Insurance
        GROUP BY tiv_2015
        HAVING COUNT(*) >= 2
    )
  AND 
    (lat, lon) IN (
        SELECT lat, lon -- 조건2
        FROM Insurance
        GROUP BY lat, lon
        HAVING COUNT(*) = 1
    )
