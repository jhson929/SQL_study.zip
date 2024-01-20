SELECT DISTINCT city
FROM station
WHERE LOWER(LEFT(city, 1)) IN ('a', 'e', 'i', 'o', 'u')
  AND LOWER(RIGHT(city, 1)) IN ('a', 'e', 'i', 'o', 'u')
