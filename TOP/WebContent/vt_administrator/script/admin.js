function memberSearchFormInit(){
	memberSearchForm.searchMessage.focus();
}

function memberDataView(userNum, id, name, nickname, phone, zipcode, address, email, join_date){	
	memberSearchForm.userNumber.value = userNum;
	var isSend = true;
	switch(true){
	case userNum==1 : 		
		var userNumDiv = document.getElementById("div_1");		
		if(memberSearchForm.userId_1.value == 0){			
			memberSearchForm.userId_1.value = 1;
			userNumDiv.style.display = "";
		}else{			
			memberSearchForm.userId_1.value = 0;
			userNumDiv.style.display = "none";
		}
		break;
	case userNum==2 : 
		var userNumDiv = document.getElementById("div_2");
		if(memberSearchForm.userId_2.value == 0){
			memberSearchForm.userId_2.value = 1;
			userNumDiv.style.display = "";
		}else{
			memberSearchForm.userId_2.value = 0;
			userNumDiv.style.display = "none";
		}
		break;
	case userNum==3 : 
		var userNumDiv = document.getElementById("div_3");
		if(memberSearchForm.userId_3.value == 0){
			memberSearchForm.userId_3.value = 1;
			userNumDiv.style.display = "";
		}else{
			memberSearchForm.userId_3.value = 0;
			userNumDiv.style.display = "none";
		}
		break;
	case userNum==4 : 
		var userNumDiv = document.getElementById("div_4");
		if(memberSearchForm.userId_4.value == 0){
			memberSearchForm.userId_4.value = 1;
			userNumDiv.style.display = "";
		}else{
			memberSearchForm.userId_4.value = 0;
			userNumDiv.style.display = "none";
		}
		break;
	case userNum==5 : 
		var userNumDiv = document.getElementById("div_5");
		if(memberSearchForm.userId_5.value == 0){
			memberSearchForm.userId_5.value = 1;
			userNumDiv.style.display = "";
		}else{
			memberSearchForm.userId_5.value = 0;
			userNumDiv.style.display = "none";
		}
		break;
	case userNum==6 : 
		var userNumDiv = document.getElementById("div_6");
		if(memberSearchForm.userId_6.value == 0){
			memberSearchForm.userId_6.value = 1;
			userNumDiv.style.display = "";
		}else{
			memberSearchForm.userId_6.value = 0;
			userNumDiv.style.display = "none";
		}
		break;
	case userNum==7 : 
		var userNumDiv = document.getElementById("div_7");
		if(memberSearchForm.userId_7.value == 0){
			memberSearchForm.userId_7.value = 1;
			userNumDiv.style.display = "";
		}else{
			memberSearchForm.userId_7.value = 0;
			userNumDiv.style.display = "none";
		}
		break;
	case userNum==8 : 
		var userNumDiv = document.getElementById("div_8");
		if(memberSearchForm.userId_8.value == 0){
			memberSearchForm.userId_8.value = 1;
			userNumDiv.style.display = "";
		}else{
			memberSearchForm.userId_8.value = 0;
			userNumDiv.style.display = "none";
		}
		break;
	case userNum==9 : 
		var userNumDiv = document.getElementById("div_9");
		if(memberSearchForm.userId_9.value == 0){
			memberSearchForm.userId_9.value = 1;
			userNumDiv.style.display = "";
		}else{
			memberSearchForm.userId_9.value = 0;
			userNumDiv.style.display = "none";
		}
		break;
	case userNum==10 : 
		var userNumDiv = document.getElementById("div_10");
		if(memberSearchForm.userId_10.value == 0){
			memberSearchForm.userId_10.value = 1;
			userNumDiv.style.display = "";
		}else{
			memberSearchForm.userId_10.value = 0;
			userNumDiv.style.display = "none";
		}
		break;
	}
	
	if(isSend == true){
		request = new Request(memberDataViewResult, "memberSearchView.do", "POST", 
				"id="+id+"&name="+name+"&nickname="+nickname+"&phone="+phone+"&zipcode="+zipcode+"&address="
				+address+"&email="+email+"&join_date="+join_date);
		request.sendRequest(userNum);
	}	
}
function memberDataViewResult(userNum){
	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			var userNumber = memberSearchForm.userNumber.value;			
			switch(true){
				case userNumber==1 :
					var userIdDiv = document.getElementById("div_1");
					userIdDiv.innerHTML = request.httpRequest.responseText;
					break;
				case userNumber==2 : 
					var userIdDiv = document.getElementById("div_2");
					userIdDiv.innerHTML = request.httpRequest.responseText;
					break;
				case userNumber==3 :
					var userIdDiv = document.getElementById("div_3");
					userIdDiv.innerHTML = request.httpRequest.responseText;
					break;
				case userNumber==4 :
					var userIdDiv = document.getElementById("div_4");
					userIdDiv.innerHTML = request.httpRequest.responseText;
					break;
				case userNumber==5 : 
					var userIdDiv = document.getElementById("div_5");
					userIdDiv.innerHTML = request.httpRequest.responseText;
					break;
				case userNumber==6 :
					var userIdDiv = document.getElementById("div_6");
					userIdDiv.innerHTML = request.httpRequest.responseText;
					break;
				case userNumber==7 :
					var userIdDiv = document.getElementById("div_7");
					userIdDiv.innerHTML = request.httpRequest.responseText;
					break;
				case userNumber==8 :
					var userIdDiv = document.getElementById("div_8");
					userIdDiv.innerHTML = request.httpRequest.responseText;
					break;
				case userNumber==9 :
					var userIdDiv = document.getElementById("div_9");
					userIdDiv.innerHTML = request.httpRequest.responseText;
					break;
				case userNumber==10 :
					var userIdDiv = document.getElementById("div_10");
					userIdDiv.innerHTML = request.httpRequest.responseText;
					break;
			}
		}
	}
}

