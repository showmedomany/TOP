var request = null;

var msg_sererror = "검색어를 입력하세요!";

//공지사항 검색시 submit은 안되고 검색만 되게
function searchNoticetext(){	
	//text input창에 검색어 적고 엔터 쳤을 경우 submit되는거 방지함과 동시에 검색 시작	
	searchNoticeCheck();
	noticeBoardForm.text.focus();
	return false;
}
//공지사항 게시글 클릭시 게시판 위로 게시글 보이기
function content_view(contentNum, pageNum){	
	var params = "num="+contentNum+"&pageNum="+pageNum;	
	request = new Request(content_show, "noticeBoardContent.do", "POST", params);
	request.sendRequest();	
}

//공지사항 게시글 핸들러에서 처리후 jsp파일 붙여넣을 펑션
function content_show(){	
	var content_div = document.getElementById("content_div");	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			content_div.innerHTML = request.httpRequest.responseText;
			content_div.scrollIntoView(); //포커싱 주기
		}
	}
}
//공지사항 검색
function searchNoticeCheck(){	
	if(!noticeBoardForm.text.value){
		//빈칸 검색하면 그냥 아무일도 없어라?
		alert(msg_sererror);
		return false;
	}else{
		if(noticeBoardForm.tag_serach.options[noticeBoardForm.tag_serach.selectedIndex].value=="sub"){			
			location = "notice_search.do?msg="+noticeBoardForm.text.value+"&type=sub"+"&pageNum="+noticeBoardForm.pageNum.value;
			
		}else if(noticeBoardForm.tag_serach.options[noticeBoardForm.tag_serach.selectedIndex].value=="content"){
			location = "notice_search.do?msg="+noticeBoardForm.text.value+"&type=content"+"&pageNum="+noticeBoardForm.pageNum.value;
			
		}else if(noticeBoardForm.tag_serach.options[noticeBoardForm.tag_serach.selectedIndex].value=="nick"){
			location = "notice_search.do?msg="+noticeBoardForm.text.value+"&type=nick"+"&pageNum="+noticeBoardForm.pageNum.value;
		}
	}
}

/* 공지사항   writeForm 유효성 검사*/
function noticewritefocus(){
	NBWriteForm.subject.focus();
}
function noticeBoardWriteCheck(){	
	if(!NBWriteForm.subject.value){
		NBWriteForm.subject.focus();
		alert("제목을 입력하세요.")
		return false;
	}else if(!NBWriteForm.content.value){        
		NBWriteForm.content.focus();
		alert("내용을 입력하세요.")
		return false;
	}
}


/* 공지사항  modifyForm 유효성 검사*/
function noticemodifyfocus(){
	NBModifyForm.subject.focus();
}
function noticeBoardModifyCheck(){
	var modifyFormCheckDiv = document.getElementById("modifyFormCheckDiv");
	if(!NBModifyForm.subject.value){
		NBModifyForm.subject.focus();
		modifyFormCheckDiv.innerHTML = "제목을 입력하세요."
		return false;
	}else if(!NBModifyForm.content.value){        
		NBModifyForm.content.focus();
		modifyFormCheckDiv.innerHTML = "내용을 입력하세요."
		return false;
	}
}
/*공지사항 삭제 여부*/
function isDeleteData(num, pageNum){	
	if (confirm("정말 삭제하시겠습니까?")){
		location.href = "noticeBoardDeletePro.do?num="+num+"&pageNum="+pageNum;
	}
}















