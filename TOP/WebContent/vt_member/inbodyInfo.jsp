<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %> 
<script src="${script}member.js" type="text/javascript"></script>
<div class="banner">
	<img src="${images}InbodyBanner.png">	
	<div class="bannerText">&nbsp;&nbsp;&nbsp;Inbody</div>
</div>

<div class="tableInfo">	
	<c:if test="${inbodyData.check_date == null }">
		<div class="tableInfo">	
			<table class="tableNotInfo">
				<tr>
					<th>
						<h3>인바디 수치를 측정하세요</h3>
					</th>
				</tr>
			</table>
		</div>				
	</c:if>
		
	<c:if test="${inbodyData.check_date != null }">	
		<table>	
			<tr class="tableTr">
				<th style="width: 200px;">나이</th>
				<td style="width: 800px;">${inbodyData.age }</td>			
			</tr>		
			<tr class="tableTr">
				<th>키</th>
				<td>${inbodyData.height }</td>			
			</tr>
			<tr class="tableTr">		
				<th>성별</th>
				<td>${inbodyData.sex }</td>	
			</tr>
			<tr class="tableTr">		
				<th>몸무게</th>
				<td>${inbodyData.weight }</td>	
			</tr>
			<tr class="tableTr">		
				<th>bmi 수치</th>
				<td>${inbodyData.bmi }</td>	
			</tr>
			<tr class="tableTr">		
				<th>수치 등록일</th>
				<td><fmt:formatDate value="${inbodyData.check_date }" type="date" pattern="yyyy년 MM월 dd일"/></td>	
			</tr>
		</table>	
	</c:if>
</div>

