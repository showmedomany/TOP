<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>	
	<title>비주얼탑 홈페이지에 오신것을 환영합니다.</title>	
	</head>
	
	<body>
		<div id = "top" >
			<div>
				<jsp:include page="vt_topForm.jsp"></jsp:include>
			</div>		
		</div>
		<div id = "center">	
			<div>
				<!-- 가운데 부분만 jsp를 갈아 끼운다. -->
				<jsp:include page="${center}.jsp"></jsp:include>
			</div>
		</div>
		<div id = "bottom">
			<div>
				<jsp:include page="vt_bottomForm.jsp"></jsp:include>
			</div>
		</div>
	</body>
</html>