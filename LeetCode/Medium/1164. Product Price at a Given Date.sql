-- 2019년 8월 16일 이전의 날짜들 중 각 product_id별 최신 날짜
WITH SUB1 AS (
    SELECT P.product_id, new_price AS price
    FROM Products P
        JOIN (
            SELECT product_id, MAX(change_date) AS recent_date
            FROM Products P
            WHERE change_date <= '2019-08-16'
            GROUP BY product_id
        ) AS Before0816 ON P.change_date = Before0816.recent_date AND P.product_id = Before0816.product_id
), SUB2 AS (
    SELECT product_id, 10 AS price
    FROM Products
    WHERE change_date > '2019-08-16'
      AND product_id NOT IN (
        SELECT product_id
        FROM SUB1
      )
)
SELECT *
FROM SUB1
UNION
SELECT *
FROM SUB2
