package handler;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class PageController {		
	
	//홈페이지 접속 & 홈으로 이동 핸들러
	@RequestMapping("/main")
	public ModelAndView main
	(HttpServletRequest request,HttpServletResponse response){
		//가운데 컨텐츠를 메인화면용 jsp로 교체
		String center = "vt_centerContent";
		String top = "/vtFrame/changeimages/mainimage";
		request.setAttribute("top", top);
		request.setAttribute("center", center);	
		return new ModelAndView("/vtFrame/vtFrame");
	}//main
	
	//로그인태그 클릭시 로그인form 호출 핸들러
	@RequestMapping("/loginForm")
	public ModelAndView loginForm
	(HttpServletRequest request,HttpServletResponse response){
		//가운데 컨텐츠를 로그인Form으로 교체
		String center = "vt_loginForm";
		String top = "/vtFrame/changeimages/mainimage";
		request.setAttribute("top", top);
		
		String page = request.getParameter("page");
		if(page == null){
			page = "main";
		}
		request.setAttribute("center", center);
		
		request.setAttribute("page", page);
		return new ModelAndView("/vtFrame/vtFrame");
	}//loginForm
	
	@RequestMapping("/inputForm")
	public ModelAndView inputForm
	(HttpServletRequest request,HttpServletResponse response){		
	
		String center = "vt_inputForm";
		String top = "/vtFrame/changeimages/mainimage";
		request.setAttribute("top", top);
		request.setAttribute("center", center);				
		return new ModelAndView("/vtFrame/vtFrame");
	}//loginForm
	
	
	//센터소개 메뉴 시작
	@RequestMapping("/vt_infoHello")
	public ModelAndView vt_infoHello(HttpServletRequest request, 
			HttpServletResponse response){		
		String center = "/vtFrame/vt_sideMenuForm"; 
		String menu = "/vt_info/vt_infoHello";
		String word = "/vt_info/word/hello";
		String top = "/vtFrame/changeimages/cenimage";
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("menu", menu);
		request.setAttribute("word", word);
		
		return new ModelAndView("/vtFrame/vtFrame");
	}//vt_infoHello
	
	@RequestMapping("/vt_infoHistory")
	public ModelAndView vt_infoHistory(HttpServletRequest request, 
			HttpServletResponse response){
		
		String center = "/vtFrame/vt_sideMenuForm"; 
		String menu = "/vt_info/vt_infoHistory";
		String word = "/vt_info/word/history";
		String top = "/vtFrame/changeimages/cenimage";
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("menu", menu);
		request.setAttribute("word", word);
		
		return new ModelAndView("/vtFrame/vtFrame");
	}//vt_infoHistory
	@RequestMapping("/vt_infoInfo")
	public ModelAndView vt_infoInfo(HttpServletRequest request, 
			HttpServletResponse response){
		
		String center = "/vtFrame/vt_sideMenuForm"; 
		String menu = "/vt_info/vt_infoInfo";
		String word = "/vt_info/word/info";
		String top = "/vtFrame/changeimages/cenimage";
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("menu", menu);
		request.setAttribute("word", word);
		return new ModelAndView("/vtFrame/vtFrame");
	}//vt_infoInfo
	
	@RequestMapping("/vt_infoChar")
	public ModelAndView vt_infoChar(HttpServletRequest request, 
			HttpServletResponse response){
		
		String center = "/vtFrame/vt_sideMenuForm"; 
		String menu = "/vt_info/vt_infoChar";
		String word = "/vt_info/word/char";
		String top = "/vtFrame/changeimages/cenimage";
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("menu", menu);
		request.setAttribute("word", word);
		
		return new ModelAndView("/vtFrame/vtFrame");
	}//vt_infoChar
	//센터 소개메뉴 끝
	//운동 프로그램 정보 시작
	@RequestMapping("/vt_ptinfo")
	public ModelAndView vt_ptinfo(HttpServletRequest request, 
			HttpServletResponse response){
		
		String center = "/vtFrame/vt_sideMenuForm"; 
		String menu = "/vt_exerinfo/vt_ptinfo";
		String word = "/vt_exerinfo/word/pt";
		String top = "/vtFrame/changeimages/exerimage";
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("menu", menu);
		request.setAttribute("word", word);
		
		return new ModelAndView("/vtFrame/vtFrame");
	}//vt_ptinfo
	@RequestMapping("/vt_gxinfo")
	public ModelAndView vt_gxinfo(HttpServletRequest request, 
			HttpServletResponse response){
		
		String center = "/vtFrame/vt_sideMenuForm"; 
		String menu = "/vt_exerinfo/vt_gxinfo";
		String word = "/vt_exerinfo/word/gx";
		String top = "/vtFrame/changeimages/exerimage";
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("menu", menu);
		request.setAttribute("word", word);
		
		return new ModelAndView("/vtFrame/vtFrame");
	}//vt_ptinfo
	//운동 프로그램 정보 끝
	//트레이너 소개 시작
	@RequestMapping("/vt_pttrinfo")
	public ModelAndView vt_pttrinfo(HttpServletRequest request, 
			HttpServletResponse response){
		
		String center = "/vtFrame/vt_sideMenuForm"; 
		String menu = "/vt_trinfo/vt_pttrinfo";
		String word = "/vt_trinfo/word/pttr";
		String top = "/vtFrame/changeimages/trimage";
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("menu", menu);
		request.setAttribute("word", word);
		
		return new ModelAndView("/vtFrame/vtFrame");
	}//vt_pttrinfo
	@RequestMapping("/vt_gxtrinfo")
	public ModelAndView vt_gxtrinfo(HttpServletRequest request, 
			HttpServletResponse response){
		
		String center = "/vtFrame/vt_sideMenuForm"; 
		String menu = "/vt_trinfo/vt_gxtrinfo";
		String word = "/vt_trinfo/word/gxtr";
		String top = "/vtFrame/changeimages/trimage";
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("menu", menu);
		request.setAttribute("word", word);
		
		return new ModelAndView("/vtFrame/vtFrame");
	}//vt_gxtrinfo
	//트레이너 소개 끝	
}

