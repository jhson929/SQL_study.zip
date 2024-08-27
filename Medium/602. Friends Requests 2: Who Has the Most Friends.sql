-- 방법1
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

-- 방법2
WITH BASE AS (
    SELECT requester_id id
    FROM RequestAccepted

    UNION ALL

    SELECT accepter_id id
    FROM RequestAccepted
)

SELECT id, COUNT(*) num
FROM BASE
GROUP BY id
ORDER BY num DESC
LIMIT 1 -- most friends가 1명임을 보장하므로 이 코드 또한 가능.
