<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %> 
<script src="${script}vt_noticeBoardContent.js" type="text/javascript"></script>

<body>
	<form>
		<table border="1">
			<tr>
				<th>게시물번호</th>
				<td>${noticeBoardData.num }</td>			
				<th>아이디</th>
				<td>${noticeBoardData.id }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${noticeBoardData.subject }</td>			
				<th>조회수</th>
				<td>${noticeBoardData.readcount }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><pre>${noticeBoardData.content }</pre></td>
				
			</tr>
			<tr>
				<th>입력시간</th>
				<td colspan="3">${noticeBoardData.reg_date }</td>				
			</tr>
			<c:if test="${noticeBoardData.id == memId}">
				<tr>
					<td colspan="4" align="center">
						<input type="button" value="수정" onclick="location = 'noticeBoardModifyForm.do?num=${num}&pageNum=${pageNum}'">
						<input type="button" value="삭제" onclick="isDeleteData(${num}, ${pageNum})">
					</td>
				</tr>
			</c:if>
			
		
		
		</table>	
	</form>
</body> 

<br>
<jsp:include page="vt_noticeBoardList.jsp" flush="false"></jsp:include>	




