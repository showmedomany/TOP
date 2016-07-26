<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='cnt' value="0"/>
<c:set var="exeriseLength" value="${exeriselist.size()}"/>
<c:forEach var="i" begin="0" end="${exeriseLength-1}" step="1">
	<c:set var='exeriseData' value="${exeriselist.get(i)}"/>
	<c:if test="${exeriseData.ex_part_id == partId}">		
		<p onclick="exeriseInfo(${cnt})">${exeriseData.name}</p>
		<c:set var='cnt' value="${cnt+1}"/>
	</c:if>
</c:forEach>
