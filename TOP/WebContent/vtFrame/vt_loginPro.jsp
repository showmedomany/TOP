<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<!-- 한글써진 부분 setting.jsp로 옮겨야함 -->

<html>
	<head>
	
	</head>
	
	<body>
		<!-- 아이디 없음 -->
		<c:if test="${loginCheck eq 0}">
			<script type = "text/javascript">
				//<!--
				alert("아이디 없음");
				history.back();
				//-->
			</script>
		</c:if>
		<!-- 비밀번호 틀림 -->
		<c:if test="${loginCheck eq -1}">
			<script type = "text/javascript">
				//<!--
				alert("비밀번호 틀림");
				history.back();
				//-->
			</script>
		</c:if>
		<!-- 로그인 하면 세션에 ID랑 권한 넘김 -->
		<c:if test="${loginCheck eq 1 }">
			${sessionScope.memId = id}
			${sessionScope.authority_id = authority_id}
			<c:redirect url = "main.do"/>
		</c:if>
	
	</body>
</html>