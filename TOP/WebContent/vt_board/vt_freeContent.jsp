<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<script type = "text/javascript">
	//<!--
	$(
		function(){			
			var params = "num="+${dto.num};
			request = new Request(commentshow, "vt_commentlist.do", "POST", params);
			request.sendRequest();			
		}		
	);
	function commentshow(){
		var commentlist = document.getElementById("commentlist");	
		if(request.httpRequest.readyState == 4){
			if(request.httpRequest.status == 200){
				commentlist.innerHTML = request.httpRequest.responseText;			
			}
		}
	}
	//-->
</script>

<input type = "hidden" name = "pageNum" value = "${pageNum}">

<div class="header">
	<div class="header_sub">
		<div class="subject">
			제목&nbsp;:&nbsp;${dto.subject }
			<input type = "button" value = "목록으로" 
					onclick = "location = 'vt_community_free.do'">
		</div>
	</div>
	<div class="header_info">
		<p class="cont_p1">글번호&nbsp;:&nbsp;${dto.num }</p>
		<p class="cont_p2">작성자&nbsp;:&nbsp;${dto.id }</p>
		<p class="cont_p3">조회수&nbsp;:&nbsp;${dto.readcount+1}</p>
		<p class="cont_p4">작성일&nbsp;:&nbsp;${dto.reg_date}</p>
	</div>
</div>
<div class="content">
	${dto.content}
</div>

<div class="bottom">
	<c:if test="${dto.id == memId}">
		<input type = "button" value = "수정" onclick = "location = 'vt_freeModifyForm.do?num=${dto.num}&pageNum=${pageNum}'">
		<input type = "button" value = "삭제" onclick = "checkdelete(${dto.num}, ${pageNum})">
	</c:if>
	<input type="button" value="댓글달기">
	<input type = "button" value = "목록으로" 
					onclick = "location = 'vt_community_free.do'">
</div>
<div id = "commentlist"></div>
