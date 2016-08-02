<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:if test="${insertArticleResult!=0}">
	글이 작성 되었습니다.
	<meta http-equiv="refresh" content="2; url=noticeBoard.do">
</c:if>
<c:if test="${insertArticleResult==0}">	
	글 작성에 실패하였습니다.
	<meta http-equiv="refresh" content="2; url=noticeBoard.do">
</c:if>

