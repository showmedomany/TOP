package board;

import java.sql.Timestamp;

public class BoardDataBean {

	private int num;				//글번호
	private String id;				//작성자 id
	private String nickname;
	private String subject;			//제목
	private int readcount;			//조회수
	private Timestamp reg_date;		//작성일
	private String content;			//내용
	
	
	public int getNum() {
		return num;
	}
	public String getId() {
		return id;
	}
	public String getNickname() {
		return nickname;
	}
	public String getSubject() {
		return subject;
	}
	public int getReadcount() {
		return readcount;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public String getContent() {
		return content;
	}
	
	
	
	public void setNum(int num) {
		this.num = num;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
