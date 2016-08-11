<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file = "setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link href = "${css}vt_noticeBoardWritePro.css" rel="stylesheet"	type="text/css">
<c:if test="${updateArticleResult!=0}">
	<div class="border">
		<img src="${images}modc.png">
	</div>
	<meta http-equiv="refresh" content="1; url=noticeBoard.do">
</c:if>
<c:if test="${updateArticleResult==0}">	
	<div class="border">
		<img src="${images}modf.png">
	</div>
	<meta http-equiv="refresh" content="1; url=noticeBoard.do">
</c:if>


