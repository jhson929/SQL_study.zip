SELECT DISTINCT city
FROM station
WHERE LOWER(LEFT(city, 1)) NOT IN ('a', 'e', 'i', 'o', 'u')
   OR LOWER(RIGHT(city, 1)) NOT IN ('a', 'e', 'i', 'o', 'u')
