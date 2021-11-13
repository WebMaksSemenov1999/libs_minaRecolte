import os.path
import sys
from create_tokens.create_tokens import createToken

main = (os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
sys.path.append(main)


createToken(2)
