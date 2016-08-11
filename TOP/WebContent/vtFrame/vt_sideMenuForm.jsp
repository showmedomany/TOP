<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<html>
	<head>
		<link href = "${css}vt_sideMenuStyle.css" rel="stylesheet"	type="text/css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="${script}vt_sideMenuForm.js" type="text/javascript"></script>
	</head>
	<body>
		<div id="container">
			<div class="cont_main">
					<div class="menu_top">
						<div class="top_word">
							<jsp:include page="${word}.jsp"></jsp:include>
						</div>
					</div>
				<div class="side_menu">
					
					<div class="vt_info_menu_title">
							<p class="sub1_p1">건강을 먼저 생각하는</p>
							<p class="sub1_p2">비주얼탑 휘트니스</p>
					</div>
					<ul class="menu_ul">
				        <li class="menu">
				            <p>센터 소개</p>
				            <ul class="hide">
				                <li onclick="location = 'vt_infoHello.do'">>인사말</li>
				                <li onclick="location = 'vt_infoHistory.do'">>센터 연혁</li>
				                <li onclick="location = 'vt_infoInfo.do'">>센터 정보</li>
				                <li onclick="location = 'vt_infoChar.do'">>센터 특징</li>
				            </ul>
				        </li>
				        <li class="menu">
				            <p>운동 프로그램 정보</p>
				            <ul class="hide">
				                <li onclick="location = 'vt_ptinfo.do'">> 퍼스널 트레이닝 정보</li>
				                <li onclick="location = 'vt_gxinfo.do'">> GX 트레이닝 정보</li>
				            </ul>
				        </li>
				        <li class="menu">
				            <p>트레이너 소개</p>
				            <ul class="hide">
				                <li onclick="location = 'vt_pttrinfo.do'">> 트레이너 정보</li>
				                <li onclick="location = 'vt_gxtrinfo.do'">> GX 강사 정보</li>
				            </ul>
				        </li>
				        <li class="menu">
				            <p>커뮤니티</p>
				            <ul class="hide">
				                <li onclick="location = 'noticeBoard.do'">> 공지사항 게시판</li>
				                <li onclick="location = 'vt_community_free.do'">> 자유게시판</li>
				                <li onclick="location = 'vt_FAQ.do'">> FAQ</li>
				            </ul>
				        </li>
				    </ul>
   				 </div>
   				 <div class="main_wrap">
					<div class="content_wrap">
						<jsp:include page="${menu}.jsp"></jsp:include>
					</div>
				</div>
			</div>		
		</div>
	</body>
</html>
