-- параметры sql
-- LIMIT,  OFFSET

SELECT *
FROM "categoires_dish"
WHERE "categoires_dish"."acitve"= '1'
AND "categoires_dish"."name" LIKE '%нап%'
LIMIT 1
OFFSET 0