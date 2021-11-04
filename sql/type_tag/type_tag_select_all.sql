SELECT * FROM "type-tag" 
WHERE "key" = 'News'
ORDER BY "id", "key" DESC, "description" DESC
LIMIT 5 
OFFSET 1