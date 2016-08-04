<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
vt_memberSearch.jsp
<script src="/TOP/request.js" type="text/javascript"></script>
<script src="/TOP/vt_administrator/script/admin.js" type="text/javascript"></script>

<c:if test="${pageNum!=0}">
	전체 사용자 수 : ${articleCount}
</c:if>
<c:if test="${pageNum==0}">
	검색된 사용자 수 : ${articleCount}
</c:if>

<body onload="memberSearchFormInit()">
	<form name="memberSearchForm">		
	<input type="hidden" name="userNumber" value="0">	
		<table border="1">
			<tr>
				<th colspan="5">
					회원리스트
				</th>
			</tr>	
			<tr>
				<th>
					검색
				</th>
				<td colspan="4">					
					<input type="text" name="searchMessage" onkeydown="if(event.keyCode==13) return false;">
					<select name="searchMeans" size="1">
						<option value="name" selected="selected">Name</option>
						<option value="id">ID</option>
						<option value="nickname">Nick</option>
					</select>
					<input type="button" value="검색" onclick="searchMember('${pageNum}')">
				</td>
			</tr>
			<tr>					
				<th>ID</th>
				<th>Name</th>
				<th>Nick</th>
				<th>JoinDate</th>
				<th>Register</th>									
			</tr>
			<c:if test="${articleCount != 0 }">
				<c:forEach var="i" begin="0" end="${memberDataList.size()-1}" step="1">
					<c:set var="userNumber" value="${userNumber+1}"/>
					<input type="hidden" name="userId_${userNumber}" value="0">
					
					<c:set var="memberData" value="${memberDataList[i]}"/>
					<c:if test="${memberData.authority_id == 2}">
						<tr style="cursor:pointer; ">						
							<td onclick="memberDataView('${userNumber}', '${memberData.id}', '${memberData.name}','${memberData.nickname}','${memberData.phone}', '${memberData.zipcode}','${memberData.address}','${memberData.email}','${memberData.join_date}')">${memberData.id }</td>
							<td onclick="memberDataView('${userNumber}', '${memberData.id}', '${memberData.name}','${memberData.nickname}','${memberData.phone}', '${memberData.zipcode}','${memberData.address}','${memberData.email}','${memberData.join_date}')">${memberData.name }</td>
							<td onclick="memberDataView('${userNumber}', '${memberData.id}', '${memberData.name}','${memberData.nickname}','${memberData.phone}', '${memberData.zipcode}','${memberData.address}','${memberData.email}','${memberData.join_date}')">${memberData.nickname }</td>
							<td onclick="memberDataView('${userNumber}', '${memberData.id}', '${memberData.name}','${memberData.nickname}','${memberData.phone}', '${memberData.zipcode}','${memberData.address}','${memberData.email}','${memberData.join_date}')"><fmt:formatDate value="${memberData.join_date }" pattern="yyyy-MM-dd" /></td>
							<td>
								<select name="searchMeans" size="1">
									<option value="ID" selected="selected">피트니스</option>
									<option value="NickName">인바디</option>
									<option value="email">스케줄</option>
								</select>			
								<input type="button" value="등록">				
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
			
		</table>
		
		<c:forEach var="i" begin="1" end="${pageCount}" step="1">
			<a href="memberSearch.do?pageNum=${i}">[${i}]&nbsp;</a>				
		</c:forEach>	
	</form>
</body>
