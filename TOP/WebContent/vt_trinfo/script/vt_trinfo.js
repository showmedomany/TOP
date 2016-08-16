function ddel(no){
	if(confirm("정말 삭제하시겠습니까? 복구가 불가능합니다.")){
		self.location = "../bdd/?mid=team&mode=del&no="+no;
	}
}
function dview(no){
	var result = null;
	var tplURL = "../team_detail.php?no="+no;
	jQuery("#detailview").fadeIn(500);
	jQuery("#detailview .con").animate({width:760},300);
	$.ajax({
		url: tplURL,        
		type: 'get',        
		dataType: 'text',        
		async: false,        
		success: function(data) {            
			result = data;        
			}      
		});
	
	jQuery("#dviewdiv").html(result);
}
