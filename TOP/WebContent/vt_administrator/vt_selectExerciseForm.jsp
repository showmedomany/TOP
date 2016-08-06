<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
[
<c:forEach var="item" items="${list}" varStatus="status">
	{
		"EXERCISE_ID": ${item.EXERCISE_ID},
		"EX_PART_ID": ${item.EX_PART_ID},
		"NAME": "${item.NAME}",
		"MACHINE": "${item.MACHINE}",
		"METHOD1": "${item.METHOD1}",
		"METHOD2": "${item.METHOD2}",
		"METHOD3": "${item.METHOD3}",
		"METHOD4": "${item.METHOD4}"
	}
	<c:if test="${!status.last}">
		,
	</c:if>
</c:forEach>
]