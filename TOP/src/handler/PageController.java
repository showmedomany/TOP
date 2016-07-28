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
		
		//홈으로 오면 채팅창 띄운다
		
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
	
	@RequestMapping("/inputForm")
	public ModelAndView inputForm
	(HttpServletRequest request,HttpServletResponse response){		
	
		String center = "vt_inputForm";
		request.setAttribute("center", center);				
		return new ModelAndView("/vtFrame/vtFrame");


	}//loginForm
	
	@RequestMapping("/writeForm")
	public ModelAndView writeForm
	(HttpServletRequest request, HttpServletResponse response) {

		int num = 0;
		int ref = 0;
		int re_step = 0;
		int re_level = 0;
		
		String pageNum =request.getParameter("pageNum");
		if( pageNum == null){
			pageNum = "1";
		}
			
		if(request.getParameter("num") != null){
			//답변글 - content.jsp에서 이동
			//넘어온 값을 써야함
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));	
			pageNum = request.getParameter("pageNum");			
			
		}
		
		request.setAttribute("num", num);
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);
		request.setAttribute("pageNum", pageNum);
		
		
		return new ModelAndView("/vtFrame/vt_writeForm");
	}
	
			
	@RequestMapping("/memberChat")
	public ModelAndView memberChat
	(HttpServletRequest request,HttpServletResponse response){		
		//세션아이디 받아와야함
		String ip = request.getRemoteAddr();
		
		request.setAttribute("ip", ip);
		return new ModelAndView("/vtFrame/vt_chat");

	}//loginForm
	
	
	//센터소개 메뉴 시작
			@RequestMapping("/vt_infoHello")
			public ModelAndView vt_infoHello(HttpServletRequest request, 
					HttpServletResponse response){
				
				String center = "/vt_info/vt_infoForm"; 
				String menu = "/vt_info/vt_infoHello";
				String word = "/vt_info/word/hello";
				request.setAttribute("center", center);
				request.setAttribute("menu", menu);
				request.setAttribute("word", word);
				
				return new ModelAndView("/vtFrame/vtFrame");
			}//vt_infoHello
			@RequestMapping("/vt_infoHistory")
			public ModelAndView vt_infoHistory(HttpServletRequest request, 
					HttpServletResponse response){
				
				String center = "/vt_info/vt_infoForm"; 
				String menu = "/vt_info/vt_infoHistory";
				String word = "/vt_info/word/history";
				request.setAttribute("center", center);
				request.setAttribute("menu", menu);
				request.setAttribute("word", word);
				
				return new ModelAndView("/vtFrame/vtFrame");
			}//vt_infoChar
			@RequestMapping("/vt_infoInfo")
			public ModelAndView vt_infoInfo(HttpServletRequest request, 
					HttpServletResponse response){
				
				String center = "/vt_info/vt_infoForm"; 
				String menu = "/vt_info/vt_infoInfo";
				String word = "/vt_info/word/info";
				request.setAttribute("center", center);
				request.setAttribute("menu", menu);
				request.setAttribute("word", word);
				
				return new ModelAndView("/vtFrame/vtFrame");
			}//vt_infoInfo
			@RequestMapping("/vt_infoChar")
			public ModelAndView vt_infoChar(HttpServletRequest request, 
					HttpServletResponse response){
				
				String center = "/vt_info/vt_infoForm"; 
				String menu = "/vt_info/vt_infoChar";
				String word = "/vt_info/word/char";
				request.setAttribute("center", center);
				request.setAttribute("menu", menu);
				request.setAttribute("word", word);
				
				return new ModelAndView("/vtFrame/vtFrame");
			}//vt_infoInfo
			//센터 소개메뉴 끝
			//커뮤니티 시작
			@RequestMapping("/vt_mainboard")
			public ModelAndView vt_mainboard(HttpServletRequest request, 
					HttpServletResponse response){
				
				String center = "/vt_board/vt_infoForm"; 
				String menu = "/vt_board/vt_mainboard";
				String word = "/vt_board/word/char";
				request.setAttribute("center", center);
				request.setAttribute("menu", menu);
				request.setAttribute("word", word);
				
				return new ModelAndView("/vtFrame/vtFrame");
			}//vt_infoInfo
			//커뮤니티 끝
}

