<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
    
<html>
	<head>
	
	</head>
	<body>
		<form name = "adminchatForm">
			<input type = "hidden" name = "ip" value = "${ip}">
			<input type = "hidden" name = "id" value = "${id}">
			<div id = "chatarea">${ip}//${id}</div>
			<input type = "text" name = "inputarea">
			<input type = "button" value = "전송">
		</form>
	</body>
</html>