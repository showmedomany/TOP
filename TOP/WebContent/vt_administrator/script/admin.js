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

function onEnter(searchPageNum){	
	searchMember(searchPageNum);
	return false;
	
}

function searchMember(searchPageNum){		
	var searchMeans = $('select[name=searchMeans]').val();
	var searchMessage = memberSearchForm.searchMessage.value;
	
	if(!memberSearchForm.searchMessage.value){		
		location.href = 'memberSearch.do';		
	}else{	
		location.href = "memberSearchResult.do?searchPageNum="+searchPageNum+"&searchMeans="+searchMeans+"&searchMessage="+searchMessage;
	}
}



function insertUserInfo(num, id){
	
	var selectText = "select[name=insertMeans_" + num + "]";	
	var insertMeans = $(selectText).val();	
	if(insertMeans=="fitness"){
		request = new Request(insertFitnessUserSearchResult, "insertFitnessUserSearch.do", "POST", "id="+id);
		request.sendRequest();		
	}
	/*
	else if(insertMeans=="inbody"){
		request = new Request(insertInbodyUserSearchResult, "insertInbodyUserSearch.do", "POST", "id="+id);
		request.sendRequest();		
	}
	*/
	else if(insertMeans=="schedule"){		
		request = new Request(insertScheduleUserSearchResult, "insertScheduleUserSearch.do", "POST", "id="+id);
		request.sendRequest();
	}
}
function insertFitnessUserSearchResult(){	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			document.getElementById("insertUserDiv").innerHTML = request.httpRequest.responseText;					
		}
	}
}
/*
function insertInbodyUserSearchResult(){	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			document.getElementById("insertUserDiv").innerHTML = request.httpRequest.responseText;					
		}
	}
}
*/
function insertScheduleUserSearchResult(){	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			// document.getElementById("insertUserDiv").innerHTML = request.httpRequest.responseText;
			$("#insertUserDiv").html(request.httpRequest.responseText);
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

/* 피트니스 정보 디비저장하기 */
function fitnessInsertProcess(){
	var bool = true;
	//id
	var id = insertForm.fitnessId.value;
	//피트니스 기간
	var exp_date = insertForm.termselect.value;
	//시작일 년월일
	var start = insertForm.selectStartYear.value+"-"
				+insertForm.selectStartMonth.value+"-"
				+insertForm.selectStartDay.value;
	
	//종료일 년월일 = 회원권 기간을 계산하여 나온 값을 end에 저장
	var end = insertForm.expiYear.value+"-"
				+insertForm.expiMonth.value+"-"
				+insertForm.expiDay.value;
	// GT여부
	var isGX = insertForm.GX.value;
	// PT여부
	var isPT = insertForm.PT.value;
	// PT Count
	var PTCount = insertForm.PTCount.value;
	// 트레이너
	//var trainer = insertForm.trainerId.value;
	
	
	/*유효성 검사 - 날짜 */
	var fitnessSaveDiv = document.getElementById("fitnessSaveDiv");

	
	/*
	if(trainer == 0){		
		fitnessSaveDiv.innerHTML="트레이너를 선택하여 주세요.";
		return; 
	}
	*/
	
	fitnessSaveDiv.innerHTML="저장중..";
	request = new Request(fitnessInsertProcessResult, "fitnessInsertProcess.do", "POST", 
			"id="+id+"&exp_date="+exp_date+"&start="+start+"&end="+end+"&isGX="+isGX+"&isPT="
			+isPT+"&PTCount="+PTCount);
	request.sendRequest();
	
	
}
function fitnessInsertProcessResult(){
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			document.getElementById("fitnessSaveDiv").innerHTML = request.httpRequest.responseText;							
		}
	}
}



/*
 인바디 정보 저장하기 
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
	
	 유효성 검사 
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
			"id="+id+"&age="+age+"&sex="+sex+"&height="+height+"&weight="+weight+"&bmi="+bmi);
	request.sendRequest();
}
function inbodyInsertProcessResult(){	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			document.getElementById("inbodySaveDiv").innerHTML = request.httpRequest.responseText;					
		}
	}
}
*/
function termcalc(){
	/*등록일의 날짜를 가져와 기간의 개월수로 계산*/
	var year = insertForm.selectStartYear.value;
	var month = parseInt(insertForm.selectStartMonth.value)-1;
	var day = insertForm.selectStartDay.value;
	
	var term = insertForm.termselect.value;
	
	//선택한 개월을 더해 계산해야함
	var startdate =  new Date(year,month,day);
	startdate.setDate(startdate.getDate()+(parseInt(term)*30));
	
	insertForm.expiYear.value = startdate.getFullYear();
	insertForm.expiMonth.value = startdate.getMonth()+1;
	insertForm.expiDay.value = startdate.getDate();
	
	
	request = new Request(expichange, "expirechange.do", "POST", 
			"year="+insertForm.expiYear.value
			+"&month="+insertForm.expiMonth.value
			+"&day="+insertForm.expiDay.value);
	
	request.sendRequest();
}

function expichange(){
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			document.getElementById("expichange").innerHTML = request.httpRequest.responseText;					
		}
	}
}

//지울까 고민중
function numOnly(){
	if(event.keyCode>=48 && event.keyCode>=58){
		event.returnValue=false;
	}
}

