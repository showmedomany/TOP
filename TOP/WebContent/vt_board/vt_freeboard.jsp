<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

		<link href = "${css}vt_boardStyle.css" rel="stylesheet"	type="text/css">

	<div class="bd_name">
		자유 게시판${count}
	</div>	
	<div class="bd_wrap">
			<div class="bd_btn">
				글쓰기
			</div>
			<table class="bd_top">
				<tr>
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
							${dto.getSubject() }
						</td>
						<td align = "center">
							${dto.getId() }
						</td>
						<td align = "center">
							<fmt:formatDate value="${dto.reg_date}"
								pattern = "yyyy-MM-dd HH:mm"/>							
						</td>
						<td align = "center">
							${dto.getReadcount() }						
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>

	