
/*주소찾기*/
function searchAdr(){
	/* modify 버전 */
	var url = "zipCheck.do?choice=modify";
	window.open(url, "zipCheck", 
			'scrollbars=no,resizable=no, menubar=yes, status=yes, width=600, height=500 ');
}
/* 비밀번호 검사 */
function comparepasswd(){
	var userPasswd = document.getElementById("userPasswd");	//div 출력 설정
	var userPasswd_overlap = document.getElementById("userPasswd_overlap");
		
	//비밀번호칸이 비워져 있으면
	if(!memberModifyForm.passwd.value){
		userPasswd.innerHTML = "비밀번호를 확인해주세요";
		userPasswd.style.display = ""; 				//파란거 출력
		userPasswd_overlap.style.display = "none";	//빨간거 숨기기	
	}	
	//비밀번호는 있는데 비밀번호 확인이 비어있다면
	else if(!memberModifyForm.repasswd.value)	{
		userPasswd_overlap.innerHTML ="비밀번호 확인을 해주세요";		
		userPasswd_overlap.style.display = ""; 		//파란거 숨기기
		userPasswd.style.display = "none"; 			//빨간	
	}
	//비밀번호가 다 찾는데 맞지 않다면
	else if(memberModifyForm.passwd.value != memberModifyForm.repasswd.value){		
		userPasswd_overlap.innerHTML = "확인비밀번호와 다릅니다.";
		userPasswd_overlap.style.display = ""; //파란거 숨기기
		userPasswd.style.display = "none"; //빨간거 출력 ex)비밀번호가 다릅니다	
	}
	//비밀번호와 재입력 비밀번호가 일치한다면
	else{
		userPasswd.innerHTML = "사용가능한 비밀번호입니다.";
		userPasswd.style.display = "";				//파란거 출력 ex)비밀번호가 일치합니다
		userPasswd_overlap.style.display = "none";	//빨간거 숨기기	
	}
}

/*
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
*/

/* 메일공란 체크 */
function mailCheck(){
	var userMail = document.getElementById("userMail");
	if(!memberModifyForm.email1.value || !memberModifyForm.email2.value){
		userMail.style.display = "";
		userMail.innerHTML = "이메일을 입력하세요";
	}else{
		userMail.style.display = "none";
	}
}
/* 전화번호공란 체크 */
function phoneCheck(){
	var userPhone = document.getElementById("userPhone");
	if(!memberModifyForm.tel1.value && !memberModifyForm.tel2.value && !memberModifyForm.tel3.value){
		userPhone.style.display = "none";
	}else{
		if(!memberModifyForm.tel1.value || !memberModifyForm.tel2.value || !memberModifyForm.tel3.value){
			userPhone.style.display = "";
			userPhone.innerHTML = "전화번호를 입력하세요";
		}else{
			userMail.style.display = "none";
		}
	}
}

/* 유효성 검사 */
function modifyCheck(){
	/*비밀번호 비어있으면*/
	if(!memberModifyForm.passwd.value){
		alert("비밀번호를 확인하세요");
		memberModifyForm.passwd.focus();
		return false;	
	}
	/*비밀번호 확인이 비어있으면*/
	else if(!memberModifyForm.repasswd.value){
		alert("비밀번호 확인을 해주세요");
		memberModifyForm.repasswd.focus();
		return false;
	}
	/*비밀번호와 비밀번호 확인이 틀리면*/
	else if(memberModifyForm.passwd.value != memberModifyForm.repasswd.value){
		alert("비밀번호와 확인비밀번호가 다릅니다.");
		memberModifyForm.passwd.focus();
		return false;
	}	
	else if(!memberModifyForm.email1.value){			
		memberModifyForm.email1.focus();
		return false;
	}else if(!memberModifyForm.email2.value){	
		memberModifyForm.email2.focus();
		return false;
	}else if (confirm("회원정보를 수정하시겠습니까?")){
		return true;
	}	
}

function deleteMember(){	
	if(confirm("회원을 탈퇴하시겠습니까?")){
		location.href = 'memberDelete.do';
	}
}

