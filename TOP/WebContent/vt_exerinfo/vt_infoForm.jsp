<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<html>
	<head>
		<link href = "${css}vt_infoStyle.css" rel="stylesheet"	type="text/css">
	</head>
		<div id="container">
			<div class="cont_main">
					<div class="menu_top">
						<div class="top_word">
							<jsp:include page="${word}.jsp"></jsp:include>
						</div>
						<div class="menu_img">
							<img src="${images}menu1.jpg">
						</div>
					</div>
				<div class="side_menu">
					
					<div class="vt_info_menu_title">
							<p class="sub1_p1">건강을 먼저 생각하는</p>
							<p class="sub1_p2">비주얼탑 휘트니스</p>
					</div>
					<div class="vt_info_menu_wrap_sub">
							<p class="vt_info_menu_wrap_sub_sub">센터 소개</p>
							<p class="sub" onclick="location = 'vt_infoHello.do'">> 인사말</p>
							<p class="sub" onclick="location = 'vt_infoHistory.do'">> 센터 연혁</p>
							<p class="sub" onclick="location = 'vt_infoInfo.do'">> 센터 정보</p>
							<p class="sub" onclick="location = 'vt_infoChar.do'">> 센터 특징</p>
					</div>
					<div class="vt_info_menu_wrap_sub">
						<p class="vt_info_menu_wrap_sub_sub">운동 프로그램 정보</p>
							<p class="sub" onclick="location = 'vt_ptinfo.do'">> 퍼스널 트레이닝 정보</p>
							<p class="sub" onclick="location = 'vt_gxinfo.do'">> GX 트레이닝 정보</p>
					</div>
					<div class="vt_info_menu_wrap_sub">
							<p class="vt_info_menu_wrap_sub_sub">트레이너 소개</p>
							<p class="sub" onclick="location = 'vt_pttrinfo.do'">> 트레이너 정보</p>
							<p class="sub" onclick="location = 'vt_gxtrinfo.do'">> GX 강사 정보</p>
					</div>
					<div class="vt_info_menu_wrap_sub">
							<p class="vt_info_menu_wrap_sub_sub">커뮤니티</p>
							<p class="sub" onclick="location = 'vt_mainboard.do'">> 공지사항 게시판</p>
							<p class="sub" onclick="location = 'vt_freeboard.do'">> 자유게시판</p>
							<p class="sub" onclick="location = 'vt_QNA.do'">> QNA</p>
					</div>
				</div>
					<div class="main_wrap">
						<jsp:include page="${menu}.jsp"></jsp:include>
					</div>
			</div>		
		</div>
</html>