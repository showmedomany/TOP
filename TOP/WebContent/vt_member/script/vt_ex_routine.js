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