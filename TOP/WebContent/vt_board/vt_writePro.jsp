<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<h2> 처리 </h2>
<html>
	<head>
	
	
	</head>
	<body>
		test: ${result }	
		<c:if test="${result == 0 }">
			<script type = "text/javascript">
				<!--
					erroralert(writeerror);
				//-->			
			</script>
		</c:if>

		<c:if test="${result < 0 }">
			<c:if test="${pageNum > 0 }">
			
			  
				<c:redirect url = "main.do?pageNum=${pageNum }"/>
				
			</c:if>
		</c:if>
		
	</body>
</html>


















