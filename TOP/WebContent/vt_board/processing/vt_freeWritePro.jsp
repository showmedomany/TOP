<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result eq 0 }">
	<script type = "text/javascript">
		//<!--
			alert("안들어감");
		//-->			
	</script>
</c:if>

<c:if test="${result ne 0 }">
	
	<c:if test="${pageNum > 0 }">			
		<c:redirect url = "vt_community_free.do"/>
	</c:if>
</c:if>