from bd import conn
from sql_fun.users import users_select_all
params = {
    'limit': '2',
    'offeset':'2',
    'order':{
        'fio': True,
        'email': False,
        'nik': False,
        'is_active': False,
        'is_admin': False,
        'is_user':False,
    }
} 
 
def ParsringOrder(obj):
    stringOrder = ""
    for key in obj:
        if obj[key] == True:
            stringOrder += key + ' ' +  'DESC,'
        if obj[key] == False:
            stringOrder += key + ' ' +  'ASC,'
    
    return stringOrder[0:-1]

params['order'] = ParsringOrder(params['order'])
 


your_sql = users_select_all(**params)
cur = conn.cursor()
print(your_sql)
cur.execute(your_sql)
print(cur.fetchall())