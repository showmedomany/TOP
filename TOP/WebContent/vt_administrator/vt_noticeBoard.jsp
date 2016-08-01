<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file = "setting.jsp" %>   

<body class="vt_noticeBoardBody">
	<div class="vt_noticeBoard_main">
		
		<c:if test="${sessionScope.authority_id==1}">
			<a href="noticeBoard.do">공지사항 게시판</a>
			 |<a> aaaa </a>
			 |<a> bbbb </a>
			 <br><br>
		 </c:if>
		
		<jsp:include page="${adminBoardPage}.jsp" flush="false"></jsp:include>	
	</div>
</body>