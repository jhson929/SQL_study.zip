SELECT product_id, 'store1' AS store, store1 AS price
FROM Products
WHERE store1 IS NOT NULL

UNION

SELECT product_id, 'store2' AS store, store2 AS price
FROM Products
WHERE store2 IS NOT NULL

UNION

SELECT product_id, 'store3' AS store, store3 AS price
FROM Products
WHERE store3 IS NOT NULL

-- 처음에 푼 코드
WITH ALL_TB AS (
    SELECT product_id, 'store1' AS store, store1 AS price
    FROM Products

    UNION

    SELECT product_id, 'store2' AS store, store2 AS price
    FROM Products

    UNION

    SELECT product_id, 'store3' AS store, store3 AS price
    FROM Products
)
SELECT *
FROM ALL_TB
WHERE price IS NOT NULL
ORDER BY product_id ASC
