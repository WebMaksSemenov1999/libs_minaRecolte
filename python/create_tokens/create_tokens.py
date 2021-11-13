import random
import datetime
import secrets

from bd import conn

now = datetime.datetime.now()
tokens = []
uniq_tokens = []


def saveTokens(tok):
    print(tok)
    cursor = conn.cursor()
    sql = f'INSERT INTO "token" ("date", "active", "token") ' \
          f'VALUES (\'{tok["date"]}\',\'{tok["is_active"]}\', \'{tok["token"]}\');'
    print(sql)
    cursor.execute(sql)


def uniqToken():
    tmptoken = secrets.token_hex()
    uniq_tokens.append(tmptoken)
    set_tokens = set(uniq_tokens)
    if len(uniq_tokens) == len(set_tokens):
        return tmptoken
    else:
        uniq_tokens.pop(len(uniq_tokens) - 1)
        return uniqToken()


def randActive(count_is_act):
    if count_is_act >= 5:
        return True
    else:
        return bool(random.randint(0, 1))


def createToken(count):
    for i in range(count):
        count_is_act = 0
        is_active = randActive(count_is_act)
        if not is_active:
            count_is_act += 1

        tokens.append({
            'date': now.strftime("%d-%m-%Y %H:%M"),
            'is_active': is_active,
            'token': uniqToken(),
        })

    for tok in tokens:
        saveTokens(tok)
