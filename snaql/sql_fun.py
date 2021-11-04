from snaql.factory import Snaql
import os
root_location = os.path.abspath(os.path.dirname(__file__))
snaql_factory = Snaql(root_location, '../sql')
# подключение файлов 
users_inset_user = snaql_factory.load_queries('users/users_inset_user.sql')
 