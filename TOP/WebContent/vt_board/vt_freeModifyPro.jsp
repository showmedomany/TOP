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
			 	alert("수정안됨");
			 	//-->
			</script>	
			<meta http-equiv = "refresh" 
				content = "0; url = vt_community_free.do?pageNum=${pageNum}">
		</c:if>
		
		<c:if test="${result ne 0}">
			<c:redirect url = "vt_community_free.do?pageNum=${pageNum}"/>
		</c:if>
	</body>
</html>