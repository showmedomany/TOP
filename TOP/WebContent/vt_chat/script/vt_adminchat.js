/**
 * 
 */
var request = null;

function adminChatFormFocus(){
	window.focus();
	admin_getchat();
	adminchatForm.inputarea.focus();
}

function sndtext(){
	adminsndmsg();
	return false;
}

function exitchat(){
	var params = "ip="+adminchatForm.ip.value;
	
	request = new Request(resultexit, "exitChat.do", "POST", params);
	request.sendRequest();
}

function resultexit(){
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			//아무것도 할 필요가 없다?		
		}
	}	
}

$(
		function(){
			setInterval("admin_getchat()", 1000);			
		} 
);


function admin_getchat(){
	var params = "ip="+adminchatForm.ip.value;	
	request = new Request(getresult, "admin_getchat.do", "POST", params);
	request.sendRequest();
}

function getresult(){	//뿌릴 채팅내역을 담고있는 vt_chatPro.jsp를 vt_memberchat의 div에 넣는다.
	var chatarea = document.getElementById("chatarea");	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			chatarea.innerHTML = request.httpRequest.responseText;			
		}
	}	
}

//adminsendmsg필요
function adminsndmsg(){
	if(adminchatForm.inputarea.value){
		var params = "ip="+adminchatForm.ip.value				
				+"&content="+encodeURI(adminchatForm.inputarea.value);
		adminchatForm.inputarea.value = "";
		adminchatForm.inputarea.focus();
		request = new Request(sndresult, "admin_sndmsg.do", "POST", params);	
		request.sendRequest(); 
	}
}

function sndresult(){
	var chatarea = document.getElementById("chatarea");	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			chatarea.innerHTML = request.httpRequest.responseText;				
		}
	}
}




