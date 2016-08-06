<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<div class = "commentform">코멘트(0)</div>
<c:forEach var="cdto" items="${clist}">
	<div class ="comment_info"><b>${cdto.nick}</b> ${cdto.reg_date}</div>	
	<div class = "comment_content"><br>${cdto.content}</div>		
</c:forEach>
<div class = "commentinput">
	<input type ="text" name ="commentinput">
	<input type ="button" value = "등록">
</div>
<div class = "commentbottom">
	목록/다음글/이전글							글쓰기
</div>