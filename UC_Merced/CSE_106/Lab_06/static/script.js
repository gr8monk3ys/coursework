var API = "https://amhep.pythonanywhere.com";

function search() {
    let request = new XMLHttpRequest();
    let text = "<table border='1'><tr><th>Name</th><th>Grade</th></tr>";
    request.open("GET", API + "/grades");
    request.send();
    request.onload = () => {
        let data = JSON.parse(request.response);
        let keys = Object.keys(data);

        let i = 0;
        while (i < keys.length) {
            text += "<tr><td>" + keys[i] + "</td><td>" + data[keys[i]] + "</td></tr>";
            i++;
        }
        text += "</table>";
        document.getElementById("getAll").innerHTML = text;
    }
}

function get() {
    let name = document.getElementById("name").value;
    let request = new XMLHttpRequest();
    let ping = false;

    request.open("GET", API + "/grades");
    request.send();
    request.onload = () => {
        let data = JSON.parse(request.response);
        let keys = Object.keys(data);

        let i = 0;
        while (i < keys.length) {
            if (keys[i] == name) {
                document.getElementById("searchGrade").value = data[keys[i]];
                ping = true;
            }
            i++;
        }
        if (ping == false) {
            document.getElementById("searchGrade").value = "Name could not be found";
        }
    }
}

function edit() {
    let name = document.getElementById("name3").value;
    let grade = document.getElementById("grade3").value;
    let param =
    {
        "grade": grade
    };
    let request = new XMLHttpRequest();

    request.open("PUT", API + "/grades" + "/" + name, true);
    request.setRequestHeader("Content-Type", "application/json");

    let json_data = JSON.stringify(param);
    request.send(json_data);
    document.getElementById("delete").innerHTML = "Grade edited";
}

function includeStudent() {
    let name = document.getElementById("name2").value;
    let grade = document.getElementById("grade2").value;
    let param =
    {
        "name": name,
        "grade": grade
    };
    let request = new XMLHttpRequest();
    request.open("POST", API + "/grades", true);
    request.setRequestHeader("Content-Type", "application/json");
    let json_data = JSON.stringify(param);
    request.send(json_data);
    document.getElementById("record").innerHTML = "Record included";
}

function deleteStudent() {
    let name = document.getElementById("name4").value;

    let request = new XMLHttpRequest();
    request.open("DELETE", API + "/grades" + "/" + name, true);
    request.setRequestHeader("Content-Type", "application/json");
    request.send();

    document.getElementById("delete").innerHTML = "Record deleted";
}
