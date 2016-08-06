<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<html>
	<head>
		<link href = "${css}vt_freewriteFormStyle.css" rel="stylesheet"	type="text/css">
		<script src = "${script}freeboard.js"></script>
	</head>
	
	<body onload = "freeModifyFocus()">
		<form method = "post" 
			action = "vt_freeModifyPro.do" 
			name = "vt_freeModifyPro">
			<input type = "hidden" name = "num" value = "${num}">
			<input type = "hidden" name = "pageNum" value = "${pageNum}">
			
			<div class="name">
			자유게시판 수정
			<div class="list" onclick="location = 'vt_community_free.do'">
				목록
			</div>
		</div>
		<div class="header">
			<div class="sub_wrap">
				<div class="subject">
					제목&nbsp;:&nbsp;<input type = "text" name = "subject" value = "${bdto.subject}">
				</div>
			</div>
			<div class="writer_wrap">
				<div class="writer">
					작성자&nbsp;:&nbsp;${bdto.nickname}
				</div>
			</div>
		</div>
		<div class="center">
			<div class="text_wrap">
				<textarea class="textarea" name="content">${bdto.content}</textarea>
			</div>
		</div>
		<div class="bottom">
			<div class="btn_wrap">
				<input class = "inputbutton" type = "submit" value = "작성완료">
			</div>	
		</div>
		</form>
	</body>
</html>