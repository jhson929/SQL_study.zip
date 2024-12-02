-- 또는 3개의 테이블을 모두 join 한 후, where로 필터링 하는 흐름도 ok
WITH TB1 AS (
    SELECT *
    FROM APPOINTMENT
    WHERE DATE_FORMAT(APNT_YMD, '%Y-%m-%d') = '2022-04-13'
      AND APNT_CNCL_YN = 'N'
      AND MCDP_CD = 'CS'
)

SELECT TB1.APNT_NO
      ,P.PT_NAME
      ,P.PT_NO
      ,D.MCDP_CD
      ,D.DR_NAME
      ,TB1.APNT_YMD
FROM TB1
    JOIN PATIENT P ON TB1.PT_NO = P.PT_NO
    JOIN DOCTOR D ON TB1.MDDR_ID = D.DR_ID
ORDER BY TB1.APNT_YMD ASC
