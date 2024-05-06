-- > 노선별 노선, 총 누계거리, 평균 역 사이의 거리
-- 누계거리 : 역 사이 거리 총합 (둘째자리에서 반올림)
-- 평균 역~ : 셋째자리에서 반올림
-- km 같이 출력
-- 총 누계거리 DESC
SELECT ROUTE
      ,CONCAT(ROUND(SUM(D_BETWEEN_DIST),1), 'km') AS TOTAL_DISTANCE
      ,CONCAT(ROUND(AVG(D_BETWEEN_DIST),2), 'km') AS AVERAGE_DISTANCE
FROM SUBWAY_DISTANCE
GROUP BY ROUTE
ORDER BY SUM(D_BETWEEN_DIST) DESC
