<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
    
<html>
	<head>
		<script src = "${jquery}"></script>
		<script src = "${request}"></script>
		<script src = "${script}vt_adminchat.js"></script>		
</html>
		
	</head>	
	<body onUnload = "exitchat()" onload="adminChatFormFocus()">
		<form name = "adminchatForm" onsubmit = "return sndtext()">
			<input type = "hidden" name = "ip" value = "${ip}">
			<input type = "hidden" name = "id" value = "${id}">
			<div id = "chatarea">${ip}//${id}</div>
			<input type = "text" name = "inputarea">
			<input type = "button" value = "전송" onclick = "adminsndmsg()">
		</form>
	</body>
</html>