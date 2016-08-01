
function checkdelete(){
	var check = confirm("정말 삭제하시겠습니까?");
	if(check){
		location = "vt_freeDeletePro.do?pageNum="+content.pageNum.value+"&num="+content.num.value;
	}
}