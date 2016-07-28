/**
 * 
 */
function vt_centerPaymentInfoInit(){
	
	var insertInbodyDiv = document.getElementById("insertInbodyDiv");
	insertInbodyDiv.style.display = "none"; 
}

//인바디 정보가 없을 경우 입력창 열고 닫기
function insertInbodyDivView(){
	var insertInbodyDiv = document.getElementById("insertInbodyDiv");
	if(centerPaymentInfo.centerPaymentInfo_hidden.value==0){
		insertInbodyDiv.style.display = ""; 
		centerPaymentInfo.insertInbody.value = "닫기";
		centerPaymentInfo.centerPaymentInfo_hidden.value='1';
	}else if(centerPaymentInfo.centerPaymentInfo_hidden.value==1){
		insertInbodyDiv.style.display = "none";
		centerPaymentInfo.insertInbody.value = "등록";
		centerPaymentInfo.centerPaymentInfo_hidden.value='0';
	}
}

//인바디 정보가 없을 경우 입력된 정보 디비에 유효성 검사하고 저장하기
function insertInbodySave(){
	var age = centerPaymentInfo.insertInbody_age.value;
	var height = centerPaymentInfo.insertInbody_height.value;
	var sex = centerPaymentInfo.insertInbody_sex.value;
	var weight = centerPaymentInfo.insertInbody_weight.value;
	var bmi = centerPaymentInfo.insertInbody_bmi.value;
	
	////유효성 검사 / 지금은 생략
	
	//////////
	
	document.location.href = 
		"myPageInsertInbody.do?age="+age+"&height="+height+"&sex="+sex+"&weight="+weight+"&bmi="+bmi;
	
}

