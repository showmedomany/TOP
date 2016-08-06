<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<c:if test="${result eq 0 }">
	<script type = "text/javascript">
	 	//<!--
	 	alert("수정안됨");
	 	//-->
	</script>	
	<meta http-equiv = "refresh" 
		content = "0; url = vt_community_free.do?pageNum=${pageNum}">
</c:if>

<c:if test="${result ne 0}">
	<c:redirect url = "vt_community_free.do?pageNum=${pageNum}"/>
</c:if>