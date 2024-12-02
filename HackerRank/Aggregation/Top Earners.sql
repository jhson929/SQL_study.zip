SELECT salary * months AS total_earnings
     ,COUNT(*)
FROM employee
GROUP BY total_earnings
ORDER BY total_earnings DESC
LIMIT 1

-- 서브쿼리로도 풀 수 있다.
SELECT (SELECT MAX(salary*months) from employee)
     , COUNT(*)
FROM employee
WHERE salary*months = (SELECT MAX(salary*months) from employee)
