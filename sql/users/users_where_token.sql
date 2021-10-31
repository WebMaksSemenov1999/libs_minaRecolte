-- параметры sql
-- token
SELECT * FROM "users"
LEFT JOIN "users_token" ON "users"."id" = "users_token"."id_users" 
LEFT JOIN "token" ON "token"."id" = "users_token"."id_token" 
WHERE "token"."token" = 'dsay54e6e4t'