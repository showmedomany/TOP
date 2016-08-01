<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
			<!-- 회원가입이 되었다는 알림이 있으면 좋을듯 -->			
			<c:redirect url = "loginForm.do"/>
		</c:if>
	
	</body>
</html>