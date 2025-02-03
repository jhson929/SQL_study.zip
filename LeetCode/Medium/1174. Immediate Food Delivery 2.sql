-- 첫 번째 코드 : 1460ms
WITH First_order AS (
    SELECT customer_id, MIN(order_date) AS first_order
    FROM Delivery
    GROUP BY customer_id
)
SELECT ROUND(COUNT(DISTINCT CASE WHEN order_date = customer_pref_delivery_date THEN customer_id END) / COUNT(DISTINCT customer_id) * 100, 2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (SELECT * FROM First_order)


-- 두 번째 코드 : 838ms
SELECT ROUND(COUNT(DISTINCT CASE WHEN order_date = customer_pref_delivery_date THEN customer_id END) / COUNT(DISTINCT customer_id) * 100, 2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (SELECT customer_id, MIN(order_date) AS first_order
                                    FROM Delivery
                                    GROUP BY customer_id)
