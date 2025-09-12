SELECT U.name, SUM(T.amount) AS balance
FROM Users U
    JOIN Transactions T ON U.account = T.account
GROUP BY U.name
HAVING balance > 10000
