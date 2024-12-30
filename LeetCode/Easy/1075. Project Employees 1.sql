-- 모든 프로젝트에 대해, 모든 직원들의 평균 연차 출력
SELECT project_id
      ,ROUND(AVG(E.experience_years),2) AS average_years
FROM Project P
    JOIN Employee E ON P.employee_id = E.employee_id
GROUP BY project_id
