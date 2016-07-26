/**
 * 
 */

var request = null;


var msg_iderror = "아이디를 입력하세요.";
var msg_passwderror = "비밀번호를 입력하세요.";
var msg_passwdok = "비밀번호가 일치합니다.";
var msg_repasswd="비밀번호 재입력하세요";
var msg_repasswderror = "비밀번호가 다릅니다.";




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

