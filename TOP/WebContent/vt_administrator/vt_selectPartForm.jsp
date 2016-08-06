<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>



<b>${day}요일 운동 스케줄</b> 


<table border = "1">
	<tr>		
		<c:forEach var = "i" begin="1" end="4">
			<th>부위</th>
			<th>
				<select id="searchPart${i}" size="1" onchange="selectexercise(${i})">
					<option value="">부위를 선택하세요</option>
					<option value="1">가슴</option>
					<option value="2">등</option>
					<option value="3">하체</option>
					<option value="4">팔/이두</option>
					<option value="5">팔/삼두</option>
					<option value="6">어깨</option>
					<option value="7">복근</option>				
				</select>
			</th>
		</c:forEach>
	</tr>
	<tr>
		
	</tr>
		
</table>
