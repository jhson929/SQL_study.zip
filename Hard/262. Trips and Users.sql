-- banned된 user 제외
WITH Unbanned_TB AS (
    SELECT *
    FROM Trips
    WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03' -- 이걸 빼먹음
    AND (client_id NOT IN (SELECT users_id FROM Users WHERE banned = 'Yes' AND role = 'client')
        AND driver_id NOT IN (SELECT users_id FROM Users WHERE banned = 'Yes' AND role = 'driver'))
)

SELECT Day
      ,ROUND(cancelled_cnts / total, 2) 'Cancellation Rate'
FROM (
    SELECT request_at AS Day
        ,COUNT(*) AS total
        ,SUM(CASE WHEN status != 'completed' THEN 1 ELSE 0 END) AS cancelled_cnts
    FROM Unbanned_TB
    GROUP BY request_at
) AS SUB
