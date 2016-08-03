<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<c:forEach var="rdto" items="${rlist}">
	<script type = "text/javascript">
		//<!--
		var a = ${rdto.ip};
		alert(a);
		var url = "responseChat.do?ip="+${rdto.ip}+"&id="+${rdto.id};
		open(url, "_blank", 
				'scrollbars=no,resizable=no, menubar=yes, status=yes, width=600, height=500 ')
		//-->
	</script>
</c:forEach>
