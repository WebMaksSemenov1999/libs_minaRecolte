import requests
import json
from random import randint

user =  []

def generatorUser(count):
    for  i in range(count):
        res = requests.get('https://api.randomdatatools.ru/?unescaped=false%27')
        jfile = json.loads(res.text)

        user.append(
            {"fio": jfile["LastName"]+' '+jfile["FirstName"]+' '+jfile["FatherName"]}
        )


        print(user)
generatorUser(3)