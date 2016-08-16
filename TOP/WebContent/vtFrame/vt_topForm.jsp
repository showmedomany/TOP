<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
<link href="${css}vt_topFormStyle.css" rel="stylesheet"	type="text/css">
<script src="${script}jquery.min.js" type="text/javascript"></script>

	
				
				<!-- 한글로 써진 부분 전부 setting의 탑메뉴 문자열로 보내야함 -->
				<div class="top">
					<div class="login_wrap">
						<div class="login_body">
								<div class="login_p">
									<c:if test="${sessionScope.authority_id eq null }">
										${sessionScope.authority_id }
										${sessionScope.memId }
										<a class="top_header_atag_font" 
											href="main.do">HOME</a>&nbsp;
										<a class="top_header_atag_font"
											href="loginForm.do">LOGIN</a>&nbsp;
										<a class="top_header_atag_font"
											href="inputForm.do">SIGN UP</a>								
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
							</div>
						</div>	
					<div class="div_wrap"></div>							
					<div class="top_2">						
						<div class="site_name" onclick="location = 'main.do'">
							<img src="${images}logo.png">
						</div>
						
						<div class="div_img_wrap">
							<div class="div_posi">
								<jsp:include page="${top}.jsp"></jsp:include>
							</div>
						</div>							
								<div class="div_1">
									<div class="open"><p class="menu1">센터 소개</p>
									  <div class="div_1menu">
										  <div class="sub-menu">
										    <div class="div_1menu1" onclick="location = 'vt_infoHello.do'">인사말</div> 
										    <div class="div_1menu2" onclick="location = 'vt_infoHistory.do'">센터 연혁</div>
					                        <div class="div_1menu3" onclick="location = 'vt_infoInfo.do'">센터 정보</div>  
					                        <div class="div_1menu4" onclick="location = 'vt_infoChar.do'">센터 특징</div>
										  </div></div>
									 </div>
								 </div>
								 <div class="div_2">
									  <div class="open"><p class="menu2">운동 프로그램 정보</p>
									  	<div class="div_2menu">
											  <div class="sub-menu">
											    <div class="div_2menu1" onclick="location = 'vt_ptinfo.do'">퍼스널트레이닝정보</div>  
					                            <div class="div_2menu2" onclick="location = 'vt_gxinfo.do'">GX 트레이닝 정보</div>
											  </div></div>
										</div>
								</div>
								<div class="div_3">
									  <div class="open"><p class="menu3">트레이너 소개</p>
									  	<div class="div_3menu">
											  <div class="sub-menu">
											    <div class="div_3menu1" onclick="location = 'vt_pttrinfo.do'">트레이너 정보</div>  
					                            <div class="div_3menu2" onclick="location = 'vt_gxtrinfo.do'">GX강사 정보</div> 
											  </div></div>
										</div>
								 </div>
								 <div class="div_4">
								  <div class="open"><p class="menu4">커뮤니티</p>
								  	<div class="div_4menu">
									  <div class="sub-menu">
									    <div class="div_4menu1" onclick="location = 'noticeBoard.do'">공지사항 게시판</div>  
				                        <div class="div_4menu2" onclick="location = 'vt_community_free.do'">자유 게시판</div> 
				                        <div class="div_4menu3" onclick="location = 'vt_FAQ.do'">FAQ</div> 
									  </div></div>
									 </div>
							 		</div>
							 	</div>
							</div>
					
	