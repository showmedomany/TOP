<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>vt_ex_routine</title>
		<link href="${css}vt_ex_routineStyle.css" rel="stylesheet"	type="text/css">
		<script src="${script}request.js" type="text/javascript"></script>
		<script src="${script}vt_ex_routine.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="vt_ex_routine_body">	
			<div class="vt_ex_routine_body_id">
				vt_ex_routine.jsp<br>
				회원아이디 : ${id }		
			
			</div>
			<div class="vt_ex_routine_body_startEnd_date">
				시작일 :	생략<br>
				종료일 :	생략<br>
			
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
						
						
						</tr>
					
					
					</table>
				</form>
			</div>
			
			
			<div id="weekScheduleResult" class="weekScheduleResult"></div>
			
			
			
			
			
			
		
		</div>
	</body>
</html>
    