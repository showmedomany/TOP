<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<html>
	<head>
		<link href = "${css}vt_loginFormStyle.css" rel = "stylesheet" type = "text/css">
	</head>
	<body>
		<form method = "post" action = "loginPro.do">
			<div class = "vt_loginForm_frame">
				
				<div class = "vt_loginForm_body">
					<div class = "vt_loginForm_title">
						<div>${str_visual}<span>${str_top}</span></div>						
					</div>
					<div class = "vt_loginForm_inputTable">
						<input type = "text" placeholder="user ID" name = "id">
						<br>
						<input type = "password" placeholder="password" name = "passwd">
						<br>
						<input type = "submit" value = "${str_loginbt}">
					</div>
					<div class = "vt_loginForm_atag">
						<a>${str_membership}</a>
						<a>${str_findidentity}</a>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>