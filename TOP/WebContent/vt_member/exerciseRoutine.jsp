<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<%@ include file = "setting.jsp" %>
<script src="${script}member.js" type="text/javascript"></script>
<script src="/TOP/request.js" type="text/javascript"></script>
<link href = "${css}myPageStyle.css" rel="stylesheet"	type="text/css">

<body onload="exerciseInit()">
	<c:if test="${checkResult==0}">
		운동정보 루틴을 신청하세요.
	</c:if>
	<c:if test="${checkResult==1}">
		
		<div class="tableInfo">
			<table>
				<tr class="tableTr">
					<th style="width: 200px;">루틴 시작일</th>
					<td style="width: 800px;">${uesrRoutineInfoData.start_date }</td>			
				</tr>	
				<tr class="tableTr">
					<th>루틴 종료일</th>
					<td>${uesrRoutineInfoData.end_date }</td>		
				</tr>
					
			</table>		
		</div>
		
		${exeriselist[0].day }
		${exeriselist[0].part_name}
		${exeriselist[0].exercise_id }
		
		<c:set var="count" value="0" />
		<div class="tableInfo">
			<form>
				<table>
					<tr class="tableTr" height="30">
						<th width="190" onclick="weekSchedule(1)">Monday</th>
						<th width="190" onclick="weekSchedule(2)">Tuesday</th>
						<th width="190" onclick="weekSchedule(3)">Wednesday</th>
						<th width="190" onclick="weekSchedule(4)">Thursday</th>
						<th width="190" onclick="weekSchedule(5)">Friday</th>		
					</tr>
					
					
												
					</tr>
				</table>
			</form>
		</div>
	</c:if>
	
	<div id="weekScheduleResult" style="margin-left: 50px; margin-top:50px"></div>
	<div class="routine">		
		<div id="routineMonday" class="routineDiv">
			<div class="routineSub"></div>
			<table class="tableClass" style="top:20px;">
				<c:forEach var="i" begin="0" end="${userMemberRoutineList.size()-1 }" step="1" >
					<tr class="routineTabel">			
						<c:set var="userMemberRoutineDate" value="${userMemberRoutineList[i]}"/>
						<c:if test="${userMemberRoutineDate.day=='mon'}">							
							<td style="width: 1000px;">
								<c:forEach var="j" begin="0" end="${exeriselist.size()-1 }" step="1">
									<c:set var="exerise" value="${exeriselist[j]}"/>
									<c:if test="${exerise.exercise_id == exerciseIds[count] }">									
										<span class="spanText" onclick="exeriseInfo(${count})">${exerise.name}</span>		
									</c:if>					
								</c:forEach>	
								<c:set var="count" value="${count+1}" />
							</td>													
						</c:if>			
					</tr>
				</c:forEach>	
			</table>			
		</div>
		
		<div id="routineTuesday" class="routineDiv">
			<div class="routineSub"></div>
			<table class="tableClass" style="top:-10px;">
				<c:forEach var="i" begin="0" end="${userMemberRoutineList.size()-1 }" step="1" >
					<tr class="routineTabel">			
						<c:set var="userMemberRoutineDate" value="${userMemberRoutineList[i]}"/>
						<c:if test="${userMemberRoutineDate.day=='tue'}">
							<td style="width: 1000px;">
								<c:forEach var="j" begin="0" end="${exeriselist.size()-1 }" step="1">
									<c:set var="exerise" value="${exeriselist[j]}"/>
									<c:if test="${exerise.exercise_id == exerciseIds[count] }">
											<span onclick="exeriseInfo(${count})">${exerise.name}</span>	
									</c:if>					
								</c:forEach>	
								<c:set var="count" value="${count+1}" />
							</td>													
						</c:if>			
					</tr>
				</c:forEach>	
			</table>
		</div>
		
		<div id="routineWednesday" class="routineDiv">
			<div class="routineSub"></div>
			<table class="tableClass" style="top:-38px;">
				<c:forEach var="i" begin="0" end="${userMemberRoutineList.size()-1 }" step="1" >
					<tr class="routineTabel">			
						<c:set var="userMemberRoutineDate" value="${userMemberRoutineList[i]}"/>
						<c:if test="${userMemberRoutineDate.day=='wed'}">
							<td style="width: 1000px;">
								<c:forEach var="j" begin="0" end="${exeriselist.size()-1 }" step="1">
									<c:set var="exerise" value="${exeriselist[j]}"/>
									<c:if test="${exerise.exercise_id == exerciseIds[count] }">
											<span onclick="exeriseInfo(${count})">${exerise.name}</span>	
									</c:if>					
								</c:forEach>	
								<c:set var="count" value="${count+1}" />
							</td>													
						</c:if>			
					</tr>
				</c:forEach>	
			</table>	
		</div>
		
		<div id="routineThursday" class="routineDiv">
			<div class="routineSub"></div>
			<table class="tableClass" style="top:-68px;">
				<c:forEach var="i" begin="0" end="${userMemberRoutineList.size()-1 }" step="1" >
					<tr class="routineTabel">			
						<c:set var="userMemberRoutineDate" value="${userMemberRoutineList[i]}"/>
						<c:if test="${userMemberRoutineDate.day=='thur'}">
							<td style="width: 1000px;">
								<c:forEach var="j" begin="0" end="${exeriselist.size()-1 }" step="1">
									<c:set var="exerise" value="${exeriselist[j]}"/>
									<c:if test="${exerise.exercise_id == exerciseIds[count] }">
											<span onclick="exeriseInfo(${count})">${exerise.name}</span>	
									</c:if>					
								</c:forEach>	
								<c:set var="count" value="${count+1}" />
							</td>													
						</c:if>			
					</tr>
				</c:forEach>	
			</table>		
		</div>
		
		<div id="routineFriday" class="routineDiv">
			<div class="routineSub"></div>
			<table class="tableClass" style="top:-96;">
				<c:forEach var="i" begin="0" end="${userMemberRoutineList.size()-1 }" step="1" >
					<tr class="routineTabel">			
						<c:set var="userMemberRoutineDate" value="${userMemberRoutineList[i]}"/>
						<c:if test="${userMemberRoutineDate.day=='fri'}">
							<td style="width: 1000px;">
								<c:forEach var="j" begin="0" end="${exeriselist.size()-1 }" step="1">
									<c:set var="exerise" value="${exeriselist[j]}"/>
									<c:if test="${exerise.exercise_id == exerciseIds[count] }">
											<span onclick="exeriseInfo(${count})">${exerise.name}</span>	
									</c:if>					
								</c:forEach>	
								<c:set var="count" value="${count+1}" />
							</td>													
						</c:if>			
					</tr>
				</c:forEach>	
			</table>	
		</div>
	</div>
	<!-- 운동 상세 설명 -->
	<div id="exeriseInfo" class="exeriseInfo"></div>
</body>	