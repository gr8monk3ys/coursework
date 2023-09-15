import sys
import json
import requests
import pandas as pd

# Establishing the global variables
baseURL = 'https://dsci551-e9a0b-default-rtdb.firebaseio.com/.json'

csv_file = sys.argv[1]

df = pd.read_csv(csv_file).to_json(orient='table')

# Load the data parsed and dump it as JSON data
parsed = json.loads(df)

# Simple load in the data as a JSON
with open('cars.json', 'w') as cars:
    json_file = json.dump(parsed, cars, indent=4)

# Sends a PUT request of the newly made file onto the realtime database
r = requests.put(baseURL, json=parsed)