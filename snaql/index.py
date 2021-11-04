import os
import sys

main = (os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
sys.path.append(main)

from bd import conn
from sql_fun.users import users_select_all
from libs_back.parsring_order import ParsringOrder



params = {
    'limit': '2',
    'offeset': '2',
    'order': {
        'fio': True,
        'email': False,
        'nik': False,
        'is_active': False,
        'is_admin': False,
        'is_user': False,
    }
}
params['order'] = ParsringOrder(params['order'])
your_sql = users_select_all(**params)
cur = conn.cursor()
print(your_sql)
cur.execute(your_sql)
print(cur.fetchall())
