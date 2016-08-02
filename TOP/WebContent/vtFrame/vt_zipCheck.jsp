<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "setting.jsp" %>
   
		<link href = "${css}vt_zipCheckFormStyle.css" rel = "stylesheet" type = "text/css">
		<script src = "${script}vtFrame.js"></script>		
		<script src = "${jquery}"></script>

		<form method="post" name="zipCheckForm" action="zipCheck.do" onsubmit="return checkadr()">		
			<div class="zip_header">
				▶&nbsp;우편번호 찾기	
			</div>
			<div class="wrap">	
				<div class="search">
					<div class="search_1">
						<div class="search_word">
							지번/도로명
						</div>
					</div>
					<div class="search_2">
						<div class="search_find">
						
						</div>
						<div class="search_info">
						
						</div>
					</div>
				</div>
				<div class="result">
				
				</div>
				
			</div>	
		</form>
	








