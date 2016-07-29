<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file = "setting.jsp" %>
<html>
	<head>
		<link href = "${css}vt_passwordFormStyle.css" rel = "stylesheet" type = "text/css">
	</head>
	<body>
		<form method = "post" name = "passwordForm" action = "modifyPro.do">	
			<div class = "vt_passwordForm_Frame">
				<div class = "vt_passwordForm_info">	</div>	
					<div class="vt_passwordForm_top_line"></div>
					<table class = "vt_passwordForm_table">
						<tr>
							<th colspan = "2">
								비밀번호를 입력 하셩~
							</th>
						</tr>
				
						<tr>
							<th>비밀번호</th>
							<td>
								<input class = "input" type = "password" name = "passwd"
									maxlength = "12">
							</td>
						</tr>
						<tr>
							<th colspan = "2">
								<input class = "inputbutton" type = "submit" value = "확인">
								<input class = "inputbutton" type = "button" value = "취소"
									onclick = "location = 'mainboard.do?pageNum=${pageNum}'">
							</th>
						</tr>
					</table>
					<div class = "vt_passwordForm_bottom_line"></div>
				</div>
		</form>
	</body>
</html>