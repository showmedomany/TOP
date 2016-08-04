<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${deleteResult!=0}">
	회원 탈퇴가 처리되었습니다.
	
	<c:remove var="memId" scope="session"/>
	<c:remove var="authority_id" scope="session"/>
	<c:remove var="nickname" scope="session"/>
	<meta http-equiv="refresh" content="2; url=main.do">
</c:if>
<c:if test="${deleteResult==0}">	
	회원 탈퇴에 실패하였습니다.<br> 잠시 후 다시 하십시오.	
	<meta http-equiv="refresh" content="2; url=myPageView.do">
</c:if>
    