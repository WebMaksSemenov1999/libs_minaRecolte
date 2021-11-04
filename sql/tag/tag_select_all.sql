SELECT *
FROM "tag"
WHERE "active" = '1' AND "id_type" = '3' AND "name" LIKE '%с%'
ORDER BY "name", "active", "id_type" DESC
LIMIT 50
OFFSET 1