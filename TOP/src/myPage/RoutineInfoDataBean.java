package myPage;

import java.sql.Timestamp;

public class RoutineInfoDataBean {
	private int routineinfo_id;
	private String id;
	private String sex;
	private String routine_type;
	private Timestamp start_date;
	private Timestamp end_date;
	
	public int getRoutineinfo_id() {
		return routineinfo_id;
	}
	public void setRoutineinfo_id(int routineinfo_id) {
		this.routineinfo_id = routineinfo_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getRoutine_type() {
		return routine_type;
	}
	public void setRoutine_type(String routine_type) {
		this.routine_type = routine_type;
	}
	public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}
	public Timestamp getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}
	
}
