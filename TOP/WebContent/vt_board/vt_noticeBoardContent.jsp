<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	
<div class="header">
	<div class="header_sub">
		<div class="subject">
			제목&nbsp;:&nbsp;${noticeBoardData.subject }
		</div>
	</div>
	<div class="header_info">
		<p class="cont_p1">글번호&nbsp;:&nbsp;${noticeBoardData.num }</p>
		<p class="cont_p2">작성자&nbsp;:&nbsp;${noticeBoardData.id }</p>
		<p class="cont_p3">조회수&nbsp;:&nbsp;${noticeBoardData.readcount+1}</p>
		<p class="cont_p4">작성일&nbsp;:&nbsp;${noticeBoardData.reg_date}</p>
	</div>
</div>
<div class="content">
	${noticeBoardData.content}
</div>
<div class="bottom">
	<c:if test="${noticeBoardData.id == memId}">	
		<input type="button" value="수정" onclick="location = 'noticeBoardModifyForm.do?num=${num}&pageNum=${pageNum}'">
		<input type="button" value="삭제" onclick="isDeleteData(${num}, ${pageNum})">	
	</c:if>
</div>




