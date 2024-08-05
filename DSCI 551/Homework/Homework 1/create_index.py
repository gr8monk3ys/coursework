import re
import sys
import string
import requests
import pandas as pd

csv_file = sys.argv[1]
df = pd.read_csv(csv_file)

baseURL = 'https://dsci551-e9a0b-default-rtdb.firebaseio.com/'
index_list = []
values = []

for i in df.loc[:, 'CarName']:
    index_list.append(i)

index = 0
for j in index_list:
    if index == len(index_list):
        exit()
    # Uses Regex to isolate the string from whitespaces into dictionary
    values.append(re.sub('['+string.punctuation+']', '', j).split())

    # Make the PUT request to send to the realtime database
    # r = requests.put(baseURL + 'index/{}.json'.format(index), data='{key_words: "{}"}'.format(values[index]))
    r = requests.put(baseURL + 'index/{}.json'.format(index), data='{key_words: "Example"}')
    index = index + 1

print(values)