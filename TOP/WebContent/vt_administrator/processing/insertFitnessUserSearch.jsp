<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/TOP/request.js" type="text/javascript"> </script>
<script src="/TOP/vt_administrator/script/admin.js" type="text/javascript"> </script>

<form name="insertForm">
	<input type="hidden" name="start_leapYear" value="${start_leapYear}">
	<input type="hidden" name="fitnessId" value="${id}">
	
	
	<div class = "fit_frame">	
		
	<!-- 결과가 없는경우 결과없다고 띄우기 -->
	<table class="fit_table">
		<c:if test="${idCheckResult eq 0 }">
			<tr>
				<td colspan="2">'${id}'회원은 첫 등록입니다.</td>
			</tr>			
		</c:if>	
			<tr class="tableTr">
				<th style="width: 280px;">아이디</th>
				<td class="tableTd">${id}</td>
			</tr>
			
			<tr class="tableTr">
				<th>피트니스 등록일</th>	
				<td class="tableTd">
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
						<c:forEach var="i" begin="1" end="12" step="1">
							<c:if test="${startMonth==i}">																		
								<option value="${i}" selected="selected">${i}월</option>
							</c:if>
							<c:if test="${startMonth!=i}">											
								<option value="${i}">${i}월</option>								
							</c:if>
						</c:forEach>
					</select>
									
					<!-- 윤년 윤달이면 셀렉터가 바뀌어야 한다. -->
					
					<div id = "selectStartDay" style=" position: relative; float: right; top: 1px; left: -329px;">
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
							<c:forEach var="i" begin="1" end="${day}" step="1">
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
			<tr  class="tableTr">
				<th>피트니스 회원권 기간</th>	
				<td class="tableTd">
					<select size="1" name="termselect" onchange="termcalc()">					
						<c:forEach var="i" begin="1" end="12" step="1">
							<c:if test="${registerData.exp_date==i}">									
									<option value="${i}" selected="selected">${i}개월</option>									
							</c:if>
							<c:if test="${registerData.exp_date!=i}">	
									<option value="${i}">${i}개월</option>									
							</c:if>								
						</c:forEach>
					</select>
					<%-- 
					<input type="text" name="exp_date" 
						value="${registerData.exp_date}" onkeydown="numOnly()">개월
					 --%>				
				</td>			
			</tr>
			
			<tr class="tableTr">
				<th>피트니스 만료일</th>
				<td class="tableTd">
					<input type = "hidden" name = "expiYear" value = "${endYear}">
					<input type = "hidden" name = "expiMonth" value = "${endMonth}">
					<input type = "hidden" name = "expiDay" value = "${endDay}">
					<div id = "expichange">${endYear}년 ${endMonth}월 ${endDay}일</div>
				</td>
			</tr>
			<tr class="tableTr">
				<th>GX여부</th>
				<td class="tableTd">
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
			<tr class="tableTr">
				<th>PT여부</th>
				<td class="tableTd">
					<!-- 여기서 하겠다고 체크하면 밑에 pt횟수 창과 트레이너창 생기게 -->
					<c:if test="${registerData.pt_check=='true'}">
						<input type="radio" name="PT" value="true" checked="checked">true
						<input type="radio" name="PT" value="false">false
					</c:if>
					<c:if test="${(registerData.pt_check=='false')||(registerData.gx_check eq null)}">
						<!-- <input type="radio" name="PT" value="1" onclick = "pt_onoff(this.value,'ptcheck')">true -->
						<input type="radio" name="PT" value="true">true
						<input type="radio" name="PT" value="false" checked="checked">false
					</c:if>					
				</td>
			</tr>
			<tr class="tableTr">
				<th>PT 횟수</th>
				<c:if test="${idCheckResult == 0 }">					
					<td class="tableTd">
						<input type="text" name="PTCount" value="0" onkeydown="numOnly()">
					</td>								
				</c:if>
				<c:if test="${idCheckResult != 0 }">					
					<td class="tableTd">
						<input type="text" name="PTCount" value="${registerData.pt_count}" onkeydown="numOnly()">
					</td>
				</c:if>							
			</tr>
			<tr class="tableTr">
				<th colspan="2">
					<input name="fit_btn" type="button" value="수정 및 저장" onclick="fitnessInsertProcess()">
					<div id="fitnessSaveDiv"></div>
					
				</th>
			</tr>
			
		</table>
	</div>	
</form>











