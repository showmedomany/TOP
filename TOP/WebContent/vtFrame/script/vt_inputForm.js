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
}*/