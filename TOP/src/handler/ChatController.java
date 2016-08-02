package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	
	@RequestMapping("/memberChat")
	public ModelAndView memberChat(HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		//아이디와 아이피를 받아옴
		
		
		return new ModelAndView("/vt_chat/vt_memberchat");
	}//logoutPro
}
