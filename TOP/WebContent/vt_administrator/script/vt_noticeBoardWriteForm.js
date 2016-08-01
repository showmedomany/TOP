/**
 * vt_noticeBoardWriteForm.js
 */

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