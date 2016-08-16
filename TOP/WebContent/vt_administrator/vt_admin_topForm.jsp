<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<html>			
	<head>
		
		<script src = "${jquery}"></script>
		<script src = "${script}vt_admin_topForm.js"></script>
		<link href = "${css}vt_admin_topFormStyle.css" rel="stylesheet"	type="text/css">			
	</head>
	
	<body>	
		<div class="admin_top_frame">
			<div class="admin_top_header" style="height: 20px;">
				<div class="admin_top_header_atag_line">
					<div class="admin_top_header_atag_form">
						<!-- 관리자  -->						
						${sessionScope.memId}						
						<a class="admin_top_header_atag_font"
							href = "main.do">홈페이지</a>
						<a class="admin_top_header_atag_font" 
							href = "logoutPro.do">로그아웃</a>
					</div>
				</div>			
				
			</div>
		</div>		
	</body>
</html>