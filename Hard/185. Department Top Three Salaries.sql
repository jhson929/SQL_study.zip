SELECT Department, Employee, Salary
FROM (SELECT D.name AS Department
      ,E.name AS Employee
      ,E.salary AS Salary
      ,DENSE_RANK() OVER (PARTITION BY E.departmentId ORDER BY E.salary DESC) AS s_rank
      FROM Employee E
        JOIN Department D ON E.departmentId = D.id) AS SUB
WHERE s_rank <= 3
