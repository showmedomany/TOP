<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<h2>${page_modify }</h2>
<%
	int result = (Integer) request.getAttribute("result");
	String pageNum = (String) request.getAttribute("pageNum");
%>
	<c:if test="${result eq 0 }">
		<script type = "text/javascript">
		 	<!--
		 	alert(modifyerror);
		 	//-->
		</script>	
		<meta http-equiv = "refresh" 
			content = "0; url = mainboard.do?pageNum=${pageNum}">
	</c:if>
	
	<c:if test="${result ne 0}">
		<c:redirect url = "mainboard.do?pageNum=${pageNum }"/>
	</c:if>