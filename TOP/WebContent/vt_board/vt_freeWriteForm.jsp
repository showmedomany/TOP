<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<html>
	<head>
		<script src = "${script}board.js"></script>
	</head>
	<body onload = "freeWriteFocus()">
		<form method = "post" name = "freeWriteForm" 
			action = "vt_freeWritePro.do" onsubmit="return checkblank()">
			<input type = "hidden" name = "id" value = "${sessionScope.memId}">
			<input type = "hidden" name = "nickname" value = "${sessionScope.nickname}">
			<input type = "hidden" name = "pageNum" value = "${pageNum}">
			<div>
				<table border="1">
					<tr>
						<th>확인용닉네임 지워도 됨</th>
						<th>${sessionScope.nickname}</th>
					</tr>
					<tr>
						<th>확인용 아이디 지워도됨</th>
						<th>${sessionScope.memId}</th>
					</tr>
					<tr>
						<th colspan="2">
							글쓰기 폼
						</th>
					</tr>
					<tr>
						<th>
							제목:
						</th>
						<th>
							<input type = "text" name = "subject">
						</th>
					</tr>
					<tr>
						<th>
							내용:
						</th>
						<th>
							<input type = "text" name = "content">
						</th>
					</tr>
					<tr>
						<th colspan="2">
							<input type = "submit" value = "작성">
							<input type = "button" value = "취소" onclick = "history.back()">
						</th>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>