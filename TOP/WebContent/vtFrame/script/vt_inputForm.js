/**
 * 
 */

var request = null;


var msg_emailerror = "이메일이 유효하지 않습니다";
var msg_wait = "전송중";
var msg_send = "전송완료";
var msg_mailconfirmerror = "인증번호가 유효하지 않습니다. \n 다시 입력하세요.";
var msg_emptyerror = "인증번호를 입력하세요."; 
var msg_wait = "전송중...";
var msg_send = "전송 완료";
var msg_iderror = "아이디를 입력 해주세요!";
var msg_passwderror = "비밀번호를 입력 해주세요!";
var msg_repasswderror = "비밀번호를 확인 해주세요!";
var msg_nameerror = "이름을 입력 해주세요!";
var msg_nicknameerror = "닉네임을 입력 해주세요!";
var msg_emailerror = "이메일을 입력 해주세요!";
var msg_emailsenderror = "인증번호를 입력 해주세요!";
var msg_emailsendcheckerror = "인증번호를 확인 해주세요!";
var msg_idcheckerror = "사용할 수 없는 아이디 입니다!";
var msg_nickcheckerror = "사용할 수 없는 닉네임 입니다!";

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
//아이디 중복체크
function confirmid(obj){
	
	if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
	        || event.keyCode == 46 ) return;
	    //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
	    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');

	
	request = new Request(confirmidResult, "idConfirm.do", "POST", "id="+inputform.id.value);	
	request.sendRequest();
}


function confirmidResult(){
	var userId = document.getElementById("userId");
	var userId_overlap = document.getElementById("userId_overlap");
	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			if(!inputform.id.value){
				userId.innerHTML = msg_iderror;				
			}else{
				if(request.httpRequest.responseText == 0){								
					inputform.idConfirm.value="1";
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
		
		userPasswd.style.display = ""; //파란거 출력
		userPasswd_overlap.style.display = "none";//빨간거 숨기기	
		
	//비밀번호와 재입력 비밀번호가 일치한다면
	}else if(inputform.passwd.value == inputform.repasswd.value){
		userPasswd.innerHTML = msg_passwdok;
							
		userPasswd.style.display = ""; //파란거 출력 ex)비밀번호가 일치합니다
		userPasswd_overlap.style.display = "none"; //빨간거 숨기기	
		
		
	}else if( inputform.passwd.value && ! inputform.repasswd.value )	{
		userPasswd_overlap.innerHTML =msg_repasswd;
		
		userPasswd_overlap.style.display = ""; //파란거 숨기기
		userPasswd.style.display = "none"; 
	
		//비밀번호와 재입력 비밀번호가 일치하지 않을 경우	
	}else{
		
		userPasswd_overlap.innerHTML = msg_repasswderror;

		userPasswd_overlap.style.display = ""; //파란거 숨기기
		userPasswd.style.display = "none"; //빨간거 출력 ex)비밀번호가 다릅니다	
	}				
}

// 닉네임 중복확인
function confirmnick(){	
	request = new Request(confirmnickResult, "nickConfirm.do", "POST", "nick="+inputform.nickname.value);	
	request.sendRequest();
	
}
function confirmnickResult(){
	
	var userNick = document.getElementById("userNick");
	var userNick_overlap = document.getElementById("userNick_overlap");
	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			
			if(!inputform.nickname.value){				
				userNick.innerHTML = msg_nickerror;		
			}else{			
				if(request.httpRequest.responseText == 0){
					inputform.nickConfirm.value="1";					
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


//*********************ajax 아이디,비번,닉네임 중복확인 끝*********************	
//*********************자동 포커싱 시작*********************


function inputformfocus() {
	inputform.id.focus();
}

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
//*********************자동 포커싱 끝*********************
//**********************이메일 시작**********************
function mailconfirm(){
	if(! inputform.email1.value || ! inputform.email2.value){
		alert(msg_emailerror);
		inputform.email1.focus();
		return false;
	}else{
		if(inputform.email1.value){			
			var email = inputform.email1.value;
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
			else{
				//전체에서 @가 있다면(뒤에 @붙은 이메일을 주므로)
				if(email.match('@')!=null){
					alert(msg_emailerror);
					inputform.email1.focus();
					return false;
				}
			}
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
			emailResultText.innerHTML = "전송완료!";
			emailResult.innerHTML = request.httpRequest.responseText;
			
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
		inputform.email_send.focus();		
		return false;
	}
	else if(inputform.email_send.value == inputform.equal.value){
		emailResultText.innerHTML = "인증완료!";
		inputform.emailConfirm.value = 1;
		return false;
	}
}
//**********************이메일 끝**********************
//**********************주소 시작**********************
function serchadr() {
	var url = "zipCheck.do";
	open(url, "zipCheck", "scrollbars = yes, status = yes, width = 600, height = 500");
}

function useadr(first, second, adr){
	opener.document.inputform.zipcode1.value = first;
	opener.document.inputform.zipcode2.value = second;
	opener.document.inputform.adr.value = adr;
	opener.document.inputform.detail_adr.focus();
	self.close();
	opener.document.inputform.adrcheck.value = 1;
}
//**********************주소 끝**********************
//**********************필수항목 입력 확인 시작**********************
function inputcheck(){
	if(!inputform.id.value){
		alert(msg_iderror);
		inputform.id.focus();
		return false;
	}
	else if(!inputform.passwd.value){
		alert(msg_passwderror);
		inputform.passwd.focus();
		return false;
	}
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
	else if(!inputform.nickname.value){
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
	}
	else if(inputform.emailConfirm.value == 0){
		alert(msg_emailsenderror);
		inputform.email_send.focus();
		return false;
	}
	else if(inputform.idConfirm.value==0){
		alert(msg_idcheckerror);
		inputform.id.focus();
		return false;
	}
	else if(inputform.nickConfirm.value==0){
		alert(msg_nickcheckerror);
		inputform.nickname.focus();
		return false;
	}
}
//**********************필수항목 입력 확인 끝**********************
/*


var request = null;
var project = "/Visual/member/";


//	* inputForm	* //

//아이디 중복체크
function confirmid(obj){
	
	if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
	        || event.keyCode == 46 ) return;
	    //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
	    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');

	
	request = new Request(confirmidResult, "logonConfirmId.do", "POST", "id="+inputform.id.value);	
	request.sendRequest();
}
function confirmidResult(){
	var userId = document.getElementById("userId");	
	
	var userId_overlap = document.getElementById("userId_overlap");
	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			if(!inputform.id.value){
				userId.innerHTML = msg_iderror;
			}else{
				if(request.httpRequest.responseText == 0){
					inputform.confirm.value="1";					
					userId.innerHTML = inputform.id.value + " 는 사용할 수 있습니다.";	
					
					userId.style.display = "";	
					userId_overlap.style.display = "none";								
				}else{	
					inputform.confirm.value="0";					
					userId_overlap.innerHTML = inputform.id.value + " 는 사용할 수 없습니다.";
					
					userId_overlap.style.display = "";			
					userId.style.display = "none";	
				}	
			}					
		}
	}	
}

*/