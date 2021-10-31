import requests
import json

users = []

response = requests.get('https://api.randomdatatools.ru?unescaped=false')
jfile = json.loads(response.text)