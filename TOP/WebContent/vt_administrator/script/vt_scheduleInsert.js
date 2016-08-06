/**
 * 
 */
var request = null;


function selectday(day){
	var params = "day="+day;
	request = new Request(selectpart, "selectPart.do", "POST", params);
	request.sendRequest();
}

function selectpart(){
	var partTable = document.getElementById("partTable");
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			partTable.innerHTML = request.httpRequest.responseText;
		}
	}	
}

function selectexercise(num){

	var part_id = $('#searchPart'+num+' option:selected').val();
	var params = "part_id="+part_id;
	
	$.ajax({
	      type: "POST",
	      url: "selectExe.do",
	      data: params,
	      success: function(responseText) {
	    	  console.log(responseText);
	    	  var list = JSON.parse(responseText);
	    	  console.log(list);
	      }
	});
}

