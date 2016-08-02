/**
 * 
 */

var request = null;
//*********************ajax 아이디,비번,닉네임 중복확인 시작*********************
/*
$(
		function(){		
			setInterval("receivechat()", 1000);
		}
);
*/
function sendmsg(){
	//여기서는 추가로 채팅입력메세지를 보내야함
	if(chatForm.chatinput.value){
		var params = "ip="+chatForm.ip.value
				+"&id="+chatForm.id.value
				+"&content="+chatForm.chatinput.value;
		
		request = new Request(sendrequest, "memberRequestChat.do", "POST", params);	
		request.sendRequest(); 
	}
	
}

function sendrequest(){
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
								
		}
	}	
}
/*
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
*/













