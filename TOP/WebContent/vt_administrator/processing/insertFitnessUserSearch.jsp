<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/TOP/request.js" type="text/javascript"> </script>
<script src="/TOP/vt_administrator/script/admin.js" type="text/javascript"> </script>

<form name="insertForm">
	<input type="hidden" name="start_leapYear" value="${start_leapYear}">
	<input type="hidden" name="end_leapYear" value="${end_leapYear}">
	<input type="hidden" name="fitnessId" value="${id}">
	
	<!-- 결과가 없는경우 결과없다고 띄우기 -->
	<c:if test="${idCheckResult eq 0 }">
		${id}회원은 첫 등록입니다.<br>
	</c:if>
	
	아이디 : ${id}
	<table border = "1">
		<tr>
			<th>피트니스 기간</th>	
			<td>
				<input type = "text" name = "year">년
				<input type = "text" name = "month">월
				<input type = "text" name = "day">일
				<input type="text" name="exp_date" 
					value="${registerData.exp_date}" onkeydown="numOnly()">개월
			</td>			
		</tr>
		<tr>
			<th>피트니스 등록일</th>	
			<td>
				<select size="1" name="selectStartYear" onchange="leapYearCheck_start()">					
					<c:forEach var="i" begin="${startYear}" end="${startYear+20}" step="1">
						<c:if test="${startYear==i}">									
								<option value="${i}" selected="selected">${i}년</option>									
						</c:if>
						<c:if test="${startYear!=i}">	
								<option value="${i}">${i}년</option>									
						</c:if>								
					</c:forEach>
				</select>
				<select size="1" name="selectStartMonth" onchange="monthDataCheck_start()">
					<c:forEach var="i" begin="${startMonth}" end="12" step="1">
						<c:if test="${startMonth==i}">																		
							<option value="${i}" selected="selected">${i}월</option>
						</c:if>
						<c:if test="${startMonth!=i}">											
							<option value="${i}">${i}월</option>								
						</c:if>
					</c:forEach>
				</select>
				
				<!-- 윤년 윤달이면 셀렉터가 바뀌어야 한다. -->
				
				<div id = "selectStartDay" style="float: right; margin-top: 1px">
					<select size="1" name="selectStartDay">
						<c:forEach var="i" begin="1" end="12" step="1">
							<c:if test="${startMonth==i}">
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
						<c:forEach var="i" begin="${startDay}" end="${day}" step="1">
							<c:if test="${startDay==i}">		
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
			<th>피트니스 만료일</th>
			<td>		
				<select size="1" name="selectEndYear" onchange="leapYearCheck_end()">					
					<c:forEach var="i" begin="${endYear}" end="${endYear+20}" step="1">
						<c:if test="${endYear==i}">									
							<option value="${i}" selected="selected">${i}년</option>	
						</c:if>
						<c:if test="${endYear!=i}">
							<option value="${i}">${i}년</option>
						</c:if>
					</c:forEach>
				</select>
				<select size="1" name="selectEndMonth" onchange="monthDataCheck_end()">
					<c:forEach var="i" begin="${endMonth}" end="12" step="1">
						<c:if test="${endMonth==i}">																		
							<option value="${i}" selected="selected">${i}월</option>
							
						</c:if>
						<c:if test="${endMonth!=i}">															
							<option value="${i}">${i}월</option>								
						</c:if>
					</c:forEach>
				</select>
				<!-- end_day -->														
				<div id="selectEndDay" style="float: right; margin-top: 1px">				
					<select size="1" name="selectEndDay"  onchange="test()">
						<c:forEach var="i" begin="1" end="12" step="1">
							<c:if test="${endMonth==i}">
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
						<c:forEach var="i" begin="${endDay+1}" end="${day}" step="1">
							<c:if test="${endDay==i}">		
								<option value="${i}" selected="selected">${i}일</option>
							</c:if>
							<c:if test="${endDay!=i}">
								<option value="${i}">${i}일</option>									
							</c:if>
						</c:forEach>
					</select>
				</div>				
			</td>
		</tr>
		<tr>
			<th>GX여부</th>
			<td>
				<c:if test="${registerData.gx_check=='true'}">
					<input type="radio" name="GX" value="true" checked="checked">true
					<input type="radio" name="GX" value="false">false
				</c:if>
				<c:if test="${(registerData.gx_check=='false')||(registerData.gx_check eq null)}">
					<input type="radio" name="GX" value="true">true
					<input type="radio" name="GX" value="false" checked="checked">false
				</c:if>					
			</td>
		</tr>
		<tr>
			<th>PT여부</th>
			<td>
				<!-- 여기서 하겠다고 체크하면 밑에 pt횟수 창과 트레이너창 생기게 -->
				<c:if test="${registerData.pt_check=='true'}">
					<input type="radio" name="PT" value="true" checked="checked">true
					<input type="radio" name="PT" value="false">false
				</c:if>
				<c:if test="${(registerData.pt_check=='false')||(registerData.gx_check eq null)}">
					<input type="radio" name="PT" value="true">true
					<input type="radio" name="PT" value="false" checked="checked">false
				</c:if>					
			</td>
		</tr>		
		<tr>
			<th>PT 횟수</th>
			<td><input type="text" name="PTCount" value="${registerData.pt_count}" onkeydown="numOnly()"></td>
		</tr>
		<tr>
			<th>담당 트레이너</th>			
			<td>
				<select size="1" name="trainerId">
					<option value ="0" selected = "selected">트레이너를 선택해주세요</option>
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
				<input type="button" value="수정 및 저장" onclick="fitnessInsertProcess()">
				<div id="fitnessSaveDiv"></div>
				
			</td>
		</tr>
	</table>	
</form>











