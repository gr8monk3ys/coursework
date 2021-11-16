import json
from flask import Flask, render_template, request, redirect, url_for, flash
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.secret_key = "hi"
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///Students.sqlite"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db = SQLAlchemy(app)

class Students(db.Model):
    name = db.Column(db.String(100), primary_key=True)
    grade = db.Column(db.String(25))

    # def __repr__(self): 
    #     return '<Student %r>' % self.name

    def __init__(self, name, grade):
        self.name = name
        self.grade = grade
    
        # super(Students, self).__init__()

@app.route('/')
def home():
    return render_template('grades.html', students=Students.query.all())

@app.route('/search', methods=['GET'])
def search():
    if request.method == 'GET':
        render_template('search.html')
        search_name = request.form.get('name')
        found_student = Students.query.filter_by(name=search_name).first()
        flash("Student: {}, Grade: {}".format(found_student.name, found_student.grade))
        return render_template('search.html')
    else:
        flash("Error: Could not find student")
        return render_template('search.html')

@app.route('/add', methods=['POST', 'GET'])
def add():
    if request.method == 'POST':
        new_name = request.form.get("name")
        new_grade = request.form.get("grade")
        student = Students(new_name, new_grade)

        db.session.add(student)
        db.session.commit()
        flash("{} has been added to list of students".format(student.name))
        return render_template('add.html')
    else:
        flash("Error: Student failed to be added")
        return render_template('add.html')
    return render_template('grades.html', students=Students.query.all())

@app.route('/edit', methods=['PUT', 'GET'])
def edit():
    if request.method == 'GET':
        new_name = request.form.get('name')
        new_grade = request.form.get('grade')
        student = Students(new_name, new_grade)

        found_student = student.query.filter_by(name=new_name).first()
        new_student = found_student
        new_student.grade = new_grade
        # db.session.add(new_student)
        # db.session.delete(found_student)
        db.session.commit()
        flash("{}'s grade has been changed to {}".format(found_student.name, found_student.grade))
        return render_template('edit.html')
    else:
        flash("Error: Student edit failed")
        return render_template('edit.html')
    return render_template('grades.html', students=Students.query.all())
    

@app.route('/delete', methods=['DELETE', 'GET'])
def delete_record():
    if request.method == 'GET':
        search_name = request.form.get('name')
        found_student = Students.query.filter_by(name=search_name).first()
        db.session.delete(found_student)
        db.session.commit()
        flash("Student deleted successfully")
        return render_template('delete.html')
    else:
        flash("Error: Could not delete")
        return render_template('delete.html')
    return render_template('grades.html', students=Students.query.all())

if __name__ == '__main__':
    
    db.create_all()
    
    # Example name to put in database
    # me = Students('Lorenzo', '100')
    # db.session.add(me)
    # db.session.commit()
    # db.drop_all()
    
    app.run(debug=True)

    