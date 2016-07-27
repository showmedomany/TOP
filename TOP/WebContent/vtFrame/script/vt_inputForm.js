/**
 * 
 */

var msg_iderror = "아이디를 입력해주세요";
var msg_idcheckerror = "사용할 수 없는 아이디입니다";

var msg_passwderror = "비밀번호를 입력해주세요";
var msg_passwdok = "비밀번호 확인";
var msg_repasswderror = "비밀번호가 다릅니다";
var msg_repasswd = "비밀번호를 확인해주세요";

var msg_nameerror = "이름을 입력해주세요";

var msg_nickerror = "닉네임을 입력해주세요";
var msg_nickcheckerror = "사용할 수 없는 닉네임입니다";

var msg_emailerror = "이메일을 입력해주세요";
var msg_emailsenderror = "인증번호를 입력해주세요";
var msg_emailsendcheckerror = "인증번호를 확인해주세요";


var msg_emailerror = "이메일이 유효하지 않습니다";
var msg_wait = "전송중";
var msg_send = "전송완료";
var msg_mailconfirmerror = "인증번호가 유효하지 않습니다. \n 다시 입력하세요.";
var msg_emptyerror = "인증번호를 입력하세요."; 
var msg_wait = "전송중...";
var msg_send = "전송 완료";
var msg_ok = "인증 완료";
//////////////////////////////////////////////////////////////////////////

var request = null;
var emailResult = document.getElementById("emailResult");


//*********************ajax 아이디,비번,닉네임 중복확인 시작*********************

function Request( callback, url, method, params ){
	this.callback = callback;
	this.url = url;
	this.method = method;
	this.params = params;
	this.httpRequest = null;	
};

Request.prototype = {
		getXMLHttpRequest : function(){
			if(window.ActiveXObject){
				try{
					return new ActiveXObject("Msxml2.XMLHTTP");
				}catch(e){
					try{
						return new ActiveXObject("Microsoft.XMLHTTP");
					}catch(ex){
						return null;
					}
				}
			}else{
				try{
					return new XMLHttpRequest();
				}catch(e){
					return null;
				}
			}
		},
		sendRequest : function(){   
			this.httpRequest = this.getXMLHttpRequest();
			
			this.httpRequest.onreadystatechange = this.callback;
			
			var httpMethod = this.method ? this.method : "GET";
			if(httpMethod != "POST" && httpMethod != "GET"){
				httpMethod = "GET";
			}
			
			var httpParams = (this.params == null || this.params == "") ? "" : this.params;
			var httpUrl = (httpMethod == "GET") ? this.url + "?" + httpParams : this.url;
			
			this.httpRequest.open(httpMethod, httpUrl, true);
			this.httpRequest.setRequestHeader(
					"content-type", "application/x-www-form-urlencoded" );
			this.httpRequest.send(httpMethod == "POST" ? httpParams : null);			
		}
};

//input폼 시작시 포커싱
function inputformfocus() {
	inputform.id.focus();
}


//아이디 중복체크
function confirmid(obj){
	/*불필요한 기능 해당하는 키의 이벤트를 무시하라는 명령언데 입력창에서 저거 무시할 필요없음
	if(event.keyCode == 9 || event.keyCode == 37 
			|| event.keyCode == 39 || event.keyCode == 46 ){
		//9번 키코드 = 탭키
		//37번 키코드 = 왼쪽화살표키
		//39번 키코드 = 오른쪽화살표키
		//46번 키코드 = delete키
		//8번 키코드 = 백스페이스 이므로 무시하면 안됨
		return;
	}
	*/
	obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');	
		    
	request = new Request(confirmidResult, "idConfirm.do", "POST", "id="+inputform.id.value);	
	request.sendRequest(); 
}


//id체크AJax
function confirmidResult(){
	var userId = document.getElementById("userId");
	var userId_overlap = document.getElementById("userId_overlap");
	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			if(!inputform.id.value){//id이 비어있다면				
				userId.innerHTML = msg_iderror;				
			}else{
				if(request.httpRequest.responseText == 0){								
					inputform.idConfirm.value="1";	//서밋 할때 입력되었나 확인용
					userId.innerHTML = inputform.id.value + " 는 사용할 수 있습니다.";					
					userId.style.display = "";	
					userId_overlap.style.display = "none";				
				}else{	
					inputform.idConfirm.value="0";
					userId_overlap.innerHTML = inputform.id.value + " 는 사용할 수 없습니다.";
					userId_overlap.style.display = "";			
					userId.style.display = "none";	
				}	
			}					
		}
	}	
}

