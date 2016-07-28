<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>


<!-- 한글로 된부분 setting.jsp로 옮겨야함 제훈이씀 나안씀-->
<html>			
	<head>	
		<script src = "${jquery}"></script>	
		<link href = "${css}vt_admin_topFormStyle.css" rel="stylesheet"	type="text/css">
		<script src = "${script}vt_admin_topForm.js"></script>
			
	</head>
	
	<body>
		<div class="admin_top_frame">
			<div class="admin_top_header">
				<div class="admin_top_header_atag_line">
					<div class="admin_top_header_atag_form">
						<!-- 세션스코프의 권한 값이 널일때 -->
						${sessionScope.memId }					
						
						<!-- 마이페이지.do 를 a태그에 걸어줌 -->	
						<a href="main.do">메인페이지</a>
						<a class="admin_top_header_atag_font">${str_logouttag}</a> 		
						
						
					</div>
				</div>
				
				<!-- 한글로 써진 부분 전부 setting의 탑메뉴 문자열로 보내야함 -->
				<div class="admin_top_navi_frame">
					<div class="admin_top_navi">
						<ul>  
							<li class="admin_top_navi_menuframe">  
								<div class="admin_top_navi_emptymenu"></div>
							</li>   
							<li class="admin_top_navi_menuframe">  
								<div class="admin_top_navi_emptymenu"></div>
							</li> 
							<li class="admin_top_navi_menuframe">  
								<div class="admin_top_navi_menu">센터 등록</div>
								<ul class="admin_top_navi_subframe">  
									<li>인바디 등록</li>  
									<li>빈공간</li>							
								</ul>  
							</li> 
							<li class="admin_top_navi_menuframe">  
								<div class="admin_top_navi_menu">회원 관리</div>
								<ul class="admin_top_navi_subframe"> 
									<li>회원 검색</li>									
									<li>회원 운동 스케쥴 등록</li>  
									
								</ul>  
							</li> 
							<li class="admin_top_navi_menuframe">  
								<div class="admin_top_navi_menu">게시판 관리</div>
								<ul class="admin_top_navi_subframe">  
									<li>공지사항</li> 
									<li>게시판 관리</li>  
									 
								</ul>  
							</li>
							 
						</ul> 
					</div>
				</div>
			</div>
		</div>		
	</body>
</html> 
<!--
<!DOCTYPE html >
<html>
	<head>
	<meta charset="UTF-8">
	<link href="${css}vt_admin_topFormStyle.css" rel="stylesheet"	type="text/css">
		
	</head>
	<body>
		<div class="top_navi_admin">
			<div class="admin_top_navi">
				<ul>  
					<li class="admin_top_navi_menuframe">  
						<div class="admin_top_navi_emptymenu"></div>
					</li>   
					<li class="admin_top_navi_menuframe">  
						<div class="admin_top_navi_emptymenu"></div>
					</li> 
					<li class="admin_top_navi_menuframe">  
						<div class="admin_top_navi_menu">회원관리</div>
						<ul class="admin_top_navi_subframe">  
							<li>메뉴1</li>  
							<li>메뉴2</li> 
							<li>메뉴3</li> 							 
						</ul>  
					</li> 
					
					
					
				</ul> 
			</div>
		</div>
	</body>
</html>

-->