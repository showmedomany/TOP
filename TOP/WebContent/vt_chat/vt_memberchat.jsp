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
		<div class="chatDiv">
			<form name = "chatForm" onsubmit = "return sendtext()" >
				<input type = "hidden" name = "ip" value = "${ip}">
				<input type = "hidden" name = "id" value = "${id}">
					<div class="chatBanner"><span class="chatBannertText">채팅상담</span></div>
					
					<div class="chatTop">
						<div id = "chatarea"></div>						
					</div>
				
					<div class="chatBottom">
						<input class="chatContent" type = "text" name = "content" onkeydown="chatkeydown()">
						<div class="chatButton" onclick = "sendmsg()"><span class="chatButtonText">전송</span></div>											
					</div>
			</form>
		</div>
	</body>	
</html>
