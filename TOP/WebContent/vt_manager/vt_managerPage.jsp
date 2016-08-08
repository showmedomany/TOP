<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<html>
	<head>
		<script src = "${jquery}"></script>
		<script src = "${script}vt_managerPage.js"></script>
		<link href = "${css}vt_managerPage.css" rel = "stylesheet" type = "text/css">
	</head>
	
	<body>	
		<div class="frame">
			<div class="body">
				<div class="top">
					<div class="atag">
						<!-- 관리자  -->						
						${sessionScope.memId}						
						<a href = "main.do">홈페이지</a>
						<a href = "logoutPro.do">로그아웃</a>
					</div>
				</div>
				
				<!-- 한글로 써진 부분 전부 setting의 탑메뉴 문자열로 보내야함 -->
				<div class="naviframe">
					<div class="navi">
						<ul>
							<li class="menu">  
								<div class="subject">회원 관리</div>
								<ul class="contents">									
									<li></li>
								</ul>  
							</li> 
							<li class="menu">  
								<div class="subject">게시판 관리</div>
								<ul class="contents"> 
									<li>빈공간</li>
								</ul>  
							</li> 
							<li class="menu">  
								<div class="subject">트레이너 관리</div>
								<ul class="contents"> 
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