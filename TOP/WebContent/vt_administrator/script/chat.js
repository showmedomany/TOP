/**
 * 
 */
var request = null;

$(
	//administor.jsp(관리자페이지)가 실행되면 계속해서 searchRequest()를 수행
	function(){		
		setInterval("searchRequest()", 1000);
	}
);

//request테이블을 검색할 schRequest.do 핸들러로 이동하며 결과는 getrequest()에서 받아 administor.jsp에 결과를 출력해준다.
function searchRequest(){
	var params = "";
	request = new Request(getrequest, "schRequest.do", "POST", params);
	request.sendRequest();
}

//schRequest.do를 실행하여 결과를 받는 jsp을 가지고 돌아와 id가 adminchat인 div에 jsp에 출력된 결과를 삽입하는 펑션
function getrequest(){
	var adminchat = document.getElementById("adminchat");	//jsp의 결과를 text로 받을 div
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			adminchat.innerHTML = request.httpRequest.responseText;
		}
	}
}