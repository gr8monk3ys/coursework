import json
from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("home.html")

@app.route("/grades", methods=['GET'])
def search():
    text = "<table border='1'><tr><th>Name</th><th>Grade</th></tr>";
    data = json.parse(request.response)
    keys = Object.keys(data)

    # i = 0
    # while i < keys.length:
    #     text += "<tr><td>" + keys[i] + "</td><td>" + data[keys[i]] + "</td></tr>"
    #     i++
    # text += "</table>"
    # return text

@app.route("/grades", methods=['GET'])
def get():

    return

@app.route("/grades", methods=['PUT'])
def edit():
    return

@app.route("/grades", methods=['POST'])
def includeStudent():
    return

if __name__ == "__main__":
    app.run(debug=True)