import json
from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///example.sqlite" 
db = SQLAlchemy(app)

class Student(db.model):
    name = db.Column(db.String, primary_key=True)
    grade = db.Column(db.Integer, unique=True, nullable=False)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/', methods=['GET'])
def gather_data():
    f = requests.get('https://amhep.pythonanywhere.com')
    return f.text

@app.route('/', methods=['GET'])
def search():
    name = request.args.get('name')
    print(name)
    file = gather_data()
    data = file.read()
    records = json.loads(data)
    for record in records:
        if record['name'] == name:
            return jsonify(record)
    return jsonify({'error': 'name not found'})

# @app.route('/', methods=['GET'])
# def get():

#     return

@app.route('/', methods=['PUT'])
def edit():
    record = json.loads(request.data)
    new_records = []
    file = gather_data()
    data = file.read() 
    records = json.loads(data)
    for r in records:
        if r['name'] == record['name']:
            r['grade'] = record['grade']
        new_records.append(r)
        file = gather_data()
        file.write(json.dumps(new_records, indent = 2))
    return jsonify(record)

@app.route('/', methods=['POST'])
def includeStudent():
    record = json.loads(request.data)
    file = gather_data()
    data = file.read()

    if not data:
        records = [record]
    else:
        records = json.loads(data)
        records.append(record)
    file = gather_data()
    file.write(json.dumps(records, indent=2))
    return jsonify(record)

@app.route('/', methods=['DELETE'])
def delete_record():
    record = json.loads(request.data)
    new_records = []
    with open('/tmp/data.txt', 'r') as f:
        data = file.read()
        records = json.loads(data)
        for r in records:
            if r['name'] == record['name']:
                continue
            new_records.append(r)
    with open('/tmp/data.txt', 'w') as f:
        f.write(json.dumps(new_records, indent=2))
    return jsonify(record)

if __name__ == '__main__':
    app.run(debug=True)