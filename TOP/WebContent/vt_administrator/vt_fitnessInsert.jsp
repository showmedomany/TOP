<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<script src="${script}vt_fitnessInsert.js" type="text/javascript"></script>
<script src="${script}request.js" type="text/javascript"></script>

<body>
	<form name="fitnessInsertform" onkeydown="if(event.keyCode==13) return false;">		
		<table>
			<tr>
				<th colspan="3">
					회원을 검색하세요
				</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="userSearch">
				</td>
				<td>
					<select name="searchMeans" size="1">
						<option value="ID" selected="selected">ID</option>
						<option value="NickName">NickName</option>
						<option value="email">email</option>
					</select>
				</td>
				<td>
					<input type="button" name="searchButton" value="검색" onclick="insertFitnessUserSearch()">
					
				</td>
			</tr>		
		</table>		
	</form>	
	
	<form name="userSearchTextForm">		
		<div id="userSearchResult">	
		</div>		
	</form>
</body>







<!-- memo
여기서 일단 피트니스를 등록할 회원을 검색.

회원 검색은 Id나 닉네임, 이메일로 검색 할 수 있도록함.

검색후 그 사용자의 피티니스를 등록함. 

등록하려면 트레이너가 필요함.

등록하면서 등록중 트레이너 검색하여 선택할수 있도록 주소창처럼 만들어야함.

유효성 검사도 하고 입력하면됨. 



응.-->