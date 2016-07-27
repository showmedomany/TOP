<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>


<!-- 한글로 된부분 setting.jsp로 옮겨야함 제훈이씀-->
<html>			
	<head>
		<script src = "${jquery}"></script>
		<script src = "${script}vt_topForm.js"></script>
		<link href = "${css}vt_topFormStyle.css" rel="stylesheet"	type="text/css">		
	</head>
	
	<body>
		<div class="top_frame">
			<div class="top_header">
				<div class="top_header_atag_line">
					<div class="top_header_atag_form">
						<!-- 세션스코프의 권한 값이 널일때 -->
						<c:if test="${sessionScope.authority_id eq null }">
							${sessionScope.authority_id }
							${sessionScope.memId }
							<a class="top_header_atag_font" 
								href="main.do">${str_hometag}</a>
							<a class="top_header_atag_font"
								href="loginForm.do">${str_logintag}</a>
							<a class="top_header_atag_font"
								href="inputForm.do">${str_membership}</a>
						</c:if>
						
						<!-- 세션스코프의 권한 값이 관리자일때  -->
						<c:if test="${sessionScope.authority_id eq 1 }">
							${sessionScope.memId}
							<a class="top_header_atag_font" 
								href = "vt_managerPage.do">관리자페이지</a>
							<a class="top_header_atag_font" 
								href = "logoutPro.do">${str_logouttag}</a> 
						</c:if>
						<!-- 세션스코프의 권한 값이 회원일때  -->
						<c:if test="${sessionScope.authority_id eq 2 }">
							${sessionScope.memId }
							<!-- 마이페이지.do 를 a태그에 걸어줌 -->	
							<a href="myPageView.do">마이페이지</a>
							<a class="top_header_atag_font"
								href = "logoutPro.do">${str_logouttag}</a> 
						</c:if>
						
						
					</div>
				</div>
				
				<!-- 한글로 써진 부분 전부 setting의 탑메뉴 문자열로 보내야함 -->
				<div class="top_navi_frame">
					<div class="top_navi">
						<ul>  
							<li class="top_navi_menuframe">  
								<div class="top_navi_emptymenu"></div>
							</li>   
							<li class="top_navi_menuframe">  
								<div class="top_navi_emptymenu"></div>
							</li> 
							<li class="top_navi_menuframe">  
								<div class="top_navi_menu"
									onclick="location = 'vt_infoHello.do'">센터 소개</div>
								<ul class="top_navi_subframe">  
									<li onclick="location = 'vt_infoHello.do'">인사말</li>  
									<li onclick="location = 'vt_infoHistory.do'">센터 연혁</li>
									<li onclick="location = 'vt_infoInfo.do'">센터 정보</li>  
									<li onclick="location = 'vt_infoChar.do'">센터 특징</li>   
								</ul>  
							</li> 
							<li class="top_navi_menuframe">  
								<div class="top_navi_menu">운동 프로그램 정보</div>
								<ul class="top_navi_subframe">  
									<li>퍼스널트레이닝정보</li>  
									<li>GX 트레이닝 정보</li>
								</ul>  
							</li> 
							<li class="top_navi_menuframe">  
								<div class="top_navi_menu">트레이너 소개</div>
								<ul class="top_navi_subframe">  
									<li>트레이너 정보</li>  
									<li>GX강사 정보</li>  
								</ul>  
							</li> 
							<li class="top_navi_menuframe">  
								<div class="top_navi_menu">커뮤니티</div>
								<ul class="top_navi_subframe">  
									<li>공지사항 게시판</li>  
									<li>자유 게시판</li> 
									<li>FAQ</li>   
								</ul>  
							</li> 
						</ul> 
					</div>
				</div>
			</div>
		</div>		
	</body>
</html>