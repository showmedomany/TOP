<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>


<html>
	<head>
		<link href = "${css}vt_scheduleInsert.css" rel="stylesheet"	type="text/css">
	</head>
	
	<body>
		<div class = "frame">
			<br><br>
			회원id : ${id}<br><br>
			운동기간 : 언제부터~~ 언제까지 <br><br>
			운동시간<br><br>
			<table border = "1">
				<tr>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
					<th>일</th>
				</tr>
				<tr>
					<th><div>여기로<br>데이터<br>들어옴</div></th>
					<th><div>여기로<br>데이터<br>들어옴</div></th>
					<th><div>여기로<br>데이터<br>들어옴</div></th>
					<th><div>여기로<br>데이터<br>들어옴</div></th>
					<th><div>여기로<br>데이터<br>들어옴</div></th>
					<th><div>여기로<br>데이터<br>들어옴</div></th>
					<th><div>여기로<br>데이터<br>들어옴</div></th>
				</tr>
				<tr>
					<th colspan="7">
						<input type = "button" value = "추가">
						<input type = "button" value = "삭제">
						<input type = "button" value = "수정">
					</th>
				</tr>
			</table>
			<br><br>
			해당 요일을 클릭하면 밑의 테이블이 생성됨?
			<table border = "1">
				<tr>
					<th>부위</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>부위</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>부위</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>부위</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
				</tr>
				<tr>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
				</tr>
				<tr>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
				</tr>
				<tr>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
				</tr>
				<tr>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>운동</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
				</tr>
			</table>
		</div>
	</body>
</html>