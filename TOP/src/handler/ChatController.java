package handler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import chat.ChatDao;
import chat.ChatDataBean;
import chat.RequestDataBean;

@Controller
public class ChatController {
	@Resource(name = "chatDao")
	private ChatDao chatDao;
	
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
		int checkip = chatDao.checkIp(ip);
		
		if(checkip==0){
			int resp = 0;
			RequestDataBean rdto = new RequestDataBean();
			rdto.setIp(ip);
			rdto.setId(id);
			rdto.setResponse(resp);
			
			//요청생성
			int insertCheck = chatDao.insertRequest(rdto);
			
			if(insertCheck !=0){
				ChatDataBean cdto = new ChatDataBean();
				cdto.setIp(ip);
				cdto.setContent(content);
				cdto.setId(id);
				
				int insertchat = chatDao.insertChat(cdto);
				if(insertchat != 0){
					List<ChatDataBean> clist = chatDao.getChat(ip);
					request.setAttribute("id", id);
					request.setAttribute("clist", clist);
				}				
			}
		}
		else{
			ChatDataBean cdto = new ChatDataBean();
			cdto.setIp(ip);
			cdto.setContent(content);
			cdto.setId(id);
			
			int insertchat = chatDao.insertChat(cdto);
			if(insertchat != 0){
				List<ChatDataBean> clist = chatDao.getChat(ip);
				request.setAttribute("id", id);
				request.setAttribute("clist", clist);
			}
		}
		
		
		
		return new ModelAndView("/vt_chat/vt_chatPro");
	}
}
