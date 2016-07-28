<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %> 
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="${script }vt_centerPaymentInfo.js" type="text/javascript"></script>
		
	</head>
	<body onload="vt_centerPaymentInfoInit()">
		<form name="centerPaymentInfo">
		<input type="hidden" name="centerPaymentInfo_hidden" value="0">
		
			vt_centerPaymentInfo.jsp
			<div class="vt_centerPaymentInfo_body">
				센타 결제 정보<br>
				id: ${id}<br>
				피트니스 정보
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
				<br>
				<c:if test="${inbodyData.check_date == null }">
				인바디 수치  <input type="button" name="insertInbody" value="등록" 
					onclick="insertInbodyDivView()">
				
				<div id = "insertInbodyDiv">					
						<table border="1">	
							<tr>
								<th>나이</th>
								<td>
									<input type="text" name="insertInbody_age">
								</td>			
							</tr>		
							<tr>
								<th>키</th>
								<td>
									<input type="text" name="insertInbody_height">
								</td>			
							</tr>
							<tr>		
								<th>성별</th>
								<td>
									<input type="text" name="insertInbody_sex">
								</td>	
							</tr>
							<tr>		
								<th>몸무게</th>
								<td>
									<input type="text" name="insertInbody_weight">
								</td>	
							</tr>
							<tr>		
								<th>bmi 수치</th>
								<td>
									<input type="text" name="insertInbody_bmi">
								</td>	
							</tr>
							<tr>
								<td colspan="2">
									<input type="button" value="저장" onclick="insertInbodySave()">
								</td>
							</tr>
						</table>
						
				</div>
				
				</c:if>
				<c:if test="${inbodyData.check_date != null }">			
				인바디 수치  <input type="button" name="updateInbody" value="수정">	
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
		</form>	
	</body>
</html>
