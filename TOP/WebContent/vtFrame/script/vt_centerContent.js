
$(
	function(){
		//권한이 관리자면 열지마라
		if(sessioncheck.authority.value != 1){
			window.open("memberChat.do", "name", 
				'scrollbars=no,resizable=no, menubar=yes, status=yes, width=330, height=290 ');
			/* 일반용 채팅창 크기 변경함 */
		}		
	}
);


