/**
 * 
 */

function inputformfocus() {
	inputform.id.focus();
}

function nexttel1(){
	if(inputform.tel1.value.length == 3){
		inputform.tel2.focus();
	}
}
function nexttel2(){
	if(inputform.tel2.value.length == 4){
		inputform.tel3.focus();
	}
}
function nexttel3(){
	if(inputform.tel3.value.length == 4){
		inputform.email1.focus();
	}
}