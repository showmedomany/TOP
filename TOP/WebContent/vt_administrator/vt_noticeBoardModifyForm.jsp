<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %> 


<body>
	<form method="post" action="noticeBoardModifyPro.do?pageNum=${pageNum}&num=${num}" >
		<table border="1">
			<tr>							
				<th>아이디</th>
				<td>${sessionScope.memId }</td>
				<th>제목</th>
				<td><input type="text" name="subject" value="${noticeBoardData.subject }"></td>
			</tr>			
			<tr>
				<th>내용</th>
				<td colspan="3"> <textarea name="content" rows="20" cols="50">${noticeBoardData.content }</textarea></td>
				
			</tr>			
			<tr>
				<td colspan="4" align="center">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="location = 'noticeBoard.do'">					
				</td>
			</tr>
		</table>	
	</form>
</body> 