/* 스케줄 정보 디비저장하기 */
function scheduleInsertProcess(){
	var bool = true;
	//id
	var id = insertForm.scheduleId.value;
	//성별
	var sex = insertForm.sex.value;
	//시작일 년월일
	var start = insertForm.selectStartYear.value+"-"
				+insertForm.selectStartMonth.value+"-"
				+insertForm.selectStartDay.value;
	//종료일 년월일
	var end = insertForm.expiYear.value+"-"
				+insertForm.expiMonth.value+"-"
				+insertForm.expiDay.value;
	// 운동 종류
	var routineType = insertForm.routineType.value;
	
	scheduleSaveDiv.innerHTML="저장중..";
	request = new Request(scheduleInsertProcessResult, "scheduleInsertProcess.do", "POST", 
			"id="+id+"&sex="+sex+"&start="+start+"&end="+end+"&routineType="+routineType);
	request.sendRequest();
	
}
function scheduleInsertProcessResult(){
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			document.getElementById("scheduleSaveDiv").innerHTML = request.httpRequest.responseText;
			$("#memberRoutineArea").show();
		}
	}
}


function onPartChangeHandler(event, rowIndex, columnIndex) {
	var selectedExPartIdVal = $(event.target).find(":selected").val();
	var selectedExPartIdText = $(event.target).find(":selected").text();
	
	console.log("onPartChangeHandler - selectedExPartIdVal : " + selectedExPartIdVal);
	console.log("onPartChangeHandler - selectedExPartIdText : " + selectedExPartIdText);
	console.log("onPartChangeHandler - rowIndex : " + rowIndex);
	console.log("onPartChangeHandler - columnIndex : " + columnIndex);
	
	$.ajax({
		type: "POST",
		url: "exerciseOption.do",
		data: "ex_part_id=" + selectedExPartIdVal,
		success: function(responseText) {
//			console.log(responseText);
			$(".exercise_method" + "." + rowIndex + "_" + columnIndex).empty();
			$(".exercise_method" + "." + rowIndex + "_" + columnIndex).html(responseText);
		}
	});
}

function saveExercise() {
	
	var memberRoutineList = new Array();

	$(".ex_part_id").each(function(exPartIdIndex, exPartIdItem) {
		var selectedExPartIdClass = $(exPartIdItem).attr('class');
		var selectedExPartIdDay = selectedExPartIdClass.substr(selectedExPartIdClass.length-3 , selectedExPartIdClass.length);
		var selectedExPartIdVal = $(exPartIdItem).find(":selected").val();
		var selectedExPartIdText = $(exPartIdItem).find(":selected").text();
		
		if(selectedExPartIdVal == "") {
			return;
		}
		
		console.log("saveExercise - selectedExPartIdClass : " + selectedExPartIdClass);
		console.log("saveExercise - selectedExPartIdDay : " + selectedExPartIdDay);
		console.log("saveExercise - selectedExPartIdVal : " + selectedExPartIdVal);
		console.log("saveExercise - selectedExPartIdText : " + selectedExPartIdText);
		
		var exerciseMethodSelector = selectedExPartIdClass.replace("ex_part_id", "exercise_method").replace(/ /g, ".");
		
		$("." + exerciseMethodSelector).each(function(exerciseMethodIndex, exerciseMethodItem) {
			var selectedExerciseMethodClass = $(exerciseMethodItem).attr('class');
			var selectedExerciseMethodDay = selectedExerciseMethodClass.substr(selectedExerciseMethodClass.length-3 , selectedExerciseMethodClass.length);
			var selectedExerciseMethodVal = $(exerciseMethodItem).find(":selected").val();
			var selectedExerciseMethodText = $(exerciseMethodItem).find(":selected").text();
			
			if(selectedExerciseMethodVal == "") {
				return;
			}
			
			console.log("saveExercise - selectedExerciseMethodClass : " + selectedExerciseMethodClass);
			console.log("saveExercise - selectedExerciseMethodDay : " + selectedExerciseMethodDay);
			console.log("saveExercise - selectedExerciseMethodVal : " + selectedExerciseMethodVal);
			console.log("saveExercise - selectedExerciseMethodText : " + selectedExerciseMethodText);
			
			var memberRoutineItem = new Object();
			memberRoutineItem.day = selectedExerciseMethodDay;
			memberRoutineItem.exercise_id = selectedExerciseMethodVal;
			
			memberRoutineList.push(memberRoutineItem);
			
		});
		
	});
	
	if(memberRoutineList.length == 0) {
		return;
	}
	
//	console.log(memberRoutineList);
//	console.log(JSON.stringify(memberRoutineList));
	
	
				
	$.ajax({
		type: "post",
		url: "insertMemberRoutine.do",
		data: "id=" + $("#scheduleId").val() + "&memberRoutineList=" + JSON.stringify(memberRoutineList),
		success: function(responseText) {
			if(responseText != null){
				
				//저장완료알림	있어야함
				location.href = 'memberSearch.do';
		  }
			
		}
	});
	
}
/*
success: function(responseText) {	//이거는 처리된 jsp의 글자들
	  //div id
	  if(responseText != null){
		 $("#adminchat").html(responseText);	  	        
        $("#adminchat").find("script").eval;
	  }         	        
}
*/

