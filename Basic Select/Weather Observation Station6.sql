-- LIKE를 이용한 풀이
SELECT DISTINCT city
FROM station
WHERE LOWER(city) LIKE 'a%'
   OR LOWER(city) LIKE 'e%'
   OR LOWER(city) LIKE 'i%'
   OR LOWER(city) LIKE 'o%'
   OR LOWER(city) LIKE 'u%'

-- IN을 이용한 풀이
SELECT DISTINCT city
FROM station
WHERE LOWER(LEFT(city, 1)) IN ('a', 'e', 'i', 'o', 'u')
