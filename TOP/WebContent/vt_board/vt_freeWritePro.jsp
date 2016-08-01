<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<html>
	<head>
		
	</head>
	<body>
		<c:if test="${result eq 0 }">
			<script type = "text/javascript">
				//<!--
					alert("안들어감");
				//-->			
			</script>
		</c:if>
		
		<c:if test="${result ne 0 }">
			
			<c:if test="${pageNum > 0 }">			
				<c:redirect url = "vt_community_free.do?pageNum=${pageNum }"/>
			</c:if>
		</c:if>
	</body>
</html>