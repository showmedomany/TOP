<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	
	</head>
	<body>
		<c:if test="${result == 0 }">
			<script>
				//<!--
				alert("삭제실패");
				//-->
			</script>
			<meta http-equiv = "refresh" 
				content = "0; url = vt_community_free.do?pageNum=${pageNum}">
		</c:if>
		
		<c:if test="${result == 1 }">
			<c:redirect url = "vt_community_free.do?pageNum=${pageNum}"/>
		</c:if>		
	</body>
</html>