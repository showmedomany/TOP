<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<html>
	<head>
		<script src = "${jquery}"></script>
		<script src = "${request}"></script>
		<script src="${script}vt_memberchat.js"></script>
		
	</head>
	<body>		
		<form name = "chatForm">
			<input type = "hidden" name = "ip" value = "${ip}">
			<input type = "hidden" name = "id" value = "${id}">
					
			
			<br>
			<div id = "chatarea"></div>
			<input type = "text" name = "chatinput">
			<input type = "button" value = "전송" onclick = "sendmsg()">
		</form>
	</body>
</html>