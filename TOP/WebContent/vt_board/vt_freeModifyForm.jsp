<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<html>
	<head>
	
	</head>
	<body>
		<form method = "post" 
			action = "vt_freeModifyPro.do" name = "vt_freeModifyPro">
			<input type = "hidden" name = "num" value = "${num}">
			<input type = "hidden" name = "pageNum" value = "${pageNum}">
			
			<div>
				제목: <input type = "text" name = "subject" value = "${bdto.subject}"><br>
				작성자는 고정: ${bdto.nickname}<br>
				내용: <input type = "text" name = "content" value = "${bdto.content}"><br>	
				
				<input type = "submit" value = "수정">
				<input type = "button" value = "취소" onclick = "location = 'vt_freeContent.do?pageNum=${pageNum}'">
			</div>
		</form>
	</body>
</html>