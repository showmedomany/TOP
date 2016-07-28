/**
 * 
 */

$(document).ready(function(){ 
			$(".admin_top_navi_menu").hover(function() { //마우스를 topnav에 오버시
				$(this).parent().find(".admin_top_navi_subframe").slideDown('normal').show(); //subnav가 내려옴.
				$(this).parent().hover(function() {  
				}, function(){  
					$(this).parent().find(".admin_top_navi_subframe").slideUp('fast'); //subnav에서 마우스 벗어났을 시 원위치시킴  
				});  
			}); 
		});