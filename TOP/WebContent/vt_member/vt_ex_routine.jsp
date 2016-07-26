<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>vt_ex_routine</title>		
		<script src="${script}request.js" type="text/javascript"></script>
		<script src="${script}vt_ex_routine.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="vt_ex_routine_body">
		
			<div class="vt_ex_routine_body_id">				
				회원아이디 : ${id }		
			
			</div>
			<div class="vt_ex_routine_body_startEnd_date">
				시작일 :	${StartEndDateData.start_date }<br>
				종료일 :	${StartEndDateData.end_date }<br>
			
			</div>
			<div class="vt_ex_routine_body_exerciseSchedule">
				<form>
					<table border="1">
						<tr>
							<th width="40" onclick="weekSchedule(1)">월</th>
							<th width="40" onclick="weekSchedule(2)">화</th>
							<th width="40" onclick="weekSchedule(3)">수</th>
							<th width="40" onclick="weekSchedule(4)">목</th>
							<th width="40" onclick="weekSchedule(5)">금</th>		
						</tr>
						<tr>
							
							<c:set var="WeekScheduleLength" value="${WeekScheduleList.size()}"/>			
								<td onclick="weekSchedule(1)">
								<c:forEach var="i" begin="0" end="${WeekScheduleLength-1}" step="1">
									<c:set var="WeekScheduleData" value="${WeekScheduleList.get(i)}"/>
									<c:if test="${WeekScheduleData.day == 'mon'}">						
										<c:if test="${WeekScheduleData.exercise_id==1}">
											<span onclick="partSchedule(1)">가슴</span><br>									
										</c:if>
										<c:if test="${WeekScheduleData.exercise_id==2}">
											<span onclick="partSchedule(2)">등</span><br>							
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==3}">
											<span>하체</span><br>							
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==4}">
											<span>팔_이두</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==5}">
											<span>팔_삼두</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==6}">
											<span>어깨</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==7}">
											<span>복근</span><br>								
										</c:if>						
									</c:if>
								</c:forEach>
								</td>	
								<td onclick="weekSchedule(2)">
								<c:forEach var="i" begin="0" end="${WeekScheduleLength-1}" step="1">
									<c:set var="WeekScheduleData" value="${WeekScheduleList.get(i)}"/>
									<c:if test="${WeekScheduleData.day == 'tue'}">						
										<c:if test="${WeekScheduleData.exercise_id==1}">
											<span onclick="partSchedule(1)">가슴</span><br>									
										</c:if>
										<c:if test="${WeekScheduleData.exercise_id==2}">
											<span onclick="partSchedule(2)">등</span><br>							
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==3}">
											<span>하체</span><br>							
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==4}">
											<span>팔_이두</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==5}">
											<span>팔_삼두</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==6}">
											<span>어깨</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==7}">
											<span>복근</span><br>								
										</c:if>						
									</c:if>
								</c:forEach>
								</td>	
								<td onclick="weekSchedule(3)">
								<c:forEach var="i" begin="0" end="${WeekScheduleLength-1}" step="1">
									<c:set var="WeekScheduleData" value="${WeekScheduleList.get(i)}"/>
									<c:if test="${WeekScheduleData.day == 'wed'}">						
										<c:if test="${WeekScheduleData.exercise_id==1}">
											<span onclick="partSchedule(1)">가슴</span><br>									
										</c:if>
										<c:if test="${WeekScheduleData.exercise_id==2}">
											<span onclick="partSchedule(2)">등</span><br>							
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==3}">
											<span>하체</span><br>							
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==4}">
											<span>팔_이두</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==5}">
											<span>팔_삼두</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==6}">
											<span>어깨</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==7}">
											<span>복근</span><br>								
										</c:if>						
									</c:if>
								</c:forEach>
								</td>	
								<td onclick="weekSchedule(4)">
								<c:forEach var="i" begin="0" end="${WeekScheduleLength-1}" step="1">
									<c:set var="WeekScheduleData" value="${WeekScheduleList.get(i)}"/>
									<c:if test="${WeekScheduleData.day == 'thur'}">						
										<c:if test="${WeekScheduleData.exercise_id==1}">
											<span onclick="partSchedule(1)">가슴</span><br>									
										</c:if>
										<c:if test="${WeekScheduleData.exercise_id==2}">
											<span onclick="partSchedule(2)">등</span><br>							
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==3}">
											<span>하체</span><br>							
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==4}">
											<span>팔_이두</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==5}">
											<span>팔_삼두</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==6}">
											<span>어깨</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==7}">
											<span>복근</span><br>								
										</c:if>					
									</c:if>
								</c:forEach>
								</td>	
								<td onclick="weekSchedule(5)">
								<c:forEach var="i" begin="0" end="${WeekScheduleLength-1}" step="1">
									<c:set var="WeekScheduleData" value="${WeekScheduleList.get(i)}"/>
									<c:if test="${WeekScheduleData.day == 'fri'}">											
										<c:if test="${WeekScheduleData.exercise_id==1}">
											<span onclick="partSchedule(1)">가슴</span><br>									
										</c:if>
										<c:if test="${WeekScheduleData.exercise_id==2}">
											<span onclick="partSchedule(2)">등</span><br>							
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==3}">
											<span>하체</span><br>							
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==4}">
											<span>팔_이두</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==5}">
											<span>팔_삼두</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==6}">
											<span>어깨</span><br>								
										</c:if>	
										<c:if test="${WeekScheduleData.exercise_id==7}">
											<span>복근</span><br>								
										</c:if>	
									</c:if>
								</c:forEach>
							</td>					
						</tr>
					
					
					</table>
				</form>
			</div>
			
			<!-- 요일 출력 -->
			<div id="weekScheduleResult" class="weekScheduleResult"></div>
			<!-- 부위별 운동이름 순서 출력 -->
			<div id="partExeriseResult" class="partExeriseResult"></div>
			<!-- 운동 상세 설명 -->
			<div id="exeriseInfo" class="exeriseInfo"></div>
			
			
			
			
		
		</div>
	</body>
</html>
    