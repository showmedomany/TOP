package myPage;

import java.sql.Timestamp;

public class RegisterDataBean {
	private int register_id;
	private String id;
	private Timestamp start_date;
	private int exp_date;
	private Timestamp end_date;
	private String gx_check;
	private String pt_check;
	private int pt_count;
	private String trainer_id;
	public int getRegister_id() {
		return register_id;
	}
	public void setRegister_id(int register_id) {
		this.register_id = register_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}
	public int getExp_date() {
		return exp_date;
	}
	public void setExp_date(int exp_date) {
		this.exp_date = exp_date;
	}
	public Timestamp getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}
	public String getGx_check() {
		return gx_check;
	}
	public void setGx_check(String gx_check) {
		this.gx_check = gx_check;
	}
	public String getPt_check() {
		return pt_check;
	}
	public void setPt_check(String pt_check) {
		this.pt_check = pt_check;
	}
	public int getPt_count() {
		return pt_count;
	}
	public void setPt_count(int pt_count) {
		this.pt_count = pt_count;
	}
	public String getTrainer_id() {
		return trainer_id;
	}
	public void setTrainer_id(String trainer_id) {
		this.trainer_id = trainer_id;
	}
	
	
}
	
	
