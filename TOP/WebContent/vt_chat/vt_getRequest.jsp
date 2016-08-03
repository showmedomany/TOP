<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>


<script type = "text/javascript">
		//<!--		
		<c:forEach var="rdto" items="${rlist}">	
			var url = "responseChat.do?ip="+'${rdto.ip}'+"&id="+'${rdto.id}';
			open(url, "_blank", 
					'scrollbars=no,resizable=no, status=yes, width=600, height=500,left = 0, top = 0')	
					
			
		</c:forEach>
		//-->
</script>
