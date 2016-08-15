<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %> 
<div class="banner">
	<img src="${images}CenterPayBanner.png">	
	<div class="bannerText">CenterPay</div>
</div>
<div class="tableInfo"> 
	<table>
		<tr class="tableTr">
			<th colspan="2" style="width:950px">회원정보</th>
		</tr>		
		<tr class="tableTr">	
			<th>아이디</th>
			<td align="center">${sessionScope.memId}</td>			
		</tr>
		<tr class="tableTr">	
			<th>이름</th>
			<td align="center">${memberData.name }</td>			
		</tr>
		<tr class="tableTr">	
			<th>닉네임</th>
			<td align="center">${memberData.nickname }</td>			
		</tr>
		<tr class="tableTr">	
			<th>가입일</th>
			<td align="center"><fmt:formatDate value="${memberData.join_date }" type="date" pattern="yyyy년 MM월 dd일"/></td>			
		</tr>
	</table>
	<br>
	<table>
		<tr class="tableTr">
			<th colspan="2" style="width:950px">휘트니스</th>
		</tr>
		<c:if test="${userCheckResult.register==1}">
			<tr class="tableTr" style="height: 30px;">
				<td colspan="2" align="center">휘트니스를 결제하셨습니다.</td>
			</tr>
			<tr class="tableTr">
				<th rowspan="2">기간&nbsp;&nbsp;&nbsp;</th>
				<td align="center"><fmt:formatDate value="${userCheckResult.register_start_date }" type="date" pattern="yyyy년 MM월 dd일"/></td>			
			</tr>
			<tr class="tableTr">
				<td align="center"><fmt:formatDate value="${userCheckResult.register_end_date }" type="date" pattern="yyyy년 MM월 dd일"/></td>			
			</tr>
		</c:if>
		<c:if test="${userCheckResult.register==0}">
			<tr class="tableTr">
				<td align="center">휘트니스를 결제하지 않으셨습니다.</td>
			</tr>
		</c:if>
	</table>
	<br>
	<%-- 	
	<table>	
		<tr class="tableTr">
			<th colspan="2" style="width:950px">인바디</th>
		</tr>	
		
		<c:if test="${userCheckResult.inbody==1}">
			<tr class="tableTr" style="height: 30px;">
				<td colspan="2" align="center">인바디를 등록하셨습니다.</td>
			</tr>
			<tr class="tableTr">
				<th>등록일</th>
				<td align="center"><fmt:formatDate value="${userCheckResult.inbody_date }" type="date" pattern="yyyy년 MM월 dd일"/></td>	
			</tr>
		</c:if>
		<c:if test="${userCheckResult.inbody==0}">
			<tr class="tableTr">
				<td align="center">인바디를 등록하지 않으셨습니다.</td>
			</tr>
		</c:if>
		
	</table>
	 --%>
	<br>
	<table>
		<tr class="tableTr">
			<th colspan="2" style="width:950px">운동루틴</th>
		</tr>
		<c:if test="${userCheckResult.register==1}">
			<tr class="tableTr" style="height: 30px;">
				<td colspan="2" align="center">운동루틴을 등록하셨습니다.</td>
			</tr>
			<tr class="tableTr">
				<th rowspan="2">기간&nbsp;&nbsp;&nbsp;</th>
				<td align="center"><fmt:formatDate value="${userCheckResult.routine_start_date }" type="date" pattern="yyyy년 MM월 dd일"/></td>			
			</tr>
			<tr class="tableTr">
				<td align="center"><fmt:formatDate value="${userCheckResult.routine_end_date }" type="date" pattern="yyyy년 MM월 dd일"/></td>			
			</tr>
		</c:if>
		<c:if test="${userCheckResult.register==0}">
			<tr class="tableTr">
				<td align="center">운동루틴을 등록하지 않으셨습니다.</td>
			</tr>
		</c:if>
	</table>	
</div>
		
