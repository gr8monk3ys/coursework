from flask import Flask, request, flash, url_for, redirect, render_template, session
from flask_admin.contrib.sqla import ModelView
from flask_sqlalchemy import SQLAlchemy
from flask_admin.contrib.sqla import ModelView
from flask_admin import Admin, AdminIndexView
from flask_login import UserMixin, LoginManager, current_user, login_user, logout_user
import pandas as pd
import numpy as np

app = Flask(__name__)
app.config["SECRET_KEY"] = "1234"

app.config['FLASK_ADMIN_SWATCH'] = 'cerulean'
app.config['DATABASE_FILE'] = 'enrollment.sqlite3'
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///enrollment.sqlite3"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

db = SQLAlchemy(app)
login = LoginManager(app)

@login.user_loader
def load_user(user_id):
    return User.query.get(user_id)

class Student(db.Model):
    __tablename__ = 'student'
    id = db.Column('id', db.String(100), primary_key=True)
    name = db.Column('name', db.String(20))
    user_id = db.Column('user_id', db.Integer)

    def __init__(self, id, name, user_id):
        self.id = id
        self.name = name
        self.user_id = user_ids

class User(db.Model, UserMixin):
    __tablename__ = 'user'
    id = db.Column('id', db.Integer, primary_key=True)
    username = db.Column('username', db.String(20))
    password = db.Column('password', db.String(20))

    def __init__(self, id, username, password):
        self.id = id
        self.username = username
        self.password = password

class Teacher(db.Model):
    __tablename__ = 'teacher'
    id = db.Column('id', db.Integer, primary_key=True)
    name = db.Column('name', db.Integer)
    user_id = db.Column('user_id', db.Integer)

    def __init__(self, id, name, user_id):
        self.id = id
        self.name = name
        self.user_id = user_ids

class Enrollment(db.Model):
    __tablename__ = 'enrollment'
    id = db.Column('id', db.Integer, primary_key=True)
    class_id = db.Column('class_id', db.Integer)
    student_id = db.Column('student_id', db.Integer)
    grade = db.Column('grade', db.Integer)

    def __init(self, id, class_id, student_id, grade):
        self.id = id
        self.class_id = class_id
        self.student_id = student_id
        self.grade = grade

class Class(db.Model):
    __tablename__ = 'class'
    id = db.Column('id', db.Integer, primary_key=True)
    course_name = db.Column('course_name', db.String(100))
    teacher_id = db.Column('teacher_id', db.Integer)
    num_enrolled = db.Column('num_enrolled', db.Integer)

    def __init__(self, id, course_name, teacher_id, num_enrolled):
        self.id = id
        self.course_name = course_name
        self.teacher_id = teacher_id
        self.num_enrolled = num_enrolled

@app.route("/")
def index():
    return render_template('login.html')

class MyModelView(ModelView):
    def is_accessible(self):
        return current_user.is_authenticated
    
    def inaccessible_callback(self, name, **kwargs):
        return redirect(url_for('login'))

class MyAdminIndexView9(AdminIndexView):
    def is_accessible(self):
        return current_user.is_authenticated

admin = Admin(app, name='Admin Portal', template_mode='bootstrap3')
admin.add_view(ModelView(Student, db.session))
admin.add_view(MyModelView(User, db.session))
admin.add_view(ModelView(Teacher, db.session))
admin.add_view(ModelView(Enrollment, db.session))
admin.add_view(ModelView(Class, db.session))

@app.route("/login", methods=['POST', 'GET'])
def login():
    """Login the current user."""
    user = User.query.get(1)
    login_user(user)
    return 'Logged in!'
    # if request.method == 'POST':
    #     username = request.form.get('username')
    #     password = request.form.get('password')
    #     if username == user['username'] and password == password['password']:
    #         session['user'] = username
    #         return redirect(url_for('/student'))
    #     if request.method == 'POST':
    #         username = request.form.get('username')
    #         password = request.form.get('password')

    #     else:
    #         return "<h1>Wrong username or password</h1>"
    # else:
    #     return render_template("login.html")

@app.route('/logout')
def logout():
    """Helps users to logout"""
    logout_user()
    return 'Logged out'

@app.route("/student-view/", methods=['GET', 'POST'])
def student_view():
    return render_template('student_view.html')

@app.route("/teacher-view", methods=['GET', 'POST', 'PUT'])
def teacher_view():
    """Allows teachers to view their current courses and general logistics"""
    return render_template('teacher_view.html')

@app.route("/teacher-view/<course>", methods=['GET', 'POST', 'PUT'])
def edit_course():
    """Allows teachers to be able to edit courses"""
    return

def build_df():
    """Populate the database with this function"""
    file = 'enrollment_data.xlsx'
    #df = pd.read_excel(file, index_col=None, na_values=['NA'], usecols ="A:F")
    courses = df[["A"]].to_numpy()
    db.session.add()
    teachers = df[["B"]].to_numpy()
    Time = df[["C"]].to_numpy()
    students = df[["D"]].to_numpy()
    grades = df[["E"]].to_numpy()


if __name__ == "__main__":

    # db.create_all()
    # me = User(id=1, username="Lorenzo", password="hello") 
    # db.session.add(me)
    # db.session.commit()
    # df = build_df()
    app.run(debug = True)