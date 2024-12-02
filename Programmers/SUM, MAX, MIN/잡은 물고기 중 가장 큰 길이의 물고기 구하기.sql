-- 어차피 행을 구하는 게 아니라, "길이"만 구하면 됨
-- 첫 번째 코드가 틀린 이유 : 최대 길이를 갖고 있는 행이 여러개 있을 수 있음 -> 중복 제거를 해줘야 함.
SELECT DISTINCT(CONCAT(LENGTH, 'cm')) AS MAX_LENGTH
FROM FISH_INFO
WHERE LENGTH = (SELECT MAX(LENGTH) FROM FISH_INFO WHERE LENGTH IS NOT NULL)
