<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<html>
	<head>
			<link href = "${css}vt_boardStyle.css" rel="stylesheet"	type="text/css">
			<link href = "${css}vt_noticecontentFormStyle.css" rel="stylesheet"	type="text/css">
			<script src = "${script}freeboard.js"></script>
			<script src = "${request}"></script>
	</head>
	
	<body>
		<!-- 폼이름 변경 해야함-->
		<form method = "post" name = "freeBoardForm" onsubmit="return searchBoardtext();">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<input type="hidden" name="type" value="${type}">
					<input type="hidden" name="searchword" value="${searchword}">		
			<div id="content_div">
				<!-- 게시글선택시 게시글 뿌려질 영역 -->
			</div>		
			<div class="board_header">
				<div class="board_all">
					전체글 : ${count}
				</div>
				<div class="board_write">
					<a onclick = "logincheck('${memId}')">
						<img src="${images}write.gif">
					</a>			
				</div>
			</div>
			<div class="board_wrap">
				<div class="board_center">
					<div class="board_top">
						<p class="p1">번호</p>
						<p class="p2">제목</p>
						<p class="p3">조회수</p>
						<p class="p4">작성자</p>
						<p class="p6">작성일</p>
					</div>
					<div class="board_content">
						<c:if test="${count eq 0 }">
							<tr>
								<td colspan = "4" align = "center">
										글이 없습니다.
								</td>
							</tr>
						</c:if>
						<c:if test="${count ne 0 }">
							<c:forEach var="i" begin="0" end="${list.size()-1 }" step="1">
								<c:set var="dto" value="${list[i] }"/>
								<div class="show">
									<p class="p1">${dto.num}</p>									
									<p class="p2">									
										<a onclick="board_view(${dto.num},${pageNum})">${dto.subject}</a>
									</p>
									<p class="p3">${dto.readcount}</p>
									<p class="p4">${dto.id}</p>
									<p class="p5">${dto.reg_date }</p>
								</div>					
							</c:forEach>
						</c:if>
					</div>
					<div class="board_bottom">
						<div class="bottom1">					
						</div>
						<div class="bottom2">
							<div class="search">
								<div class="searchform_option">
									<select name="tag_serach">									
										<option value="sub"> 제목 </option>
										<option value="content"> 내용 </option>
										<option value="nick"> 닉네임 </option>						
									</select>
								</div>
								<div class="searchform_text">
									<input class="ser_text" type="text" name="text">
								</div>
								<div class="searchform_btn"	onclick="searchBoardCheck()">
									<img src="${images}btn_ser.gif">
								</div>
							</div>
							<div class="pagenum">
								<div class="left">
									<img src="${images}left.gif">
								</div>
								<div class="num">
									<c:if test="${search ne 1 }">
										<c:forEach var="i" begin="1" end="${pageCount}" step="1">
											<a href="vt_community_free.do?pageNum=${i}">[${i }]&nbsp;</a>	
										</c:forEach>
									</c:if>
									<c:if test="${search eq 1 }">
										<c:forEach var="i" begin="1" end="${pageCount}" step="1">
											<a href="board_search.do?msg=${searchword}&type=${type}&pageNum=${i}">
												[${i }]&nbsp;
											</a>	
										</c:forEach>									
									</c:if>							
								</div>
								<div class="right">
									<img src="${images}right.gif">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>	