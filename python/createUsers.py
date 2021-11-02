import psycopg2
from config import host, user, password, db_name


try:
    # Подключение к бд
    c = psycopg2.connect(
        host = host,
        user = user,
        password = password,
        database = db_name
    )

    # Курсор (Штука для действий с бд)
    with c.cursor() as cursor:
        cursor.execute(
            "SELECT version();"
        )

        print(f"Server version: {cursor.fetchone()}")

except Exception as ex:
    print("[INFO] Error while working with PostgreSQL", ex)
finally:
    if c:
        c.close()
        print("[INFO] PostgreSQL connection closed")