-- 연속된 3개 혹은 그 이상의 id를 가지고, (연속된 날짜가 아니어도 ㄱㅊ)
-- 각 row의 people이 100이상인 레코드 출력
-- visit_date asc

WITH ST AS (
    SELECT *
          ,id - ROW_NUMBER() OVER (ORDER BY id) AS diff
    FROM Stadium
    WHERE people >= 100
    ORDER BY id
)

SELECT id
      ,visit_date
      ,people
FROM ST
WHERE diff IN (
    SELECT diff
    FROM ST
    GROUP BY diff
    HAVING COUNT(*) >= 3
)
ORDER BY visit_date ASC
