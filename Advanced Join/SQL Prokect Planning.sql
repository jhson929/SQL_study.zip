SELECT start_date
      ,MIN(end_date)
FROM
    (SELECT start_date
    FROM Projects
    WHERE start_date NOT IN (SELECT end_date FROM Projects)) AS A,
    (SELECT end_date
    FROM Projects
    WHERE end_date NOT IN (SELECT start_date FROM Projects)) AS B
WHERE start_date < end_date
GROUP BY start_date
ORDER BY MIN(end_date) - start_date ASC, start_date ASC
