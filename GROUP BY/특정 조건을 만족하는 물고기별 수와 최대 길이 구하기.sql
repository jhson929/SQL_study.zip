-- 1. 물고기 종류별 평균 길이 구하고
-- 2. 평균 길이가 33cm이상인 것 필터링
-- 3. 조건에 맞는 물고기의 종류, 총 잡은 수, 최대 길이 추출
WITH SUB AS (
    SELECT ID, FISH_TYPE
          ,IF(LENGTH IS NULL, 10, LENGTH) AS LENGTH
    FROM FISH_INFO
)

SELECT COUNT(*) AS FISH_COUNT
      ,MAX(LENGTH) AS MAX_LENGTH
      ,FISH_TYPE
FROM FISH_INFO
WHERE FISH_TYPE IN (SELECT FISH_TYPE
                    FROM SUB
                    GROUP BY FISH_TYPE
                    HAVING AVG(LENGTH) >= 33)
GROUP BY FISH_TYPE
ORDER BY FISH_TYPE ASC
