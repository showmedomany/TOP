<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<%@ include file = "setting.jsp" %>
<script src="${script}member.js" type="text/javascript"></script>
<script src="/TOP/request.js" type="text/javascript"></script>

<div class="banner">
	<img src="${images}ExerciseRoutineBanner.png">	
	<div class="bannerText" style="margin-left: 180;">ExerciseRoutine</div>
</div>

	
<body>
	<c:if test="${checkResult==0}">		
		<div class="tableInfo">
			<table class="tableNotInfo">
				<tr>
					<td>
						<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						운동정보 루틴을 신청하세요.</h3>
					</td>
				</tr>
			</table>
		</div>
	</c:if>	
	<c:if test="${checkResult!=0}">
		<div class="tableInfo">
			<table>
				<tr class="tableTr">
					<th style="width: 200px;">루틴 시작일</th>
					<td style="width: 800px;"><fmt:formatDate value="${uesrRoutineInfoData.start_date }" type="date" pattern="yyyy년 MM월 dd일"/></td>			
				</tr>	
				<tr class="tableTr">
					<th>루틴 종료일</th>
					<td><fmt:formatDate value="${uesrRoutineInfoData.end_date }" type="date" pattern="yyyy년 MM월 dd일"/></td>		
				</tr>
					
			</table>		
		</div>	

		
		<div class="tableInfo">
			<form>
				<table style="text-align: center; cursor: pointer;">
					<tr>
						<td colspan="7" style="text-align: left;">
							해당요일을 클릭하면 운동루틴를 확인할 수 있습니다.
						</td>
					</tr>
					
					<tr class="tableTr" height="30">
						<th width="135" onclick="weekSchedule(1)">
							<c:if test="${day eq 2 }">
								Monday 강조
							</c:if>
							<c:if test="${day ne 2 }">
								Monday
							</c:if>							
						</th>
						<th width="135" onclick="weekSchedule(2)">
							<c:if test="${day eq 3 }">
								Tuesday 강조
							</c:if>
							<c:if test="${day ne 3 }">
								Tuesday
							</c:if>	
						</th>
						<th width="135" onclick="weekSchedule(3)">
							<c:if test="${day eq 4 }">
								<div class = "emp">Wednesday 강조</div>
							</c:if>
							<c:if test="${day ne 4 }">
								Wednesday
							</c:if>							
						</th>
						<th width="135" onclick="weekSchedule(4)">
							<c:if test="${day eq 5 }">
								Thursday 강조
							</c:if>
							<c:if test="${day ne 5 }">
								Thursday
							</c:if>
						</th>
						<th width="135" onclick="weekSchedule(5)">
							<c:if test="${day eq 6 }">
								Friday 강조
							</c:if>
							<c:if test="${day ne 6 }">
								Friday
							</c:if>
						</th>
						<th width="135" onclick="weekSchedule(6)">
							<c:if test="${day eq 7 }">
								Saturday 강조
							</c:if>
							<c:if test="${day ne 7 }">
								Saturday
							</c:if>
						</th>	
						<th width="135" onclick="weekSchedule(7)">
							<c:if test="${day eq 1 }">
								Sunday 강조
							</c:if>
							<c:if test="${day ne 1 }">
								Sunday
							</c:if>
						</th>		
					</tr>
					<!-- 현재 요일 강조 -->
					<tr class="tableTr">
					
						<td onclick="weekSchedule(1)">					
							<c:forEach var="i" begin="0" end="${exeriselistRoutine.size()-1 }" step="1" >
								<c:set var="exeriselistData" value="${exeriselistRoutine[i]}"/>
								<c:if test="${exeriselistData.day=='mon'}">								
									<c:if test="${exeriselistData.part_name != part}">
										<c:if test="${day eq 2 }">
											${exeriselistData.part_name }<br> 강조
										</c:if>
										<c:if test="${day ne 2 }">
											${exeriselistData.part_name }<br>
										</c:if>																			
										<c:set var="part" value="${exeriselistData.part_name }"/>																		
									</c:if>																	
								</c:if>
							</c:forEach>
						</td>
						
						<td onclick="weekSchedule(2)">					
							<c:forEach var="i" begin="0" end="${exeriselistRoutine.size()-1 }" step="1" >
								<c:set var="exeriselistData" value="${exeriselistRoutine[i]}"/>
								<c:if test="${exeriselistData.day=='tue'}">								
									<c:if test="${exeriselistData.part_name != part}">
										<c:if test="${day eq 3 }">
											${exeriselistData.part_name }<br> 강조
										</c:if>
										<c:if test="${day ne 3 }">
											${exeriselistData.part_name }<br>
										</c:if>
																			
										<c:set var="part" value="${exeriselistData.part_name }"/>																		
									</c:if>																	
								</c:if>
							</c:forEach>
						</td>
						
						<td onclick="weekSchedule(3)">					
							<c:forEach var="i" begin="0" end="${exeriselistRoutine.size()-1 }" step="1" >
								<c:set var="exeriselistData" value="${exeriselistRoutine[i]}"/>
								<c:if test="${exeriselistData.day=='wed'}">								
									<c:if test="${exeriselistData.part_name != part}">
										<c:if test="${day eq 4 }">
											${exeriselistData.part_name }<br> 강조
										</c:if>
										<c:if test="${day ne 4 }">
											${exeriselistData.part_name }<br>
										</c:if>
										<c:set var="part" value="${exeriselistData.part_name }"/>																		
									</c:if>																	
								</c:if>
							</c:forEach>
						</td>
						
						<td onclick="weekSchedule(4)">					
							<c:forEach var="i" begin="0" end="${exeriselistRoutine.size()-1 }" step="1" >
								<c:set var="exeriselistData" value="${exeriselistRoutine[i]}"/>
								<c:if test="${exeriselistData.day=='thu'}">								
									<c:if test="${exeriselistData.part_name != part}">
										<c:if test="${day eq 5 }">
											${exeriselistData.part_name }<br> 강조
										</c:if>
										<c:if test="${day ne 5 }">
											${exeriselistData.part_name }<br>
										</c:if>
										<c:set var="part" value="${exeriselistData.part_name }"/>																		
									</c:if>																	
								</c:if>
							</c:forEach>
						</td>
						
						<td onclick="weekSchedule(5)">					
							<c:forEach var="i" begin="0" end="${exeriselistRoutine.size()-1 }" step="1" >
								<c:set var="exeriselistData" value="${exeriselistRoutine[i]}"/>
								<c:if test="${exeriselistData.day=='fri'}">								
									<c:if test="${exeriselistData.part_name != part}">
										<c:if test="${day eq 6 }">
											${exeriselistData.part_name }<br> 강조
										</c:if>
										<c:if test="${day ne 6 }">
											${exeriselistData.part_name }<br>
										</c:if>
										<c:set var="part" value="${exeriselistData.part_name }"/>																		
									</c:if>																	
								</c:if>
							</c:forEach>
						</td>
						
						<td onclick="weekSchedule(6)">					
							<c:forEach var="i" begin="0" end="${exeriselistRoutine.size()-1 }" step="1" >
								<c:set var="exeriselistData" value="${exeriselistRoutine[i]}"/>
								<c:if test="${exeriselistData.day=='sat'}">								
									<c:if test="${exeriselistData.part_name != part}">
										<c:if test="${day eq 7 }">
											${exeriselistData.part_name }<br> 강조
										</c:if>
										<c:if test="${day ne 7 }">
											${exeriselistData.part_name }<br>
										</c:if>
										<c:set var="part" value="${exeriselistData.part_name }"/>																		
									</c:if>																	
								</c:if>
							</c:forEach>
						</td>
						
						<td onclick="weekSchedule(7)">					
							<c:forEach var="i" begin="0" end="${exeriselistRoutine.size()-1 }" step="1" >
								<c:set var="exeriselistData" value="${exeriselistRoutine[i]}"/>
								<c:if test="${exeriselistData.day=='sun'}">								
									<c:if test="${exeriselistData.part_name != part}">
										<c:if test="${day eq 1 }">
											${exeriselistData.part_name } 강조<br> 
										</c:if>
										<c:if test="${day ne 1 }">
											${exeriselistData.part_name }<br>
										</c:if>																			
										<c:set var="part" value="${exeriselistData.part_name }"/>																		
									</c:if>																	
								</c:if>
							</c:forEach>
						</td>
						
					</tr>
				</table>
			</form>
		</div>
		
		<div id="weekScheduleResult" style="margin-left: 50px; margin-top:50px"></div>	
		<div class="routine">		
			<div id="routineMonday" class="routineDiv" style="display: none;">			
			
				<c:set var="count" value="0"/>			
				<table class="tableClass">
					<tr class="routineTabel">
						<c:forEach var="i" begin="0" end="${exeriselistRoutine.size()-1 }" step="1" >	
								<c:set var="exeriselistData" value="${exeriselistRoutine[i]}"/>
								<c:if test="${count==6 || count==12 }">	
									<!-- 경고가 뜨지만 이렇게 하는게 맞음. -->
									</tr><tr style="height: 5px;"></tr><tr class="routineTabel">								
								</c:if>
								
								<c:if test="${exeriselistData.day=='mon'}">
									<td class="tableTr" style="width: 1000px; cursor: pointer;" onclick="exeriseInfo('${exeriselistData.name}')">
										<div class="exeriseNameDiv"><span class="exeriseText">${exeriselistData.name }</span></div>
										<c:set var="temp" value="${i}"/>
										<c:set var="count" value="${count+1}"/>									
									</td>				
								</c:if>	
						</c:forEach>
					</tr>				
				</table>						
			</div>
			
			<div id="routineTuesday" class="routineDiv" style="display: none;">			
			
				<c:set var="count" value="0"/>			
				<table class="tableClass">
					<tr class="routineTabel">
						<c:forEach var="i" begin="0" end="${exeriselistRoutine.size()-1 }" step="1" >	
								<c:set var="exeriselistData" value="${exeriselistRoutine[i]}"/>
								<c:if test="${count==6 || count==12 }">	
									<!-- 경고가 뜨지만 이렇게 하는게 맞음. -->
									</tr><tr style="height: 5px;"></tr><tr class="routineTabel">								
								</c:if>
								<c:if test="${exeriselistData.day=='tue'}">
									<td class="tableTr" style="width: 1000px; cursor: pointer;" onclick="exeriseInfo('${exeriselistData.name}')">
										<div class="exeriseNameDiv"><span class="exeriseText">${exeriselistData.name }</span></div>
										<c:set var="temp" value="${i}"/>
										<c:set var="count" value="${count+1}"/>									
									</td>				
								</c:if>	
						</c:forEach>
					</tr>				
				</table>						
			</div>
			
			<div id="routineWednesday" class="routineDiv" style="display: none;">			
			
				<c:set var="count" value="0"/>			
				<table class="tableClass">
					<tr class="routineTabel">
						<c:forEach var="i" begin="0" end="${exeriselistRoutine.size()-1 }" step="1" >	
								<c:set var="exeriselistData" value="${exeriselistRoutine[i]}"/>
								<c:if test="${count==6 || count==12 }">	
									<!-- 경고가 뜨지만 이렇게 하는게 맞음. -->
									</tr><tr style="height: 5px;"></tr><tr class="routineTabel">								
								</c:if>
								<c:if test="${exeriselistData.day=='wed'}">
									<td class="tableTr" style="width: 1000px; cursor: pointer;" onclick="exeriseInfo('${exeriselistData.name}')">
										<div class="exeriseNameDiv"><span class="exeriseText">${exeriselistData.name }</span></div>
										<c:set var="temp" value="${i}"/>
										<c:set var="count" value="${count+1}"/>									
									</td>				
								</c:if>	
						</c:forEach>
					</tr>				
				</table>						
			</div>
			
			<div id="routineThursday" class="routineDiv" style="display: none;">			
			
				<c:set var="count" value="0"/>			
				<table class="tableClass">
					<tr class="routineTabel">
						<c:forEach var="i" begin="0" end="${exeriselistRoutine.size()-1 }" step="1" >	
								<c:set var="exeriselistData" value="${exeriselistRoutine[i]}"/>
								<c:if test="${count==6 || count==12 }">	
									<!-- 경고가 뜨지만 이렇게 하는게 맞음. -->
									</tr><tr style="height: 5px;"></tr><tr class="routineTabel">								
								</c:if>
								<c:if test="${exeriselistData.day=='thu'}">
									<td class="tableTr" style="width: 1000px; cursor: pointer;" onclick="exeriseInfo('${exeriselistData.name}')">
										<div class="exeriseNameDiv"><span class="exeriseText">${exeriselistData.name }</span></div>
										<c:set var="temp" value="${i}"/>
										<c:set var="count" value="${count+1}"/>									
									</td>				
								</c:if>	
						</c:forEach>
					</tr>				
				</table>						
			</div>
			
			<div id="routineFriday" class="routineDiv" style="display: none;">			
			
				<c:set var="count" value="0"/>			
				<table class="tableClass">
					<tr class="routineTabel">
						<c:forEach var="i" begin="0" end="${exeriselistRoutine.size()-1 }" step="1" >	
								<c:set var="exeriselistData" value="${exeriselistRoutine[i]}"/>
								<c:if test="${count==6 || count==12 }">	
									<!-- 경고가 뜨지만 이렇게 하는게 맞음. -->
									</tr><tr style="height: 5px;"></tr><tr class="routineTabel">								
								</c:if>
								<c:if test="${exeriselistData.day=='fri'}">
									<td class="tableTr" style="width: 1000px; cursor: pointer;" onclick="exeriseInfo('${exeriselistData.name}')">
										<div class="exeriseNameDiv"><span class="exeriseText">${exeriselistData.name }</span></div>
										<c:set var="temp" value="${i}"/>
										<c:set var="count" value="${count+1}"/>									
									</td>				
								</c:if>	
						</c:forEach>
					</tr>				
				</table>						
			</div>
			
			<div id="routineSaturday" class="routineDiv" style="display: none;">			
			
				<c:set var="count" value="0"/>			
				<table class="tableClass">
					<tr class="routineTabel">
						<c:forEach var="i" begin="0" end="${exeriselistRoutine.size()-1 }" step="1" >	
								<c:set var="exeriselistData" value="${exeriselistRoutine[i]}"/>
								<c:if test="${count==6 || count==12 }">	
									<!-- 경고가 뜨지만 이렇게 하는게 맞음. -->
									</tr><tr style="height: 5px;"></tr><tr class="routineTabel">								
								</c:if>
								<c:if test="${exeriselistData.day=='sat'}">
									<td class="tableTr" style="width: 1000px; cursor: pointer;" onclick="exeriseInfo('${exeriselistData.name}')">
										<div class="exeriseNameDiv"><span class="exeriseText">${exeriselistData.name }</span></div>
										<c:set var="temp" value="${i}"/>
										<c:set var="count" value="${count+1}"/>									
									</td>				
								</c:if>	
						</c:forEach>
					</tr>				
				</table>						
			</div>
			
			<div id="routineSunday" class="routineDiv" style="display: none;">			
		
			<c:set var="count" value="0"/>			
				<table class="tableClass">
					<tr class="routineTabel">
						<c:forEach var="i" begin="0" end="${exeriselistRoutine.size()-1 }" step="1" >	
						<c:set var="exeriselistData" value="${exeriselistRoutine[i]}"/>
							<c:if test="${count==6 || count==12 }">	
								<!-- 경고가 뜨지만 이렇게 하는게 맞음. -->
								</tr><tr style="height: 5px;"></tr><tr class="routineTabel">								
							</c:if>
							<c:if test="${exeriselistData.day=='sun'}">
								<td class="tableTr" style="width: 1000px; cursor: pointer;" onclick="exeriseInfo('${exeriselistData.name}')">
									<div class="exeriseNameDiv"><span class="exeriseText">${exeriselistData.name }</span></div>
									<c:set var="temp" value="${i}"/>
									<c:set var="count" value="${count+1}"/>									
								</td>				
							</c:if>	
						</c:forEach>
					</tr>				
				</table>						
			</div>			
		</div>
	</c:if>
</body>



<!-- 운동 상세 설명 -->
<div id="exeriseInfo" class="exeriseInfo"></div>

