package chat;

public class RequestDataBean {
	private String ip;					//요청한 아이피
	private String request_id;			//요청한 아이디
	
	
	public String getIp() {
		return ip;
	}
	public String getRequest_id() {
		return request_id;
	}
	
	public void setIp(String ip) {
		this.ip = ip;
	}
	public void setRequest_id(String request_id) {
		this.request_id = request_id;
	}
}
