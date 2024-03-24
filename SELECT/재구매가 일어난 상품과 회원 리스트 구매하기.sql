-- 동일 회원, 동일 상품 재구매한 데이터
-- -> 재구매한 회원id, 재구매한 상품id
-- 회원 id asc,  상품id desc
SELECT USER_ID
      ,PRODUCT_ID
FROM ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(*) >= 2
ORDER BY USER_ID ASC, PRODUCT_ID DESC
