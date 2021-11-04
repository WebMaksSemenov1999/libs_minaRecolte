import requests
import json
from bs4 import BeautifulSoup as bs
import random
import bcrypt
from createUsers import saveUsers

users = []
niks = []
emails = []



def randAdm(count_is_adm):
    if count_is_adm >= 3:
        return False
    else:
        return bool(random.randint(0, 1))


def randActive(count_is_act):
    if count_is_act >= 5:
        return True
    else:
        return bool(random.randint(0, 1))


def uniqNik():
    response = requests.get('https://api.randomdatatools.ru?unescaped=false&params=Login')
    nik_file = json.loads(response.text)
    niks.append(nik_file["Login"])

    set_niks = set(niks)
    if len(niks) == len(set_niks):
        return nik_file["Login"]
    else:
        niks.pop(len(niks) - 1)
        return uniqNik()


def uniqEmail():
    response = requests.get('https://api.randomdatatools.ru?unescaped=false&params=Email')
    email_file = json.loads(response.text)
    emails.append(email_file["Email"])

    set_emails = set(emails)
    if len(emails) == len(set_emails):
        return email_file["Email"]
    else:
        emails.pop(len(emails) - 1)
        return uniqEmail()

def getImage():
    # Парсинг ссылок на изображения
    r = requests.get("https://www.google.ru/search?tbm=isch&q=человек")
    text = r.text
    soup = bs(text, "html.parser")
    imgall = soup.find_all('img')
    index = random.randint(0, len(soup.find_all('img'))-1)
    resimg = imgall[index].get('src')
    return resimg


def generatorUser(count):
    count_is_adm = 0
    count_is_act = 0

    for i in range(count):
        response = requests.get('https://api.randomdatatools.ru?unescaped=false')
        jfile = json.loads(response.text)

        is_admin = randAdm(count_is_adm)
        if is_admin:
            count_is_adm += 1

        is_active = randActive(count_is_act)
        if not is_active:
            count_is_act += 1
        #salt
        #password = bytes(jfile['Password'], encoding='utf-8')

        users.append(
            {"fio": jfile["LastName"] + ' ' + jfile["FirstName"] + ' ' + jfile["FatherName"],
             'password': jfile['Password'],
             #'password': bcrypt.hashpw(password, bcrypt.gensalt()),
             'nik': uniqNik(),
             'email': uniqEmail(),
             'avatar': getImage(),
             'is_user': True,
             'is_admin': is_admin,
             'is_active': is_active
             }
        )

    for a in users:
        saveUsers(a)


generatorUser(200)
