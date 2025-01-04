-- 2019년 첫 번째 분기에만 판매된 제품들 출력
SELECT DISTINCT P.product_id, P.product_name
FROM Sales S
    LEFT JOIN Product P ON S.product_id = P.product_id
WHERE S.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
  AND S.product_id NOT IN (
        SELECT product_id
        FROM Sales
        WHERE sale_date < '2019-01-01' OR sale_date > '2019-03-31'
)
ORDER BY S.product_id
