<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<html>
	<head>
		<link href = "${css}vt_freewriteFormStyle.css" rel="stylesheet"	type="text/css">
		<script src = "${script}freeboard.js"></script>
	</head>
	
	<body onload = "freeWriteFocus()">
		<form method = "post" name = "freeWriteForm" 
			action = "vt_freeWritePro.do" onsubmit="return checkblank()">
			<input type = "hidden" name = "id" value = "${sessionScope.memId}">
			<input type = "hidden" name = "nickname" value = "${sessionScope.nickname}">
			<input type = "hidden" name = "pageNum" value = "${pageNum}">
			
			<div class="name">
			자유게시판 게시글 작성
				<div class="list" onclick="location = 'noticeBoard.do'">
					목록
				</div>
			</div>
			<div class="header">
				<div class="sub_wrap">
					<div class="subject">
						제목&nbsp;:&nbsp;<input class = "input" type = "text" name = "subject" maxlength = "50">
					</div>
				</div>
				<div class="writer_wrap">
					<div class="writer">
						작성자&nbsp;:&nbsp;${sessionScope.memId}
					</div>
				</div>
			</div>
			<div class="center">
				<div class="text_wrap">
					<textarea class="textarea" name = "content"></textarea>
				</div>
			</div>
			<div class="bottom">
				<div class="btn_wrap">
					<input class = "inputbutton" type = "submit" value = "작성완료">
					<input type = "button" value = "취소" onclick = "history.back()">
				</div>	
			</div>		
		</form>
	</body>
</html>