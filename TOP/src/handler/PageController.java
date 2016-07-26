package handler;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * PageController
 * 페이지 이동관련 핸들러 모음
 * 가능하면 핸들러 위에 주석으로 무엇에 관한 핸들러 인지 적어줄 것 
 *    
 */

@Controller
public class PageController {		
	
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

