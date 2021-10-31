-- параметры
-- limit, offeset,nik,email,is_active,is_admin,is_user
SELECT *
FROM "users"
WHERE "fio" LIKE '%1%' 
AND nik LIKE '%1%'
AND email LIKE '%1%'
AND is_active = '1'
AND is_admin = '1'
AND is_user= '1'
LIMIT 1
OFFSET 1