// 비밀번호 체크하기
function comparepasswd(){
	var userPasswd = document.getElementById("userPasswd");	//div 출력 설정
	var userPasswd_overlap = document.getElementById("userPasswd_overlap");
		
	//비밀번호칸이 비워져 있으면
	if(!inputform.passwd.value){
		userPasswd.innerHTML = msg_passwderror;
		userPasswd.style.display = ""; 				//파란거 출력
		userPasswd_overlap.style.display = "none";	//빨간거 숨기기	
	}	
	//비밀번호는 있는데 비밀번호 확인이 비어있다면
	else if(!inputform.repasswd.value)	{
		userPasswd_overlap.innerHTML =msg_repasswd;		
		userPasswd_overlap.style.display = ""; 		//파란거 숨기기
		userPasswd.style.display = "none"; 			//빨간	
	}
	//비밀번호가 다 찾는데 맞지 않다면
	else if(inputform.passwd.value != inputform.repasswd.value){		
		userPasswd_overlap.innerHTML = msg_repasswderror;
		userPasswd_overlap.style.display = ""; //파란거 숨기기
		userPasswd.style.display = "none"; //빨간거 출력 ex)비밀번호가 다릅니다	
	}
	//비밀번호와 재입력 비밀번호가 일치한다면
	else{
		userPasswd.innerHTML = msg_passwdok;
		userPasswd.style.display = "";				//파란거 출력 ex)비밀번호가 일치합니다
		userPasswd_overlap.style.display = "none";	//빨간거 숨기기	
	}
}


// 닉네임 중복확인
function confirmnick(){	
	request = new Request(confirmnickResult, "nickConfirm.do", "POST", "nick="+inputform.nickname.value);	
	request.sendRequest();	
}

// 닉네임 체크 Ajax
function confirmnickResult(){	
	var userNick = document.getElementById("userNick");
	var userNick_overlap = document.getElementById("userNick_overlap");
	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){			
			if(!inputform.nickname.value){//입력창이 비어있는경우			
				userNick.innerHTML = msg_nickerror;		
			}else{			
				if(request.httpRequest.responseText == 0){
					inputform.nickConfirm.value="1";	//서밋할때 확인용					
					userNick.innerHTML = inputform.nickname.value + " 는 사용할 수 있습니다.";						
					userNick.style.display = "";	
					userNick_overlap.style.display = "none";								
				}else{	
					inputform.nickConfirm.value="0";				
					userNick_overlap.innerHTML = inputform.nickname.value + " 는 사용할 수 없습니다.";					
					userNick_overlap.style.display = "";			
					userNick.style.display = "none";	
				}	
			}			
		}
	}
}



//주소검색 버튼 클릭
function searchAdr(){
	var url = "zipCheck.do";
	//크기조정, 크기변경불가 등여기서 고침
	open(url, "zipCheck", "scrollbars = yes, status = yes, width = 600, height = 500");	
}

//주소 선택시 inputform에 값 넣기
function useadr(first, second, adr) {
	opener.document.inputform.zipcode1.value = first;
	opener.document.inputform.zipcode2.value = second;
	opener.document.inputform.adr.value = adr;
	opener.document.inputform.detail_adr.focus();
	self.close();
}

//전화번호 입력창 포커싱
function nexttel1(){
	if(inputform.tel1.value.length == 3){
		inputform.tel2.focus();
	}
}
function nexttel2(){
	if(inputform.tel2.value.length == 4){
		inputform.tel3.focus();
	}
}
function nexttel3(){
	if(inputform.tel3.value.length == 4){
		inputform.email1.focus();
	}
}

