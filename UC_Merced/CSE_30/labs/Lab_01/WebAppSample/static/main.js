function clickAdd(){
            
	var x = document.getElementById("lhs").value;
	var y = document.getElementById("rhs").value;
	
	
	var xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
		   // Typical action to be performed when the document is ready:
		   // alert(xhttp.responseText);
		   var ansSpace = document.getElementById("ans");
		   
		   ansSpace.innerHTML = xhttp.responseText;
		}
	};
	var string = "/add/" + x + "/" + y
	xhttp.open("GET", string, true);
	xhttp.send();
}

function clickMultiply(){
            
	var x = document.getElementById("lhs2").value;
	var y = document.getElementById("rhs2").value;
	
	
	var xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
		   // Typical action to be performed when the document is ready:
		   // alert(xhttp.responseText);
		   var ansSpace = document.getElementById("ans2");
		   
		   ansSpace.innerHTML = xhttp.responseText;
		}
	};
	var string = "/times/" + x + "/" + y
	xhttp.open("GET", string, true);
	xhttp.send();
}
