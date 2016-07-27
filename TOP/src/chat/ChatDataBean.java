package chat;

public class ChatDataBean {
	private String ip;				//요청자 ip
	private String request_id;		//요청자 id
	private String manager_id;		//답변자 id
	private String content;			//내용
	
	
	public String getIp() {
		return ip;
	}
	public String getRequest_id() {
		return request_id;
	}
	public String getManager_id() {
		return manager_id;
	}
	public String getContent() {
		return content;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public void setRequest_id(String request_id) {
		this.request_id = request_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
