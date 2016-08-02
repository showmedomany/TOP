<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<script src="/TOP/vt_administrator/script/admin.js" type="text/javascript"></script>
<script src="/TOP/request.js" type="text/javascript"></script>

<body>
	<form name="fitnessInsertform" method="post" action="vt_fitnessInsertPro" onkeydown="if(event.keyCode==13) return false;">		
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