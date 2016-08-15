<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
    
<html>
	<head>
		<script src = "${jquery}"></script>
		<script src = "${request}"></script>
		<script src = "${script}vt_adminchat.js"></script>
		<link href = "${css}chat.css" rel = "stylesheet" type = "text/css">
	</head>	
	<body onUnload = "exitchat()" onload="adminChatFormFocus()">
		<div class="chatDiv">
			<form name = "adminchatForm" onsubmit = "return sndtext()">
				<input type = "hidden" name = "ip" value = "${ip}">
				<input type = "hidden" name = "id" value = "${id}">
				<div class="chatBanner"><span class="chatBannertText">채팅상담</span></div>
				
				<div class="chatTop" id="chatTop">
						<div id = "chatarea"></div>						
				</div>
				
				
				<div class="chatBottom">
						<input class="chatContent" type = "text" name = "inputarea" onkeydown="chatkeydown()">
						<div class="chatButton" onclick = "adminsndmsg()"><span class="chatButtonText">전송</span></div>						
				</div>
			</form>
		</div>
	</body>
</html>


<!-- 원본 -->
<%--
<html>
	<head>
		<script src =   "${jquery}"></script>
		<script src = "${request}"></script>
		<script src = "${script}vt_adminchat.js"></script>
	</head>	
	<body onUnload = "exitchat()" onload="adminChatFormFocus()">
		<form name = "adminchatForm" onsubmit = "return sndtext()">
			<input type = "hidden" name = "ip" value = "${ip}">
			<input type = "hidden" name = "id" value = "${id}">
			
			<div id = "chatarea"></div>
			<input type = "text" name = "inputarea">
			<input type = "button" value = "전송" onclick = "adminsndmsg()">
		</form>
	</body>
</html>
--%>  