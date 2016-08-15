<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<!-- 한글 setting에서 처리할것 -->


		<link href = "${css}vt_admin_inputForm.css" rel = "stylesheet" type = "text/css">
		<script src = "${script}vt_admin_inputForm.js"></script>
		<script src = "${request}"></script>		

	
	<body onload = "inputformfocus()">
		<form method = "post" name = "inputform" action="admin_inputPro.do" 
			onsubmit="return sumitCheckfn()">
			<input type="hidden" name = "idConfirm" value = "0">
			<input type="hidden" name = "nickConfirm" value = "0">
			<input type="hidden" name = "emailConfirm" value = "0">			

			<div class="vt_inputForm_Frame">
				<div class = "vt_inputForm_body">					
					<table class="vt_inputForm_table">
						<tr>
							<th>*아이디</th>
							<td>
								<input class="input" type="text" name="id" maxlength="15" onkeyup = "confirmid(this)">

								<br>
								<div id="userId" style="font-size:12px; margin-left: 5px; color: blue">
									아이디를 입력하세요
								</div>
								<div id="userId_overlap" style="font-size:12px; margin-left: 5px; color: red;">
								</div>	
							</td>
						</tr>																		

						<tr>
							<!-- AJAX로 비밀번호 다른지 비교 -->
							<th>*비밀번호</th>
							<td>
								<input class="input" type="password" name="passwd" maxlength="15" onkeyup="comparepasswd()">
								
							</td>
						</tr>
						<tr>	
							<th>*비밀번호 확인</th>			
							<td>
								<input class="input" type="password" name="repasswd" maxlength="15" onkeyup="comparepasswd()">
								<br>
								<div id="userPasswd" style="font-size:12px; margin-left: 5px; color: blue">
									비밀번호를 입력하세요
								</div>
								<div id="userPasswd_overlap" style="font-size:12px; margin-left: 5px; color: red;">
								</div>	
							</td>
						</tr>
						<tr>
							<th>*이름</th>
							<td>
								<input class="input" type="text" name="name" maxlength="20">
							</td>
						</tr>
						<tr>
							<!-- AJAX로 닉네임 비교 -->
							<th>*닉네임</th>
							<td>
							<input class="input" type="text" name="nickname" maxlength="20" onkeyup="confirmnick()">
							<br>											
							<div id="userNick" style="font-size:12px; margin-left: 5px; color: blue">
								닉네임을 입력하세요
							</div>
							<div id="userNick_overlap" style="font-size:12px; margin-left: 5px; color: red;">
							
							</div>								
						</td>
						</tr>
						<tr>
							<th rowspan="3">주소</th>
							<td>
								<input class="input" type="text" name="zipcode1"
									style="width:60px" readonly="readonly">-
								<input class="input" type="text" name="zipcode2"  
									style="width:60px" readonly="readonly">

								<input class="inputbutton" type="button" name = "searchadr" value="주소검색"
								onclick="searchAdr()">
							</td>
						</tr>
						<tr>
							<td>
								
								<input class="input" type="text" name="adr" readonly="readonly" 
									style="width:500px" placeholder = "주소">
									<br>
							</td>
						</tr>
						<tr>
							<td>
								<input class="input" type="text" name="detail_adr" 
									style="width:500px"placeholder = "나머지 주소">
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<input class="input" type="text" name="tel1"	
									maxlength="3" style="width: 34px" onkeyup="nexttel1()">
								- <input class="input" type="text" name="tel2"	
									maxlength="4" style="width: 38px" onkeyup="nexttel2()">	
								- <input class="input" type="text" name="tel3"	
									maxlength="4" style="width: 38px" onkeyup="nexttel3()">	
							</td>				
						</tr>
						<tr style="border-bottom: 2px solid #D8D8D8">
							<!-- 이메일 전송 및 확인 -->
							
							<th>*이메일</th>
							<td>
								<input class="input" type="text" name="email1"
									maxlength="20" style="width: 100px">
								@
								<select name="email2">									
									<option value="0"> 직접입력 </option>
									<option value="naver.com"> 네이버 </option>
									<option value="daum.net"> 다음 </option>
									<option value="gmail.com"> 구글 </option>
									<option value="nate.com"> 네이트 </option>						
								</select>
								<input type = "button" name = "cmail" value = "메일확인" onclick = "checkmail()">
								<div id = "checkmail"></div>
							</td>							
						</tr>
						</table>
						<div class="vt_inputForm_bottom_wrap">
							<div class="vt_inputForm_bottom_line"></div>
							<div class="vt_inputForm_bottom_btn">
								<input class="inputbutton_okno" type="submit" value="회원등록">
								<input class="inputbutton_okno" type="button" value="취소">
							</div>
						</div>
					</div>
				</div>
		</form>
