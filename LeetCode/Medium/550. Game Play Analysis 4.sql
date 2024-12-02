-- 1) 유저별 최초 접속 날짜 구하기
-- 2) 최초 접속 날짜로부터 이틀 연속 접속했는지 체크

WITH AFL AS (SELECT player_id
      ,MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id
) 

SELECT ROUND(COUNT(A1.event_date) / COUNT(AFL.player_id), 2) AS fraction
FROM AFL
    LEFT JOIN Activity A1 ON AFL.player_id = A1.player_id
                            AND DATE_ADD(AFL.first_login, INTERVAL 1 DAY) = A1.event_date
