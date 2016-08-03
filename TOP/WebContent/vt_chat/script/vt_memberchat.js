/**
 * 
 */

var request = null;
//*********************ajax 아이디,비번,닉네임 중복확인 시작*********************
//버튼을 눌러 상담을 요청하면 실행되어야함


function chatFormFocus(){
	window.focus();
	receivechat();
	chatForm.content.focus();
}

$(
		function(){
			setInterval("receivechat()", 1000);
		}
);

function sendtext(){
	sendmsg();
	chatForm.content.value = "";
	chatForm.content.focus();
	return false;
}

function sendmsg(){	
	if(chatForm.content.value){
		var params = "ip="+chatForm.ip.value
				+"&id="+chatForm.id.value
				+"&content="+encodeURI(chatForm.content.value);
		chatForm.content.value = "";
		chatForm.content.focus();
		request = new Request(sendreq, "memberRequestChat.do", "POST", params);	
		request.sendRequest(); 
	}
}

function sendreq(){	
	var chatarea = document.getElementById("chatarea");	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			chatarea.innerHTML = request.httpRequest.responseText;				
		}
	}	
}

function receivechat(){	
	var params = "ip="+chatForm.ip.value+"&id="+chatForm.id.value;
	request = new Request(showchat, "receiveChat.do", "POST", params);	
	request.sendRequest();
}

function showchat(){	//뿌릴 채팅내역을 담고있는 vt_chatPro.jsp를 vt_memberchat의 div에 넣는다.
	var chatarea = document.getElementById("chatarea");	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			chatarea.innerHTML = request.httpRequest.responseText;			
		}
	}	
}


function exitchat(){
	var params = "ip="+chatForm.ip.value;
	
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











