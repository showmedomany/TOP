<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${updateResult!=0}">
	회원정보가 수정되었습니다.
	<meta http-equiv="refresh" content="2; url=myPageView.do">
</c:if>
<c:if test="${updateResult==0}">	
	회원정보가 수정에 실패하였습니다.
	<meta http-equiv="refresh" content="2; url=myPageView.do">
</c:if>
    