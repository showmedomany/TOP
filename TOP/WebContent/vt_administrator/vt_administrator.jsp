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
		
		<div id = "administrator_top" >
			<div>			
				<jsp:include page="${top }.jsp" flush="false"></jsp:include>
			</div>		
		</div>
		<br>
		<div id = "adminchat">
			
		</div>
		
		<div id = "administrator_center">	
			<div>
				<!-- 가운데 부분만 jsp를 갈아 끼운다. -->
				<jsp:include page="${center }.jsp" flush="false"></jsp:include>
			</div>
		</div>	
		<c:if test="${bottom!=null}">
		<div id = "administrator_bottom">	
			<div>				
				<jsp:include page="${bottom}.jsp" flush="false"></jsp:include>				
			</div>
		</div>	
		</c:if>
	</body>
</html>