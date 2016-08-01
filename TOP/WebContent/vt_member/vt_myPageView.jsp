<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>    

<html>
	<head>
	<meta charset="UTF-8">
		<title>myPageView</title>
		<link href="${css}vt_myPageViewStyle.css" rel="stylesheet"	type="text/css">
		<link href="${css}vt_ex_routineStyle.css" rel="stylesheet"	type="text/css">
		<link href="${css}vt_centerPaymentInfoStyle.css" rel="stylesheet"	type="text/css">
	</head>
	<body>
		<div class="vt_myPageView_body">			
			<div class="vt_myPageView_body_subject"> 
			
				| <a href="myPageView.do?choice=0">센터결제정보</a> 
				| <a href="myPageView.do?choice=1">참조 운동정보</a>
				| <a href="myPageView.do?choice=2">달성률</a>
				| <a href="myPageView.do?choice=3">회원정보</a>
				| <a href="myPageView.do?choice=4">회원탈퇴</a> | 
			</div>		
			<jsp:include page="${myPageSuject}.jsp"></jsp:include>
		</div>
	</body>
</html>