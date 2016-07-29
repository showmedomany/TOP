package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdministratorController {	
	@RequestMapping("/administratorPage")
	public ModelAndView administratorPage
	(HttpServletRequest request,HttpServletResponse response){		
		
		//String top = "vt_admin_topForm";	바뀔일 없으므로 vt_administrator.jsp에서 그냥 끼운다
		String center = "vt_admin_centerForm";		
		
		//request.setAttribute("top", top);	넘길 필요없다.
		request.setAttribute("center", center);
		
		return new ModelAndView("/vt_administrator/vt_administrator");
	}//
	
	//vt_administrator.jsp가 불려지면 계속 DB를 검사한다.
}