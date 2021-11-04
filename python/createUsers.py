import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

from config import host, user, password, db_name

    # Подключение к бд
c = psycopg2.connect(
    host = host,
    user = user,
    password = password,
    database = db_name
)
c.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
cursor = c.cursor()

def saveUsers(us):
    cursor.execute(f'INSERT INTO "users" ("fio", "nik", "email", "password", "avatar", "is_active", "is_admin", '
                   f'"is_user") VALUES (\'{us["fio"]}\', \'{us["nik"]}\', \'{us["email"]}\', \'{us["password"]}\', \'{us["avatar"]}\', \'{us["is_active"]}\', \'{us["is_admin"]}\', \'{us["is_user"]}\') ;')

