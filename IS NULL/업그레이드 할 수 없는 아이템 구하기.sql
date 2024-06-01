-- 더 이상 업그레이드 할 수 없는 아이템
--    = item_id가 parent_id에 없을 경우
SELECT ITEM_ID
      ,ITEM_NAME
      ,RARITY
FROM ITEM_INFO
WHERE ITEM_ID NOT IN (SELECT DISTINCT PARENT_ITEM_ID
                      FROM ITEM_TREE
                      WHERE PARENT_ITEM_ID IS NOT NULL)
ORDER BY ITEM_ID DESC
