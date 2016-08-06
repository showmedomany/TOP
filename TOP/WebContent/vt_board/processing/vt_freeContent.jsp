<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<input type = "hidden" name = "pageNum" value = "${pageNum}">

<div class="header">
	<div class="header_sub">
		<div class="subject">
			제목&nbsp;:&nbsp;${dto.subject }
			
		</div>
	</div>
	<div class="header_info">
		<p class="cont_p1">글번호&nbsp;:&nbsp;${dto.num }</p>
		<p class="cont_p2">작성자&nbsp;:&nbsp;${dto.id }</p>
		<p class="cont_p3">조회수&nbsp;:&nbsp;${dto.readcount+1}</p>
		<p class="cont_p4">작성일&nbsp;:&nbsp;${dto.reg_date}</p>
	</div>
</div>
<div class="content">
	${dto.content}
</div>
<c:if test="${dto.id == memId}">
	<div class="bottom">
			<input type = "button" value = "수정" onclick = "location = 'vt_freeModifyForm.do?num=${dto.num}&pageNum=${pageNum}'">
			<input type = "button" value = "삭제" onclick = "checkdelete(${dto.num},${pageNum})">
			<input type="button" value="댓글달기">
	</div>
</c:if>