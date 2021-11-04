-- параметры
-- value object - {data: '2 day', active: 0, token:'dsay54e6e4fsdft'}
INSERT INTO "token" ("date", "active", "token")
VALUES (
now() + interval '2 day', 
'0', 
'dsay54e6e4fsdft'
);