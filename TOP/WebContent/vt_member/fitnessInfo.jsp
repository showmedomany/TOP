<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<script src="${script}member.js" type="text/javascript"></script>
<div class="banner">
	<img src="${images}FitnessBanner.png">	
	<div class="bannerText">&nbsp;&nbsp;&nbsp;Fitness</div>
</div>

<div class="tableInfo">	
 
	<c:if test="${registerData!=null }">
		<table>			
			<tr class="tableTr">
				<th style="width: 200px;"> 등록일</th>
				<td style="width: 800px;"><fmt:formatDate value="${registerData.start_date }" type="date" pattern="yyyy년 MM월 dd일"/></td>
						
			</tr>
			<tr class="tableTr">
				<th>만료일</th>
				<td><fmt:formatDate value="${registerData.end_date }" type="date" pattern="yyyy년 MM월 dd일"/></td>	
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
					<td>${registerData.pt_count } 세트</td>
				</tr>
			</c:if>
			<c:if test="${registerData.pt_check=='false'}">
				<tr class="tableTr">
					<th>PT state</th>
					<td>이용안함</td>
				</tr>
			</c:if>						
		</table>
	</c:if>
	<c:if test="${registerData==null }">
		<div class="tableInfo">	
			<table class="tableNotInfo">
				<tr>
					<th>
						<h3>피트니스를 등록하세요</h3>
					</th>
				</tr>
			</table>
		</div>		
	</c:if>	
</div>		
			