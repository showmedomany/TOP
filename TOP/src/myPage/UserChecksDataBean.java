package myPage;

import java.sql.Timestamp;

public class UserChecksDataBean {
	private int inbody;
	private Timestamp inbody_date;
	private int register;
	private Timestamp register_start_date;
	private Timestamp register_end_date;
	private int routine_info;
	private Timestamp routine_start_date;
	private Timestamp routine_end_date;
	public int getInbody() {
		return inbody;
	}
	public void setInbody(int inbody) {
		this.inbody = inbody;
	}
	public Timestamp getInbody_date() {
		return inbody_date;
	}
	public void setInbody_date(Timestamp inbody_date) {
		this.inbody_date = inbody_date;
	}
	public int getRegister() {
		return register;
	}
	public void setRegister(int register) {
		this.register = register;
	}
	public Timestamp getRegister_start_date() {
		return register_start_date;
	}
	public void setRegister_start_date(Timestamp register_start_date) {
		this.register_start_date = register_start_date;
	}
	public Timestamp getRegister_end_date() {
		return register_end_date;
	}
	public void setRegister_end_date(Timestamp register_end_date) {
		this.register_end_date = register_end_date;
	}
	public int getRoutine_info() {
		return routine_info;
	}
	public void setRoutine_info(int routine_info) {
		this.routine_info = routine_info;
	}
	public Timestamp getRoutine_start_date() {
		return routine_start_date;
	}
	public void setRoutine_start_date(Timestamp routine_start_date) {
		this.routine_start_date = routine_start_date;
	}
	public Timestamp getRoutine_end_date() {
		return routine_end_date;
	}
	public void setRoutine_end_date(Timestamp routine_end_date) {
		this.routine_end_date = routine_end_date;
	}
	
}
