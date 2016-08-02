<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
공지사항 게시판 테스트중
authority_id:  ${authority_id }<br>

<body>
	<form>
		<table border="1">
			<tr>	
				<c:if test="${authority_id==1}">		
					<td colspan="4">
					전체글 : ${articleCount }
					</td>				
					<td>
						<a href="noticeBoardWriteForm.do">공지사항 쓰기</a>
					</td>	
				</c:if>
				<c:if test="${authority_id!=1}">
					<td colspan="5">
						전체글 : ${articleCount }
					</td>
				</c:if>					
			</tr>
			<tr>
				<th>글 번호</th>
				<th>글 제목</th>
				<th>조회수</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:if test="${articleCount != 0 }">
				<c:forEach var="i" begin="0" end="${noticeBoardDataList.size()-1 }" step="1">
					<c:set var="noticeBoardData" value="${noticeBoardDataList[i] }"/>
					<tr>
						<td>${noticeBoardData.num}</td>
						<td><a href="noticeBoardContent.do?num=${noticeBoardData.num}&pageNum=${pageNum}">${noticeBoardData.subject}</a></td>
						<td>${noticeBoardData.readcount}</td>
						<td>${noticeBoardData.id}</td>
						<td>${noticeBoardData.reg_date }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${articleCount==0}">
				<tr>
					<td colspan="5">
						게시글이 없습니다.
					</td>
				</tr>
			</c:if>
		</table>
		<table>
			<tr>
				<td>
					<c:forEach var="i" begin="1" end="${pageCount}" step="1">
						<a href="noticeBoard.do?pageNum=${i}">[${i }]&nbsp;</a>	
					</c:forEach>
				</td>
			</tr>		
		</table>
	</form>
</body>

