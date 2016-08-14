<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

		
		



<html>
	<head>
		<link href = "${css}vt_infoInfoStyle.css" rel="stylesheet"	type="text/css">
		<script src = "${jquery}"></script>
		<script src="${script}vt_infoInfo.js" type="text/javascript"></script>
	</head>
<div class = "info_Infowarp">
			<div class = "info_Infotit">
				<strong class = "tit">INFO</strong>
			
	
	<div class = "info_Infoframe">
	
	<P class="floor">VISUAL T.O.P 층별 시설안내입니다.</P>
	<P class="first">1F</P>
	<P class="firstinfo">처음 운동을 시작하시는 고객 한분한분의 개인적 성향은 물론 체격조건,
	건강상태를 분석하여 운동을 시작할때 반갑게 맞아주는 공간입니다.</P>
	<p class="first">2F</p>
	<P class="firstinfo">몸 전체의 밸런스와 유연성을 키워주는 유산소 트레이닝 스피닝,신체보다도 더많은 정서적인 안정과 평온함이 가득한 요가
	</P>
	<p class="first">3F</p>
	<P class="firstinfo">GX를 할수 있는 태보, 수영, 필라테스 와 사우나 시설, 샤워장을 이용하실 수 있습니다  </P>
	
	
	<div id="map" style="width:564px;height:400px; top: 866px;"></div>
	
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1d132072640b7303f74a5471b606ef5b"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			//center: new daum.maps.LatLng(33.450701, 126.570667),
			center: new daum.maps.LatLng(37.4990295, 127.032881),
			level: 3
		};
	//강남구37.5173319, 127.047377
	//37.4990295, 북위 127.032881
		var map = new daum.maps.Map(container, options);
		map.setLevel(2);
		
		var control = new daum.maps.ZoomControl();
		map.addControl(control, daum.maps.ControlPosition.TOPRIGHT);
		
		
		 var marker=new daum.maps.Marker({
	            position:new daum.maps.LatLng(37.4990295,127.032881)
	        });
		 
		 marker.setMap(map);
	
	
	</script>
	
	
	
	
	
	</div>	
	<div id="sliderFrame">
				<div id="slider">
					<img src="${images}웨이트존.jpg">
					<img src="${images}프리웨이트존.jpg">
					<img src="${images}스피닝존.jpg">
					<img src="${images}gx존.jpg">
					<img src="${images}사물함.jpg">
					<img src="${images}기능성웨이트존.jpg">
					<img src="${images}사우나.jpg">
					<img src="${images}탈의실.jpg">
					<img src="${images}수영장.jpg">
					<img src="${images}수영장1.jpg">
					<img src="${images}사우나1.jpg">
					<img src="${images}샤워.jpg">
					<img src="${images}샤워1.jpg">
				</div>
			</div>
			<div class="find">
			찾아오시는길
			</div>
			<div class="findd">
				<p class="find1">Address:서울특별시 강남구 역삼동 823-24 남도빌딩 </p><br><br>
				<p class="find1">전화번호 : 02 - 1234 -5678</p><br><br>
				<p class="find1">운영시간 / 평일 AM 06:00 ~ PM 24:00 주말/공휴일
				<p class="find1"> AM 10:00 ~ PM 08:00 (매일 세째주 일요일 휴무)</p>
			</div>
			<div class="traffic">
				<img src="${images}대추.PNG">
				<p class="find2">역삼역 3번 출구 직진 5분 거리</p>
				<p class="find2">강남역 1번 출구 직진 5분 거리</p>
			
			</div>
			<div class="traffic1">
				<img  class="park1"src="${images}주차.PNG">
				<p class="find3">주차시 기본 2시간 30분 적용</p>
				<p class="find3">무인정산기를 이용하여 30분 추가 혜택(총30분)</p>
				<p class="find3">무인정산 후 10분 이내에 반드시 출차하여야 하고 시간초과 출차시엔 10분당 1,000씩 부과됩니다.</p>
				
			
			</div>
</div>
</div>
		
