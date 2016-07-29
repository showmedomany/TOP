<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
	<h2>${page_delete }</h2>
	
	<c:if test="${resultCheck == 0}">
		<script>
			<!--
			erroralert(passwderror);
			//-->
		</script>
	</c:if>
	
	<c:if test="${resultCheck != 0 }">
		<c:if test="${result == 0 }">
			<script>
				<!--
				alert(deleteerror);
				//-->
			</script>
			<meta http-equiv = "refresh" 
				content = "0; url = mainboard.do?pageNum=${pageNum}">
		</c:if>
		
		<c:if test="${result == -1 }">
			<script>
				<!--
				alert(replyeerror);
				//-->
			</script>
			<meta http-equiv = "refresh" 
				content = "0; url = mainboard.do?pageNum=${pageNum}">
		</c:if>
		
		<c:if test="${result == 1 }">
			<c:redirect url = "mainboard.do?pageNum=${pageNum }"/>
		</c:if>
	</c:if>