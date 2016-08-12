<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="passwdCheckPro.do?choice=${choice}" name="passwdCheckForm">
	<table border="1">
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="text" name="passwd"> 
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="확인">
				<input type="button" value="취소" onclick="location='myPageView.do'">
			</td>
		</tr>
	</table>
</form>