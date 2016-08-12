<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %> 
<script src="${script}member.js" type="text/javascript"></script>

<c:if test="${inbodyData.check_date == null }">
				인바디 수치를 측정하세요
</c:if>
		
<c:if test="${inbodyData.check_date != null }">			
	<div class="tableInfo">	
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
				<td>${inbodyData.check_date }</td>	
			</tr>
		</table>
	</div>
</c:if>