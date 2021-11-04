import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

from config import host, user, password, db_name

    # Подключение к бд
conn = psycopg2.connect(
    host = host,
    user = user,
    password = password,
    database = db_name
)
conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)