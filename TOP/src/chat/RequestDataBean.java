package chat;

import java.sql.Timestamp;

public class RequestDataBean {
	private String ip;
	private String id;
	private Timestamp req_date;
	private int rp;				//요청에 응답했는지
	
	public String getIp() {
		return ip;
	}
	public String getId() {
		return id;
	}
	public Timestamp getReq_date() {
		return req_date;
	}
	public int getRp() {
		return rp;
	}
	
	public void setIp(String ip) {
		this.ip = ip;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setReq_date(Timestamp req_date) {
		this.req_date = req_date;
	}
	public void setRp(int rp) {
		this.rp = rp;
	}
	
	
}
