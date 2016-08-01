<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>


<html>
	<head>
		<link href = "${css }vt_freeContentStyle.css" rel = "stylesheet" type = "text/css">
		<script src = "${script}board.js"></script>
	</head>
	<body>
		<form name = "content">
			<input type = "hidden" name = "num" value = "${dto.num}">
			<input type = "hidden" name = "pageNum" value = "${pageNum}">
			<div class="frame">
				여기 데이터 다 넘겼음 수정버튼, 삭제버튼, 댓글버튼 onclick이벤트해야함<br>
				글쓴이는 nickname으로 할 수 있도록<br><br><br>
			
			
				제목:${dto.subject } <br>
				글쓴이(닉네임으로 교체) : ${dto.id}/ ${dto.nickname } <br>			
				조회수:${dto.readcount } <br>
				작성일:${dto.reg_date } <br>
				내용: ${dto.content } <br>			
				<input type = "button" value = "목록으로" 
					onclick = "location = 'vt_community_free.do?pageNum=${pageNum}'">
					
				<c:if test="${sessionScope.nick eq dto.nickname }">
					작성자만 버튼이 보이게
					<input type = "button" value = "수정" onclick = "location = 'vt_freeModifyForm.do?num=${dto.num}&pageNum=${pageNum}'">수정은 바로 수정페이지로<br>
					<input type = "button" value = "삭제" onclick = "checkdelete()">삭제는 삭제할건지 물어보고<br>
				</c:if>
				
				<input type = "button" value = "댓글">
				
				<br>로그인 한사람만 글쓰기 가능 이거는 버튼은 있는데 누르면 로그인하라고? 바꿔야할듯<br>
				<%-- 
				<c:if test="${authority_id ne null}"> 
					<input type = "button" value = "글쓰기" onclick = "location = 'vt_freeContent.do?pageNum=${pageNum}'">
				</c:if>
				 --%>
				
				<input type = "button" value = "글쓰기" onclick = "logincheck()">
			</div>	
		</form>
	</body>
</html>