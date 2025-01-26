-- 이동평균 구하기
-- 사람들이 일주일동안 얼마나 지불하는지
-- 반올림하여 2번째 자리까지 표시
-- visited_on ASC (누적합)
WITH Total_amt AS (
    SELECT visited_on
         ,SUM(amount) AS amt
    FROM Customer
    GROUP BY visited_on
), Cumul_sum AS (
    SELECT visited_on
          ,SUM(amt) OVER (ORDER BY visited_on ROWS 6 PRECEDING) AS amount
          ,ROUND(AVG(amt) OVER (ORDER BY visited_on ROWS 6 PRECEDING), 2) AS average_amount
    FROM Total_amt
)
SELECT *
FROM Cumul_sum
WHERE visited_on >= (
    SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY) AS start
    FROM Cumul_sum
)
ORDER BY visited_on ASC
