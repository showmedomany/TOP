<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "setting.jsp" %>
<link href = "${css}vt_memberInfoView.css" rel = "stylesheet" type = "text/css">
<script src="/TOP/request.js" type="text/javascript"></script>
<script src="/TOP/vt_member/script/member.js" type="text/javascript"></script>
<body>
	회원정보<br>		
	설명<br>
	<form method="post" action="memberModifyPro.do" name="memberModifyForm" onsubmit="return modifyCheck()">
		<input type="hidden" name = "nickConfirm" value ="1">
		<table border="1">
			<tr style ="border-top: 2px solid #D8D8D8">
				<th>*회원아이디</th>				    
				<td>${sessionScope.memId}</td>
			</tr>																		
	
			<tr>
				<!-- AJAX로 비밀번호 다른지 비교 -->
				<th> * 비밀번호  </th>
				<td>
					<input class="input" type="password" name="passwd" maxlength="15" value="${memberData.passwd}" onkeyup="comparepasswd()">
				</td>
			</tr>
			<tr>	
				<th> * 비밀번호 확인	</th>			
				<td>
					<input class="input" type="password" name="repasswd" maxlength="15" value="${memberData.passwd}" onkeyup="comparepasswd()">					
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="userPasswd" style="display:none; font-size:12px; margin-left: 5px; color: red">						
					</div>					
				</td>			
			</tr>
			<tr>
				<th>* 이름</th>
				<td>
					${memberData.name }
				</td>
			</tr>
			<tr>
				<!-- AJAX로 닉네임 비교 -->
				<th>* 닉네임</th>
				<td>
					<input class="input" type="text" name="nickname" maxlength="20" 
						value="${memberData.nickname }" onkeyup="confirmnick()">
					<input type="hidden" name="Nickname" value="${memberData.nickname }">
					<br>						
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="userNick" style="display:none; font-size:12px; margin-left: 5px; color: red"></div>
				</td>				
			</tr>
			<tr>
				<th rowspan="3">주소</th>
				<td>
					<!-- 주소가 null -->
					<c:if test="${memberData.zipcode == null }">					
						<input class="input" type="text" name="zipcode1" 
							style="width:60px" value="" readonly="readonly">-
						<!-- 수정불가로 -->
						<input class="input" type="text" name="zipcode2"  
							style="width:60px" value="" readonly="readonly">
						<!-- 주소 검색창 -->
						<input class="inputbutton" type="button" value="주소 검색">
					</c:if>
					
					<!-- 주소가 있음 -->
					<c:if test="${memberData.zipcode != null }">
						<c:set var="zipcode" value="${fn:split( memberData.zipcode, '-' )}"/>
						<input class="input" type="text" name="zipcode1" 
							style="width:60px" value="${zipcode[0]}" readonly="readonly">-
						<!-- 수정불가로 -->
						<input class="input" type="text" name="zipcode2"  
							style="width:60px" value="${zipcode[1]}" readonly="readonly">
						<!-- 주소 검색창 -->
						<input class="inputbutton" type="button" value="주소 검색" onclick="searchAdr()">	
					</c:if>	
				</td>
			</tr>
			<c:if test="${memberData.address == null }">
				<tr>
					<td>					
						<input class="input" type="text" name="adr" readonly="readonly" 
							style="width:500px" placeholder = "주소">						
					</td>
				</tr>
				<tr>
					<td>
						<input class="input" type="text" name="detail_adr"  readonly="readonly"
							style="width:500px"placeholder = "나머지주소">
					</td>
				</tr>
			</c:if>
			<c:if test="${memberData.address != null }">
				<c:set var="address" value="${fn:split( memberData.address, '|' )}"/>
				<tr>
					<td>					
						<input class="input" type="text" name="adr"  value="${address[0] }" readonly="readonly" 
							style="width:500px" placeholder = "주소">						
					</td>
				</tr>
				<tr>
					<td>
						<input class="input" type="text" name="detail_adr" value="${address[1] }"
							style="width:500px"placeholder = "나머지주소">
					</td>
				</tr>
			</c:if>
			<c:if test="${memberData.phone == null }">
				<tr>			
					<th> 전화번호 </th>
					<td>
						<input class="input" type="text" name="tel1"	
							maxlength="3" style="width: 34px">
						- <input class="input" type="text" name="tel2"	
							maxlength="4" style="width: 38px">	
						- <input class="input" type="text" name="tel3"	
							maxlength="4" style="width: 38px">	
					</td>				
				</tr>
			</c:if>
			<c:if test="${memberData.phone != null }">
				<c:set var="phone" value="${fn:split( memberData.phone, '-' )}"/>
				<tr>			
					<th> 전화번호 </th>
					<td>
						<input class="input" type="text" name="tel1"	
							maxlength="3" value="${phone[0] }" style="width: 34px">
						- <input class="input" type="text" name="tel2"	
							maxlength="4"  value="${phone[1] }" style="width: 38px">	
						- <input class="input" type="text" name="tel3"	
							maxlength="4"  value="${phone[2] }" style="width: 38px">	
					</td>				
				</tr>
			</c:if>
						
			<tr style="border-bottom: 2px solid #D8D8D8">
				<!-- 이메일 전송 및 확인 -->
				
				<th> * 이메일  </th>
				<c:if test="${memberData.email == null }">
					<td>
						<input class="input" type="text" name="email1"
							maxlength="20" style="width: 100px">
						@
						<input class="input" type="text" name="email2"
							maxlength="20" style="width: 100px">					
					</td>
				</c:if>	
				
				<c:if test="${memberData.email != null }">
					<c:set var="email" value="${fn:split( memberData.email, '@' )}"/>
					<td>
						<input class="input" type="text" name="email1"
							maxlength="20" value="${email[0] }" style="width: 100px">
						@
						<input class="input" type="text" name="email2"
							maxlength="20" value="${email[1] }" style="width: 100px">					
					</td>
				</c:if>							
			</tr>
			<tr>
				<th>가입일</th>
				<td>
					${memberData.join_date }
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="수정">	
					<input type="button" value="취소" onclick="location='myPageView.do'">
				</td>
			</tr>
		</table>
	</form>		
</body>
