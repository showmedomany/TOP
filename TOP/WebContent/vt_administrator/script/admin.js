//submit 과 같은 기능
function insertFitnessUserSearch(){	
	var searchMsg = fitnessInsertform.userSearch.value;
	var searchMeans = fitnessInsertform.searchMeans.value;
	//document.location.href = "insertFitnessUserSearch.do?searchMsg="+searchMsg+"&searchMeans="+searchMeans;
	request = new Request(insertFitnessUserSearchResult, "insertFitnessUserSearch.do", "POST", 
			"searchMsg="+searchMsg+"&searchMeans="+searchMeans);
	request.sendRequest();	
}
function insertFitnessUserSearchResult(){	
	var userSearchResult = document.getElementById("userSearchResult");	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){			
			userSearchResult.innerHTML = request.httpRequest.responseText;
		}
	}
}

/* 시작일 */
//윤년 체크
function leapYearCheck_start(){	
	var selectStartYear = userSearchTextForm.selectStartYear.value;	
	var start_leapYear = false;
	if((0==(selectStartYear%4) && 0 !=(selectStartYear%100)) || 0 == selectStartYear%400){
		start_leapYear = true;
	}else{
		start_leapYear = false;
	}
	userSearchTextForm.start_leapYear.value=start_leapYear;
	var month = userSearchTextForm.selectStartMonth.value;
	request = new Request(monthDataCheckResult_start, "selectDayText_start.do", "POST", 
			"start_month="+month+"&start_leapYear="+start_leapYear);
	request.sendRequest();	
}
//달 확인후 일 계산 
function monthDataCheck_start(){
	var start_leapYear = userSearchTextForm.start_leapYear.value;
	var month = userSearchTextForm.selectStartMonth.value;	
	request = new Request(monthDataCheckResult_start, "selectDayText_start.do", "POST", 
			"start_month="+month+"&start_leapYear="+start_leapYear);
	request.sendRequest();	
}
function monthDataCheckResult_start(){	
	var selectStartDay = document.getElementById("selectStartDay");
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){			
			selectStartDay.innerHTML = request.httpRequest.responseText;			
		}
	}	
}
/* 종료일 */
//윤년 체크
function leapYearCheck_end(){	
	var selectEndYear = userSearchTextForm.selectEndYear.value;	
	var end_leapYear = false;
	if((0==(selectEndYear%4) && 0 !=(selectEndYear%100)) || 0 == selectEndYear%400){
		end_leapYear = true;
	}else{
		end_leapYear = false;
	}
	userSearchTextForm.end_leapYear.value=end_leapYear;
	var month = userSearchTextForm.selectEndMonth.value;
	request = new Request(monthDataCheckResult_end, "selectDayText_end.do", "POST", 
			"end_month="+month+"&end_leapYear="+end_leapYear);
	request.sendRequest();	
}
//달 확인후 일 계산 
function monthDataCheck_end(){
	var end_leapYear = userSearchTextForm.end_leapYear.value;
	var month = userSearchTextForm.selectEndMonth.value;	
	request = new Request(monthDataCheckResult_end, "selectDayText_end.do", "POST", 
			"end_month="+month+"&end_leapYear="+end_leapYear);
	request.sendRequest();	
}
function monthDataCheckResult_end(){	
	var selectEndDay = document.getElementById("selectEndDay");
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){			
			selectEndDay.innerHTML = request.httpRequest.responseText;			
		}
	}	
}

