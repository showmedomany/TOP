/**
 * vt_ex_routine.js
 */

function weekSchedule(number){	
	var weekScheduleResult = document.getElementById("weekScheduleResult");	
	if(number==1){		
		weekScheduleResult.innerHTML = "월요일 운동 순서<br>"				
	}else if(number==2){
		weekScheduleResult.innerHTML = "화요일 운동 순서<br>";
	}else if(number==3){
		weekScheduleResult.innerHTML = "수요일 운동 순서<br>";
	}else if(number==4){
		weekScheduleResult.innerHTML = "목요일 운동 순서<br>";
	}else if(number==5){
		weekScheduleResult.innerHTML = "금요일 운동 순서<br>";
	}
}

function partSchedule(number){	
	request = new Request(partScheduleResult, "myPagePartSchedulePrint.do", "POST", "partId="+number);	
	request.sendRequest();
}
function partScheduleResult(){
	var partExeriseResult = document.getElementById("partExeriseResult");	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){			
			partExeriseResult.innerHTML = request.httpRequest.responseText;
		}
	}
}

function exeriseInfo(number){
	var pList = document.getElementsByTagName("p");	
	var p = pList.item(number).firstChild.nodeValue;
	
	request = new Request(exeriseInfoResult, "myPageExeriseInfoPrint.do", "POST", "name="+encodeURI(p));	
	request.sendRequest();	
}
function exeriseInfoResult(){
	var exeriseInfo = document.getElementById("exeriseInfo");
	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){			
			exeriseInfo.innerHTML = request.httpRequest.responseText;
		}
	}
}