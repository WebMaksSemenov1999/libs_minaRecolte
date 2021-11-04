-- параметры sql
-- fio, nik, email, password, avatar

{% sql 'users_inset_user', note='создать пользователя' %}
INSERT INTO "users" ("fio", "nik", "email", "password", "avatar", "is_active", "is_admin", "is_user")
VALUES ({{ fio|guards.string }},{{ nik|guards.string }},{{ email|guards.string }},{{ password|guards.string }},{{ avatar|guards.string }},'0','0','1');
{% endsql %}

 