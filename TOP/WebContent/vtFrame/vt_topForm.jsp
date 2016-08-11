<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>


<!-- 한글로 된부분 setting.jsp로 옮겨야함 제훈이씀-->
<html>			
	<head>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
		<link href="${css}vt_topFormStyle.css" rel="stylesheet"	type="text/css">
		<script src="${script}vt_topForm.js" type="text/javascript"></script>
	</head>
	
	<body>
		<div class="top">
				<div class="top_2">
					<div class="login_p">
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
								href = "administratorPage.do">관리자페이지</a>
							<a class="top_header_atag_font" 
								href = "logoutPro.do">${str_logouttag}</a> 
						</c:if>
						<!-- 세션스코프의 권한 값이 회원일때  -->
						<c:if test="${sessionScope.authority_id eq 2 }">
							${sessionScope.memId }
							<!-- 마이페이지.do 를 a태그에 걸어줌 -->	
							<a class="top_header_atag_font"
								href="myPageView.do">마이페이지</a>
							<a class="top_header_atag_font"
								href = "logoutPro.do">${str_logouttag}</a> 
						</c:if>
					</div>
					<div class="site_name" onclick="location = 'main.do'">
						<img src="${images}logo.png">
					</div>
					<div class="menu_name">
						<p class="topmenu1"
							onclick="location = 'noticeBoard.do'">커뮤니티</p>
						<p class="topmenu1"
							onclick="location = 'vt_ptinfo.do'">트레이너 소개</p>
						<p class="topmenu2"
							onclick="location = 'vt_pttrinfo.do'">운동 프로그램 정보</p>
						<p class="topmenu2"
							onclick="location = 'vt_infoHello.do'">센터 소개</p>
					</div>
					<div class="open1">
						<div class="open">
							<span class="cls"></span>
							<span>
								<ul class="sub-menu">
									<li onclick="location = 'vt_infoHello.do'">인사말</li> 
									<li onclick="location = 'vt_infoHistory.do'">센터 연혁</li>
									<li onclick="location = 'vt_infoInfo.do'">센터 정보</li>  
									<li onclick="location = 'vt_infoChar.do'">센터 특징</li> 
								</ul>
							</span>
						<span class="cls"></span>
						</div>
						<div class="open">
							<span class="cls"></span>
							<span>
								<ul class="sub-menu">
									<li onclick="location = 'vt_ptinfo.do'">퍼스널트레이닝정보</li>  
									<li onclick="location = 'vt_gxinfo.do'">GX 트레이닝 정보</li>
								</ul>
							</span>
						<span class="cls"></span>
						</div>
					</div>
				<div class="open2">
					<div class="open">
						<span class="cls"></span>
						<span>
							<ul class="sub-menu">
								<li onclick="location = 'vt_pttrinfo.do'">트레이너 정보</li>  
								<li onclick="location = 'vt_gxtrinfo.do'">GX강사 정보</li> 
							</ul>
						</span>
						<span class="cls"></span>
					</div>
					<div class="open">
						<span class="cls"></span>
						<span>
							<ul class="sub-menu">
								<li onclick="location = 'noticeBoard.do'">공지사항 게시판</li>  
								<li onclick="location = 'vt_community_free.do'">자유 게시판</li> 
								<li onclick="location = 'vt_FAQ.do'">FAQ</li> 
							</ul>
						</span>
					<span class="cls"></span>
					</div>
				</div>
			</div>
		</div>			
	</body>
</html>