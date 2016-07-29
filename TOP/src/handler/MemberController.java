package handler;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import address.AddressDao;
import address.AddressDataBean;
import board.BoardDao;
import board.BoardDataBean;
import emailconfirm.SMTPmailconfirm;
import member.MemberDao;
import member.MemberDataBean;

@Controller
public class MemberController {
	
	//DBBean 객체생성 bean패키지 CreateBean에 이름있음	
	@Resource(name = "memberDao")
	private MemberDao memberDao;
	
	@Resource(name = "adrDao")
	private AddressDao adrDao;
	
	
	
	//로그인처리 핸들러
	@RequestMapping("/loginPro")
	public ModelAndView loginPro
	(HttpServletRequest request,HttpServletResponse response){
		//로그인 폼에서 보내진 id와 비밀번호로 db검색후
		//세션스코프에 권한과 아이디 저장
		
		//로그인 폼에서 보내진 id
		String id = request.getParameter("id");
		//로그인 폼에서 보내진 passwd
		String passwd = request.getParameter("passwd");
		
		int loginCheck = memberDao.loginMember(id, passwd);
		
		if(loginCheck == 1){			
			int authority_id = memberDao.getAuthority_id(id);
			request.setAttribute("authority_id", authority_id);			
		}
		//loginMember메소드 사용
		//getMember메소드 사용해서 권한 저장
		request.setAttribute("loginCheck", loginCheck);
		request.setAttribute("id", id);
		
		
		//리턴은 loginPro.jsp로 이동하여 로그인이 제대로 이뤄 졌는지 알려줌
		return new ModelAndView("/vtFrame/vt_loginPro");
	}//loginPro
	
	@RequestMapping("/inputPro")
	public ModelAndView inputPro
	(HttpServletRequest request,HttpServletResponse response) throws Exception{		
		//메인으로 돌아가야하므로 센터 컨텐트로 설정
		request.setCharacterEncoding("utf-8");
		
		MemberDataBean mdto = new MemberDataBean();
		
		mdto.setAuthority_id(2);
		mdto.setId(request.getParameter("id"));
		mdto.setPasswd(request.getParameter("passwd"));
		mdto.setName(request.getParameter("name"));
		mdto.setNickname(request.getParameter("nickname"));
				
		String zipcode = null;
		String zipcode1 = request.getParameter("zipcode1");
		String zipcode2 = request.getParameter("zipcode2");
		
		if(!zipcode1.equals("") && !zipcode2.equals("")){
			zipcode = zipcode1 + "-" + zipcode2;
		}
		mdto.setZipcode(zipcode);
		
		String address = null;
		String adr = request.getParameter("adr");
		String detail = request.getParameter("detail_adr");
		
		if(!adr.equals("") && !detail.equals("")){
			address = adr + "|" + detail;
		}
		mdto.setAddress(address);
	
		String tel = null;
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		
		if(!tel1.equals("")
				&& !tel2.equals("") 
				&& !tel3.equals("")){
			tel = tel1 + "-" + tel2 + "-" + tel3;
		}
		
		mdto.setPhone(tel);
	
		String email = null;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		
		if(!email1.equals("") && !email2.equals("")){
			if(email2.equals("0")){
				//직접입력
				email = email1;
			}
			else{
				//선택입력
				email = email1 + "@" + email2;
			}
		}
		
		mdto.setEmail(email);
		
		int insertResult = memberDao.insertMember(mdto);
		
		request.setAttribute("insertResult", insertResult);
		
		return new ModelAndView("/vtFrame/inputPro");
	}//loginForm
	
	@RequestMapping("/logoutPro")
	public ModelAndView logoutPro
	(HttpServletRequest request,HttpServletResponse response){
		
		//메인으로 돌아가야하므로 센터 컨텐트로 설정
		String center = "vt_centerContent";
		request.setAttribute("center", center);		
		//세션 내용을 지움
		request.getSession().removeAttribute("memId");
		request.getSession().removeAttribute("authority_id");
		
		return new ModelAndView("/vtFrame/vtFrame");
	}//logoutPro
	
	
	@RequestMapping("/idConfirm")
	public ModelAndView idConfirm
	(HttpServletRequest request,HttpServletResponse response){
		
		String id =request.getParameter("id");
		
		int result = memberDao.checkMember(id);
		request.setAttribute("result", result);

		return new ModelAndView("/vtFrame/vt_Confirm");		

		
	}

