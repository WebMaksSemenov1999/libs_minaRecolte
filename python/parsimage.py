import requests
from bs4 import BeautifulSoup as bs
import random
import lxml.html

r = requests.get("https://www.google.ru/search?tbm=isch&q=яблоко")
text = r.text
soup = bs(text, "html.parser")
theresult = {}
i = 0

for qwerty in soup.find_all('img'):
    theresult[i] = qwerty.get('src')
    print(theresult[i])
    i = i + 1
    print(i)
i = random.randint(1, 19)
print(theresult[i])