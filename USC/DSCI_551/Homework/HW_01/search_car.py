import sys
import requests

baseURL = 'https://dsci551-e9a0b-default-rtdb.firebaseio.com/data/.json'
search = sys.argv[1]
id_list = []

r = requests.get(baseURL + '?orderBy="CarName"&equalTo="{}"'.format(search))

for i in r.json():
    id_list.append(r.json()[i]['car_ID'])

if len(id_list) == 0:
    print("No cars found")
else:
    print("IDs of the cars are:")
    id_list.sort()
    print(id_list)
    