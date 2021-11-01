-- параметры
-- value object - {data: '2 day', active: 0, token:'dsay54e6e4fsdft'}, user_id
INSERT INTO "token" ("date", "active", "token")
VALUES (
now() + interval '2 day', 
'0', 
'dsay54e6e4fsdft'
);

INSERT INTO "users_token" ("id_users", "id_token")
VALUES ('2', 
    (
        SELECT id 
        FROM "users_token" 
        ORDER BY "users_token"."id" DESC 
        LIMIT 1 
    )
);