CREATE FUNCTION getNthHighestSalary(N INT)
RETURNS INT
BEGIN
  RETURN (
    SELECT IF(COUNT(salary) < N OR N < 0, NULL, MIN(salary))
    FROM (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT N) SUB
    );
END

-- OFFSET을 이용한 풀이
CREATE FUNCTION getNthHighestSalary(N INT)
RETURNS INT
BEGIN
  SET N = N - 1; -- 파라미터로 받은 N을 직접적으로 수정할 수 없어서 SET을 거쳐 수정함.
  RETURN (
        SELECT DISTINCT Salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT N, 1 -- N-1번째까지는 가져오지 말고, 그 다음 것 1개만 가져온다. = N번째를 가져온다.
    );
END
