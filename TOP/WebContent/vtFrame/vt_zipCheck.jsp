<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "setting.jsp" %>
   
		<link href = "${css}vt_zipCheckFormStyle.css" rel = "stylesheet" type = "text/css">
		<script src = "${script}vtFrame.js"></script>	
		<script src = "${jquery}"></script>
		
		
		
		
		<form method="post" name="zipCheckForm" action="zipCheck.do?choice=${choice}" onsubmit="return checkadr()">		
			<div class="wrap">
				<div class="zip_header">
					<div class="header_img">
						<img src="${images}zip.png">
					</div>
					<div class="header_word">
						우편번호 검색
					</div>
				</div>
					<div class="zip_top">
						<div class="search">
							<input class = "input" type = "text" name = "inputarea" >
							<input class = "inputbutton" type = "submit" value = "${str_zipCheckForm_zip_search}">						
						</div>
						<div class="info">
							<p>*&nbsp;도로명,건물,지번,사서함에 대해 통합검색이 가능합니다.</p>
							<p>*&nbsp;우편번호 상세주소가 검색되지 않는 경우 범위 주소로 검색됩니다.</p>
							<p>*&nbsp;도로명주소 및 국가기초구역에 대한 자세한 안내는 도로명주소안내 시스템을 참고하시기 바랍니다.</p>
						</div>
					</div>
				</div>
			</form>
					<div class="zip_center">
						<c:if test = "${area ne null }">
							<c:if test = "${resultCheck eq 0 }">
								<div class="zipnumadr">																			
									<div class="zipnum">
										${str_zipCheckForm_zipNum}														
									</div>
									<div class="adr">
										${str_inputForm_adr}	
									</div>
								</div>
								<div class="nosearch">	
										검색결과가 없습니다.
								</div>							
							</c:if>
							<c:if test = "${resultCheck ne 0 }">
								<c:set var = "adto" value = "${adto}"/>
								<form method = "post" name = "addressform">
										<div class="zipnumadr">																			
											<div class="zipnum">
												${str_zipCheckForm_zipNum}														
											</div>
											<div class="adr">
												${str_inputForm_adr}	
											</div>
										</div>
										<c:forEach var = "adto" items="${adto }">
											<c:set var = "first" value = "${fn:substring(adto.zipcode,0,3) }"/>
											<c:set var = "second" value = "${fn:substring(adto.zipcode,4,7) }"/>									
											<c:set var = "adr" 
												value = "${adto.area1} ${adto.area2} ${adto.area3} ${adto.area4}"/>	
												<div class="aaa12">	
													<div  class="aaa1">
														<a class="pointer" onclick = "useadr('${first}','${second}','${adr}','${choice}')">${adto.zipcode}</a>
													</div>														
													<div class="aaa2">
													<a class="pointer" onclick = "useadr('${first}','${second}','${adr}','${choice}')">${adr}</a> 
													</div>
												</div>
										</c:forEach>						
								</form>	
							</c:if>	
						</c:if>
					</div>
	
	








