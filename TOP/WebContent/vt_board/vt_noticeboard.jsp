<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

		<link href = "${css}vt_boardStyle.css" rel="stylesheet"	type="text/css">

	<div class="bd_name">
		공지사항
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
			</table>			
			<table class="bd_content">
				<tr>					
					<td class="bd_sub">제목나오는곳</td>
					<td class="bd_wri">작성자나오는곳</td>
					<td class="bd_day">등록일나오는곳</td>
					<td class="bd_read">조회수나오는곳</td>	
				</tr>
			</table>
	</div>

	