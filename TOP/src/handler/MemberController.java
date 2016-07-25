package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.MemberDao;
import member.MemberDataBean;

@Controller
public class MemberController {
	
	//DBBean 객체생성 bean패키지 CreateBean에 이름있음	
	@Resource(name = "memberDao")
	private MemberDao memberDao;
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
		
}
