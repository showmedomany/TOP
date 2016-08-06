<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- form 은 div밖에 있음 -->
<script src="/TOP/request.js" type="text/javascript"> </script>
<script src="/TOP/vt_administrator/script/admin.js" type="text/javascript"> </script>

<body>
	<form name="userSearchFitnessInfoForm">
		<input type="hidden" name="start_leapYear" value="${start_leapYear}">
		<input type="hidden" name="end_leapYear" value="${end_leapYear}">
		<input type="hidden" name="fitnessId" value="${id}">
		<c:if test="${idCheckResult!=0}">
			<br><br>
			아이디 : ${id}
			<table border="1">			
				<tr>
					<th>피트니스 번호</th>
					<td>${registerData.register_id}</td>
				</tr>
				<tr>
					<th>피트니스 기간</th>
					<td><input type="text" name="exp_date" value="${registerData.exp_date}">개월</td>			
				</tr>
				<tr>			
					<th>피트니스 시작일</th>				
					<td>				
						<!-- start_year -->					
						<select size="1" name="selectStartYear" onchange="leapYearCheck_start()">					
							<c:forEach var="i" begin="${year}" end="${year+20}" step="1">
								<c:if test="${year==i}">									
										<option value="${i}" selected="selected">${i}년</option>									
								</c:if>
								<c:if test="${year!=i}">	
										<option value="${i}">${i}년</option>									
								</c:if>								
							</c:forEach>
						</select>
						
						<!-- start_month  vt_fitnessInsert.js 에 함수 있음 -->						
						<select size="1" name="selectStartMonth" onchange="monthDataCheck_start()">
							<c:forEach var="i" begin="1" end="12" step="1">
								<c:if test="${start_month==i}">
									<c:if test="${i lt 10}">										
										<option value="${i}" selected="selected">${i}월</option>
									</c:if>
									<c:if test="${i gt 9}">										
										<option value="${i}" selected="selected">${i}월</option>
									</c:if>
								</c:if>
								<c:if test="${start_month!=i}">
									<c:if test="${i lt 10}">										
										<option value="${i}">${i}월</option>
									</c:if>
									<c:if test="${i gt 9}">									
										<option value="${i}">${i}월</option>
									</c:if>
								</c:if>
							</c:forEach>
						</select>
						<!-- start_day -->														
						<div id="selectStartDay" style="float: right; margin-top: 1px">				
							<select size="1" name="selectStartDay">
								<c:forEach var="i" begin="1" end="12" step="1">
									<c:if test="${start_month==i}">
										<c:if test="${i==2}">
											<c:if test="${start_leapYear==true}">
												<c:set var="day" value="29"/>
											</c:if>
											<c:if test="${start_leapYear==false}">											
												<c:set var="day" value="28"/>
											</c:if>
										</c:if>
										<c:if test="${i==1 or i==3 or i==5 or i==7 or i==8 or i==12}">
											<c:set var="day" value="31"/>
										</c:if>
										<c:if test="${i==4 or i==6 or i==9 or i==10 or i==11 }">
											<c:set var="day" value="30"/>
										</c:if>
									</c:if>														
								</c:forEach>
								<c:forEach var="i" begin="1" end="${day}" step="1">
									<c:if test="${start_day==i}">		
										<option value="${i}" selected="selected">${i}일</option>
									</c:if>
									<c:if test="${start_day!=i}">
										<option value="${i}">${i}일</option>									
									</c:if>
								</c:forEach>
							</select>
						</div>					
					</td>			
				</tr>			
				<tr>
					<th>피트니스 종료일</th>
					<td>			
						<!-- end_year -->					
						<select size="1" name="selectEndYear" onchange="leapYearCheck_end()">					
							<c:forEach var="i" begin="${year}" end="${year+20}" step="1">
								<c:if test="${end_year==i}">									
									<option value="${i}" selected="selected">${i}년</option>	
								</c:if>
								<c:if test="${end_year!=i}">
									<option value="${i}">${i}년</option>
								</c:if>
							</c:forEach>
						</select>				
						<!-- end_month  vt_fitnessInsert.js 에 함수 있음 -->						
						<select size="1" name="selectEndMonth" onchange="monthDataCheck_end()">
							<c:forEach var="i" begin="1" end="12" step="1">
								<c:if test="${end_month==i}">
									<c:if test="${i lt 10}">										
										<option value="${i}" selected="selected">${i}월</option>
									</c:if>
									<c:if test="${i gt 9}">										
										<option value="${i}" selected="selected">${i}월</option>
									</c:if>
								</c:if>
								<c:if test="${end_month!=i}">
									<c:if test="${i lt 10}">										
										<option value="${i}">${i}월</option>
									</c:if>
									<c:if test="${i gt 9}">									
										<option value="${i}">${i}월</option>
									</c:if>
								</c:if>
							</c:forEach>
						</select>
						<!-- end_day -->														
						<div id="selectEndDay" style="float: right; margin-top: 1px">				
							<select size="1" name="selectEndDay">
								<c:forEach var="i" begin="1" end="12" step="1">
									<c:if test="${end_month==i}">
										<c:if test="${i==2}">
											<c:if test="${end_leapYear==true}">
												<c:set var="day" value="29"/>
											</c:if>
											<c:if test="${end_leapYear==false}">											
												<c:set var="day" value="28"/>
											</c:if>
										</c:if>
										<c:if test="${i==1 or i==3 or i==5 or i==7 or i==8 or i==12}">
											<c:set var="day" value="31"/>
										</c:if>
										<c:if test="${i==4 or i==6 or i==9 or i==10 or i==11 }">
											<c:set var="day" value="30"/>
										</c:if>
									</c:if>														
								</c:forEach>
								<c:forEach var="i" begin="1" end="${day}" step="1">
									<c:if test="${end_day==i}">		
										<option value="${i}" selected="selected">${i}일</option>
									</c:if>
									<c:if test="${end_day!=i}">
										<option value="${i}">${i}일</option>									
									</c:if>
								</c:forEach>
							</select>
						</div>				
					</td>
				</tr>
				<tr>
					<th>GX</th>
					<td>
						<c:if test="${registerData.gx_check=='true'}">
							<input type="radio" name="GX" value="true" checked="checked">true
							<input type="radio" name="GX" value="false">false
						</c:if>
						<c:if test="${registerData.gx_check=='false'}">
							<input type="radio" name="GX" value="true">true
							<input type="radio" name="GX" value="false" checked="checked">false
						</c:if>					
					</td>
				</tr>
				<tr>
					<th>PT</th>
					<td>
						<c:if test="${registerData.pt_check=='true'}">
							<input type="radio" name="PT" value="true" checked="checked">true
							<input type="radio" name="PT" value="false">false
						</c:if>
						<c:if test="${registerData.pt_check=='false'}">
							<input type="radio" name="PT" value="true">true
							<input type="radio" name="PT" value="false" checked="checked">false
						</c:if>					
					</td>
				</tr>
				<tr>
					<th>PT Count</th>
					<td><input type="text" name="PTCount" value="${registerData.pt_count}"></td>
				</tr>			
				<tr>
					<th>담당 트레이너</th>			
					<td>
						<select size="1" name="trainerId">
							<c:forEach var="i" begin="0" end="${trainerIdList.size()-1 }" step="1">
								<c:if test="${trainerIdList[i]==registerData.trainer_id}">
									<option value="${trainerIdList[i]}" selected="selected">${trainerIdList[i]}</option>	
								</c:if>
								<c:if test="${trainerIdList[i]!=registerData.trainer_id}">
									<option value="${trainerIdList[i]}">${trainerIdList[i]}</option>	
								</c:if>											
							</c:forEach>				
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<c:set var="saveType" value="update"/>
						<input type="button" value="수정 및 저장" onclick="fitnessInsertProcess('${saveType}')">
						<div id="fitnessEffDiv"></div>
						<div id="fitnessSaveDiv"></div>
						
					</td>
				</tr>		
			</table>
		</c:if>
		<c:if test="${idCheckResult==0}">
			<br>해당 회원은 피트니스를 기입하지 않았습니다<br><br>
			아이디 : ${id}<br>
			
			<table border="1">
				<tr>
					<th>피트니스 기간</th>
					<td><input type="text" name="exp_date" value="0">개월</td>			
				</tr>
				<tr>			
					<th>피트니스 시작일</th>				
					<td>				
						<!-- start_year -->					
						<select size="1" name="selectStartYear" onchange="leapYearCheck_start()">								
							<c:forEach var="i" begin="${year}" end="${year+20}" step="1">
								<c:if test="${year==i}">
									<option value="${i}" selected="selected">${i}년</option>	
								</c:if>
								<c:if test="${year!=i}">
									<option value="${i}">${i}년</option>	
								</c:if>											
							</c:forEach>
						</select>
						
						<!-- start_month  vt_fitnessInsert.js 에 함수 있음 -->			
						<select size="1" name="selectStartMonth" onchange="monthDataCheck_start()">
							<c:forEach var="i" begin="1" end="12" step="1">	
								<c:if test="${i lt 10}">										
									<option value="${i}">${i}월</option>
								</c:if>
								<c:if test="${i gt 9}">									
									<option value="${i}">${i}월</option>
								</c:if>							
							</c:forEach>
						</select>
						<!-- start_day -->														
						<div id="selectStartDay" style="float: right; margin-top: 1px">				
							<select size="1" name="selectStartDay">
								<c:forEach var="i" begin="1" end="12" step="1">								
									<c:if test="${i==2}">
									
										<c:if test="${start_leapYear==true}">
											<c:set var="day" value="29"/>
										</c:if>
										<c:if test="${start_leapYear==false}">											
											<c:set var="day" value="28"/>
										</c:if>
									 
									<c:set var="day" value="28"/>
									
									</c:if>
									<c:if test="${i==1 or i==3 or i==5 or i==7 or i==8 or i==12}">
										<c:set var="day" value="31"/>
									</c:if>
									<c:if test="${i==4 or i==6 or i==9 or i==10 or i==11 }">
										<c:set var="day" value="30"/>
									</c:if>																						
								</c:forEach>
								<c:forEach var="i" begin="1" end="${day}" step="1">
										<option value="${i}">${i}일</option>	
								</c:forEach>
							</select>
						</div>					
					</td>			
				</tr>
				<tr>
					<th>피트니스 종료일</th>
					<td>				
						<!-- end_year -->					
						<select size="1" name="selectEndYear" onchange="leapYearCheck_end()">			
							<c:forEach var="i" begin="${year}" end="${year+20}" step="1">								
								<c:if test="${year==i}">
									<option value="${i}" selected="selected">${i}년</option>
								</c:if>
								<c:if test="${year!=i}">
									<option value="${i}">${i}년</option>
								</c:if>								
							</c:forEach>
						</select>
						
						<!-- end_month  vt_fitnessInsert.js 에 함수 있음 -->						
						<select size="1" name="selectEndMonth" onchange="monthDataCheck_end()">
							<c:forEach var="i" begin="1" end="12" step="1">								
								<c:if test="${i lt 10}">
									<option value="${i}">${i}월</option>
								</c:if>
								<c:if test="${i gt 9}">
									<option value="${i}">${i}월</option>
								</c:if>
							</c:forEach>
						</select>
						<!-- end_day -->
				
						<div id="selectEndDay" style="float: right; margin-top: 1px">				
							<select size="1" name="selectEndDay">
								<c:forEach var="i" begin="1" end="12" step="1">								
									<c:if test="${i==2}">							
										<c:if test="${start_leapYear==true}">
											<c:set var="day" value="29"/>
										</c:if>
										<c:if test="${start_leapYear==false}">											
											<c:set var="day" value="28"/>
										</c:if>								  
									<c:set var="day" value="28"/>
									
									</c:if>
									<c:if test="${i==1 or i==3 or i==5 or i==7 or i==8 or i==12}">
										<c:set var="day" value="31"/>
									</c:if>
									<c:if test="${i==4 or i==6 or i==9 or i==10 or i==11 }">
										<c:set var="day" value="30"/>
									</c:if>																						
								</c:forEach>
								<c:forEach var="i" begin="1" end="${day}" step="1">
									<c:if test="${end_day==i}">		
										<option value="${i}" selected="selected">${i}일</option>
									</c:if>
									<c:if test="${end_day!=i}">
										<option value="${i}">${i}일</option>					
		
					
									</c:if>
								</c:forEach>
							</select>
						</div>				
					</td>
				</tr>
				
				<tr>
					<th>GX</th>
					<td>					
						<input type="radio" name="GX" value="true">true
						<input type="radio" name="GX" value="false" checked="checked">false										
					</td>
				</tr>
				<tr>
					<th>PT</th>
					<td>
						<input type="radio" name="PT" value="true">true
						<input type="radio" name="PT" value="false" checked="checked">false									
					</td>
				</tr>
				<tr>
					<th>PT Count</th>
					<td><input type="text" name="PTCount"></td>
				</tr>
				<tr>
					<th>담당 트레이너</th>			
					<td>
						<select size="1" name="trainerId">
							<option value="0" selected="selected">트레이너 선택</option>
							<c:forEach var="i" begin="0" end="${trainerIdList.size()-1 }" step="1">
								<option value="${trainerIdList[i]}">${trainerIdList[i]}</option>				
							</c:forEach>					
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<c:set var="saveType" value="insert"/>
						<input type="button" value="입력 및 저장" onclick="fitnessInsertProcess('${saveType}')">				
						<div id="fitnessEffDiv"></div>
						<div id="fitnessSaveDiv"></div>
					</td>
				</tr>					
			</table>		
		</c:if>
	</form>
</body>