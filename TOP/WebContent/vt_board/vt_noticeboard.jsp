<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>

<html>
	<head>
		<link href = "${css}vt_noticeStyle.css" rel="stylesheet"	type="text/css">
		<link href = "${css}vt_noticecontentFormStyle.css" rel="stylesheet"	type="text/css">
		<script src = "${request}"></script>
		<script src = "${script}noticeboard.js"></script>		
	</head>
	
	<body>
		<!-- 게시판 들어오면 가장 위로 -->
		<form method = "post" name = "noticeBoardForm" onsubmit="return searchNoticetext();">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<input type="hidden" name="type" value="${type}">
			<input type="hidden" name="searchword" value="${searchword}">
			<div id="content_div">					
			</div>
			<div class="notice_header">			
				<div class="notice_all">
					전체글 : ${articleCount}
				</div>
				<c:if test="${authority_id==1}">		
					<div class="notice_write">
						<a href="noticeBoardWriteForm.do">
							<img src="${images}write.gif">
						</a>
					</div>
				</c:if>
			</div>
			<div class="notice_wrap">
				<div class="notice_center">
					<div class="notice_top">
						<p class="p1">번호</p>
						<p class="p2">제목</p>
						<p class="p3">조회수</p>
						<p class="p4">작성자</p>
						<p class="p6">작성일</p>
					</div>
					<div class="notice_content">
						<c:if test="${articleCount != 0 }">
							<c:forEach var="i" begin="0" end="${noticeBoardDataList.size()-1 }" step="1">
								<c:set var="noticeBoardData" value="${noticeBoardDataList[i] }"/>
								<div class="show">
									<%-- <p class="p1">${noticeBoardData.num}</p> --%>
									<p class="p1">${number}</p>		
									<c:set var = "number" value = "${number-1 }"/>							
									<p class="p2">									
										<a onclick="content_view(${noticeBoardData.num},${pageNum})">${noticeBoardData.subject}</a>
									</p>
									<p class="p3">${noticeBoardData.readcount}</p>
									<p class="p4">${noticeBoardData.id}</p>
									<p class="p5">${noticeBoardData.reg_date }</p>
								</div>					
							</c:forEach>
						</c:if>
					</div>	
				</div>
				<div class="notice_bottom">
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
							<div class="searchform_btn"	onclick="searchNoticeCheck()">
								<img src="${images}btn_ser.gif">
							</div>
						</div>
						<div class="pagenum">
							<div class="left">
								<c:if test="${startPage > pageBlock }">	
									<a href="noticeBoard.do?pageNum=1">[◀◀]</a>
									<a href="noticeBoard.do?pageNum=${startPage-pageBlock}">[◀]</a>
									<%-- <a href="noticeBoard.do?pageNum=${currentPage-1}">[◀]</a> --%>
								</c:if>
							</div>
							<div class="num">
								<c:if test="${search ne 1 }">
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<span><b>[${i}]</b></span>
										</c:if>
										<c:if test="${i != currentPage}">
											<a href="noticeBoard.do?pageNum=${i}">[${i}]</a>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${search eq 1 }">
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<a href="notice_search.do?msg=${searchword}&type=${type}&pageNum=${i}">
											[${i }]&nbsp;
										</a>	
									</c:forEach>									
								</c:if>							
							</div>
							<div class="right">
								<c:if test = "${pageCount > endPage }">
							      <a href = "noticeBoard.do?pageNum=${startPage + pageBlock}">[▶]</a>
							      <a href = "noticeBoard.do?pageNum=${pageCount}">[▶▶]</a>
							   </c:if>
							</div>
						</div>
					</div>
				</div>
			</div>			
		</form>
	</body>
</html>