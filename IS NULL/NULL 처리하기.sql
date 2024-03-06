-- 종, 이름, 성별, 중성화 여부
-- 아디이 순으로
-- null = No name
SELECT ANIMAL_TYPE
      ,IF(NAME IS NULL, "No name", NAME)
      ,SEX_UPON_INTAKE
FROM ANIMAL_INS
ORDER BY ANIMAL_ID ASC
