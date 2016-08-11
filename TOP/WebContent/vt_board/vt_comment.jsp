<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<div class = "commentform">코멘트(${commentcount})</div>
<c:forEach var="cdto" items="${clist}">	
	<div class ="comment_info"><b>${cdto.nick}</b> (${cdto.reg_date})</div>
	<c:if test="${nickname eq cdto.nick }">
		<input type = "button" value = "삭제" onclick = "deletecomment('${cdto.comment_id}','${cdto.num}')">
	</c:if>		
	<div class = "comment_content"><br>${cdto.content}</div>
	
</c:forEach>
