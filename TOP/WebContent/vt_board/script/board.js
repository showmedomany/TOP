
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















