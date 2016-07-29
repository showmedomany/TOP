package handler;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDao;
import board.BoardDataBean;

@Controller
public class BoardController {
	
	@Resource(name = "boardDao")
	private BoardDao boardDao;
	
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
		
		
		return new ModelAndView("/vt_board/vt_writeForm");
	} // writeForm
	
	
	@RequestMapping("/deleteForm")
	public ModelAndView deleteForm
	(HttpServletRequest request,HttpServletResponse response)  {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		
		return new ModelAndView("/vt_board/vt_deleteForm");
	} // deleteForm
	
	@RequestMapping("/writePro")
	public ModelAndView writePro
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			
		BoardDataBean dto = new BoardDataBean();
		
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setRef(Integer.parseInt(request.getParameter("ref")));
		dto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		dto.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		dto.setWriter(request.getParameter("writer"));
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPasswd(request.getParameter("passwd"));
		
		//<!-- num ref re_step re_level -->
		//<!-- writer email subject content passwd -->

		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		int result = boardDao.insertArticle(dto);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return new ModelAndView("/vt_board/vt_writePro");
	}
	
	
	@RequestMapping("/deletePro")
	public ModelAndView deletePro(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String passwd = request.getParameter("passwd");
	
		
		int resultCheck = boardDao.check(num, passwd);
		
		if(resultCheck != 0){
			int result = boardDao.deletArticle(num);
			
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			
		}
		
		request.setAttribute("resultCheck", resultCheck);
		
		return new ModelAndView("/vt_board/vt_deletePro");
	}
	
	
	@RequestMapping("/modifyPro")
	public ModelAndView modifyPro(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
	
		
		//<!-- num, email, subject, content, passwd 받을 수 있다. -->
		BoardDataBean dto = new BoardDataBean();
		
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPasswd(request.getParameter("passwd"));
	
		String pageNum = request.getParameter("pageNum");	
	
		
		int result = boardDao.modifyArticle(dto);
		
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return new ModelAndView("/vt_board/vt_modifyPro");
	}
	
}
