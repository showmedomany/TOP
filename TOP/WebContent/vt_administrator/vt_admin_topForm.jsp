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
			<div class="admin_top_header">
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
				
				<!-- 한글로 써진 부분 전부 setting의 탑메뉴 문자열로 보내야함 -->
				<div class="top_navi_frame">
					<div class="top_navi">
						<ul>  
							 
							<li class="admin_top_navi_menuframe">  
								<div class="admin_top_navi_menu"
									onclick="location = 'memberSearch.do'">회원 관리</div>
								<ul class="admin_top_navi_subframe">  
									<li onclick="location = 'memberSearch.do'">회원 검색</li>
									<li onclick="location = 'admin_input.do'">홈페이지 등록</li>
								</ul>  
							</li> 
							
							<li class="admin_top_navi_menuframe">  
								<div class="admin_top_navi_menu">게시판 관리</div>
								<ul class="admin_top_navi_subframe">  
									<li>공지사항</li>  
									<li>빈공간</li>  
								</ul>  
							</li>							
						</ul> 
					</div>
				</div>
			</div>
		</div>		
	</body>
</html>