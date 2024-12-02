WITH SUB AS (
    SELECT salary
          ,DENSE_RANK() OVER (ORDER BY salary DESC) AS s_rank
    FROM Employee
)

SELECT CASE
        WHEN COUNT(DISTINCT salary) < 2 THEN NULL
        ELSE (SELECT DISTINCT salary FROM SUB WHERE s_rank = 2) 
       END AS SecondHighestSalary
FROM SUB
