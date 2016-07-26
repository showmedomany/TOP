package handler;


import java.util.Properties;
import java.util.List;
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


import emailconfirm.SMTPmailconfirm;

import address.AddressDao;
import address.AddressDataBean;

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
			address = adr + " " + detail;
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
		request.setAttribute("idConfirm", result);
		
		String center = "vt_inputForm";
		request.setAttribute("center", center);
		
		return new ModelAndView("/vtFrame/vt_idConfirm");		
		
	}

	//닉네임
	@RequestMapping("/nickConfirm")
	public ModelAndView nickConfirm
	(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		
		String nick =request.getParameter("nick");
		int result = memberDao.nickcheckMember(nick);		
		request.setAttribute("result", result);
		
		return new ModelAndView("/vtFrame/vt_nickConfirm");
		
	}

	
	
	//여기에 메일을 보낼 핸들러를 제작한다.
	@RequestMapping("/memberMailConfirm")
	public ModelAndView memberMailConfirm
	(HttpServletRequest request,HttpServletResponse response){
		
		
		
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
		String confirmnum = buffer.toString();	//인증번호
		
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
		String center = "vt_inputForm";
		
		request.setAttribute("center", center);
		request.setAttribute("confirmnum", confirmnum);
		
		//inputform으로 바로
		return new ModelAndView("vtFrame/vtFrame");
	}
//memberMailConfirm
	/**
	 * 여기에 만들어질 핸들러에는 
	 * 1. 메일인증을 보내는폼에서 email1과 email2을 request.getparameter로 받아 
	 * 	  email변수에 저장을 한다 (email1이 직접입력이라면 email1을 그대로 email변수로)
	 * 
	 * 2. email을 보내는 권한이 있는 email과 해당 email의 비밀번호, 보내는 사람 이름,
	 *    보내는 사람의 메일(email을 보내는 권한이 있는 email을 써도 무관),보내는 메일의 제목을
	 *    각 id,pw,forname,from,subject변수에 저장한다.
	 *   
	 * 3. 보낼 내용을 작성(인증번호의 경우 랜덤을 돌려 생성)
	 * 
	 * 4. try/catch문을 작성(참조 소스긁어도 무관)
	 * 
	 * 5. 인증메일을 보낸경우 해당 번호를 메일인증을 보낸 폼에서도 알아야 하므로
	 *    request.setparmeter로 인증번호를 세팅후
	 *    메일인증을 보낸 폼으로 리턴한다 
	 *   
	 */
	
	//여기에 주소찾기할 핸들러 작성
	/**
	 * 여기에 만들어질 핸들러에는 
	 * 1. 이 핸들러를 호출한 폼에서 주소를 받아 area변수(변수명칭은 취향)에 저장 후 
	 * 	  area변수를 Dao에 작성하고 DBBean에 구현한 메소드에 매개변수로 이용하여 해당 DB를 처리 후
	 *	  javascript에서 생성한 새 창으로 해당 값을 리턴하는 작업을 한다.
	 *
	 * 2. 맨처음 inputform에서 주소찾기 버튼을 눌러 새창을 생성한 경우 입력값이 아무것도 없기 때문에
	 *    다시 새창으로 리턴되는 값은 null이 된다.
	 *    
	 * 3. return new ModelAndView("리턴될 jsp주소"); 이 부분으로 인해 주소찾기창.jsp가 호출되며
	 *    입력값이 없더라도 jsp주소는 호출했기 때문에 새 창이 생성된다.
	 *    
	 * 4. 주소찾기 창에서 검색할 주소를 입력후 호출된다면 주소DBBean에 구현된 check를 통해 해당 주소가 있는지
	 * 	   검색후 있다면 get을 통해 주소DataBean들을 가져와 List에 담고 담긴 DataBean List들을 
	 * 	  request.setAttribut해준다. 
	 * 	 
	 *   
	 */
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












