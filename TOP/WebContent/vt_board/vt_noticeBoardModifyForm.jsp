<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<html>
	<head>
		<script src="${script}noticeboard.js" type="text/javascript"></script>
		<link href = "${css}vt_noticewriteFormStyle.css" rel="stylesheet"	type="text/css">
	</head>
	<body onload="noticemodifyfocus()">
		<form method="post" name="NBModifyForm" action="noticeBoardModifyPro.do?pageNum=${pageNum}&num=${num}"
			onsubmit="return noticeBoardModifyCheck()">
			<div class="name">
				공지사항 게시글 수정
				<div class="list" onclick="location = 'noticeBoard.do'">
					목록
				</div>
			</div>
			<div class="header">
				<div class="sub_wrap">
					<div class="subject">
						제목&nbsp;:&nbsp;<input type="text" name="subject" value="${noticeBoardData.subject }">
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
					<textarea class="textarea" name="content">${noticeBoardData.content }</textarea>
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




