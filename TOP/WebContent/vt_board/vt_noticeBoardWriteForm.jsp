<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<script src="/TOP/vt_board/script/board.js" type="text/javascript"></script>
<link href = "${css}vt_writeFormStyle.css" rel="stylesheet"	type="text/css">
<body>
	<div class = "writeFormFrame">
		<div class = "writeFormTop"></div>
		<form method="post" action="noticeBoardWritePro.do" name="NBWriteForm" onsubmit="return noticeBoardWriteCheck()">
			<table>
				<tr>
					<th> ${sessionScope.memId }</th>
					<td>
						<input class = "input" type = "text" name = "writer"
							maxlength = "10" style="width:285px">
					</td>
				</tr>
				<tr>
					<th> 제목 </th>
					<td>
						<input class = "input" type = "text" name = "subject"
						maxlength = "50" style = "width : 285px">
					</td>
				</tr>
					
				<tr>
					<th> 글내용</th>
					<td>
						<textarea  name = "content" 
						rows="10" cols="50" ></textarea>
					</td>
				</tr>
				<tr>
					<th colspan = "2">
						<input class = "inputbutton" type = "submit" value = "작성완료">
						<input class = "inputbutton" type= "button" value="취소" onclick="location = 'noticeBoard.do'">
					</th>
				</tr>
			
			</table>		
		</form>
	</div>
</body> 





