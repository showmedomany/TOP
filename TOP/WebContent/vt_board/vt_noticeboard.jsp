<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "setting.jsp" %>
<link href = "${css}vt_noticeStyle.css" rel="stylesheet"	type="text/css">

<div class="notice_header">
	<c:if test="${authority_id==1}">		
		<div class="notice_all">
			전체글 : ${articleCount}
		</div>
		<div class="notice_write">
			<a href="noticeBoardWriteForm.do"><img class="pointer_img" src="${images}write.gif"></a>
		</div>
	</c:if>
	<c:if test="${authority_id!=1}">
		<div class="notice_all">
			전체글 : ${articleCount}
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
							<p class="p1">${noticeBoardData.num}</p>
							<p class="p2"><a href="noticeBoardContent.do?num=${noticeBoardData.num}&pageNum=${pageNum}">${noticeBoardData.subject}</a></p>
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
			<div class="pagenum">
				<div class="left">
					<img src="${images}left.gif">
				</div>
				<div class="num">
					<c:forEach var="i" begin="1" end="${pageCount}" step="1">
						<a href="noticeBoard.do?pageNum=${i}">[${i }]&nbsp;</a>	
					</c:forEach>
				</div>
				<div class="right">
					<img src="${images}right.gif">
				</div>
			</div>
		</div>
	</div>
</div>