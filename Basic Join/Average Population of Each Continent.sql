-- 1. names of all the contients
-- 2. respective average city population
SELECT country.continent
     , FLOOR(AVG(city.population))
FROM city
    INNER JOIN country ON city.countrycode = country.code
GROUP BY country.continent
