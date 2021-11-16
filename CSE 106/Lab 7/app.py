import json
from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///students.sqlite"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db = SQLAlchemy(app)

class Student(db.model):
    name = db.Column("name", db.String, primary_key=True)
    grade = db.Column("grade", db.Integer, unique=True, nullable=False)

    def __init__(self, name, grade):
        self.name = name
        self.grade = grade


@app.route('/')
def home():
    return render_template('home.html')

@app.route('/grades', methods=['GET'])
def gather_data():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM student_grades")
    if resultValue > 0:
        student = cur.fetchall()
        return jsonify(student)
    else:
        return jsonify({"message": "Data Not Found"})

@app.route('/', methods=['GET'])
def search(name):
    if request.method == 'GET':
        cur = mysql.connection.cursor()
        resultValue = cur.execute("SELECT * FROM student_grades where NAME = %s", [name])
        if resultValue > 0:
            student = cur.fetchall()
            return jsonify(student)
        else:
            return jsonify({"message": "Data Not Found"})

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
def addStudent():
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
    db.create_all()
    app.run(debug=True)