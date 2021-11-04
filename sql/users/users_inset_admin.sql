-- параметры sql
-- fio, nik, email, password, avatar,  is_active , is_admin, is_user

{% sql 'users_inset_user_admin', note='создать пользователя для админа' %}
INSERT INTO "users" ("fio", "nik", "email", "password", "avatar", "is_active", "is_admin", "is_user")
VALUES ({{ fio|guards.string }},{{ nik|guards.string }},{{ email|guards.string }},
    {{ password|guards.string }},{{ avatar|guards.string }},{{ is_active|guards.string }},
    {{ is_admin|guards.string }},{{ is_user|guards.string }});
{% endsql %}