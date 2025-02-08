SELECT company_code, founder
      ,COUNT(DISTINCT lead_manager_code)
      ,COUNT(DISTINCT senior_manager_code)
      ,COUNT(DISTINCT manager_code)
      ,COUNT(DISTINCT employee_code)
FROM (
    SELECT DISTINCT C.company_code, C.founder
                    ,LM.lead_manager_code
                    ,SM.senior_manager_code
                    ,M.manager_code
                    ,E.employee_code
    FROM Company C
        LEFT JOIN Lead_Manager LM 
            ON C.company_code = LM.company_code
        LEFT JOIN Senior_Manager SM 
            ON C.company_code = SM.company_code
            AND LM.lead_manager_code = SM.lead_manager_code
        LEFT JOIN Manager M 
            ON C.company_code = M.company_code
            AND LM.lead_manager_code = M.lead_manager_code
            AND SM.senior_manager_code = M.senior_manager_code
        LEFT JOIN Employee E 
            ON C.company_code = E.company_code 
            AND LM.lead_manager_code = E.lead_manager_code
            AND SM.senior_manager_code = E.senior_manager_code
            AND M.manager_code = E.manager_code
) SUB
GROUP BY company_code, founder
ORDER BY company_code ASC
