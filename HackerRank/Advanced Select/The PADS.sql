SELECT CONCAT(name, '(', LEFT(occupation, 1), ')')
FROM Occupations
ORDER BY name;

SELECT CONCAT('There are a total of ', 
              COUNT(*), ' ', LOWER(occupation), 's.') AS number_of_ocurrences
FROM Occupations
GROUP BY occupation
ORDER BY COUNT(*) ASC, LOWER(occupation) ASC
