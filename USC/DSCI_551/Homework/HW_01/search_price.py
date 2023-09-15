import sys
import json
import requests

# Establishing the global variables
baseURL = 'https://dsci551-e9a0b-default-rtdb.firebaseio.com/.json'

# Creating terminal arguments for ranges
start_range = sys.argv[1]
end_range = sys.argv[2]

id_list = []

# print a list of car ID's within the range of values
r = requests.get(baseURL + '?orderBy="price"&startAt={}&endAt={}'.format(start_range, end_range))

for i in r.json():
    id_list.append(r.json()[i]['car_ID'])

if len(id_list) == 0:
    print("No cars found with the given range")
else:
    print("IDs for the car price range are:")
    id_list.sort()
    print(id_list)
    

    