//메일 확인
function mailconfirm(){
	//메일1창또는 메일2창이 비어있는경우
	if(! inputform.email1.value || ! inputform.email2.value){
		alert(msg_emailerror);
		inputform.email1.focus();
		return false;
	}
	//메일창들이 비어있지 않다면
	else{
		//메일1의 값이 있을경우
		if(inputform.email1.value){			
			var email = inputform.email1.value;
			//메일2의 값이 0, 즉 직접입력이라면
			if(inputform.email2.
					options[inputform.email2.selectedIndex].
					value=="0"){				
				//전체에서 @가 없다면
				if(email.match('@')==null){
					alert(msg_emailerror);
					inputform.email1.focus();
					return false;
				}
			}
			//메일2의 값이 선택입력이라면
			else{
				//전체에서 @가 있다면(뒤에 @붙은 이메일을 주므로)
				if(email.match('@')!=null){
					alert(msg_emailerror);
					inputform.email1.focus();
					return false;
				}
			}
			//메일전송에 포커싱
			inputform.email_send.focus();
			emailResultText.innerHTML = "전송중...";
			request = new Request(mailconfirmResult, "memberMailConfirm.do", 
					"POST", "email1="+inputform.email1.value+"&email2="+inputform.email2.value);	
			request.sendRequest();	
		}
	}
}

function mailconfirmResult(){
	var emailResult = document.getElementById("emailResult");;
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			if(request.httpRequest.responseText==1){//이미 있는 메일의 경우
				emailResultText.innerHTML = "이미 가입된 메일입니다!! 확인해 주세요!";
			}
			else{
				emailResultText.innerHTML = "전송완료!";
				emailResult.innerHTML = request.httpRequest.responseText;
			}									
		}
	}	
}

function emailcheck(){
	if(!inputform.email_send.value){
		//입력안하면 오류
		alert(msg_emptyerror);		
		inputform.email_send.focus();
		return false;
	}
	else if(inputform.email_send.value != inputform.equal.value){
		alert(msg_mailconfirmerror);
		inputform.email_send.value = "";
		inputform.emailConfirm.value = 0;
		inputform.email_send.focus();		
		return false;
	}
	else if(inputform.email_send.value == inputform.equal.value){
		emailResultText.innerHTML = "인증완료!";
		inputform.emailConfirm.value = 1;
		return false;
	}
}

function loaded(){ 
    window.setTimeout(CloseMe, 0);
}
function CloseMe(){
    window.close();
}

function sumitCheckfn(){
	//아이디 안쓰거나 확인 안한경우
	if(inputform.idConfirm.value==0){
		alert(msg_idcheckerror);
		inputform.id.focus();
		return false;
	}
	//비밀번호 안씀
	else if(!inputform.passwd.value){
		alert(msg_passwderror);
		inputform.passwd.focus();
		return false;
	}
	//비밀번호 썼는데 확인 틀림
	else if (inputform.passwd.value != inputform.repasswd.value){
		alert(msg_repasswderror);
		inputform.repasswd.focus();
		return false;
	}
	//이름 안씀
	else if(!inputform.name.value){
		alert(msg_nameerror);
		inputform.name.focus();
		return false;
	}
	//닉네임 안쓰거나 확인안함
	else if(inputform.nickConfirm.value==0){
		alert(msg_nickcheckerror);
		inputform.nickname.focus();
		return false;
	}
	//이메일 안씀
	else if(!inputform.email1.value){
		alert(msg_emailerror);
		inputform.email1.focus();
		return false;
	}
	//인증번호 확인 안함
	else if(inputform.emailConfirm.value == 0){
		alert(msg_emailsenderror);
		inputform.email_send.focus();
		return false;
	}
	
	
	
	/*
	if(!inputform.id.value){//이건 없어도 될듯
		alert(msg_iderror);
		inputform.id.focus();
		return false;
	}else if(!inputform.passwd.value){
		alert(msg_passwderror);
		inputform.passwd.focus();
		return false;
	}
	//비밀번호 썼는데 확인 틀림
	else if (inputform.passwd.value != inputform.repasswd.value){
		alert(msg_repasswderror);
		inputform.repasswd.focus();
		return false;
	}
	else if(!inputform.name.value){
		alert(msg_nameerror);
		inputform.name.focus();
		return false;
	}
	else if(!inputform.nickname.value){//얘도 없어도 될듯
		alert(msg_nicknameerror);
		inputform.nickname.focus();
		return false;
	}
	else if(!inputform.email1.value){
		alert(msg_emailerror);
		inputform.email1.focus();
		return false;
	}
	else if(!inputform.email_send.value){
		alert(msg_emailsenderror);
		inputform.email_send.focus();
		return false;
	}*/
	
}


