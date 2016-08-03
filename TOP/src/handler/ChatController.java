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
	
	
	@RequestMapping("/receiveChat")
	public ModelAndView receiveChat
	(HttpServletRequest request,HttpServletResponse response){
		
		//메세지를 받을 필요는 없다
		String ip = request.getParameter("ip");
		String id = request.getParameter("id");
		
		List<ChatDataBean> clist = chatDao.getChat(ip);
		
		
		request.setAttribute("id", id);	//내껀지 상대방껀지 확인하기 위해서
		request.setAttribute("clist", clist);	//채팅 내역	
		
		return new ModelAndView("/vt_chat/vt_chatPro");//채팅 내역을 구성해줄 jsp로	
	}//
	
	
	
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
	
	@RequestMapping("/schRequest")
	public ModelAndView schRequest(HttpServletRequest request, HttpServletResponse response){
		//요청을 검색후 요청이 있다면 리스트를 보냄
		
		int searchResult = chatDao.searchRequest();
		
		
		if(searchResult != 0){
			//request테이블의 response가 0인 데이터를 검색하여 리스트로 받음
			List<RequestDataBean> rlist = chatDao.getRequest();		
			
			request.setAttribute("rlist", rlist);
			System.out.println("gg");
		}		
		
		return new ModelAndView("/vt_chat/vt_getRequest");
	}
	
	@RequestMapping("/responseChat")  
	public ModelAndView responseChat(HttpServletRequest request, HttpServletResponse response){
		//새창을 만들기 위해 getRequest.jsp에서 받은 rdto의 ip와 id를 세팅해서 채팅창을 연다.
		String ip = request.getParameter("ip");
		String id = request.getParameter("id");
		
		request.setAttribute("ip", ip);
		request.setAttribute("id", id);
		
		
		return new ModelAndView("/vt_chat/vt_adminchat");
	}
}












