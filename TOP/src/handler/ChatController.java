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
			HttpServletResponse response){
		//아이디와 아이피를 받아옴
		String ip = request.getRemoteAddr();
		String id = (String)request.getSession().getAttribute("memId");
		if(id == null){
			id = "guest";
		}
		request.setAttribute("ip", ip);
		request.setAttribute("id", id);
		
		
		return new ModelAndView("/vt_chat/vt_memberchat");
	}//memberChat
	
	@RequestMapping("/memberRequestChat")
	public ModelAndView memberRequestChat(HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		
		String ip = request.getParameter("ip");
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		
		//ip로 vt_request검사
		
		
		return new ModelAndView();
	}
}
