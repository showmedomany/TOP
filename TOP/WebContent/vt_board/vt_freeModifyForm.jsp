<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<html>
	<head>
		<script src = "${script}board.js"></script>
	</head>
	<body onload = "freeModifyFocus()">
		<form method = "post" 
			action = "vt_freeModifyPro.do" 
			name = "vt_freeModifyPro">
			<input type = "hidden" name = "num" value = "${num}">
			<input type = "hidden" name = "pageNum" value = "${pageNum}">
			
			<div>
				<table border="1">
					<tr>
						<th>
							제목:
						</th>
						<th>
							<input type = "text" name = "subject" value = "${bdto.subject}">
						</th>
					</tr>
					<tr>
						<th>
							작성자:
						</th>
						<th>
							${bdto.nickname}
						</th>
					</tr>
					<tr>
						<th>
							내용:
						</th>
						<th>
							<input type = "text" name = "content" value = "${bdto.content}">
						</th>
					</tr>
					<tr>
						<th colspan="2">
							<input type = "submit" value = "수정">
							<input type = "button" value = "취소" onclick = "location = 'vt_freeContent.do?pageNum=${pageNum}&num=${num}'">
						</th>
					</tr>					
				</table>				
			</div>
		</form>
	</body>
</html>