package emailconfirm;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class SMTPmailconfirm extends Authenticator{
	
	private String id;
	
	private String pw;
	
	public SMTPmailconfirm(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication(){
		return new PasswordAuthentication(id, pw);
	}
}
