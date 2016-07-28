/**
 * 
 */

var request = null;
//*********************ajax 아이디,비번,닉네임 중복확인 시작*********************

function Request( callback, url, method, params ){
	this.callback = callback;
	this.url = url;
	this.method = method;
	this.params = params;
	this.httpRequest = null;	
};

Request.prototype = {
		getXMLHttpRequest : function(){
			if(window.ActiveXObject){
				try{
					return new ActiveXObject("Msxml2.XMLHTTP");
				}catch(e){
					try{
						return new ActiveXObject("Microsoft.XMLHTTP");
					}catch(ex){
						return null;
					}
				}
			}else{
				try{
					return new XMLHttpRequest();
				}catch(e){
					return null;
				}
			}
		},
		sendRequest : function(){   
			this.httpRequest = this.getXMLHttpRequest();
			
			this.httpRequest.onreadystatechange = this.callback;
			
			var httpMethod = this.method ? this.method : "GET";
			if(httpMethod != "POST" && httpMethod != "GET"){
				httpMethod = "GET";
			}
			
			var httpParams = (this.params == null || this.params == "") ? "" : this.params;
			var httpUrl = (httpMethod == "GET") ? this.url + "?" + httpParams : this.url;
			
			this.httpRequest.open(httpMethod, httpUrl, true);
			this.httpRequest.setRequestHeader(
					"content-type", "application/x-www-form-urlencoded" );
			this.httpRequest.send(httpMethod == "POST" ? httpParams : null);			
		}
};

$(function(){setInterval("채팅DB검색해서가져오는function", 1000)})

function sendmsg(){
	//여기서는 추가로 채팅입력메세지를 보내야함
	var params = "ip="+chatForm.ip.value+"&id="+chatForm.id.value;
				/*"&msg"+chatForm.input.value*/
	
	request = new Request(sendrequest, "requestchat.do", "POST", params);	
	request.sendRequest(); 
}

function sendrequest(){
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200){
								
		}
	}	
}

function 채팅DB검색해서가져오는function(){
	//센드랑 똑같은데 얘는 그냥 가져오기만 하는 기능
	var params = "ip="+chatForm.ip.value+"&id="+chatForm.id.value;
	
	request = new Request(sendrequest, "requestchat.do", "POST", params);	
	request.sendRequest(); 
}














