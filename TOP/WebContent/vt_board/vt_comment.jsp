<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<div class = "commentform">
	<div class="commentnum">
		코멘트(${commentcount})
	</div>
</div>
<c:forEach var="cdto" items="${clist}">	
	<div class="comment_read">
		<div class ="comment_info">
			<b>${cdto.nick}</b>
		</div>				
		<div class = "comment_content">
		<p class="comen_p">${cdto.content}</p>
			<c:if test="${nickname eq cdto.nick }">
				<div class="b_content">
					<input class="b_content_b" type="button" value="삭제" onclick = "deletecomment('${cdto.comment_id}','${cdto.num}')">
				</div>
			</c:if>		
		<p class="comen_d">(${cdto.reg_date})</p>	
	</div>
</c:forEach>
