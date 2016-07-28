<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<html>
	<head>
		<script src = "${jquery}"></script>
		<script src = "${script}vt_administrator.js"></script>
		<title>관리자 페이지</title>
		
		
	</head>
	<body>	<!-- 불려지면 상담요청이 들어왔는지 DB를 검색한다. -->
		<div id = "administrator_top" >
			<div>
				<jsp:include page="vt_admin_topForm.jsp" flush="false"></jsp:include>
			</div>		
		</div>
		<div id = "administrator_center">	
			<div>
				<!-- 가운데 부분만 jsp를 갈아 끼운다. -->
				<jsp:include page="${center }.jsp" flush="false"></jsp:include>
			</div>
		</div>
		<div id = "administrator_bottom">
			<div>
				<jsp:include page="/vtFrame/vt_bottomForm.jsp" flush="false"></jsp:include>
			</div>
		</div>	
	</body>
</html>