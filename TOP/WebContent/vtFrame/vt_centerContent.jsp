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
				<div class="centerContent_content">
					<table class="centerContent_table">
						<tr height="450">
							<td>
								<img class="centerContent_img1" src="${images}center1.jpg">
							</td>
							<td>
								<img class="centerContent_img2" src="${images}center1.jpg">
							</td>
						</tr>
						<tr height="50">
							<td colspan="2"></td>
						</tr>
						<tr height="450">
							<td>
								<img class="centerContent_img2" src="${images}center1.jpg">
							</td>
							<td>
								<img class="centerContent_img2" src="${images}center1.jpg">
							</td>
						</tr>
						<tr height="50">
							<td colspan="2"></td>
						</tr>
						<tr height="500">
							<td colspan="2"><img src="${images}center2.jpg"></td>
						</tr>
						<tr height="50">
							<td colspan="2"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>




