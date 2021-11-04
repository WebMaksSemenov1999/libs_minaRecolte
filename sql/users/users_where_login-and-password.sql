SELECT *
FROM "users"
WHERE "users"."nik" = '2' OR "users"."email" = '2'
AND "users"."password" = '11'
LIMIT 1