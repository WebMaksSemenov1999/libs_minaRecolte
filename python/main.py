import requests
import json
from random import randint

user = {
    'fio': "",
    'password' : "",
    'nik' : "",
    'email' : "",
    'isUser' : True,
    'isAdmin' : False,
    'isActive' : False
}




def spisok_user(q):

    a = 1

    for i in range(q):
        response = requests.get('https://api.randomdatatools.ru?unescaped=false')
        jfile = json.loads(response.text)

        # Проверка уникальности nik
        niks.append(jfile["Login"])

        setarr1 = set(niks)
        if len(niks) == len(setarr1):
            pass
        else:
            print("Есть одинаковые")

        # Проверка уникальности email
        emails.append(jfile["Email"])

        setarr2 = set(emails)
        if len(emails) == len(setarr2):
            pass
        else:
            print("Есть одинаковые")

        # Запись значений
        user['fio'] = jfile["LastName"]+' '+jfile["FirstName"]+' '+jfile["FatherName"]
        user['password'] = jfile["Password"]
        user['nik'] = jfile["Login"]
        user['email'] = jfile["Email"]

        # Рандом админок
        if a < 3:
            user['isAdmin'] = True
            a += 1

        # Рандом активированный аккаунт

        print(user['isAdmin'])
        print(niks)

        i += 1
    return user

spisok_user(5)

