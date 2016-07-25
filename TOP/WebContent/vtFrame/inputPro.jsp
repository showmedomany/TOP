<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<!-- 한글써진 부분 setting.jsp로 옮겨야함 -->

<html>
	<head>
	
	</head>
	
	<body>
		<!-- 아이디 없음 -->
		<c:if test="${insertResult eq 0}">
			<script type = "text/javascript">
				//<!--
				alert("가입 실패");
				history.back();
				//-->
			</script>
		</c:if>		
		
		<c:if test="${loginCheck ne 0 }">
			<!-- 회원가입후 로그인페이지로 이동 -->			
			<c:redirect url = "loginForm.do"/>
		</c:if>
	
	</body>
</html>