	//닉네임
	@RequestMapping("/nickConfirm")
	public ModelAndView nickConfirm
	(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		
		String nick =request.getParameter("nick");
		int result = memberDao.nickcheckMember(nick);		
		request.setAttribute("result", result);
		
		return new ModelAndView("/vtFrame/vt_Confirm");
		
	}

	
	
	//여기에 메일을 보낼 핸들러를 제작한다.
	@RequestMapping("/memberMailConfirm")
	public ModelAndView memberMailConfirm
	(HttpServletRequest request,HttpServletResponse response){
		String email = null;
		String confirmnum = "1";
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		
		if(!email1.equals("") && !email2.equals("")){
			if(email2.equals("0")){
				//직접입력
				email = email1;
			}
			else{
				//선택입력
				email = email1 + "@" + email2;
			}
		}
		//이프문으로 묶어서 이메일 있나 없나 검사 먼저
		//있으면 이미 가입된 이메일입니다 경고창
		//없으면 메일전송
		
		int emailcheck = memberDao.checkEmail(email);
		
		if(emailcheck==0){
			System.out.println(email);	
			String id = "dhwan.jung@gmail.com";
			String pw = "ehdghks87g";	
			String fromname = "KH정보교육원 오후반 2차 과제";
			String from = "kajika24@naver.com";
			String subject = "회원가입 인증번호";
			
			
			StringBuffer buffer = new StringBuffer();
			for(int i = 0; i < 6; i++){
				int n = (int) (Math.random()*10);
				buffer.append(n);
			}
			confirmnum = buffer.toString();	//인증번호
			
			try{
				Properties p = new Properties();
				
				p.put("mail.smtp.starttls.enable", "true");
				p.put("mail.transpor.protocol", "smtp");
				p.put("mail.smtp.host","smtp.gmail.com");
				
				p.setProperty("mail.smtp.socketFactory.class", 
						"javax.net.ssl.SSLSocketFactory");
				p.put("mail.smtp.port", "465");		
				p.put("mail.smtp.auth", "true"); 
				p.put("mail.smtp.debug", "true");
				p.put("mail.smtp.socketFactory.fallback", "false");
				
			    Authenticator auth = new SMTPmailconfirm(id, pw);
			    Session ses = Session.getInstance(p, auth);
			     
			    
			    
			    ses.setDebug(true);
			     
			    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
			    //subject = 인증번호;
			    msg.setSubject(subject); // 제목 작성
			    //from = kajika24@naver.com;
			    
			    msg.setFrom(new InternetAddress(from,MimeUtility.encodeText
			    		(fromname, "UTF-8", "B"))); // 보내는 사람
			     
			    Address toAddr = new InternetAddress(email);	//받는사람
			    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
			     
			    //content = random
			    msg.setContent(confirmnum, "text/html;charset=UTF-8"); // 내용과 인코딩
			     
			    Transport.send(msg); // 전송
			} catch(Exception e){
			    e.printStackTrace();	    
			    // 오류 발생시 뒤로 돌아가도록		    
			}		
			
			confirmnum = "<input type = 'hidden' name = 'equal' value = '"+confirmnum+"'>";
			
			request.setAttribute("confirmnum", confirmnum);
		}
		request.setAttribute("confirmnum", confirmnum);
		
		
		//inputform으로 바로
		return new ModelAndView("vtFrame/vt_mailConfirmResult");
	}

	@RequestMapping("/zipCheck")
	public ModelAndView zipCheck
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");		
		String inputarea = request.getParameter("inputarea");
		
		int resultCheck = adrDao.checkAddress(inputarea);
		
		if(resultCheck != 0){
			List<AddressDataBean> alist = adrDao.getAddress(inputarea);		
			request.setAttribute("adto", alist);
			
		}		
		
		request.setAttribute("resultCheck", resultCheck);
		request.setAttribute("area", inputarea);
		
		return new ModelAndView("/vtFrame/vt_zipCheck");
	}
	
	
	
	
	
}
