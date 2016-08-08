package myPage;

import java.sql.Timestamp;

public class InbodyDataBean {
	private int inbody_id;
	private String id;
	private int age;
	private int height;
	private String sex;
	private int weight;
	private int bmi;
	private Timestamp check_date;
	public int getInbody_id() {
		return inbody_id;
	}
	public void setInbody_id(int inbody_id) {
		this.inbody_id = inbody_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getBmi() {
		return bmi;
	}
	public void setBmi(int bmi) {
		this.bmi = bmi;
	}
	public Timestamp getCheck_date() {
		return check_date;
	}
	public void setCheck_date(Timestamp check_date) {
		this.check_date = check_date;
	}
	
	
}
