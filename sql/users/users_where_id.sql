-- параметры sql
-- id
SELECT "users".*, "token".*
FROM "users"
LEFT JOIN "users_token" ON "users_token"."id_users" = "users"."id"
LEFT JOIN "token" ON "token"."id" = "users_token"."id_token"
WHERE "users"."id" = 1