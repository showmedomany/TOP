<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %> 
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	</head>
	<body>
		vt_centerPaymentInfo.jsp
		<div class="vt_centerPaymentInfo_body">
			센타 결제 정보<br>
			id: ${id}<br>
			피트니스 정보
			<c:if test="${registerData!=null }">
				<table border="1">
					<tr>
						<th> 등록일</th>
						<td>${registerData.start_date }</td>
								
					</tr>
					<tr>
						<th>만료일</th>
						<td>${registerData.end_date }</td>	
					</tr>
					<tr>
						<th>기간</th>
						<td colspan="3">${registerData.exp_date } 개월</td>				
					</tr>		
					<tr>
						<th>GT state</th>
						<td colspan="3">
							<c:if test="${registerData.gx_check=='true'}">이용중</c:if>
							<c:if test="${registerData.gx_check=='false'}">이용안함</c:if>
						</td>					
					</tr>
					
					<c:if test="${registerData.pt_check=='true'}">
						<tr>
							<th>PT state</th>
							<td>이용중</td>
						</tr>
						<tr>
							<th>PT Count</th>
							<td>${registerData.pt_count }</td>
						</tr>
					</c:if>
					<c:if test="${registerData.pt_check=='false'}">
						<tr>
							<th>PT state</th>
							<td>이용안함</td>
						</tr>
					</c:if>
					<tr>
						<th>트레이너</th>
						<td>${registerData.trainer_id }</td>
					</tr>				
				</table>
			</c:if>
			<c:if test="${registerData==null }">
				피트니스를 등록하세요
			</c:if>			
			<br>
			<c:if test="${inbodyData.check_date == null }">
				인바디 수치를 측정하세요
			</c:if>
			
			<c:if test="${inbodyData.check_date != null }">			
				인바디 수치	
				<table border="1">	
				<tr>
					<th>나이</th>
					<td>${inbodyData.age }</td>			
				</tr>		
				<tr>
					<th>키</th>
					<td>${inbodyData.height }</td>			
				</tr>
				<tr>		
					<th>성별</th>
					<td>${inbodyData.sex }</td>	
				</tr>
				<tr>		
					<th>몸무게</th>
					<td>${inbodyData.weight }</td>	
				</tr>
				<tr>		
					<th>bmi 수치</th>
					<td>${inbodyData.bmi }</td>	
				</tr>
				<tr>		
					<th>수치 등록일</th>
					<td>${inbodyData.check_date }</td>	
				</tr>
				</table>
			</c:if>
		</div>		
	</body>
</html>