function searchMember(pageNum){
	var searchMeans = memberSearchForm.searchMeans.value;
	if(searchMeans==null || searchMeans==''){
		searchMeans = 'name';
	}
	var searchMessage = memberSearchForm.searchMessage.value;	
	location.href = "memberSearchResult.do?pageNum="+pageNum+"&searchMeans="+searchMeans+"&searchMessage="+searchMessage;
}


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

//피트니스 정보 디비저장하기
function fitnessInsertProcess(saveType){	
	var fitnessSaveDiv = document.getElementById("fitnessSaveDiv");
	var bool = true;
	//id
	var id = userSearchTextForm.fitnessId.value;
	//피트니스 기간
	var exp_date = userSearchTextForm.exp_date.value;
	//시작일 년월일
	var start = userSearchTextForm.selectStartYear.value+"-"
				+userSearchTextForm.selectStartMonth.value+"-"
				+userSearchTextForm.selectStartDay.value;
	//종료일 년월일
	var end = userSearchTextForm.selectEndYear.value+"-"
				+userSearchTextForm.selectEndMonth.value+"-"
				+userSearchTextForm.selectEndDay.value;
	// GT여부
	var isGX = userSearchTextForm.GX.value;
	// PT여부
	var isPT = userSearchTextForm.PT.value;
	// PT Count
	var PTCount = userSearchTextForm.PTCount.value;
	// 트레이너
	var trainer = userSearchTextForm.trainerId.value;
	
	
	/*유효성 검사*/
	var fitnessEffDiv = document.getElementById("fitnessEffDiv");
	if(!exp_date){
		bool = false;
		fitnessEffDiv.innerHTML="피트니스 기간을 입력 해주세요.";		
	}else if(userSearchTextForm.selectStartYear.value > userSearchTextForm.selectEndYear.value){
		bool = false;
		fitnessEffDiv.innerHTML="시작일과 종료일이 맞지않습니다. year";
	}else if(userSearchTextForm.selectStartYear.value == userSearchTextForm.selectEndYear.value){		
		if(userSearchTextForm.selectStartMonth.value > userSearchTextForm.selectEndMonth.value){			
			bool = false;
			fitnessEffDiv.innerHTML="시작일과 종료일이 맞지않습니다. month";			
		}else if(userSearchTextForm.selectStartMonth.value == userSearchTextForm.selectEndMonth.value){			
			if(userSearchTextForm.selectStartDay.value > userSearchTextForm.selectEndDay.value){
				bool = false;
				fitnessEffDiv.innerHTML="시작일과 종료일이 맞지않습니다. day";				
			}
		}
	}
	if(trainer == 0){
		bool = false;
		alert("트레이너를 선택하여 주세요");
		fitnessEffDiv.innerHTML="트레이너를 선택하여 주세요.";
	}


			
				
	
	
	if(bool==true){	
		fitnessSaveDiv.innerHTML="저장중..";
		request = new Request(fitnessInsertProcessResult, "fitnessInsertProcess.do", "POST", 
				"id="+id+"&exp_date="+exp_date+"&start="+start+"&end="+end+"&isGX="+isGX+"&isPT="
				+isPT+"&PTCount="+PTCount+"&trainer="+trainer+"&saveType="+saveType);
		request.sendRequest();
	}
	
}
function fitnessInsertProcessResult(){	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			document.getElementById("fitnessSaveDiv").innerHTML = request.httpRequest.responseText;					
		}
	}
}
