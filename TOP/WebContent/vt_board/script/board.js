var request = null;

var msg_sererror = "검색어를 입력하세요!";

function searchtext(){	
	//text input창에 검색어 적고 엔터 쳤을 경우 submit되는거 방지함과 동시에 검색 시작
	searchCheck();
	return false;
}
function content_view(contentNum, pageNum){
	
	var params = "num="+contentNum+"&pageNum="+pageNum;
	
	request = new Request(content_show, "noticeBoardContent.do", "POST", params);
	request.sendRequest();
}

function content_show(){
	var content_div = document.getElementById("content_div");	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			content_div.innerHTML = request.httpRequest.responseText;				
		}
	}
}



function searchCheck(){
	if(!searchform.text.value){
		alert(msg_sererror);
		return false;
	}else{
		if(searchform.tag_serach.options[searchform.tag_serach.selectedIndex].value=="sub"){			
			location = "notice_search.do?msg="+searchform.text.value+"&type=sub"+"&pageNum="+searchform.pageNum.value;
			
		}else if(searchform.tag_serach.options[searchform.tag_serach.selectedIndex].value=="content"){
			location = "notice_search.do?msg="+searchform.text.value+"&type=content"+"&pageNum="+searchform.pageNum.value;
			
		}else if(searchform.tag_serach.options[searchform.tag_serach.selectedIndex].value=="nick"){
			location = "notice_search.do?msg="+searchform.text.value+"&type=nick"+"&pageNum="+searchform.pageNum.value;
		}
	}
}


function checkdelete(){
	var check = confirm("정말 삭제하시겠습니까?");
	if(check){
		location = "vt_freeDeletePro.do?pageNum="+content.pageNum.value+"&num="+content.num.value;
	}
}

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

function freeWriteFocus(){
	freeWriteForm.subject.focus();
}

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

function freeModifyFocus(){
	vt_freeModifyPro.subject.focus();
}


/* 공지사항   writeForm 유효성 검사*/
function noticeBoardWriteCheck(){
	var writeFormCheckDiv = document.getElementById("writeFormCheckDiv");
	if(!NBWriteForm.subject.value){
		NBWriteForm.subject.focus();
		writeFormCheckDiv.innerHTML = "제목을 입력하세요."
		return false;
	}else if(!NBWriteForm.content.value){        
		NBWriteForm.content.focus();
		writeFormCheckDiv.innerHTML = "내용을 입력하세요."
		return false;
	}
}
/* 공지사항  modifyForm 유효성 검사*/
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
	}else{
		
	}	
}














