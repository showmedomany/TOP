<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<c:forEach var="cdto" items="${clist}">
	<c:if test="${cdto.id==id}">		
		<b class = "me">${cdto.content} : ${"나"}</b><br>
	</c:if>
	<c:if test="${cdto.id!=id}">
		${cdto.id} : ${cdto.content}<br>
	
	</c:if>
</c:forEach>

