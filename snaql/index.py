from bd import conn
from sql_fun.users import users_inset_admin

your_sql = users_inset_admin(
    fio='Maks Semen', 
    nik='dadas4345asdtzz',
    email='das1321asdzzz@mail.ru',
    password='pdsf932gfz',
    avatar='https://placepic.ru/wp-content/uploads/2018/01/art-krasivyie-kartinki-Putin-politika-1331294.jpeg',
    is_active='1',
    is_admin='1',
    is_user='1'
    )
cur = conn.cursor()
cur.execute(your_sql)