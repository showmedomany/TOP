<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result eq 0 }">
	<script type = "text/javascript">
		//<!--
			alert("DB문제");
		//-->			
	</script>
</c:if>

<c:if test="${result ne 0 }">
	저장완료
	<meta http-equiv="refresh" content="1; url=memberSearch.do">	
</c:if>