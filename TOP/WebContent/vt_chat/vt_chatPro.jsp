<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<c:forEach var="cdto" items="${chatlist}">
	<c:if test="${cdto.id==id}">
		${"나"} : ${cdto.chatting}<br>
	</c:if>
	<c:if test="${cdto.id!=id}">
		${cdto.id} : ${cdto.chatting}<br>
	</c:if>
</c:forEach>
