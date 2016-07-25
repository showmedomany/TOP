<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<!-- 한글 setting에서 처리할것 -->

<html>
	<head>
		<link href = "${css}vt_inputFormStyle.css" rel = "stylesheet" type = "text/css">
		<script src = "${script }vt_inputForm.js"></script>
	</head>
	<body onload = "inputformfocus()">
		<form method = "post" name = "inputform" action = "inputPro.do">
			<div class="vt_inputForm_Frame">
				<div class = "vt_inputForm_body">
					<div class="vt_inputForm_top">
						<div class="vt_inputForm_top_sub1">
							<div class="vt_inputForm_info">
								${str_vt_inputForm_info}
							</div>
							<div class="vt_inputForm_path">
								${str_vt_inputForm_path}
							</div>
						</div>
						<div class="vt_inputForm_top_sub2">
							<div class="vt_inputForm_hello">
								${str_vt_inputForm_hello}
							</div>
							<div class="vt_inputForm_hello_path">
								${str_vt_inputForm_hello_path}
							</div>			
							<div class="vt_inputForm_top_line"></div>			
						</div>													
					</div>						
					<table class="vt_inputForm_table" >
						<tr style ="border-top: 2px solid #D8D8D8">
							<th>${str_inputForm_id}</th>
							<td>
								<!-- AJAX로 아이디 비교 -->
								<input class="input" type="text" name="id" maxlength="15">
								<input class="inputbutton" type="button" value="${str_inputForm_id_confirm}">
								${str_inputForm_id_info}																	
							</td>
						</tr>
						<tr>
							<!-- AJAX로 비밀번호 다른지 비교 -->
							<th> ${str_inputForm_passwd}  </th>
							<td>
								<input class="input" type="password" name="passwd" maxlength="15">
							</td>
						</tr>
						<tr>	
							<th> ${str_inputForm_passwd_confirm}</th>			
							<td>
								<input class="input" type="password" name="repasswd" maxlength="15">
							</td>
						</tr>
						<tr>
							<th>${str_inputForm_name}</th>
							<td>
								<input class="input" type="text" name="name" maxlength="20">
							</td>
						</tr>
						<tr>
							<!-- AJAX로 닉네임 비교 -->
							<th>${str_inputForm_nickname}</th>
							<td>
							<input class="input" type="text" name="nickname" maxlength="20">
							</td>
						</tr>
						<tr>
							<th rowspan="3">${str_inputForm_adr}</th>
							<td>
								<!-- 수정불가로 -->
								<input class="input" type="text" name="zipcode1" 
									style="width:60px" readonly="readonly">-
								<!-- 수정불가로 -->
								<input class="input" type="text" name="zipcode2"  
									style="width:60px" readonly="readonly">
								<!-- 주소 검색창 -->
								<input class="inputbutton" type="button" value="${str_inputForm_adr_search}">
							</td>
						</tr>
						<tr>
							<td>
								
								<input class="input" type="text" name="adr" readonly="readonly" 
									style="width:500px" placeholder = "${str_inputForm_adr}">
									<br>
							</td>
						</tr>
						<tr>
							<td>
								<input class="input" type="text" name="detail_adr" 
									style="width:500px"placeholder = "${str_inputForm_adr_add}">
							</td>
						</tr>
						<tr>
							<th> ${str_inputForm_tel } </th>
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
							<th> ${str_inputForm_email }  </th>
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
								<input class="inputbutton" type="button" value="${str_inputForm_email_send }" name="email_btn" style="width: 100px">
								<input class="input" type="text" name="email_send" >
								<input class="inputbutton" type="button" value="${str_inputForm_email_confirm}" style="width: 100px">
							</td>
						</tr>
						</table>
						<div class="vt_inputForm_bottom_wrap">
							<div class="vt_inputForm_bottom_line"></div>
							<div class="vt_inputForm_bottom_btn">
								<input class="inputbutton_okno" type="submit" value="${str_inputForm_bt_sumit}">
								<input class="inputbutton_okno" type="button" value="${str_inputForm_bt_cancel}"
									onclick="location='main.do'">
							</div>
						</div>
					</div>
				</div>
		</form>
	</body>
</html>