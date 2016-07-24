package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.MemberDao;

/**
 * PageController
 * 페이지 이동관련 핸들러 모음
 * 가능하면 핸들러 위에 주석으로 무엇에 관한 핸들러 인지 적어줄 것 
 */

@Controller
public class PageController {
	
	//DBBean 객체생성 bean패키지 CreateBean에 이름있음	
	@Resource(name = "memberDao")
	private MemberDao memberDao;
	
	//홈페이지 접속 & 홈으로 이동 핸들러
	@RequestMapping("/main")
	public ModelAndView main
	(HttpServletRequest request,HttpServletResponse response){
		
		//가운데 컨텐츠를 메인화면용 jsp로 교체
		String center = "vt_centerContent";
		request.setAttribute("center", center);
		
		return new ModelAndView("/vtFrame/vtFrame");
	}//main
	
	
	//로그인태그 클릭시 로그인form 호출 핸들러
	@RequestMapping("/loginForm")
	public ModelAndView loginForm
	(HttpServletRequest request,HttpServletResponse response){
		//가운데 컨텐츠를 로그인Form으로 교체
		String center = "vt_loginForm";
		request.setAttribute("center", center);
		
		return new ModelAndView("/vtFrame/vtFrame");
	}//loginForm
	
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
	
	
	@RequestMapping("/infoForm")
	public ModelAndView infoForm
	(HttpServletRequest request,HttpServletResponse response){		
		//메인으로 돌아가야하므로 센터 컨텐트로 설정
		String center = "/vt_info/vt_infoForm";
		request.setAttribute("center", center);				
		return new ModelAndView("/vtFrame/vtFrame");
	}//infoForm
	
	@RequestMapping("/inputForm")
	public ModelAndView inputForm
	(HttpServletRequest request,HttpServletResponse response){		
		//메인으로 돌아가야하므로 센터 컨텐트로 설정
		String center = "vt_inputForm";
		request.setAttribute("center", center);				
		return new ModelAndView("/vtFrame/vtFrame");
	}//loginForm
}	

