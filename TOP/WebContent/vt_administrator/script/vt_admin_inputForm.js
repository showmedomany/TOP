function inputformfocus() {
	alert(inputform.idConfirm.value);
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
}

function confirmid(obj){	
	obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');	
		    
	request = new Request(confirmidResult, "idConfirm.do", "POST", "id="+inputform.id.value);	
	request.sendRequest(); 
}

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



