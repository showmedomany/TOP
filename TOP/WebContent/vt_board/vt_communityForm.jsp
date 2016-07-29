<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<html>
	<head>
		<link href = "${css}vt_boardStyle.css" rel="stylesheet"	type="text/css">
	</head>
		<div id="container">
			<div class="cont_main">
					<div class="menu_top">
						
					</div>
				<div class="side_menu">
					
					<div class="vt_info_menu_title">
							<p class="sub1_p1">건강을 먼저 생각하는</p>
							<p class="sub1_p2">비주얼탑 휘트니스</p>
					</div>					
					<div class="vt_info_menu_wrap_sub">
							<p class="vt_info_menu_wrap_sub_sub">커뮤니티</p>
							<p class="sub" onclick="location = 'vt_communityForm.do'">> 공지사항 게시판</p>
							<p class="sub" onclick="location = 'vt_community_free.do'">> 자유게시판</p>
							<p class="sub">> FAQ</p>
					</div>
				</div>
					<div class="main_wrap">
						<jsp:include page="${board}.jsp"></jsp:include>
					</div>
			</div>		
		</div>
</html>