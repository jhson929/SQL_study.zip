WITH SUB AS (
    SELECT customer_number
      ,COUNT(*) AS cnts
    FROM Orders
    GROUP BY customer_number
)

SELECT customer_number
FROM SUB
WHERE cnts = (SELECT MAX(cnts) FROM SUB)
