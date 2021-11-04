-- параметры
-- limit, offeset,nik,email,is_active,is_admin,is_user


{% sql 'users_select_all', note='получить всех пользователей для админа' %}
SELECT *
FROM "users"
    WHERE TRUE
    {% if fio %}
        AND "fio" LIKE {{ fio | guards.string  }}
    {% endif %}
    {% if nik %}
        AND "nik" LIKE {{ nik | guards.string  }}
    {% endif %}
    {% if nik %}
        AND "email" LIKE {{ email | guards.string  }}
    {% endif %}
    {% if is_active %}
        AND "is_active" = {{ is_active | guards.string  }}
    {% endif %}
    {% if is_active %}
        AND "is_admin" = {{ is_admin | guards.string  }}
    {% endif %}
    {% if is_user %}
        AND "is_user" = {{ is_admin | guards.string  }}
    {% endif %}

    {% if order %}
        ORDER BY 
        {{ order }}
    {% endif %}

    {% if limit %}
        LIMIT {{ limit | guards.string  }}
    {% endif %}

    {% if offeset %}
        OFFSET {{ offeset | guards.string  }}
    {% endif %}

{% endsql %}