-- параметры
-- limit: 1, offeset:1, active:1, token: '21'
SELECT *
FROM "token"
WHERE "token"."active" = '1' 
AND "token"."token" LIKE '%21%'
LIMIT 1
OFFSET 1
;