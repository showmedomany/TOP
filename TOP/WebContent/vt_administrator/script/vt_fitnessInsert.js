/**
 * 
 */

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

function initformOnload(){
	
}
//윤년 체크
function leapYearCheck(){
	var selectYear = userSearchTextForm.selectYear.value;	
	var leapYear = false;
	if((0==(selectYear%4) && 0 !=(selectYear%100)) || 0 == selectYear%400){
		leapYear = true;
	}else{
		leapYear = false;
	}	
	userSearchTextForm.leapYear.value=leapYear;
	var month = userSearchTextForm.selectMonth.value;
	request = new Request(monthDataCheckResult, "selectDayText.do", "POST", 
			"start_month="+month+"&leapYear="+leapYear);
	request.sendRequest();	
}
//달 확인후 일 계산 
function monthDataCheck(){
	var leapYear = userSearchTextForm.leapYear.value;
	var month = userSearchTextForm.selectMonth.value;	
	request = new Request(monthDataCheckResult, "selectDayText.do", "POST", 
			"start_month="+month+"&leapYear="+leapYear);
	request.sendRequest();	
}
function monthDataCheckResult(){	
	var selectDay = document.getElementById("selectDay");
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){			
			selectDay.innerHTML = request.httpRequest.responseText;			
		}
	}	
}
