
/*주소찾기*/
function searchAdr(){
	/* modify 버전 */
	var url = "zipCheck.do?choice=modify";
	window.open(url, "zipCheck", 
			'scrollbars=no,resizable=no, menubar=yes, status=yes, width=600, height=500 ');
}
/* 비밀번호 검사 */
function comparepasswd(){
	var userPasswd = document.getElementById("userPasswd");
	//비밀번호칸이 비워져 있으면
	if(!memberModifyForm.passwd.value){
		userPasswd.style.display = "";
		userPasswd.innerHTML = "비밀번호를 입력하세요.";		
	}	
	//비밀번호는 있는데 비밀번호 확인이 비어있다면
	else if(!memberModifyForm.repasswd.value)	{
		userPasswd.style.display = "";
		userPasswd.innerHTML ="비밀번호를 확인하세요.";		
	}
	//비밀번호가 다 찾는데 맞지 않다면
	else if(memberModifyForm.passwd.value != memberModifyForm.repasswd.value){
		userPasswd.style.display = "";
		userPasswd.innerHTML = msg_repasswderror;		
	}
	//비밀번호와 재입력 비밀번호가 일치한다면
	else{
		userPasswd.style.display = "none";
	}
}

//닉네임 중복확인
function confirmnick(){	
	request = new Request(confirmnickResult, "nickConfirm.do", "POST", "nick="+memberModifyForm.nickname.value);	
	request.sendRequest();	
}
// 닉네임 체크 중복확인
function confirmnickResult(){
	var userNick = document.getElementById("userNick");	
	var Nickname = memberModifyForm.Nickname.value;
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){			
			if(!memberModifyForm.nickname.value){//입력창이 비어있는경우
				userNick.style.display = "";
				userNick.innerHTML = "닉네임을 입력해주세요.";		
			}else{			
				if(request.httpRequest.responseText == 0){
					userNick.style.display = "none";
					memberModifyForm.nickConfirm.value="1";	//서밋할때 확인용					
				}else{
					if(Nickname != memberModifyForm.nickname.value){
						memberModifyForm.nickConfirm.value="0";	
						userNick.style.display = "";
						userNick.innerHTML = memberModifyForm.nickname.value + " 는 사용할 수 없습니다.";		
					}					
				}
			}			
		}
	}
}
/* 유효성 검사 */
function modifyCheck(){
	if(!memberModifyForm.passwd.value){
		memberModifyForm.passwd.focus();
		return false;	
	}else if(!memberModifyForm.repasswd.value){
		memberModifyForm.repasswd.focus();
		return false;
	}else if(memberModifyForm.passwd.value != memberModifyForm.repasswd.value){
		memberModifyForm.passwd.focus();
		return false;
	}else if(memberModifyForm.nickConfirm.value==0){
		memberModifyForm.nickConfirm.focus();
		return false;
	}else if(!memberModifyForm.detail_adr.value){
		memberModifyForm.detail_adr.focus();
		return false;
	}else if(!memberModifyForm.tel1.value){
		memberModifyForm.tel1.focus();
		return false;
	}else if(!memberModifyForm.tel2.value){
		memberModifyForm.tel2.focus();
		return false;
	}else if(!memberModifyForm.tel3.value){
		memberModifyForm.tel3.focus();
		return false;
	}else if(!memberModifyForm.email1.value){	
		memberModifyForm.email1.focus();
		return false;
	}else if(!memberModifyForm.email2.value){	
		memberModifyForm.email2.focus();
		return false;
	}else if (confirm("회원정보를 수정하시겠습니까?")){
		return true;
	}else{
		return false;
	}	
}

function exerciseInit(){
	document.getElementById("routineMonday").style.display = "none";
	document.getElementById("routineTuesday").style.display = "none";
	document.getElementById("routineWednesday").style.display = "none";
	document.getElementById("routineThursday").style.display = "none";
	document.getElementById("routineFriday").style.display = "none";
	document.getElementById("exeriseInfo").style.display = "none";
	
}

function weekSchedule(number){	
	var weekScheduleResult = document.getElementById("weekScheduleResult");	
	if(number==1){		
		weekScheduleResult.innerHTML = "<table><tr class='tableTr'><th style='width: 950px;'>월요일 운동 순서</th>"
		document.getElementById("routineMonday").style.display = "";
		document.getElementById("routineTuesday").style.display = "none";
		document.getElementById("routineWednesday").style.display = "none";
		document.getElementById("routineThursday").style.display = "none";
		document.getElementById("routineFriday").style.display = "none";
		document.getElementById("exeriseInfo").style.display = "none";
	}else if(number==2){
		weekScheduleResult.innerHTML = "<table><tr class='tableTr'><th style='width: 950px;'>화요일 운동 순서</th>"
		document.getElementById("routineMonday").style.display = "none";
		document.getElementById("routineTuesday").style.display = "";
		document.getElementById("routineWednesday").style.display = "none";
		document.getElementById("routineThursday").style.display = "none";
		document.getElementById("routineFriday").style.display = "none";
		document.getElementById("exeriseInfo").style.display = "none";
	}else if(number==3){
		weekScheduleResult.innerHTML = "<table><tr class='tableTr'><th style='width: 950px;'>수요일 운동 순서</th>"
		document.getElementById("routineMonday").style.display = "none";
		document.getElementById("routineTuesday").style.display = "none";
		document.getElementById("routineWednesday").style.display = "";
		document.getElementById("routineThursday").style.display = "none";
		document.getElementById("routineFriday").style.display = "none";
		document.getElementById("exeriseInfo").style.display = "none";
	}else if(number==4){
		weekScheduleResult.innerHTML = "<table><tr class='tableTr'><th style='width: 950px;'>목요일 운동 순서</th>"
		document.getElementById("routineMonday").style.display = "none";
		document.getElementById("routineTuesday").style.display = "none";
		document.getElementById("routineWednesday").style.display = "none";
		document.getElementById("routineThursday").style.display = "";
		document.getElementById("routineFriday").style.display = "none";
		document.getElementById("exeriseInfo").style.display = "none";
	}else if(number==5){
		weekScheduleResult.innerHTML = "<table><tr class='tableTr'><th style='width: 950px;'>금요일 운동 순서</th>"
		document.getElementById("routineMonday").style.display = "none";
		document.getElementById("routineTuesday").style.display = "none";
		document.getElementById("routineWednesday").style.display = "none";
		document.getElementById("routineThursday").style.display = "none";
		document.getElementById("routineFriday").style.display = "";
		document.getElementById("exeriseInfo").style.display = "none";
	}
}

/* 사용안함 나중에 삭제
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
}*/

function exeriseInfo(number){
	var spanList = document.getElementsByTagName("span");		
	var span = spanList.item(number).firstChild.nodeValue;
	
	
	request = new Request(exeriseInfoResult, "myPageExeriseInfoPrint.do", "POST", "name="+encodeURI(span));	
	request.sendRequest();	
}
function exeriseInfoResult(){
	var exeriseInfo = document.getElementById("exeriseInfo");
	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){	
			exeriseInfo.style.display = "";
			exeriseInfo.innerHTML = request.httpRequest.responseText;
		}
	}
}