from flask import Flask, request, flash, url_for, redirect, render_template, Request
from flask_sqlalchemy import SQLAlchemy
import numpy as np
import pandas as pd
import requests
import sqlite3

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///students.db"
app.config["SECRET_KEY"] = "random string"
db = SQLAlchemy(app)

class student(db.Model):
    name = db.Column(db.String(100), primary_key = True)
    grade = db.Column(db.Integer)

    def __init__(self, name, grade):
        self.name = name
        self.grade = grade

class teacher(db.Model):
    name = db.Column(db.String(100), primary_key = True)
    grade = db.Column(db.Integer)

    def __init__(self, name, grade):
        self.name = name
        self.classes = classes

@app.route("/")
def login():
    return render_template(login.html)

@app.route("/courses")
def veiw_courses():
    return

@app.route("addCourses")
def add_course():
    return

if __name__ == "__main__":
    db.create_all()
    app.run(debug = True)