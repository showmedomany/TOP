<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result==0}">
	저장 실패
</c:if>
<c:if test="${result==1}">
	저장 완료	
</c:if>
<c:if test="${result==2}">
	저장 완료
	<meta http-equiv="refresh" content="2; url=memberSearch.do">
</c:if>

 