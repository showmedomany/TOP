package handler;


import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDao;
import board.BoardDataBean;

/**
 * 핸들러들은 센터에 들어갈 각 기능의Frame폼과
 * 각 기능의Frame폼 위에 올라갈 페이지jsp를 같이 vtFrame으로 보내야한다.
 * */

@Controller
public class BoardController {
	
	@Resource(name = "boardDao")
	private BoardDao boardDao;
	
	//community관련 메뉴들
	@RequestMapping("/vt_communityForm")//메뉴탭에서 선택한경우
	public ModelAndView vt_communityForm(HttpServletRequest request, 
			HttpServletResponse response){
		
		String center = "/vt_board/vt_communityForm"; 
		String board = "/vt_board/vt_noticeboard";
	
		request.setAttribute("center", center);
		request.setAttribute("board", board);
		
		
		return new ModelAndView("/vtFrame/vtFrame");
	}//vt_mainboard
	
	@RequestMapping("/vt_community_free")//메뉴탭에서 자유게시판 선택경우
	public ModelAndView vt_community_free(HttpServletRequest request, 
			HttpServletResponse response)throws Exception{
		
		String center = "/vt_board/vt_communityForm"; 
		String board = "/vt_board/vt_freeboard";
		
		int pageSize = 10;		//리스트에 보여질 게시글 갯수
		int pageBlock = 5;		//게시판 블록의 최대수
			
		
		String pageNum = null;				//넘어오는 페이지
				
		int count = boardDao.getCount();			//글의 총 갯수
		int currentPage = 0;						//현재 페이지
		int start = 0;								//게시판에서 맨 윗글
		int end = 0;								//게시판에서 맨 아랫글
		int number = 0;								//게시판의 글 번호		
		int pageCount = 0;							//페이지들의 총 갯수
		int startPage = 0;							//밑에 표시될 페이지의 시작
		int endPage = 0;							//밑에 표시될 페이지의 끝
	
		pageNum = request.getParameter("pageNum");	//이 핸들러 호출한page번호
		
		if(pageNum == null){
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);		//받아온 페이지를 현재페이지로
		
		/*게시판의 시작글과 끝글*/
		start = (currentPage - 1) * pageSize + 1;	// 5번 페이지 본다면 (5 - 1) * 10+1 => 41 1번페이지 (1-1)*10+1 = 1
		end = start + pageSize - 1;					// (41 + 10) - 1 => 50;				 1+10 -1 = 10번
		//1번부터 10번까지글을 1페이지에 보여줌

		request.setAttribute("count", count);		//글의 총 갯수
		request.setAttribute("pageNum", pageNum);	//이핸들러를 호출한 page번호
		request.setAttribute("currentPage", currentPage);	//현재페이지
		
		if(count != 0) {
			//왼쪽에 나열될 글의 번호 
			number = count - (currentPage -1) * pageSize;			
			
			/*페이지들의 총 갯수 */
			pageCount = count / pageSize 
					+ (count % pageSize>0 ? 1 : 0);	
			// 전체 글의 갯수/게시판에 올라갈수있는 글의 갯수 
			//		+ (전체 글의 갯수%게시판에 올라갈 수 있는 글의 갯수 >0 ? 1 : 0);
			
			/*밑에 표시될 페이지의 시작 */
			startPage = (currentPage / pageBlock) * pageBlock + 1;
			//			(현재 페이지/나열될 페이지수) * 나열될 페이지수 + 1;
			
			if(currentPage % pageBlock == 0) startPage -= pageBlock;
			
			/*밑에 표시될 페이지의 끝 */
			endPage = startPage + pageBlock -1;
			//			표시 시작 페이지 + 나열될 페이지수 -1;
			
			if(endPage > pageCount) endPage = pageCount;
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			
			List<BoardDataBean> list
				=boardDao.getArticles(map);
			
			
			request.setAttribute("number", number);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageBlock", pageBlock);
			
			request.setAttribute("list", list);
		}
		request.setAttribute("center", center);
		request.setAttribute("board", board);
		return new ModelAndView("vtFrame/vtFrame");
	}//vt_mainboard		
	
	
	
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
		
		
		
	/*	dto.setNum(Integer.parseInt(request.getParameter("num")));		
		dto.setId(id);(request.getParameter("writer"));
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPasswd(request.getParameter("passwd"));*/
		
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
		
	/*	dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPasswd(request.getParameter("passwd"));*/
	
		String pageNum = request.getParameter("pageNum");	
	
		
		int result = boardDao.modifyArticle(dto);
		
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return new ModelAndView("/vt_board/vt_modifyPro");
	}
}	
