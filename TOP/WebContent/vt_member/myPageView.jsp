<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<link href = "${css}myPageStyle.css" rel="stylesheet"	type="text/css">

	<!-- 메뉴 -->
	<jsp:include page="${top}.jsp" flush="false"></jsp:include>
	
<div class="myPage">	
	<!-- 사이드 메뉴 -->
	<div class="sideMenu">
		<jsp:include page="myPageSide.jsp" flush="false"></jsp:include>
	</div>
	
	
	<!-- 센터 -->
	<div class="myPageCenter">
		<jsp:include page="${center}.jsp" flush="false"></jsp:include>
	</div>
</div>
<div class="bottom">
	<!-- 하단 -->
	<jsp:include page="bottomForm.jsp" flush="false"></jsp:include>
</div>
