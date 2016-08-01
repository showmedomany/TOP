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
				<table border = "1">
					<tr>
						<th colspan = "2">
							여기 데이터 다 넘겼음 수정버튼, 삭제버튼, 댓글버튼 onclick이벤트해야함<br>
							글쓴이는 nickname으로 할 수 있도록<br><br><br>
						</th>
					</tr>
					<tr>
						<th>
							제목:
						</th>
						<th>
							${dto.subject}
						</th>
					</tr>
					<tr>
						<th>
							글쓴이:
						</th>
						<th>
							${dto.nickname}
						</th>
					</tr>
					<tr>
						<th>
							조회수:
						</th>
						<th>
							${dto.readcount}
						</th>
					</tr>
					<tr>
						<th>
							작성일:
						</th>
						<th>
							${dto.reg_date}
						</th>
					</tr>
					<tr>
						<th>
							내용:
						</th>
						<th>
							${dto.content}
						</th>
					</tr>
					<tr>
						<th colspan="2">
							<input type = "button" value = "목록으로" 
								onclick = "location = 'vt_community_free.do?pageNum=${pageNum}'"><br>
							<c:if test="${sessionScope.nickname eq dto.nickname }">
								작성자만 아래 버튼이 보이게<br>
								<input type = "button" value = "수정" onclick = "location = 'vt_freeModifyForm.do?num=${dto.num}&pageNum=${pageNum}'">
								<input type = "button" value = "삭제" onclick = "checkdelete()"><br>
								수정은 바로 수정페이지로, 삭제는 물어보고<br>
							</c:if>
							<input type = "button" value = "댓글">
							<br>댓글넣는 작업 해야함
							<br>
							<br>
							로그인 한사람만 글쓰기 가능<br>
							이거는 버튼은 있는데 누르면 로그인 안했으면 로그인하라고? 바꿔야할듯<br>
							<input type = "button" value = "글쓰기" onclick = "logincheck(${sessionScope.authority_id})">
						</th>
					</tr>
				</table>
			
						
				
					
				
				
								
				
				<%-- 
				<c:if test="${authority_id ne null}"> 
					<input type = "button" value = "글쓰기" onclick = "location = 'vt_freeContent.do?pageNum=${pageNum}'">
				</c:if>
				 --%>
				
				
			</div>	
		</form>
	</body>
</html>