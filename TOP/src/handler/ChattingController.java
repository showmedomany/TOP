package handler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import chat.ChatDataBean;
import chat.RequestDao;
import chat.RequestDataBean;

@Controller
public class ChattingController {
	@Resource(name="requestDao")
	private RequestDao requestDao;
	
	
	//이건 채팅창 여는 핸들러
		@RequestMapping("/memberChat")
		public ModelAndView memberChat
		(HttpServletRequest request,HttpServletResponse response){
			
			String ip = request.getRemoteAddr();
			String id = (String)request.getSession().getAttribute("memId");
			if(id == null){
				id = "guest";
			}
			request.setAttribute("ip", ip);
			request.setAttribute("id", id);
			
			return new ModelAndView("/vt_chat/vt_memberchat");
		}//main
		
	/*인터벌돌면서 채팅이 있는지 확인하고 있으면 뿌려줄 메소드*/
	@RequestMapping("/receiveChat")
	public ModelAndView receiveChat
	(HttpServletRequest request,HttpServletResponse response){
		
		//메세지를 받을 필요는 없다
		String ip = request.getParameter("ip");
		String id = request.getParameter("id");
		
		List<ChatDataBean> chatlist = requestDao.getChat(ip);
		
		
		request.setAttribute("id", id);	//내껀지 상대방껀지 확인하기 위해서
		request.setAttribute("chatlist", chatlist);	//채팅 내역	
		
		return new ModelAndView("/vt_chat/vt_chatPro");//채팅 내역을 구성해줄 jsp로	
	}//main
	
	
	
	
	//채팅요청 보내기 + 메세지 보내기 핸들러
	@RequestMapping("/requestchat")
	public ModelAndView requestchat
	(HttpServletRequest request,HttpServletResponse response){
		
		String ip = request.getParameter("ip");
		String id = request.getParameter("id");
		String chatting = request.getParameter("chatting");
		System.out.println(chatting);
		int checkip = requestDao.checkIp(ip);
		
		//없으면 요청생성
		if(checkip == 0){
			int rp = 0;	//요청 대기 상태를 0으로 시작
			RequestDataBean rdto = new RequestDataBean();
			rdto.setIp(ip);
			rdto.setId(id);
			rdto.setRp(rp);
			//만들어진 DataBean으로 요청 생성
			int insertresult = requestDao.insertRequest(rdto);//요청생성	
			
			if(insertresult !=0){//요청생성에 성공하면
				ChatDataBean cdto = new ChatDataBean();
				cdto.setIp(ip);
				cdto.setChatting(chatting);
				cdto.setId(id);
				//채팅 데이터 생성
				int insertchat = requestDao.insertChet(cdto);
				if(insertchat != 0){
					List<ChatDataBean> chatlist = requestDao.getChat(ip);
					request.setAttribute("id", id);
					request.setAttribute("chatlist", chatlist);
					return new ModelAndView("/vt_chat/vt_chatPro");
				}
			}
		}
		//있으면 DB넣고
		else{
			ChatDataBean cdto = new ChatDataBean();
			cdto.setIp(ip);
			cdto.setChatting(chatting);
			cdto.setId(id);
			//채팅 데이터 생성
			int insertchat = requestDao.insertChet(cdto);
			if(insertchat != 0){
				List<ChatDataBean> chatlist = requestDao.getChat(ip);
				request.setAttribute("id", id);
				request.setAttribute("chatlist", chatlist);				
			}
		}
		return new ModelAndView("/vt_chat/vt_chatPro");		
	}//main
}
