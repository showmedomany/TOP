<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

	<head>
		<link href = "${css}vt_boardStyle.css" rel="stylesheet"	type="text/css">
		<script src = "${script}board.js"></script>
	</head>
	
	<body>
		<div class="bd_name">
		자유 게시판${count}
		</div>	
		<div class="bd_wrap">
				<div class="bd_btn">
					
					
					<a onclick="logincheck(${sessionScope.authority_id})">
						글쓰기
					</a>					
					
					
				</div>
				<table class="bd_top">
					<tr>
						<td class="bd_sub">글번호</td>
						<td class="bd_sub">제목</td>
						<td class="bd_wri">작성자</td>
						<td class="bd_day">등록일</td>
						<td class="bd_read">조회수</td>
					</tr>	
				<c:if test="${count eq 0 }">
					<tr>
						<td colspan = "4" align = "center">
								글이 없습니다.
						</td>
					</tr>
				</c:if>			
				<c:if test="${count ne 0 }">
					<c:forEach var = "dto" items="${list}">	
						<tr>
							<td align = "center">
								${number} <c:set var = "number" value = "${number-1 }"/>
							</td>		
							<td align = "center">
							<a href = "vt_freeContent.do?num=${dto.num}&pageNum=${pageNum}&number=${number+1}">							
								${dto.getSubject()}
							</a>
							</td>
							<td align = "center">
								${dto.nickname}
							</td>
							<td align = "center">
								<fmt:formatDate value="${dto.reg_date}"
									pattern = "yyyy-MM-dd HH:mm"/>							
							</td>
							<td align = "center">
								${dto.getReadcount()}						
							</td>
						</tr>
					</c:forEach>
				</c:if>
				
			</table>
			
			<c:if test="${count>0 }">
	
				<c:if test = "${startPage > pageBlock}">
					<a href = "vt_community_free.do?pageNum=1">[◀◀]</a>
					<a href = "vt_community_free.do?pageNum=${startPage-pageBlock}">[◀]</a>
					
				</c:if>
				
				<c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
				
					<c:if test="${i eq currentPage }">
						<span><b>[${i }]</b></span>
					</c:if>
					
					<c:if test="${i ne currentPage }">
						<a href = "vt_community_free.do?pageNum=${i}">[${i }]</a>
					</c:if>
					
				</c:forEach>
				
				<c:if test = "${pageCount > endPage }">
					<a href = "vt_community_free.do?pageNum=${startPage + pageBlock}">[▶]</a>
					<a href = "vt_community_free.do?pageNum=${pageCount}">[▶▶]</a>
				</c:if>
					
			</c:if>
		</div>
	</body>

	

	