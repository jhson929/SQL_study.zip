-- 처음 판매된 연도
SELECT product_id
      ,year AS first_year
      ,quantity
      ,price
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year)
    FROM Sales
    GROUP BY product_id
)

-- rank 윈도우 함수를 사용해서 해결할 수도 있음.
-- rank() over (partition by product_id order by year) as rnk
