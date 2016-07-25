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
					<div class="vt_inputForm_top">
						<div class="vt_inputForm_top_sub1">
							<div class="vt_inputForm_info">
								회원정보입력
							</div>
							<div class="vt_inputForm_path">
								홈 > 회원가입 > 회원정보 입력
							</div>
						</div>
						<div class="vt_inputForm_top_sub2">
							<div class="vt_inputForm_hello">
								<p>비주얼 탑 휘트니스는 개인정보를 소중히 생각하며,회원님의 동의 없이는 공개 또는
								제3자에게 제공되지 않습니다.</p>
								<p></p>
								<p>자세한 내용은 개인정보취급방침을 확인해 주시기 바랍니다.</p>
							</div>
							<div class="vt_inputForm_hello_path">
								( * ) &nbsp;필수입력사항 입니다
							</div>			
							<div class="vt_inputForm_top_line"></div>			
						</div>													
					</div>						
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
						</table>
						<div class="vt_inputForm_bottom_wrap">
							<div class="vt_inputForm_bottom_line"></div>
							<div class="vt_inputForm_bottom_btn">
								<input class="inputbutton_okno" type="submit" value=회원가입>
								<input class="inputbutton_okno" type="button" value=취소하기
									onclick="location='main.do'">
							</div>
						</div>
					</div>
				</div>
		</form>
	</body>
</html>