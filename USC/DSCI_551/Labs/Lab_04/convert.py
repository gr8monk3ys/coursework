import json
from cerealbox.dynamo import from_dynamodb_json, as_dynamodb_json

# Input file based on Dynamo export
input = open('books.json')
sample_input = json.load(input)

# Using a de-serializer for the creation of new json object
dynamo_input = from_dynamodb_json(sample_input)

# Creating a new json output file
with open('output.json', 'w') as output:
  output.write(str(dynamo_input))
