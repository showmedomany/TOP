<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<!-- 한글로 된부분 setting.jsp로 옮겨야함 -->

<html>
	<link href = "${css}vt_FrameStyle.css" rel = "stylesheet" type = "text/css">
	<head>	
		<title>비주얼탑 홈페이지에 오신것을 환영합니다.</title>	
		<%-- <script src = "${script}vtFrame.js"></script> --%>
	</head>
	<!-- 홈페이지 시작시 작은 채팅창 생성 -->	
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
</html>