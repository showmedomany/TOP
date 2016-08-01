<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "setting.jsp" %>
   

<html>
	<head>
		<link href = "${css}vt_zipCheckFormStyle.css" rel = "stylesheet" type = "text/css">
		<script src = "${script}vtFrame.js"></script>		
		<script src = "${jquery}"></script>
		<%-- 
		<script src = "${script}vt_inputForm.js"></script>
		 --%>
	</head>
	<body>
		
		<form method="post" name="zipCheckForm" action="zipCheck.do" onsubmit="return serchadr()">
		
			<div class="vt_zipCheckForm_Frame"> 
				<div class="vt_zipCheckForm_header">
					우편번호 검색
				</div>
				<div class="vt_zipCheckForm_top">
					<div class="vt_zipCheckForm_info1">
						<p>입력창에 찾고자 하는 주소를 입력하세요.</p>
					</div>
					<div class="vt_zipCheckForm_ser">
						<input class = "input" type = "text" name = "inputarea" >
						<input class = "inputbutton" type = "submit" value = "${str_zipCheckForm_zip_search}">
						<!-- <input class = "inputbutton" type = "button" value = "검색" onclick = "search()"> -->
						<input class = "inputbutton" type = "button" value = "${str_zipCheckForm_zip_cancel}"
											onclick = "self.close();">
						
					</div>
					<div class="vt_zipCheckForm_info2">
						<p>예)성내동,신천동,개포동</p>
					</div>
				</div>
			</div>
			
		</form>
		<div class = "vt_zipCheckForm_center">
			<c:if test = "${area ne null }">
				<c:if test = "${resultCheck eq 0 }">
					<table>
						<tr>
							<th> ${str_zipCheckForm_zipNum} </th>
							<th style = "width : 285px;">${str_inputForm_adr}</th>
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
					<form method = "post" name = "addressform">
						<table>
							<tr>
								<th>${str_inputForm_adr} </th>
								<th style = "width : 285px;" >${str_zipCheckForm_ziparea}</th>
							</tr>
							<c:forEach var = "adto" items="${adto }">
								<c:set var = "first" value = "${fn:substring(adto.zipcode,0,3) }"/>
								<c:set var = "second" value = "${fn:substring(adto.zipcode,4,7) }"/>
							
								<c:set var = "adr" 
									value = "${adto.area1} ${adto.area2} ${adto.area3} ${adto.area4}"/>
								<tr>							
									<th>
										<a onclick = "useadr('${first}','${second}','${adr}')">
											${adto.zipcode}
										</a>
									</th>
									<th>
										<a onclick = "useadr('${first}','${second}','${adr}')">
	
											${adr}
										</a> 
									</th>								
								</tr>
							</c:forEach>						
						</table>
					</form>	
				</c:if>			
			</c:if>
		</div>
	</body>
</html>

	 










