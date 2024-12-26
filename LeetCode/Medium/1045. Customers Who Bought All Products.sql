-- Product 테이블에 있는 모든 제품을 모두 구매한 고객 출력
-- 순서 상관X
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product)
ORDER BY customer_id