function weekSchedule(number){	
	var weekScheduleResult = document.getElementById("weekScheduleResult");	
	if(number==1){		
		weekScheduleResult.innerHTML = "<table><tr><td>운동이름을 클릭하면 운동정보를 확인할 수 있습니다.</td></tr><tr class='tableTr'><th style='width: 950px;'>월요일 운동 순서</th>"
		document.getElementById("routineMonday").style.display = "";
		document.getElementById("routineTuesday").style.display = "none";
		document.getElementById("routineWednesday").style.display = "none";
		document.getElementById("routineThursday").style.display = "none";
		document.getElementById("routineFriday").style.display = "none";
		document.getElementById("routineSaturday").style.display = "none";
		document.getElementById("routineSunday").style.display = "none";
		document.getElementById("exeriseInfo").style.display = "none";				
	}else if(number==2){
		weekScheduleResult.innerHTML = "<table><tr><td>운동이름을 클릭하면 운동정보를 확인할 수 있습니다.</td></tr><tr class='tableTr'><th style='width: 950px;'>화요일 운동 순서</th>"
		document.getElementById("routineMonday").style.display = "none";
		document.getElementById("routineTuesday").style.display = "";
		document.getElementById("routineWednesday").style.display = "none";
		document.getElementById("routineThursday").style.display = "none";
		document.getElementById("routineFriday").style.display = "none";
		document.getElementById("routineSaturday").style.display = "none";
		document.getElementById("routineSunday").style.display = "none";
		document.getElementById("exeriseInfo").style.display = "none";
		
	}else if(number==3){
		weekScheduleResult.innerHTML = "<table><tr><td>운동이름을 클릭하면 운동정보를 확인할 수 있습니다.</td></tr><tr class='tableTr'><th style='width: 950px;'>수요일 운동 순서</th>"
		document.getElementById("routineMonday").style.display = "none";
		document.getElementById("routineTuesday").style.display = "none";
		document.getElementById("routineWednesday").style.display = "";
		document.getElementById("routineThursday").style.display = "none";
		document.getElementById("routineFriday").style.display = "none";
		document.getElementById("routineSaturday").style.display = "none";
		document.getElementById("routineSunday").style.display = "none";
		document.getElementById("exeriseInfo").style.display = "none";
	}else if(number==4){
		weekScheduleResult.innerHTML = "<table><tr><td>운동이름을 클릭하면 운동정보를 확인할 수 있습니다.</td></tr><tr class='tableTr'><th style='width: 950px;'>목요일 운동 순서</th>"
		document.getElementById("routineMonday").style.display = "none";
		document.getElementById("routineTuesday").style.display = "none";
		document.getElementById("routineWednesday").style.display = "none";
		document.getElementById("routineThursday").style.display = "";
		document.getElementById("routineFriday").style.display = "none";
		document.getElementById("routineSaturday").style.display = "none";
		document.getElementById("routineSunday").style.display = "none";
		document.getElementById("exeriseInfo").style.display = "none";
	}else if(number==5){
		weekScheduleResult.innerHTML = "<table><tr><td>운동이름을 클릭하면 운동정보를 확인할 수 있습니다.</td></tr><tr class='tableTr'><th style='width: 950px;'>금요일 운동 순서</th>"
		document.getElementById("routineMonday").style.display = "none";
		document.getElementById("routineTuesday").style.display = "none";
		document.getElementById("routineWednesday").style.display = "none";
		document.getElementById("routineThursday").style.display = "none";
		document.getElementById("routineFriday").style.display = "";
		document.getElementById("routineSaturday").style.display = "none";
		document.getElementById("routineSunday").style.display = "none";
		document.getElementById("exeriseInfo").style.display = "none";
	}
	else if(number==6){
		weekScheduleResult.innerHTML = "<table><tr><td>운동이름을 클릭하면 운동정보를 확인할 수 있습니다.</td></tr><tr class='tableTr'><th style='width: 950px;'>토요일 운동 순서</th>"
		document.getElementById("routineMonday").style.display = "none";
		document.getElementById("routineTuesday").style.display = "none";
		document.getElementById("routineWednesday").style.display = "none";
		document.getElementById("routineThursday").style.display = "none";
		document.getElementById("routineFriday").style.display = "none";
		document.getElementById("routineSaturday").style.display = "";
		document.getElementById("routineSunday").style.display = "none";
		document.getElementById("exeriseInfo").style.display = "none";
	}
	else if(number==7){
		weekScheduleResult.innerHTML = "<table><tr><td>운동이름을 클릭하면 운동정보를 확인할 수 있습니다.</td></tr><tr class='tableTr'><th style='width: 950px;'>일요일 운동 순서</th>"
		document.getElementById("routineMonday").style.display = "none";
		document.getElementById("routineTuesday").style.display = "none";
		document.getElementById("routineWednesday").style.display = "none";
		document.getElementById("routineThursday").style.display = "none";
		document.getElementById("routineFriday").style.display = "none";
		document.getElementById("routineSaturday").style.display = "none";
		document.getElementById("routineSunday").style.display = "";
		document.getElementById("exeriseInfo").style.display = "none";
	}
}

function exeriseInfo(name){
	var spanList = document.getElementsByTagName("span");
	
	request = new Request(exeriseInfoResult, "myPageExeriseInfoPrint.do", "POST", "name="+encodeURI(name));	
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