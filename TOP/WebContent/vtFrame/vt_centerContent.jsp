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
				
			</div>
		</div>
	</body>
</html>




