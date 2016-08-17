<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file = "setting.jsp" %>
<script src="${script}member.js" type="text/javascript"></script>
<script src="/TOP/request.js" type="text/javascript"></script>

<div class="banner">
	<img src="${images}MemberBanner.png">	
	<div class="bannerText">&nbsp;&nbsp;Member</div>
</div>

<body>	
	<form method="post" action="memberModifyPro.do" name="memberModifyForm" onsubmit="return modifyCheck()">
		
		<div class="tableInfo">
			<table>
				<tr class="tableTr">
					<th style="width: 250px;">*회원아이디</th>				    
					<td style="width: 750px;">${sessionScope.memId}</td>
				</tr>																		
		
				<tr class="tableTr">
					<!-- AJAX로 비밀번호 다른지 비교 -->
					<th> * 비밀번호  </th>
					<td>
						<input class="input" type="password" name="passwd" maxlength="15" value="${memberData.passwd}" onkeyup="comparepasswd()">
					</td>
				</tr>
				<tr class="tableTr">	
					<th> * 비밀번호 확인	</th>			
					<td>
						<input class="input" type="password" name="repasswd" maxlength="15" value="${memberData.passwd}" onkeyup="comparepasswd()">
						<div id="userPasswd" style="font-size:12px; margin-left: 5px; color: blue">
							비밀번호를 확인해주세요
						</div>
						<div id="userPasswd_overlap" style="font-size:12px; margin-left: 5px; color: red;">
						</div>						
					</td>
				</tr>				
				<tr class="tableTr">
					<th>* 이름</th>
					<td>
						${memberData.name }
					</td>
				</tr>
				<tr class="tableTr">
					<!-- AJAX로 닉네임 비교 -->
					<th>* 닉네임</th>
					<td>
						${memberData.nickname }
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="userNick" style="display:none; font-size:12px; margin-left: 5px; color: red"></div>
					</td>				
				</tr>
				<tr class="tableTr">
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
					<tr class="tableTr">
						<td>					
							<input class="input" type="text" name="adr" readonly="readonly" 
								style="width:500px" placeholder = "주소">						
						</td>
					</tr>
					<tr class="tableTr">
						<td>
							<input class="input" type="text" name="detail_adr"  readonly="readonly"
								style="width:500px"placeholder = "나머지주소">
						</td>
					</tr>
				</c:if>
				<c:if test="${memberData.address != null }">
					<c:set var="address" value="${fn:split( memberData.address, '|' )}"/>
					<tr class="tableTr">
						<td>					
							<input class="input" type="text" name="adr"  value="${address[0] }" readonly="readonly" 
								style="width:500px" placeholder = "주소">						
						</td>
					</tr>
					<tr class="tableTr">
						<td>
							<input class="input" type="text" name="detail_adr" value="${address[1] }"
								style="width:500px"placeholder = "나머지주소">
						</td>
					</tr>
				</c:if>
				<c:if test="${memberData.phone == null }">
					<tr class="tableTr">			
						<th> 전화번호 </th>
						<td>
							<input class="input" type="text" name="tel1"	
								maxlength="3" style="width: 34px" onkeyup="phoneCheck()">
							- <input class="input" type="text" name="tel2"	
								maxlength="4" style="width: 38px" onkeyup="phoneCheck()">	
							- <input class="input" type="text" name="tel3"	
								maxlength="4" style="width: 38px" onkeyup="phoneCheck()">	
						</td>				
					</tr>
				</c:if>
				<c:if test="${memberData.phone != null }">
					<c:set var="phone" value="${fn:split( memberData.phone, '-' )}"/>
					<tr class="tableTr">			
						<th> 전화번호 </th>
						<td>
							<input class="input" type="text" name="tel1"	
								maxlength="3" value="${phone[0] }" style="width: 34px" onkeyup="phoneCheck()">
							- <input class="input" type="text" name="tel2"	
								maxlength="4"  value="${phone[1] }" style="width: 38px" onkeyup="phoneCheck()">	
							- <input class="input" type="text" name="tel3"	
								maxlength="4"  value="${phone[2] }" style="width: 38px" onkeyup="phoneCheck()">	
						</td>				
					</tr>
				</c:if>
				
				<tr>
					<td colspan="2">
						<div id="userPhone" style="display:none; font-size:12px; margin-left: 5px; color: red"></div>
					</td>				
				</tr>
				
							
				<tr  class="tableTr">
					<!-- 이메일 전송 및 확인 -->
					
					<th> * 이메일  </th>
					<c:if test="${memberData.email == null }">
						<td>
							<input class="input" type="text" name="email1"
								maxlength="20" style="width: 100px" onkeyup="mailCheck()">
							@
							<input class="input" type="text" name="email2"
								maxlength="20" style="width: 100px" onkeyup="mailCheck()">					
						</td>
					</c:if>	
					
					<c:if test="${memberData.email != null }">
						<c:set var="email" value="${fn:split( memberData.email, '@' )}"/>
						<td>
							<input class="input" type="text" name="email1"
								maxlength="20" value="${email[0] }" style="width: 100px" onkeyup="mailCheck()">
							@
							<input class="input" type="text" name="email2"
								maxlength="20" value="${email[1] }" style="width: 100px" onkeyup="mailCheck()">					
						</td>
					</c:if>							
				</tr>
				<tr>
					<td colspan="2">
						<div id="userMail" style="display:none; font-size:12px; margin-left: 5px; color: red"></div>
					</td>				
				</tr>
				<tr class="tableTr">
					<th>가입일</th>
					<td>
						<fmt:formatDate value="${memberData.join_date }" type="date" pattern="yyyy년 MM월 dd일"/>
						
					</td>
				</tr>
				<tr class="tableTr" style="height: 30px">
					<td colspan="2" align="center">
						<input type="submit" value="수정">	
						<input type="button" value="취소" onclick="location='myPageView.do'">
						<input type="button" value="회원탈퇴" onclick="deleteMember()">
					</td>
				</tr>
			</table>
		</div>
	</form>		
</body>
