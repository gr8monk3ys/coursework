var API = "https://amhep.pythonanywhere.com";

function get() {
    let name = document.getElementById("name").value;
    let request = new XMLHttpRequest();
    let flag = false;

    request.open("GET", API + "/grades");
    request.send();
    request.onload = () => {
        let data = JSON.parse(request.response);
        let keys = Object.keys(data);
        for (let i = 0; i < keys.length; i++) {
            if (keys[i] == name) {
                document.getElementById("get_grade").value = data[keys[i]];
                flag = true;
            }
        }
        if (flag == false) {
            document.getElementById("get_grade").value = "Name not found";
        }
    }
}

function find() {
    let request = new XMLHttpRequest();
    let text = "<table border='1'><tr><th>Name</th><th>Grade</th></tr>";
    request.open("GET", API + "/grades");
    request.send();
    request.onload = () => {
        let data = JSON.parse(request.response);
        let keys = Object.keys(data);
        for (let i = 0; i < keys.length; i++) {
            text += "<tr><td>" + keys[i] + "</td><td>" + data[keys[i]] + "</td></tr>";
        }
        text += "</table>";
        document.getElementById("get_all").innerHTML = text;
    }
}

function add() {
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
    document.getElementById("success_record").innerHTML = "Record added successfully!";
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
    document.getElementById("success_delete").innerHTML = "Grade edited successfully!";
}

function del() {
    let name = document.getElementById("name4").value;
    
    let request = new XMLHttpRequest();
    request.open("DELETE", API + "/grades" + "/" + name, true);
    request.setRequestHeader("Content-Type", "application/json");
    request.send();
    
    document.getElementById("success_delete").innerHTML = "Record deleted successfully!";
}
