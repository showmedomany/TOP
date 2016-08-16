<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>


<script type = "text/javascript">
		//<!--
		var i = parseInt(admin.chatcount.value);
		<c:forEach var="rdto" items="${rlist}">
		 	i = i+20;
			var url = "responseChat.do?ip="+'${rdto.ip}'+"&id="+'${rdto.id}';
			open(url, "${rdto.ip}", 
					'scrollbars=no,resizable=no, status=yes, width=330, height=290,left='+i+', top='+i);	
			
			if(i>= 500){
				i=0;
			}
			admin.chatcount.value = i;
		</c:forEach>
		//-->
</script>
