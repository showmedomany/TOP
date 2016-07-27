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
		
		String top = "vt_admin_topForm";
		String center = "vt_admin_centerForm";		
		
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		
		return new ModelAndView("/vt_administrator/vt_administrator");
	}//
		
}
