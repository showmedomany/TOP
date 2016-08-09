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
	var searchMeans = $('select[name=searchMeans]').val();
	var searchMessage = memberSearchForm.searchMessage.value;
	
	if(!memberSearchForm.searchMessage.value){		
		location.href = 'memberSearch.do';		
	}else{	
		location.href = "memberSearchResult.do?pageNum="+pageNum+"&searchMeans="+searchMeans+"&searchMessage="+searchMessage;
	}
}



function insertUserInfo(num, id){
	
	var selectText = "select[name=insertMeans_" + num + "]";	
	var insertMeans = $(selectText).val();	
	if(insertMeans=="fitness"){
		request = new Request(insertFitnessUserSearchResult, "insertFitnessUserSearch.do", "POST", "id="+id);
		request.sendRequest();		
	}else if(insertMeans=="inbody"){
		request = new Request(insertInbodyUserSearchResult, "insertInbodyUserSearch.do", "POST", "id="+id);
		request.sendRequest();		
	}else if(insertMeans=="schedule"){		
		
	}
}
function insertFitnessUserSearchResult(){	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			document.getElementById("insertUserDiv").innerHTML = request.httpRequest.responseText;					
		}
	}
}
function insertInbodyUserSearchResult(){	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			document.getElementById("insertUserDiv").innerHTML = request.httpRequest.responseText;					
		}
	}
}

/* 시작일 */
//윤년 체크
function leapYearCheck_start(){	
	var selectStartYear = insertForm.selectStartYear.value;
	var start_leapYear = false;
	
	if((0==(selectStartYear%4) && 0 !=(selectStartYear%100)) || 0 == selectStartYear%400){
		var start_leapYear = true;
	}	
	
	insertForm.start_leapYear.value=start_leapYear;
	var month = insertForm.selectStartMonth.value;
	request = new Request(monthDataCheckResult_start, "selectDayText_start.do", "POST", 
			"start_month="+month+"&start_leapYear="+start_leapYear);
	request.sendRequest();	
}
//달 확인후 일 계산 
function monthDataCheck_start(){
	var start_leapYear = insertForm.start_leapYear.value;
	var month = insertForm.selectStartMonth.value;
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
	var selectEndYear = insertForm.selectEndYear.value;	
	var end_leapYear = false;
	if((0==(selectEndYear%4) && 0 !=(selectEndYear%100)) || 0 == selectEndYear%400){
		end_leapYear = true;
	}
	insertForm.end_leapYear.value=end_leapYear;
	var month = insertForm.selectEndMonth.value;
	request = new Request(monthDataCheckResult_end, "selectDayText_end.do", "POST", 
			"end_month="+month+"&end_leapYear="+end_leapYear);
	request.sendRequest();	
}
//달 확인후 일 계산 
function monthDataCheck_end(){
	var end_leapYear = insertForm.end_leapYear.value;
	var month = insertForm.selectEndMonth.value;	
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

/* 피트니스 정보 디비저장하기 */
function fitnessInsertProcess(){
	var bool = true;
	//id
	var id = insertForm.fitnessId.value;
	//피트니스 기간
	var exp_date = insertForm.exp_date.value;
	//시작일 년월일
	var start = insertForm.selectStartYear.value+"-"
				+insertForm.selectStartMonth.value+"-"
				+insertForm.selectStartDay.value;
	//종료일 년월일
	var end = insertForm.selectEndYear.value+"-"
				+insertForm.selectEndMonth.value+"-"
				+insertForm.selectEndDay.value;
	// GT여부
	var isGX = insertForm.GX.value;
	// PT여부
	var isPT = insertForm.PT.value;
	// PT Count
	var PTCount = insertForm.PTCount.value;
	// 트레이너
	var trainer = insertForm.trainerId.value;
	
	
	/*유효성 검사 - 날짜 */
	var fitnessSaveDiv = document.getElementById("fitnessSaveDiv");

	if(!exp_date){		
		fitnessSaveDiv.innerHTML="기간을 입력해 주세요.";
		return;
	}
	
	if(parseInt(insertForm.selectStartYear.value) > parseInt(insertForm.selectEndYear.value)){
		fitnessSaveDiv.innerHTML="시작일과 종료일이 맞지않습니다";
		return;
	}else if(parseInt(insertForm.selectStartYear.value) == parseInt(insertForm.selectEndYear.value)){
		if(parseInt(insertForm.selectStartMonth.value) > parseInt(insertForm.selectEndMonth.value)){
			fitnessSaveDiv.innerHTML="시작일과 종료일이 맞지않습니다";
			return;
		}else if(parseInt(insertForm.selectStartMonth.value) == parseInt(insertForm.selectEndMonth.value)){
			if(parseInt(insertForm.selectStartDay.value) > parseInt(insertForm.selectEndDay.value)){
				fitnessSaveDiv.innerHTML="시작일과 종료일이 맞지않습니다";
				return;
			}
		}
	}
	
	if(trainer == 0){		
		fitnessSaveDiv.innerHTML="트레이너를 선택하여 주세요.";
		return; 
	}
	
	
	fitnessSaveDiv.innerHTML="저장중..";
	request = new Request(fitnessInsertProcessResult, "fitnessInsertProcess.do", "POST", 
			"id="+id+"&exp_date="+exp_date+"&start="+start+"&end="+end+"&isGX="+isGX+"&isPT="
			+isPT+"&PTCount="+PTCount+"&trainer="+trainer);
	request.sendRequest();
	
	
}
function fitnessInsertProcessResult(){
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			document.getElementById("fitnessSaveDiv").innerHTML = request.httpRequest.responseText;							
		}
	}
}




