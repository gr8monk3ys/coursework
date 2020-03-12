function clickHello(){
	$.get("/hello", {}, function(response){
		$("#hello-area").html(response);
	});
}

function clickEcho(){
	var theWord = $("#echo-input").val();

	$.get("/echo", {word: theWord}, function(response){
		$("#echo-area").html(response);
	});
}

function clickScore(){
	$.get("/superbowl", {}, function(response){
		var details = JSON.parse(response); 

		var displayScore = "The " + details["home_team"] + " beat the " + + details["away_team"]  + " by " 
		+ details["away_score"] + " points to " + details["home_score"];
		
		$("#score-area").html(displayScore);
	});
}

function clickUpper(){
	var lowerWord = $("#uppercase-input").val();

	$.get("/uppercase", {word: lowerWord}, function(response){
		$("#upper-area").html(response);
	});	
}
