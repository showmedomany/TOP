<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>   

<html>
	<head>	
		<title>관리자 페이지</title>
		<script src = "${jquery}"></script>
		<script src = "${request}"></script>
		<script src = "${script}chat.js"></script>		
	</head>
	<body>
		<form name = "admin">
			<input type = "hidden" name = "chatcount" value = "0">			
		</form>
			
		<div id = "administrator_top" >
			<div>			
				<jsp:include page="vt_admin_topForm.jsp" flush="false"></jsp:include>
			</div>		
		</div>
		<br>
		<div id = "adminchat">			
		</div>
		
		<div id = "administrator_center">	
			<div>
				<!-- 가운데 부분만 jsp를 갈아 끼운다. -->
				<jsp:include page="${center}.jsp" flush="false"></jsp:include>
			</div>
		</div>	
		<div id = "administrator_bottom">	
			<div>				
				<jsp:include page="/vtFrame/vt_bottomForm.jsp" flush="false"></jsp:include>				
			</div>
		</div>			
	</body>
</html>