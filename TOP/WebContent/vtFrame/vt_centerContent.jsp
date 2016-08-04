<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<html>
	<head>
		<script src = "${jquery}"></script>
		<script src="${script}vt_centerContent.js" type="text/javascript"></script>
		<link href="${css}vt_centerContentStyle.css" rel="stylesheet"	type="text/css">
		
	</head>
	<body>
		<form name = "sessioncheck">
			<input type = "hidden" name ="authority" value = "${authority_id}">
		</form>
		<div class="centerContentframe">
			<div id="sliderFrame">
				<div id="slider">
					<img src="${images}centerSlider1.jpg">
					<img src="${images}centerSlider2.jpg">
					<img src="${images}centerSlider3.jpg">
				</div>
			</div>
			<div class="centerContent_empty_space"></div>
			<div class="centerContent_mainframe">
				<div class="centerContent_program">
					<a class="centerContent_icon1"></a>
					<p class="centerContent_icon1sub">FITNESS</p>
					<a class="centerContent_icon2"></a>
					<p class="centerContent_icon2sub">PIGATES</p>
					<a class="centerContent_icon3"></a>
					<p class="centerContent_icon3sub">PT</p>
					<a class="centerContent_icon4"></a>
					<p class="centerContent_icon4sub">YOGA</p>
					<a class="centerContent_icon5"></a>
					<p class="centerContent_icon5sub">TAE BO</p>
					<a class="centerContent_icon6"></a>
					<p class="centerContent_icon6sub">GX</p>
					
					
				</div>
			</div>
		</div>
	</body>
</html>




