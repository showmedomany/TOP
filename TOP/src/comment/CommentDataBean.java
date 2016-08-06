package comment;

import java.sql.Timestamp;

public class CommentDataBean {
	private int comment_id;		//코멘트 순서
	private int num;			//코멘트 달릴 게시글의 글번호
	private String nick;			//작성자
	private String content;		//코멘트 내용
	private Timestamp reg_date;	//작성일
	
	public int getComment_id() {
		return comment_id;
	}
	public int getNum() {
		return num;
	}
	public String getNick() {
		return nick;
	}
	public String getContent() {
		return content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}
