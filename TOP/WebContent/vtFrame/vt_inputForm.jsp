<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<!-- 한글 setting에서 처리할것 -->

<html>
	<head>
		<link href = "${css}vt_inputFormStyle.css" rel = "stylesheet" type = "text/css">
	</head>
	<body>
		<form method = "post">
			<div class="vt_inputForm_Frame">
				<div class = "vt_inputForm_body">
					<div class="vt_inputForm_info">회원정보입력</div>
					( * ) &nbsp;필수입력사항 입니다
					<div class="vt_inputForm_path">홈 ▶ 회원가입</div>
					<table class="vt_inputForm_table" >
						<tr style ="border-top: 2px solid #D8D8D8">
							<th> *회원아이디 </th>
							<td>
								<input class="input" type="text" name="id" maxlength="15">
								<input class="inputbutton" type="button" value=확인>
								&nbsp;(영문 소문자/숫자, 4~16자)																			
							</td>
						</tr>
						<tr>
							<th> * 비밀번호  </th>
							<td>
								<input class="input" type="password" name="passwd" maxlength="15">
							</td>
						</tr>
						<tr>	
							<th> * 비밀번호 확인</th>			
							<td>
								<input class="input" type="password" name="repasswd" maxlength="15">
							</td>
						</tr>
						<tr>
							<th>* 이름  </th>
							<td>
								<input class="input" type="text" name="name" maxlength="20">
							</td>
						</tr>
						<tr>
							<th>* 닉네임 </th>
							<td>
							<input class="input" type="text" name="nickname" maxlength="20">
							</td>
						</tr>
						<tr>
							<th rowspan="3"> 주소</th>
							<td>
								<!-- 수정불가로 -->
								<input class="input" type="text" name="address1" 
								style="width:60px">-
								<!-- 수정불가로 -->
								<input class="input" type="text" name="address2"  
								style="width:60px">
								<input class="inputbutton" type="button" value=찾기>
							</td>
						</tr>
						<tr>
							<td>
								
								<input class="input" type="text" name="address4"  
								style="width:500px" placeholder = "주소"><br>
							</td>
						</tr>
						<tr>
							<td>
								<input class="input" type="text" name="address5"  
								style="width:500px"placeholder = "나머지주소">
							</td>
						</tr>
						<tr>
							<th> 전화번호 </th>
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
							<th> *이메일  </th>
							<td>
								<input class="input" type="text" name="email1"
									maxlength="20" style="width: 100px">
								@
								<select name="email2">
									<option value=""> </option>
									<option value="0"> 직접입력 </option>
									<option value="naver.com"> 네이버 </option>
									<option value="daum.net"> 다음 </option>
									<option value="gmail.com"> 구글 </option>
									<option value="nate.com"> 네이트 </option>						
								</select>	
								<input class="inputbutton" type="button" value=인증번호전송 name="email_btn" style="width: 100px">
								<input class="input" type="text" name="email_send" >
								<input class="inputbutton" type="button" value=인증번호확인 style="width: 100px">
							</td>
						</tr>
						<tr>
							<th colspan="2" >
								<input class="inputbutton_okno" type="submit" value=회원가입>
								<input class="inputbutton_okno" type="button" value=취소하기
									onclick="location='main.do'">					
							</th>
						</tr>
						</table>
					</div>
				</div>
		</form>
	</body>
</html>