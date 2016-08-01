/**
 * 
 */

function isDeleteData(num, pageNum){	
	if (confirm("정말 삭제하시겠습니까?")){
		location.href = "noticeBoardDeletePro.do?num="+num+"&pageNum="+pageNum;
	}else{
		
	}	
}