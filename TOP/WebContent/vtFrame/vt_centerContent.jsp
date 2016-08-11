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
					<img src="${images}inp.jpg">
					<img src="${images}in.jpg">
					<img src="${images}in1.jpg">
					<img src="${images}in2.jpg">
					<img src="${images}in3.jpg">						
				</div>
			</div>
			<div class="content_wrap">
				<div class="content1">
					<div class="news">
						<div class="news1a"></div>
						<div class="news1b"></div>
						<div class="news1">
							<p class="news1p">Fitness News</p>
						</div>
						<div class="news2">
							
						</div>
					</div>
				<div class="trinfo">
					<div class="news1a"></div>
					<div class="news1b"></div>
					<div class="news1">
						<p class="news1p">Traning Infomation</p>				
					</div>
					<div class="news2">
						<div class="tr1">
							<div class="tr1top">
								<p class="tr2p">Persnal Exr</p>
							</div>
							<div class="tr1center">
								<figure><a href="vt_ptinfo.do"title="사진을 클릭하면 페이지로 이동합니다."><img src="${images}tr1.jpg"></a></figure>							
							</div>
						</div>
						<div class="tr2">
							<div class="tr2top">
								<p class="tr2p">Group Exr</p>
							</div>
							<div class="tr2center">
								<figure><a href="vt_gxinfo.do" title="사진을 클릭하면 페이지로 이동합니다."><img src="${images}tr2.png"></a></figure>							
							</div>
						</div>
					</div>
						<div class="trbottom">
							<img src="${images}trbot.jpg">
						</div>
					</div>
					<div class="good">
						<a href="vt_infoChar.do" title="사진을 클릭하면 페이지로 이동합니다."><img src="${images}board3.jpg"></a>
					</div>
				</div>	
				<div class="content2">
					<img src="${images}aa.jpg">
				</div>			
			</div>
		</div>
	</body>
</html>




