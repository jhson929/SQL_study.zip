SELECT CEIL(AVG(Salary) - AVG(e)) AS result
FROM (
    SELECT *
          ,CAST(REPLACE(CAST(Salary AS CHAR), '0', '') AS UNSIGNED) AS e
    FROM Employees
) AS SUB
