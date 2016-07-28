package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import chat.RequestDao;
import chat.RequestDataBean;

@Controller
public class ChattingController {
	@Resource(name="requestDao")
	private RequestDao requestDao;
	
	
	//이건 채팅창 여는 핸들러
	@RequestMapping("/chatting")
	public ModelAndView chatting
	(HttpServletRequest request,HttpServletResponse response){
		
		String ip = request.getRemoteAddr();
		String id = (String)request.getSession().getAttribute("memId");
		if(id == null){
			id = "guest";
		}
		request.setAttribute("ip", ip);
		request.setAttribute("id", id);
		
		return new ModelAndView("/vt_chat/vt_chat");
	}//main
	
	//채팅요청 보내기 + 메세지 보내기 핸들러
	@RequestMapping("/requestchat")
	public ModelAndView requestchat
	(HttpServletRequest request,HttpServletResponse response){
		
		String ip = request.getParameter("ip");
		String id = request.getParameter("id");
		String msg = request.getParameter("msg");
		//먼저 chattingrequest 테이블을 검색 ->checkRequest
		
		if(msg != null){
			int checkip = requestDao.checkIp(ip);
			
			//새로운 요청자면 이부분실행
			if(checkip == 0){
				int rp = 0;	//요청 대기 상태를 0으로 시작
				RequestDataBean rdto = new RequestDataBean();
				rdto.setIp(ip);
				rdto.setId(id);
				rdto.setRp(rp);
				//만들어진 DataBean으로 요청 생성 
				int insertresult = requestDao.insertRequest(rdto);	
				
				//여기서 채팅내용이랑 보낸사람 DB에 넣는다.
			}
			//기존에 요청했던 사용자면 채팅내용만 DB생성
			else{
				//채팅내용이랑 보낸사람을 DB에 넣는다.
				System.out.println("있는놈");
			}
			
			
			//아이피? 아이디?
			//요청을 하면 관리자에서 어떻게 받음?
			//요청용 Table 을 검색해서 요청이 있는경우 새로운 창이 뜨게
			//요청을 했을경우 응답 받으면 respones를 1로
			//요청에 응답을 안한경우(관리자가 로그인을 안한경우);
			//요청시간도?
			//ip, id, 요청시간, 응답,
			//첫 요청이라면 요청정보와 채팅데이터가 들어가게
			//만약 이미 요청을 한 상태에서 전송을 누르면 채팅데이터가 들어가게
			
			//해당 요청의 창이 있으면 더이상 안뜨게 
		}
		else{
			//여기는 채팅내역을 가져오는 메소드
		}
		
		return new ModelAndView("/vt_chat/vt_chatrequestPro");
	}//main
}
