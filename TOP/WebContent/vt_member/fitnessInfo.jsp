<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<script src="${script}member.js" type="text/javascript"></script>
<div class="tableInfo">	
 
	<c:if test="${registerData!=null }">
		<table>			
			<tr class="tableTr">
				<th style="width: 200px;"> 등록일</th>
				<td style="width: 800px;">${registerData.start_date }</td>
						
			</tr>
			<tr class="tableTr">
				<th>만료일</th>
				<td>${registerData.end_date }</td>	
			</tr>
			<tr class="tableTr">
				<th>기간</th>
				<td colspan="3">${registerData.exp_date } 개월</td>				
			</tr>		
			<tr class="tableTr">
				<th>GT state</th>
				<td colspan="3">
					<c:if test="${registerData.gx_check=='true'}">이용중</c:if>
					<c:if test="${registerData.gx_check=='false'}">이용안함</c:if>
				</td>					
			</tr>
			
			<c:if test="${registerData.pt_check=='true'}">
				<tr class="tableTr">
					<th>PT state</th>
					<td>이용중</td>
				</tr>
				<tr class="tableTr">
					<th>PT Count</th>
					<td>${registerData.pt_count }</td>
				</tr>
			</c:if>
			<c:if test="${registerData.pt_check=='false'}">
				<tr class="tableTr">
					<th>PT state</th>
					<td>이용안함</td>
				</tr>
			</c:if>
			<tr class="tableTr">
				<th>트레이너</th>
				<td>${registerData.trainer_id }</td>
			</tr>				
		</table>
	</c:if>
	<c:if test="${registerData==null }">
		피트니스를 등록하세요
	</c:if>	
</div>		
			