//자유게시판 검색시 submit은 안되고 검색만 되게
var request = null;
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



//자유게시판 글보기
function board_view(contentNum, pageNum){
	var params = "num="+contentNum+"&pageNum="+pageNum;
	var url = "vt_freeContent.do";
	content_show(url,params);
}


function content_show(url, params){
	$.ajax({
		type: "POST",
		url: url,	//검색할 핸들러
		data: params,	//데이터인데 나는 필요x
		success: function(responseText) {	//이거는 처리된 jsp의 글자들
			//div id
			if(responseText != null){
				$("#content_div").html(responseText);	  	        
				$("#content_div").find("script").eval;
				content_div.scrollIntoView();
			}         	        
		}
	});
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

function writecomment(memId,contentNum){
	var params = "num="+contentNum+"&id="
				+memId+"&content="+freeBoardForm.commentinput.value;	
	request = new Request(commentUpdate, "vt_writeComment.do", "POST", params);
	request.sendRequest();	
}
function commentUpdate(){
	var commentlist = document.getElementById("commentlist");	
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
			commentlist.innerHTML = request.httpRequest.responseText;			
		}
	}
}
