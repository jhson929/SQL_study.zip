SELECT u.user_id AS buyer_id
      ,u.join_date AS join_date
      ,CASE WHEN oc.order_cnt IS NULL THEN 0 ELSE oc.order_cnt END AS orders_in_2019
FROM Users u
    LEFT JOIN (
        SELECT buyer_id
              ,COUNT(order_id) AS order_cnt
        FROM Orders
        WHERE YEAR(order_date) = 2019
        GROUP BY buyer_id
    ) AS oc ON u.user_id = oc.buyer_id
ORDER BY u.user_id ASC


-- 정리
WITH order_cnts AS (
    SELECT buyer_id
        ,COUNT(order_id) AS order_cnt
    FROM Orders
    WHERE YEAR(order_date) = 2019
    GROUP BY buyer_id
)
SELECT u.user_id AS buyer_id
      ,u.join_date AS join_date
      ,IFNULL(oc.order_cnt, 0) AS orders_in_2019
FROM Users u
    LEFT JOIN order_cnts AS oc ON u.user_id = oc.buyer_id
ORDER BY u.user_id ASC
