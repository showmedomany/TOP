<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "setting.jsp" %>
   
<h2> zipCheck </h2>
<html>
	<head>
		<script src = "${script}vt_inputForm.js"></script>
	</head>
	<body>
		<form method="post" name="zipCheckForm" action="zipCheck.do" onsubmit="return serchadr()">
			<table class="vt_zipCheckForm_table">
				<tr>
					<th colspan="2"> </th>
				</tr>
				<tr>
					<th> 주소찾기 </th>
					<td>
						<input class = "input" type = "text" name = "inputarea">
						<input class = "inputbutton" type = "submit" value = "${str_inputForm_adr_search}">
					</td>
				</tr>
				<tr>
					<th colspan = "2">
						<input class = "inputbutton" type = "button" value = "${str_inputForm_bt_cancel}"
							onclick = "self.close();">
					</th>			
				</tr>
			</table>
			<br>
		</form>
		
		<c:if test = "${area ne null }">

			<c:if test = "${resultCheck eq 0 }">
				<table>
					<tr>
						<th> 우편번호</th>
						<th style = "width : 285px;">주소</th>
					</tr>
					<tr>
						<th colspan = "2">
						검색결과가 없습니다.
						</th>					
					</tr>
					
				</table>
			</c:if>
			
			<c:if test = "${resultCheck ne 0 }">
				<c:set var = "adto" value = "${adto }"/>
				
				<form method = "post" name = "addressform" 
					>
					<table>
						<tr>
							<th>주소</th>
							<th style = "width : 285px;" >지역</th>
						</tr>
						<c:forEach var = "adto" items="${adto }">
							<c:set var = "first" value = "${fn:substring(adto.zipcode,0,3) }"/>
							<c:set var = "second" value = "${fn:substring(adto.zipcode,4,7) }"/>
						
							<c:set var = "adr" 
								value = "${adto.area1} ${adto.area2} ${adto.area3} ${adto.area4}"/>
							
							<tr>							
								<th>
									<a onclick = "useadr('${first}','${second}','${adr }')">
										${adto.zipcode}
									</a>
								</th>
								<th>						
									<a onclick = "useadr('${first}','${second}','${adr }')">
										${adr}
									</a> 
								</th>								
							</tr>
						</c:forEach>						
					</table>
				</form>
			</c:if>
		</c:if>
	</body>
	
</html>

	 










