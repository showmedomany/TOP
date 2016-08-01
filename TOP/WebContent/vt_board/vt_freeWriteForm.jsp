<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
	<head>
	</head>
	<body>
		<form method = "post" action = "vt_freeWritePro.do">
			<input type = "hidden" name = "id" value = "${sessionScope.memId}">
			<input type = "hidden" name = "nickname" value = "${sessionScope.nick}">
			<input type = "hidden" name = "pageNum" value = "${pageNum}">
			<div>
				${sessionScope.nick}
				<br>
				<br>
				${sessionScope.memId}
				<br>
				<br>
				글쓰기폼<br>
				넘어온 페이지 : ${pageNum}<br>
				<br>
				<br>
				제목:
				<input type = "text" name = "subject">
				<br>
				내용:
				<input type = "text" name = "content">
				<br>
				<br>
				<input type = "submit" value = "작성">
				<input type = "button" value = "취소">
			</div>
		</form>
	</body>
</html>