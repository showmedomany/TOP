<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		
<script src="/TOP/request.js" type="text/javascript"></script>
<script src="/TOP/vt_member/script/member.js" type="text/javascript"></script>
	
<body>
	<div class="vt_ex_routine_body">
		
				
			id : ${id }		
		
			<c:if test="${checkResult==0}">
				운동정보 루틴을 신청하세요.
			</c:if>
			<c:if test="${checkResult==1}">
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
												<p onclick="partSchedule(1)">가슴</p>									
											</c:if>
											<c:if test="${WeekScheduleData.exercise_id==2}">
												<p onclick="partSchedule(2)">등</p>							
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==3}">
												<p>하체</p>						
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==4}">
												<p>팔_이두</p>							
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==5}">
												<p>팔_삼두</p>							
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==6}">
												<p>어깨</p>							
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==7}">
												<p>복근</p>							
											</c:if>						
										</c:if>
									</c:forEach>
									</td>	
									<td onclick="weekSchedule(2)">
									<c:forEach var="i" begin="0" end="${WeekScheduleLength-1}" step="1">
										<c:set var="WeekScheduleData" value="${WeekScheduleList.get(i)}"/>
										<c:if test="${WeekScheduleData.day == 'tue'}">						
											<c:if test="${WeekScheduleData.exercise_id==1}">
												<p onclick="partSchedule(1)">가슴</p>								
											</c:if>
											<c:if test="${WeekScheduleData.exercise_id==2}">
												<p onclick="partSchedule(2)">등</p>						
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==3}">
												<p>하체</p>							
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==4}">
												<p>팔_이두</p>								
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==5}">
												<p>팔_삼두</p>							
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==6}">
												<p>어깨</p>						
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==7}">
												<p>복근</p>								
											</c:if>						
										</c:if>
									</c:forEach>
									</td>	
									<td onclick="weekSchedule(3)">
									<c:forEach var="i" begin="0" end="${WeekScheduleLength-1}" step="1">
										<c:set var="WeekScheduleData" value="${WeekScheduleList.get(i)}"/>
										<c:if test="${WeekScheduleData.day == 'wed'}">						
											<c:if test="${WeekScheduleData.exercise_id==1}">
												<p onclick="partSchedule(1)">가슴</p>									
											</c:if>
											<c:if test="${WeekScheduleData.exercise_id==2}">
												<p onclick="partSchedule(2)">등</p>							
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==3}">
												<p>하체</p>						
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==4}">
												<p>팔_이두</p>								
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==5}">
												<p>팔_삼두</p>								
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==6}">
												<p>어깨</p>							
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==7}">
												<p>복근</p>								
											</c:if>						
										</c:if>
									</c:forEach>
									</td>	
									<td onclick="weekSchedule(4)">
									<c:forEach var="i" begin="0" end="${WeekScheduleLength-1}" step="1">
										<c:set var="WeekScheduleData" value="${WeekScheduleList.get(i)}"/>
										<c:if test="${WeekScheduleData.day == 'thur'}">						
											<c:if test="${WeekScheduleData.exercise_id==1}">
												<p onclick="partSchedule(1)">가슴</p>								
											</c:if>
											<c:if test="${WeekScheduleData.exercise_id==2}">
												<p onclick="partSchedule(2)">등</p>					
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==3}">
												<p>하체</p>						
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==4}">
												<p>팔_이두</p>							
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==5}">
												<p>팔_삼두</p>							
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==6}">
												<p>어깨</p>							
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==7}">
												<p>복근</p>						
											</c:if>					
										</c:if>
									</c:forEach>
									</td>	
									<td onclick="weekSchedule(5)">
									<c:forEach var="i" begin="0" end="${WeekScheduleLength-1}" step="1">
										<c:set var="WeekScheduleData" value="${WeekScheduleList.get(i)}"/>
										<c:if test="${WeekScheduleData.day == 'fri'}">											
											<c:if test="${WeekScheduleData.exercise_id==1}">
												<p onclick="partSchedule(1)">가슴</p>									
											</c:if>
											<c:if test="${WeekScheduleData.exercise_id==2}">
												<p onclick="partSchedule(2)">등</p>						
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==3}">
												<p>하체</p>						
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==4}">
												<p>팔_이두</p>								
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==5}">
												<p>팔_삼두</p>							
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==6}">
												<p>어깨</p>							
											</c:if>	
											<c:if test="${WeekScheduleData.exercise_id==7}">
												<p>복근</p>							
											</c:if>	
										</c:if>
									</c:forEach>
								</td>					
							</tr>						
						</table>
					</form>
				</div>				
			</c:if>	
		<!-- 요일 출력 -->
		<div id="weekScheduleResult" class="weekScheduleResult"></div>
		<!-- 부위별 운동이름 순서 출력 -->
		<div id="partExeriseResult" class="partExeriseResult"></div>
		<!-- 운동 상세 설명 -->
		<div id="exeriseInfo" class="exeriseInfo"></div>		
	</div>
</body>

    