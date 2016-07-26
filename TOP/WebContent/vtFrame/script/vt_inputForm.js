/**
 * 
 */
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
var msg_emailerror = "이메일이 유효하지 않습니다";
var msg_wait = "전송중";
var msg_send = "전송완료";
var msg_mailconfirmerror = "인증번호가 유효하지 않습니다. \n 다시 입력하세요.";
var msg_emptyerror = "인증번호를 입력하세요."; 
var msg_wait = "전송중...";
var msg_send = "전송 완료";
var msg_ok = "인증 완료";
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

function loaded(){ 
    window.setTimeout(CloseMe, 0);
}
function CloseMe(){
    window.close();
}

function mailconfirm(){
	if(! inputform.email1.value || ! inputform.email2.value){
		alert(msg_emailerror);
		inputform.email1.focus();
		return false;
	}
	else{
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
			/*window.location = "memberMailConfirm.do?email1="+inputform.email1.value
				+"&email2="+inputform.email2.value+"&="+inputform..value;*/
			
			window.location="memberMailConfirm.do?email1="+inputform.email1.value
							 +"&email2="+inputform.email2.value;
			
			/*var url = "memberMailConfirm.do?email1="+inputform.email1.value
			+"&email2="+inputform.email2.value+"&="+inputform..value;
			open(url, aaa,"status = yes, width = 1, height = 1,top=300,left=650");*/			
			inputform.email_send.focus();
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
		alert(msg_ok);
		return false;
	}
}
