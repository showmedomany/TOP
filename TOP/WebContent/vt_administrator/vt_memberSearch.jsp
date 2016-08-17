<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>


<head>
	<script src="${request}" type="text/javascript"></script>
	<script src="${script}admin.js" type="text/javascript"></script>
	<link href = "${css}vt_admin_memberSearch.css" rel="stylesheet"	type="text/css">	
</head>

<body onload="memberSearchFormInit()">
	<div id="insertUserDiv"></div><br><br>
	
	<form name="memberSearchForm" onsubmit = "return onEnter()">	
		<input type="hidden" name="userNumber" value="0">
		<div class = "frame">	
			<table class="memberTable">
				<tr>
					<td>
						<c:if test="${pageNum!=0}">
							전체 사용자 수 : ${articleCount}
						</c:if>
						<c:if test="${pageNum==0}">
							'${searchMessage}'의 검색된 사용자 수 : ${articleCount}
						</c:if>
					</td>				
				</tr>
				<tr class="tableTr" >
					<th colspan="4">
						회원리스트
					</th>
					<th>
						<input type="button" name="meminput" value="회원등록" onclick="location.href = 'admin_input.do'">
					</th>
				</tr>	
				<tr class="tableTr" >
					<th>
						검색
					</th>
					<td align="center" colspan="4">					
						<input style="width: 450px;" type="text" name="searchMessage">
						<select name="searchMeans" size="1">
							<option value="name" selected="selected">Name</option>
							<option value="id">ID</option>
							<option value="nickname">Nick</option>
						</select>
						<input type="button" value="검색" onclick="searchMember('${pageNum}')">
					</td>
				</tr>
				<tr class="tableTr" >								
					<th style="width: 150px;">ID</th>
					<th style="width: 100px;">Name</th>
					<th style="width: 180px;">Nick</th>
					<th style="width: 200px;">JoinDate</th>
					<th style="width: 150px;">Register</th>
												
				</tr>
				<c:if test="${articleCount == 0 }">
					<tr>
						<th colspan="5">검색된 회원이 없습니다.&nbsp;&nbsp;&nbsp;<a href="admin_input.do" style="text-decoration: underline;font-weight: normal;">회원등록하기</a></th>
					</tr>				
				</c:if>
				<c:if test="${articleCount != 0 }">
					<c:forEach var="i" begin="0" end="${memberDataList.size()-1}" step="1">
						<c:set var="userNumber" value="${userNumber+1}"/>
						<input type="hidden" name="userId_${userNumber}" value="0">
						
						<c:set var="memberData" value="${memberDataList[i]}"/>
						<c:if test="${memberData.authority_id == 2}">
							<tr class="mambertableTr" style="cursor:pointer; ">												
								<td align="center" onclick="memberDataView('${userNumber}', '${memberData.id}', '${memberData.name}','${memberData.nickname}','${memberData.phone}', '${memberData.zipcode}','${memberData.address}','${memberData.email}','${memberData.join_date}')">${memberData.id }</td>
								<td align="center" onclick="memberDataView('${userNumber}', '${memberData.id}', '${memberData.name}','${memberData.nickname}','${memberData.phone}', '${memberData.zipcode}','${memberData.address}','${memberData.email}','${memberData.join_date}')">${memberData.name }</td>
								<td align="center" onclick="memberDataView('${userNumber}', '${memberData.id}', '${memberData.name}','${memberData.nickname}','${memberData.phone}', '${memberData.zipcode}','${memberData.address}','${memberData.email}','${memberData.join_date}')">${memberData.nickname }</td>
								<td align="center" onclick="memberDataView('${userNumber}', '${memberData.id}', '${memberData.name}','${memberData.nickname}','${memberData.phone}', '${memberData.zipcode}','${memberData.address}','${memberData.email}','${memberData.join_date}')"><fmt:formatDate value="${memberData.join_date }" pattern="yyyy년 MM월 dd일" /></td>
								<td align="center" >
									<c:set var="insertMeans" value="insertMeans_${userNumber}"/>				
									<select name="${insertMeans}" size="1">
										<option value="fitness" selected="selected">피트니스</option>
										<!-- <option value="inbody">인바디</option> -->
										<option value="schedule">스케줄</option>
									</select>			
									<input type="button" value="등록" onclick="insertUserInfo('${userNumber}','${memberData.id}')">			
								</td>											
							</tr>
							<tr>
								<td colspan="5">								
									<c:set var="userNumberDiv" value="div_${userNumber}"/>												
									<div id="${userNumberDiv}"></div>
								</td>	
							</tr>
						</c:if>					
					</c:forEach>
				</c:if>
				<tr class="tableTr">
					<td align="center" colspan="5">
						<c:if test="${startPage > pageBlock }">	
							<a href="memberSearch.do?pageNum=1">[◀◀]</a>
							<a href="memberSearch.do?pageNum=${startPage-pageBlock}">[◀]&nbsp;</a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage}" step="1">
							<c:if test="${startPage!=endPage }">
								<a href="memberSearch.do?pageNum=${i}">[${i}]&nbsp;</a>	
							</c:if>										
						</c:forEach>
						<c:if test="${pageCount > endPage }">
							<a href="memberSearch.do?pageNum=${startPage+pageBlock}">[▶]&nbsp;</a>
							<a href="memberSearch.do?pageNum=${pageCount}">[▶▶]</a>
						</c:if>
					</td>				
				</tr>				
			</table>
			
			
		</div>
	</form>
	
</body>
