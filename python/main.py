import os.path
import sys
from create_users.create_users import generatorUser

main = (os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
sys.path.append(main)


generatorUser(2)