/* 인바디 정보 저장하기 */
function inbodyInsertProcess(){	
	
	//아이디
	var id = insertForm.inbodyId.value;
	//나이
	var age = insertForm.age.value;
	//성별
	var sex = insertForm.sex.value;
	//키
	var height = insertForm.height.value;
	//체중
	var weight = insertForm.weight.value;
	//bmi
	var bmi = insertForm.bmi.value;
	//측정시간
	var check_date = insertForm.selectStartYear.value+"-"
		+insertForm.selectStartMonth.value+"-"
		+insertForm.selectStartDay.value;
	
	/* 유효성 검사 */
	var inbodySaveDiv = document.getElementById("inbodySaveDiv");
	if(!insertForm.age.value){
		inbodySaveDiv.innerHTML = "나이를 입력하세요.";
		return;
	}else if(!insertForm.height.value){
		inbodySaveDiv.innerHTML  = "키를 입력하세요";
		return
	}else if(!insertForm.weight.value){
		inbodySaveDiv.innerHTML  = "몸무게를 입력하세요";
		return;
	}else if(!insertForm.bmi.value){
		inbodySaveDiv.innerHTML  = "bmi를 입력하세요";
		return;
	}
	
	document.getElementById("inbodySaveDiv").innerHTML="저장중..";
	request = new Request(inbodyInsertProcessResult, "inbodyInsertProcess.do", "POST",
			"id="+id+"&age="+age+"&sex="+sex+"&height="+height+"&weight="+weight+"&bmi="+bmi+"&check_date="+check_date);
	request.sendRequest();
}
function inbodyInsertProcessResult(){	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			document.getElementById("inbodySaveDiv").innerHTML = request.httpRequest.responseText;					
		}
	}
}

function test(){
	
	var year = insertForm.selectStartYear.value;
	var month = insertForm.selectStartMonth.value;
	var day = insertForm.selectStartDay.value;
	var start = new Date(year, month, day);
	
	year = insertForm.selectEndYear.value;
	month = insertForm.selectEndMonth.value;
	day = insertForm.selectEndDay.value;
	var end = new Date(year, month, day);
	
	
	var test = new Date(end - start)
	
	alert(test.+"년"+test.getMonth()+"월"+(test.getDate()-1)+"일");
	
	/*
	var year = insertForm.selectEndYear.value - insertForm.selectStartYear.value;
	var month = insertForm.selectEndMonth.value - insertForm.selectStartMonth.value;
	var day = insertForm.selectEndDay.value - insertForm.selectStartDay.value;
	*/
}


function numOnly(){
	if(event.keyCode>=48 && event.keyCode>=58){
		event.returnValue=false;
	}
}
