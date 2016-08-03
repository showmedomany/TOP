<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<html>
	<head>
		<script src = "${jquery}"></script>
		<script src = "${request}"></script>
		<script src="${script}vt_memberchat.js"></script>
		<link href = "${css}chat.css" rel = "stylesheet" type = "text/css">
		
	</head>	
	<body onUnload = "exitchat()" onload = "chatFormFocus()">		
		<form name = "chatForm" onsubmit = "return sendtext()" >
			<input type = "hidden" name = "ip" value = "${ip}">
			<input type = "hidden" name = "id" value = "${id}">
			<table border="1">
			<tr>
				<td>
					<div id = "chatarea" style="overflow:auto"></div>
				</td>
			</tr>
			<tr>
				<td>
					<input type = "text" name = "content">
					<input type = "button" value = "전송" onclick = "sendmsg()">
				</td>
			</tr>
			</table>		
			
			
		</form>
	</body> 
</html>