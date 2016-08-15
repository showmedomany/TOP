
function inputformfocus() {
	inputform.id.focus();	
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

function comparepasswd(){

	var userPasswd = document.getElementById("userPasswd");	//div 출력 설정
	var userPasswd_overlap = document.getElementById("userPasswd_overlap");
		
	//비밀번호칸이 비워져 있으면
	if(!inputform.passwd.value){
		userPasswd.innerHTML = "비밀번호를 입력하세요";
		userPasswd.style.display = ""; 				//파란거 출력
		userPasswd_overlap.style.display = "none";	//빨간거 숨기기	
	}	
	//비밀번호는 있는데 비밀번호 확인이 비어있다면
	else if(!inputform.repasswd.value)	{
		userPasswd_overlap.innerHTML ="비밀번호를 확인해주세요";		
		userPasswd_overlap.style.display = ""; 		//파란거 숨기기
		userPasswd.style.display = "none"; 			//빨간	
	}
	//비밀번호가 다 찾는데 맞지 않다면
	else if(inputform.passwd.value != inputform.repasswd.value){		
		userPasswd_overlap.innerHTML = "비밀번호가 다릅니다.";
		userPasswd_overlap.style.display = ""; //파란거 숨기기
		userPasswd.style.display = "none"; //빨간거 출력 ex)비밀번호가 다릅니다	
	}
	//비밀번호와 재입력 비밀번호가 일치한다면
	else{
		userPasswd.innerHTML = "비밀번호가 확인되었습니다.";
		userPasswd.style.display = "";				//파란거 출력 ex)비밀번호가 일치합니다
		userPasswd_overlap.style.display = "none";	//빨간거 숨기기	
	}
}

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

function searchAdr(){
	var url = "zipCheck.do";
	//크기조정, 크기변경불가 등여기서 고침 근데 명령어가 안먹음
	window.open(url, "zipCheck",'resizable=no,width=600,height=500');
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

function checkmail(){
	//메일1창또는 메일2창이 비어있는경우
	if(! inputform.email1.value || ! inputform.email2.value){
		alert("메일을 확인해주세요");
		inputform.email1.focus();
		return false;
	}
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
					alert("메일을 확인해주세요");
					inputform.email1.focus();
					return false;
				}
			}
			//메일2의 값이 선택입력이라면
			else{
				//전체에서 @가 있다면(뒤에 @붙은 이메일을 주므로)
				if(email.match('@')!=null){
					alert("메일을 확인해주세요");
					inputform.email1.focus();
					return false;
				}

			}
			
			request = new Request(admin_mailok, "admin_mailcheck.do", 
					"POST", "email1="+inputform.email1.value+"&email2="+inputform.email2.value);	
			request.sendRequest();			
		}
	}
}

function admin_mailok(){
	var checkmail = document.getElementById("checkmail");;
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			if(request.httpRequest.responseText==1){//이미 있는 메일의 경우
				checkmail.innerHTML = "이미 가입된 메일입니다!! 확인해 주세요!";
			}
			else{
				checkmail.innerHTML = "가입 가능!!";
				inputform.emailConfirm.value = 1;
			}									
		}
	}
}

function sumitCheckfn(){
	//아이디 안쓰거나 확인 안한경우
	if(inputform.idConfirm.value==0){
		alert("아이디를 확인하세요");
		inputform.id.focus();
		return false;
	}
	//비밀번호 안씀
	else if(!inputform.passwd.value){
		alert("비밀번호를 확인하세요");
		inputform.passwd.focus();
		return false;
	}
	//비밀번호 썼는데 확인 틀림
	else if (inputform.passwd.value != inputform.repasswd.value){
		alert("비밀번호 확인을 해주세요");
		inputform.repasswd.focus();
		return false;
	}
	//이름 안씀
	else if(!inputform.name.value){
		alert("이름을 확인하세요");
		inputform.name.focus();
		return false;
	}
	//닉네임 안쓰거나 확인안함
	else if(inputform.nickConfirm.value==0){
		alert("닉네임을 확인하세요");
		inputform.nickname.focus();
		return false;
	}
	//이메일 안씀
	else if(!inputform.email1.value){
		alert("메일을 확인하세요");
		inputform.email1.focus();
		return false;
	}
	else if(inputform.emailConfirm.value == 0){
		alert("메일을 확인하세요");
		inputform.email1.focus();
		return false;
	}
}