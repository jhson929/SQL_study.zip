-- 1. 내 코드
WITH SUB AS (
    SELECT H.*
          ,CC.CHALLENGES_CREATED
    FROM HACKERS H
        JOIN (SELECT HACKER_ID
                    ,COUNT(*) AS CHALLENGES_CREATED
              FROM CHALLENGES
              GROUP BY HACKER_ID) CC ON H.HACKER_ID = CC.HACKER_ID
)

SELECT *
FROM SUB
WHERE CHALLENGES_CREATED = (SELECT MAX(CHALLENGES_CREATED) FROM SUB)
        OR (CHALLENGES_CREATED < (SELECT MAX(CHALLENGES_CREATED) FROM SUB) 
                AND CHALLENGES_CREATED IN (SELECT CHALLENGES_CREATED FROM SUB GROUP BY CHALLENGES_CREATED HAVING COUNT(*) = 1))
ORDER BY CHALLENGES_CREATED DESC, HACKER_ID ASC


-- 2. 강의 코드 답안
SELECT HACKERS.HACKER_ID
     , HACKERS.NAME
     , COUNT(*) CHALLENGES_CREATED
FROM CHALLENGES
    INNER JOIN HACKERS ON CHALLENGES.HACKER_ID = HACKERS.HACKER_ID
GROUP BY HACKERS.HACKER_ID, HACKERS.NAME
HAVING CHALLENGES_CREATED = (SELECT MAX(CHALLENGES_CREATED)
                            FROM (
                                SELECT HACKER_ID
                                     , COUNT(*) AS CHALLENGES_CREATED
                                FROM CHALLENGES
                                GROUP BY HACKER_ID
                            ) SUB)    -- 최대갯수인 행의 경우
    OR CHALLENGES_CREATED IN (SELECT CHALLENGES_CREATED
                              FROM (
                                SELECT HACKER_ID
                                     , COUNT(*) AS CHALLENGES_CREATED
                                FROM CHALLENGES
                                GROUP BY HACKER_ID
                                ) SUB     -- HACKER_ID 당 만든 문제 개수
                              GROUP BY CHALLENGES_CREATED
                              HAVING COUNT(*) = 1) -- 문제 개수가 1개인 것들 필터링
ORDER BY CHALLENGES_CREATED DESC, HACKER_ID



-- 3. 2번의 코드를 좀 더 효율적으로 개선
WITH COUNTER AS (
    SELECT HACKERS.HACKER_ID
         , HACKERS.NAME
         , COUNT(*) AS CHALLENGES_CREATED
    FROM CHALLENGES
        INNER JOIN HACKERS ON CHALLENGES.HACKER_ID = HACKERS.HACKER_ID
    GROUP BY HACKERS.HACKER_ID, HACKERS.NAME
)

SELECT COUNTER.HACKER_ID
     , COUNTER.NAME
     , COUNTER.CHALLENGES_CREATED
FROM COUNTER
WHERE CHALLENGES_CREATED = (SELECT MAX(CHALLENGES_CREATED) FROM COUNTER) -- [살려야 되는 것 1.] 만든 문제 갯수가 MAX인 것.
   OR CHALLENGES_CREATED IN (SELECT CHALLENGES_CREATED -- [살려야 되는 것2.] 만든 문제 갯수 최대 이하인 것 중에서, 1명만 있는 경우. (어차피 OR로 연결되기 때문에 최대 개수 이하의 조건을 걸어줄 필요X)
                             FROM COUNTER
                             GROUP BY CHALLENGES_CREATED
                             HAVING COUNT(*) = 1)
ORDER BY COUNTER.CHALLENGES_CREATED DESC, COUNTER.HACKER_ID
