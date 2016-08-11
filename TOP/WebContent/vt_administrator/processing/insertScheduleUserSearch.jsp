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
	<input type="hidden" id="scheduleId" name="scheduleId" value="${id}">
	<input type="hidden" name=routineinfo_id value="${routineData.routineinfo_id}">
	<c:if test="${idCheckResult!=0}">
		<br><br>
		아이디 : ${id}
		<table border="1">			
			<tr>
				<th>회원 아이디</th>
				<td>${id}</td>			
			</tr>
			<tr>
				<th>성별</th>
				<td>
					 <c:if test="${routineData.sex=='male'}">
						<input type="radio" name="sex" value="male" checked="checked">male
						<input type="radio" name="sex" value="female">female
					</c:if>
					<c:if test="${routineData.sex=='female'}">
						<input type="radio" name="sex" value="male">male
						<input type="radio" name="sex" value="female" checked="checked">female
					</c:if>
				</td>
			</tr>
			<tr>			
				<th>운동 시작</th>				
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
							<c:if test="${start_month==i}">																		
								<option value="${i}" selected="selected">${i}월</option>
							</c:if>
							<c:if test="${start_month!=i}">											
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
			<tr>
				<th>운동 종료</th>
				<td>			
					<!-- end_year -->					
					<select size="1" name="selectEndYear" onchange="leapYearCheck_end()">					
						<c:forEach var="i" begin="${thisYear}" end="${thisYear+20}" step="1">
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
								<option value="${i}" selected="selected">${i}월</option>
								
							</c:if>
							<c:if test="${end_month!=i}">															
								<option value="${i}">${i}월</option>								
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
				<th>운동 종류</th>
				<td>
					 <c:if test="${routineData.routine_type=='muscle'}">
						<select id="routineType" name="routineType">
							<option value="muscle" selected="selected">근력강화</option>
							<option value="diet">다이어트</option>
						</select>
					</c:if>
					<c:if test="${routineData.routine_type=='diet'}">
						<select id="routineType" name="routineType">
							<option value="muscle">근력강화</option>
							<option value="diet" selected="selected">다이어트</option>
						</select>
					</c:if>
				</td>
			</tr>		
			<tr>
				<td colspan="2">
					<input type="button" value="수정 및 저장" onclick="scheduleInsertProcess()">
					<div id="scheduleSaveDiv"></div>
					
				</td>
			</tr>		
		</table>
	</c:if>
	<c:if test="${idCheckResult==0}">
		<br>해당 회원은 스케줄을 기입하지 않았습니다<br>
		아이디 : ${id}<br>
		
		<table border="1">
			<tr>
				<th>회원 아이디</th>
				<td>${id}</td>			
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="sex" value="male" checked="checked">male
					<input type="radio" name="sex" value="female">female
				</td>
			</tr>
			<tr>			
				<th>운동 시작</th>				
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
							<c:if test="${thisMonth==i}">										
								<option value="${i}" selected="selected">${i}월</option>
							</c:if>
							<c:if test="${thisMonth!=i}">									
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
								<c:if test="${today==i}">
									<option value="${i}" selected="selected">${i}일</option>	
								</c:if>
								<c:if test="${today!=i}">
									<option value="${i}">${i}일</option>	
								</c:if>
							</c:forEach>
						</select>
					</div>					
				</td>			
			</tr>
			<tr>
				<th>운동 종료</th>
				<td>				
					<!-- end_year -->					
					<select size="1" name="selectEndYear" onchange="leapYearCheck_end()">			
						<c:forEach var="i" begin="${thisYear}" end="${thisYear+20}" step="1">								
							<c:if test="${thisYear==i}">
								<option value="${i}" selected="selected">${i}년</option>
							</c:if>
							<c:if test="${thisYear!=i}">
								<option value="${i}">${i}년</option>
							</c:if>								
						</c:forEach>
					</select>
					
					<!-- end_month  vt_fitnessInsert.js 에 함수 있음 -->						
					<select size="1" name="selectEndMonth" onchange="monthDataCheck_end()">
						<c:forEach var="i" begin="1" end="12" step="1">								
							<c:if test="${thisMonth == i}">
								<option value="${i}" selected="selected">${i}월</option>
							</c:if>
							<c:if test="${thisMonth != i}">
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
								<c:if test="${today ==i}">		
									<option value="${i}" selected="selected">${i}일</option>
								</c:if>
								<c:if test="${today!=i}">
									<option value="${i}">${i}일</option>					
	
				
								</c:if>
							</c:forEach>
						</select>
					</div>				
				</td>
			</tr>
			<tr>
				<th>운동 종류</th>
				<td>
					<select id="routineType" name="routineType">
						<option value="muscle">근력강화</option>
						<option value="diet">다이어트</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="저장" onclick="scheduleInsertProcess()">				
					<div id="scheduleSaveDiv"></div>
				</td>
			</tr>					
		</table>		
	</c:if>
