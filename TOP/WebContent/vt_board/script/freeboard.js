//자유게시판 검색시 submit은 안되고 검색만 되게
function searchBoardtext(){
	searchBoardCheck();
	return false;
}
//자유게시판 검색
function searchBoardCheck(){
	if(!freeBoardForm.text.value){
		alert(msg_sererror);
		return false;
	}else{
		if(freeBoardForm.tag_serach.options[freeBoardForm.tag_serach.selectedIndex].value=="sub"){			
			location = "board_search.do?msg="+freeBoardForm.text.value+"&type=sub"+"&pageNum="+freeBoardForm.pageNum.value;	
			
		}else if(freeBoardForm.tag_serach.options[freeBoardForm.tag_serach.selectedIndex].value=="content"){
			location = "board_search.do?msg="+freeBoardForm.text.value+"&type=content"+"&pageNum="+freeBoardForm.pageNum.value;
			
		}else if(freeBoardForm.tag_serach.options[freeBoardForm.tag_serach.selectedIndex].value=="nick"){
			location = "board_search.do?msg="+freeBoardForm.text.value+"&type=nick"+"&pageNum="+freeBoardForm.pageNum.value;
		}
	}
}
//자유게시판 글보기 ajax
function board_view(contentNum, pageNum){	
	var params = "num="+contentNum+"&pageNum="+pageNum;	
	request = new Request(content_show, "vt_freeContent.do", "POST", params);
	request.sendRequest();
	
}
//자유게시판 글보기 핸들러후 jsp뿌려줄 펑션
function content_show(){
	var content_div = document.getElementById("content_div");	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			content_div.innerHTML = request.httpRequest.responseText;
			content_div.scrollIntoView(); //포커싱 주기
		}
	}
}
//자유게시판 삭제
function checkdelete(num,pageNum){	
	if(confirm("정말 삭제하시겠습니까?")){
		location = "vt_freeDeletePro.do?num="+num+"&pageNum="+pageNum;
	}
}

//자유게시판 글쓰기 버튼
function logincheck(obj){
	/*var check = obj;
	alert(check);*/
	if(!obj){
		//로그인 안했으면 로그인 갔다가 게시판으로 돌아와야함?
		location = "loginForm.do";
	}
	else{
		location = "vt_freeWriteForm.do";
	}	
}

//자유게시판 글쓰기 포커싱
function freeWriteFocus(){
	freeWriteForm.subject.focus();
}

//자유게시판 글쓰기 체크
function checkblank(){
	if(!freeWriteForm.subject.value){
		alert("제목을 작성해주세요");
		freeWriteForm.subject.focus();
		return false;
	}
	if(!freeWriteForm.content.value){
		alert("내용이 없습니다.");
		freeWriteForm.content.focus();
		return false;
	}
}

//자유게시판 수정포커싱
function freeModifyFocus(){
	vt_freeModifyPro.subject.focus();
}