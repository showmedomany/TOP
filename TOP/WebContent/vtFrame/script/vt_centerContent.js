
$(
	function(){
		//권한이 관리자면 열지마라
		if(sessioncheck.authority.value != 1){
			window.open("memberChat.do", "name", 
				'scrollbars=no,resizable=no, menubar=yes, status=yes, width=600, height=500 ');
		}		
	}
);


