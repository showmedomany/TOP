<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/TOP/request.js" type="text/javascript"> </script>
<script src="/TOP/vt_administrator/script/admin.js" type="text/javascript"> </script>
<form name="insertForm">
	<input type="hidden" name="start_leapYear" value="${start_leapYear}">
	<c:if test="${inbodyCheckResult!=0}">
		
		check_date: ${inbodyData.check_date }<br>
		<input type="hidden" name="inbodyId" value="${inbodyData.id }">
		아이디 : ${inbodyData.id }
		<table border="1">			
			<tr>
				<th>나이</th>
				<td><input type="text" name="age" value="${inbodyData.age }" onkeydown="numOnly()"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					 <c:if test="${inbodyData.sex=='male'}">
						<input type="radio" name="sex" value="male" checked="checked">male
						<input type="radio" name="sex" value="female">female
					</c:if>
					<c:if test="${inbodyData.sex=='female'}">
						<input type="radio" name="sex" value="male">male
						<input type="radio" name="sex" value="female" checked="checked">female
					</c:if>
				</td>
			</tr>
			<tr>
				<th>키</th>
				<td><input type="text" name="height" value="${inbodyData.height }" onkeydown="numOnly()"></td>
			</tr>
			<tr>
				<th>체중</th>
				<td><input type="text" name="weight" value="${inbodyData.weight }" onkeydown="numOnly()"></td>
			</tr>
			<tr>
				<th>bmi</th>
				<td><input type="text" name="bmi" value="${inbodyData.bmi }" onkeydown="numOnly()"></td>
			</tr>
			<%-- 
			<tr>
				<th>측정시간</th>
				<td>				
					<!-- start_year -->					
					<select size="1" name="selectStartYear" onchange="leapYearCheck_start()">								
						<c:forEach var="i" begin="${thisYear}" end="${thisYear+20}" step="1">
							<c:if test="${start_year==i}">
								<option value="${i}" selected="selected">${i}년</option>	
							</c:if>
							<c:if test="${start_year!=i}">
								<option value="${i}">${i}년</option>	
							</c:if>											
						</c:forEach>
					</select>					
								
					<select size="1" name="selectStartMonth" onchange="monthDataCheck_start()">
						<c:forEach var="i" begin="1" end="12" step="1">	
							<c:if test="${start_month == i}">										
								<option value="${i}" selected="selected">${i}월</option>
							</c:if>
							<c:if test="${start_month != i}">									
								<option value="${i}">${i}월</option>
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
			 --%>
			<tr>
				<td colspan="2">
					<input type="button" value="저장" onclick="inbodyInsertProcess()">				
					<div id="inbodySaveDiv"></div>
				</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${inbodyCheckResult==0}">
		<br><br>
		해당 회원은 인바디 정보를 입력하지 않았습니다.<br>
		
		id : ${id}
		<input type="hidden" name="inbodyId" value="${id}">
		<table border="1">
			<tr>
				<th>나이</th>
				<td><input type="text" name="age" onkeydown="numOnly()"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="sex" value="male" checked="checked">male
					<input type="radio" name="sex" value="female">female
				</td>
			</tr>
			<tr>
				<th>키</th>
				<td><input type="text" name="height" onkeydown="numOnly()"></td>
			</tr>
			<tr>
				<th>체중</th>
				<td><input type="text" name="weight" onkeydown="numOnly()"></td>
			</tr>
			<tr>
				<th>bmi</th>
				<td><input type="text" name="bmi" onkeydown="numOnly()"></td>
			</tr>
			<%-- 
			<tr>
				<th>측정시간</th>
				<td>				
					<!-- start_year -->					
					<select size="1" name="selectStartYear" onchange="leapYearCheck_start()">								
						<c:forEach var="i" begin="${thisYear}" end="${thisYear+20}" step="1">
							<c:if test="${thisYear==i}">
								<option value="${i}" selected="selected">${i}년</option>	
							</c:if>
							<c:if test="${thisYear!=i}">
								<option value="${i}">${i}년</option>	
							</c:if>											
						</c:forEach>
					</select>					
								
					<select size="1" name="selectStartMonth" onchange="monthDataCheck_start()">
						<c:forEach var="i" begin="1" end="12" step="1">	
							<c:if test="${thisMonth == i}">										
								<option value="${i}" selected="selected">${i}월</option>
							</c:if>
							<c:if test="${thisMonth != i}">									
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
								<c:if test="${today == i}">
									<option value="${i}" selected="selected" >${i}일</option>
								</c:if>
								<c:if test="${today != i}">
									<option value="${i}">${i}일</option>
								</c:if>
						
							</c:forEach>
						</select>
					</div>					
				</td>
			</tr>
			 --%>
			<tr>
				<td colspan="2">
					<input type="button" value="저장" onclick="inbodyInsertProcess()">
					<div id="inbodySaveDiv"></div>
				</td>
			</tr>
		</table>		
	</c:if>
</form>
