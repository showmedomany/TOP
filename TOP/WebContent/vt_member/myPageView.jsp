<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link href = "${css}myPageView.css" rel="stylesheet"	type="text/css">
<script src="${script}myPageSide.js" type="text/javascript"></script>

	<!-- 메뉴 -->
	<jsp:include page="/vtFrame/vt_topForm.jsp"></jsp:include>
	<div class="center">
		<div class="side">
			<jsp:include page="myPageSide.jsp" flush="false"></jsp:include>
		</div>
		<div class="content">
			<jsp:include page="${center}.jsp" flush="false"></jsp:include>
		</div>
	</div>
	<div class="bottom">
		<jsp:include page="/vtFrame/vt_bottomForm.jsp"></jsp:include>
	</div>

	
	
	<%-- <div class="myPage">	
		<!-- 사이드 메뉴 -->
		<div class="sideMenu">
			<jsp:include page="myPageSide.jsp" flush="false"></jsp:include>
		</div>	
		<!-- 센터 -->
		<div class="myPageCenter">
			
		</div>
	</div> --%>