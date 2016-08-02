<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<c:if test="${updateArticleResult!=0}">
	글이 수정 되었습니다.
	<meta http-equiv="refresh" content="2; url=noticeBoard.do?pageNum=${pageNum }">
</c:if>
<c:if test="${updateArticleResult==0}">	
	글 수정에 실패하였습니다.
	<meta http-equiv="refresh" content="2; url=noticeBoard.do?pageNum=${pageNum }">
</c:if>