</form>
<div id="memberRoutineArea" onload="selectMemberRoutineList()" style="width: 890px; ${idCheckResult==0 ? 'display: none;' : ''}"> 
	<div style="width: 100%; height:405px; overflow-x:scroll;">
		<table border="1">
			<thead>
				<tr>
					<th colspan="2">월요일</th>
					<th colspan="2">화요일</th>
					<th colspan="2">수요일</th>
					<th colspan="2">목요일</th>
					<th colspan="2">금요일</th>
					<th colspan="2">토요일</th>
					<th colspan="2">일요일</th>
				</tr>
				<tr>
					<th>부위</th>
					<th>운동</th>
					<th>부위</th>
					<th>운동</th>
					<th>부위</th>
					<th>운동</th>
					<th>부위</th>
					<th>운동</th>
					<th>부위</th>
					<th>운동</th>
					<th>부위</th>
					<th>운동</th>
					<th>부위</th>
					<th>운동</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="days" value="${fn:split('mon,tue,wed,thu,fri,sat,sun', ',')}"/>
				<c:forEach begin="0" end="3" varStatus="rowStatus">
					<tr>
						<c:forEach begin="0" end="6" varStatus="columnStatus">
							<td>
								<select class="ex_part_id ${rowStatus.index}_${columnStatus.index} ${days[columnStatus.index]}" onchange="onPartChangeHandler(event, ${rowStatus.index}, ${columnStatus.index})">
									<option value="">선택하세요.</option>
									<c:forEach var="i" begin="0" end="${exPartList.size()-1}" step="1">
										<option value="${exPartList[i].ex_part_id}">${exPartList[i].part_name}</option>
									</c:forEach>
								</select>
							</td>
							<td>
								<c:forEach begin="0" end="3" varStatus="exerciseStatus">
									<select class="exercise_method ${rowStatus.index}_${columnStatus.index} ${days[columnStatus.index]}" style="width: 200px;">
										<option value="">선택하세요.</option>
									</select>
								</c:forEach>
							</td>
						</c:forEach>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="width: 100%; text-align: center;">
		<input type="button" value="저장" onclick="saveExercise()">
	</div>
</div>

<script type="text/javascript">
	$("#memberRoutineArea").ready(function() {
		console.log("------??");
	});
	
	$.ajax({
		type: "post",
		url: "selectMemberRoutineList.do",
		data: "id=" + $("#scheduleId").val(),
		success: function(responseText) {
			var list = JSON.parse(responseText);
			
			for ( var index in list) {
				var item = list[index];
				
				console.log(item);
				setExPartIdSelectorData(item);
			}
		}
	});
	
	function setExPartIdSelectorData(item) {
		$(".ex_part_id" + "." + item.day).each(function(exPartIdIndex, exPartIdItem) {
			var selectedExPartIdClass = $(exPartIdItem).attr('class');
			var selectedExPartIdDay = selectedExPartIdClass.substr(selectedExPartIdClass.length-3 , selectedExPartIdClass.length);
			var selectedExPartIdVal = $(exPartIdItem).find(":selected").val();
			var selectedExPartIdText = $(exPartIdItem).find(":selected").text();
			
			if(selectedExPartIdVal != "") {
				return;
			}
			
			console.log("saveExercise - selectedExPartIdClass : " + selectedExPartIdClass);
			console.log("saveExercise - selectedExPartIdDay : " + selectedExPartIdDay);
			console.log("saveExercise - selectedExPartIdVal : " + selectedExPartIdVal);
			console.log("saveExercise - selectedExPartIdText : " + selectedExPartIdText);
			
			$(exPartIdItem).val(item.ex_part_id);
			$(exPartIdItem).trigger("change");
			
			(function(exPartIdItem, item) {
				setTimeout(function() {
					setExerciseMethodData(exPartIdItem, item);
				}, 300);
			})(exPartIdItem, item);
			
			return false;
		});
	}
	
	function setExerciseMethodData(exPartIdItem, item) {
		var selectedExPartIdClass = $(exPartIdItem).attr('class');
		var selectedExPartIdDay = selectedExPartIdClass.substr(selectedExPartIdClass.length-3 , selectedExPartIdClass.length);
		var selectedExPartIdVal = $(exPartIdItem).find(":selected").val();
		var selectedExPartIdText = $(exPartIdItem).find(":selected").text();		
		
		var exerciseMethodSelector = selectedExPartIdClass.replace("ex_part_id", "exercise_method").replace(/ /g, ".");
		
		$("." + exerciseMethodSelector).each(function(exerciseMethodIndex, exerciseMethodItem) {
			var selectedExerciseMethodClass = $(exerciseMethodItem).attr('class');
			var selectedExerciseMethodDay = selectedExerciseMethodClass.substr(selectedExerciseMethodClass.length-3 , selectedExerciseMethodClass.length);
			var selectedExerciseMethodVal = $(exerciseMethodItem).find(":selected").val();
			var selectedExerciseMethodText = $(exerciseMethodItem).find(":selected").text();
			
			if(selectedExerciseMethodVal != "") {
				return;
			}
			
			console.log("saveExercise - selectedExerciseMethodClass : " + selectedExerciseMethodClass);
			console.log("saveExercise - selectedExerciseMethodDay : " + selectedExerciseMethodDay);
			console.log("saveExercise - selectedExerciseMethodVal : " + selectedExerciseMethodVal);
			console.log("saveExercise - selectedExerciseMethodText : " + selectedExerciseMethodText);
			
			$(exerciseMethodItem).val(item.exercise_id);
			
			return false;
		});
	}
</script>