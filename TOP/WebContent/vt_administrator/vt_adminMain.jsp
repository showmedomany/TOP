<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>
		
	</head>
	
	<body>
		<div class = "frame">
			<div class = "header">
				<div class = "atag">
					<a>홈페이지</a>
					<a>로그아웃</a>
				</div>
			</div>
		</div>
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
								<div class="admin_top_navi_emptymenu"></div>
							</li>   
							<li class="admin_top_navi_menuframe">  
								<div class="admin_top_navi_emptymenu"></div>
							</li> 
							<li class="admin_top_navi_menuframe">  
								<div class="admin_top_navi_menu"
									onclick="location = 'centerInsert.do?choice=0'">센터 등록</div>
								<ul class="admin_top_navi_subframe">  
									<li onclick="location = 'centerInsert.do?choice=0'">회원 피트니스 등록</li>  
									<li onclick="location = 'centerInsert.do?choice=1'">회원 인바디 등록</li>
									<li onclick="location = 'centerInsert.do?choice=2'">회원 운동스케줄 작성</li>  
									<li onclick="location = ''">빈공간</li>   
								</ul>  
							</li> 
							<li class="admin_top_navi_menuframe">  
								<div class="admin_top_navi_menu">회원 관리</div>
								<ul class="admin_top_navi_subframe">  
									<li onclick="location = 'memberSearch.do'">회원 검색</li>  
									<li>빈공간</li>
								</ul>  
							</li> 
							<li class="admin_top_navi_menuframe">  
								<div class="admin_top_navi_menu">게시판 관리</div>
								<ul class="admin_top_navi_subframe">  
									<li onclick="location = 'noticeBoard.do'">공지사항</li>  
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