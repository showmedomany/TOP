/**
 * 
 */
var request = null;

$(
	//administor.jsp(관리자페이지)가 실행되면 계속해서 searchRequest()를 수행
	function(){
		
		setInterval("searchRequest()", 2000);
		
	}
);

//request테이블을 검색할 schRequest.do 핸들러로 이동하며 결과는 getrequest()에서 받아 administor.jsp에 결과를 출력해준다.

function searchRequest(){
	var params = "";
	var url = "schRequest.do";
	getrequest(url,params);
}


function getrequest(url, params){
	   $.ajax({
	      type: "POST",
	      url: url,	//검색할 핸들러
	      data: params,	//데이터인데 나는 필요x
	      success: function(responseText) {	//이거는 처리된 jsp의 글자들
	    	  //div id
	    	  if(responseText != null){
	    		 $("#adminchat").html(responseText);	  	        
	 	         $("#adminchat").find("script").eval;
	    	  }         	        
	      }
	   });
	}

