WITH FriendsInfo AS (
    SELECT requester_id AS id
    ,COUNT(*) AS num
    FROM RequestAccepted
    GROUP BY requester_id

    UNION ALL

    SELECT accepter_id AS id
        ,COUNT(*) AS num
    FROM RequestAccepted
    GROUP BY accepter_id
), SUB AS (
    SELECT id
      ,SUM(num) AS num
    FROM FriendsInfo
    GROUP BY id
)

SELECT id, num
FROM SUB
WHERE num = (SELECT MAX(num) FROM SUB)
