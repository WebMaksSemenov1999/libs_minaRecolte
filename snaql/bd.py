import psycopg2
conn = psycopg2.connect(
    dbname="MinaRecolte", 
    user="root", 
    password="JDAKF032498FFjfs3",
)

import psycopg2
from psycopg2 import Error
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
try:
    # Подключение к существующей базе данных
    conn = psycopg2.connect(
        dbname="MinaRecolte", 
        user="root", 
        password="JDAKF032498FFjfs3",
    )
    conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
except (Exception, Error) as error:
    print("Ошибка при работе с PostgreSQL", error)