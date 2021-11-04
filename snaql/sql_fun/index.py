from snaql.factory import Snaql
import os
root_location = os.path.abspath(os.path.dirname(__file__))
snaql_factory = Snaql(root_location, '../../sql')