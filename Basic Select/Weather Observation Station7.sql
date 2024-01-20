SELECT DISTINCT city
FROM station
WHERE LOWER(RIGHT(city, 1)) IN ('a', 'e', 'i', 'o', 'u')
