<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<!-- 

 DB 추가사항

DROP SEQUENCE vt_faq;

/*vt_faq*/
CREATE SEQUENCE vt_faq
START WITH 1
MAXVALUE 999999999999
MINVALUE 1
INCREMENT BY 1
CYCLE; 
 
CREATE TABLE vt_faq
(
   num number NOT NULL,
   classify varchar2(20) NOT NULL,  <--- 이부분 추가
   question varchar2(100) NOT NULL,
   answer varchar2(4000) NOT NULL,
   PRIMARY KEY (num)
);


 -->
 <script type="text/javascript">
//<!--
function initLoad(){
	faqForm.top3_text.focus();
}
function answerNumView(answerNum){
	var answerNumDiv = document.getElementById(answerNum);	
	if(answerNumDiv.style.display == 'none'){
		answerNumDiv.style.display = '';
	}else{
		answerNumDiv.style.display = 'none';
	}
}
function faqSearch(pageNum){
	var msg = faqForm.top3_text.value;
	var selectOption = faqForm.top3_option.value;
	if(!msg){
		location.href = "vt_FAQ.do";
		return;
	}	
	location.href = "vt_FAQSearch.do?selectOption="+selectOption+"&msg="+msg;
}

//-->
</script>

<html>
	<head>
		<link href = "${css}vt_FNQStyle.css" rel="stylesheet"	type="text/css">
	</head>
	<body onload="initLoad()">
		<form name="faqForm">
			<div class="content_top">				
				<div class="50">
					<img src="${images}FAQ_banner.jpg">
				</div>
				<div class="top3">
					<div class="top3_img">
						<img src="${images}title_inquiry.gif">						
					</div>
					<div class="top3_btn" onclick="faqSearch('${pageNum}')">
						<img src="${images}serachButton.jpg" >	
					</div>
					<div class="top3_option">
						<select name="top3_option">
							<option value="all" selected="selected"> 전체</option>
							<option value="member"> 회원관련 </option>							
							<option value="exercise"> 운동관련 </option>
							<option value="others"> 기타 </option>
						</select>	
					</div>
					<input class="top3_text" type="text" name="top3_text" placeholder="검색어를 입력하세요" onkeydown="if(event.keyCode==13) return false;">
					
					<div class="top3_btn">
						<!--버튼지역-->
											
					</div>
				</div>
			</div>
			<div class="content_center">
				<!-- overflow : auto; -->
				<table>
					<tr style="height: 40px; background-color: #FAFFFF;">
						<th style=" width: 70px;">분류</th>
						<th style=" width: 730px;">질문내용</th>
					</tr>
					<c:if test="${faqCount==0 }">
						<tr style="height: 40px; background-color: #FAFFFF;">
							<th colspan="2">검색된 FAQ가 없습니다.</th>
						</tr>
					</c:if>
					<c:if test="${faqCount!=0 }">
						<c:forEach var="i" begin="0" end="${faqDataList.size()-1 }" step="1">
						<c:set var="faqData" value="${faqDataList[i]}" ></c:set>					
							<tr class="faqTable_tr">
								<c:set var="answerNum" value="answer_${faqData.num}"/>
								<c:if test="${faqData.classify=='member'}"><th>회원</th></c:if>
								<c:if test="${faqData.classify=='exercise'}"><th>운동</th></c:if>
								<c:if test="${faqData.classify=='others'}"><th>기타</th></c:if>
								<th style="cursor:pointer;" onclick="answerNumView('${answerNum}')">${faqData.question}</th>
							</tr>
							<tr class="faqTable_trInfo">
								<td></td>																					
								<td>							
									<div id="${answerNum}" style="display: none;" class="faqTable_trInfo"><pre>${faqData.answer }</pre></div>
								</td>
							</tr>							
						</c:forEach>
					</c:if>
									
				</table>
				<div class="tableList">		
					<c:if test="${search == 0 }">
						<c:forEach var="i" begin="1" end="${pageCount}" step="1">
							<a href="vt_FAQ.do?pageNum=${i}">${i}&nbsp;</a>	
						</c:forEach>
					</c:if>
					<c:if test="${search == 1 }">
						<c:forEach var="i" begin="1" end="${pageCount}" step="1">
							<a href="vt_FAQSearch.do?msg=${msg}&selectOption=${selectOption}&pageNum=${i}">
								${i}&nbsp;
							</a>	
						</c:forEach>									
					</c:if>
				</div>							
			</div>
		</form>
	</body>		
</html>	

<!-- &selectOption=${selectOption}&msg=${msg} -->