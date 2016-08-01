<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<script src="${script }vt_noticeBoardWriteForm.js" type="text/javascript"></script>

<body>
	<form method="post" action="noticeBoardWritePro.do" name="NBWriteForm" onsubmit="return noticeBoardWriteCheck()">
		<table border="1">
			<tr>							
				<th>아이디</th>
				<td>${sessionScope.memId }</td>
				<th>제목</th>
				<td><input type="text" name="subject"></td>
			</tr>			
			<tr>
				<th>내용</th>
				<td colspan="3"> <textarea name="content" class="content" rows="20" cols="50"></textarea></td>
				
			</tr>
			<tr>
				<td colspan="4" align="center">
					<div id="writeFormCheckDiv">			
					</div>				
				</td>				
			</tr>
					
			<tr>
				<td colspan="4" align="center">
					<input type="submit" value="등록">
					<input type="button" value="취소" onclick="location = 'noticeBoard.do'">					
				</td>
			</tr>
		</table>	
	</form>
</body> 





