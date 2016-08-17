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
import board.SearchDataBean;
import comment.CommentDao;
import comment.CommentDataBean;
import member.MemberDao;
import util.Util;

/**
 * 핸들러들은 센터에 들어갈 각 기능의Frame폼과
 * 각 기능의Frame폼 위에 올라갈 페이지jsp를 같이 vtFrame으로 보내야한다.
 * */

@Controller
public class BoardController {
	
	@Resource(name = "boardDao")
	private BoardDao boardDao;
	
	@Resource(name = "commentDao")
	private CommentDao commentDao;
	
	@Resource(name = "memberDao")
	private MemberDao memberDao;
	
	@RequestMapping("/vt_community_free")//메뉴탭에서 자유게시판 선택경우
	public ModelAndView vt_community_free(HttpServletRequest request, 
			HttpServletResponse response)throws Exception{
		String word = "/vt_board/word/free";
		String center = "/vtFrame/vt_sideMenuForm"; 
		String menu = "/vt_board/vt_freeboard";
		String top = "/vtFrame/changeimages/coimage";
		
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
		// 2*11 22
		//22 + 10 32
		
		// 2-1 * 10+1 = start= 11
		// 11+ 10 = 21 
		end = start + pageSize - 1;					// (41 + 10) - 1 => 50;				 1+10 -1 = 10번
		//1번부터 10번까지글을 1페이지에 보여줌
		
		
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
		
		request.setAttribute("count", count);		//글의 총 갯수
		request.setAttribute("pageNum", pageNum);	//이핸들러를 호출한 page번호
		request.setAttribute("currentPage", currentPage);	//현재페이지
		
		request.setAttribute("word",word);
		request.setAttribute("menu",menu);
		request.setAttribute("center",center);
		request.setAttribute("top", top);
		return new ModelAndView("vtFrame/vtFrame");
	}//vt_mainboard		
	
	
	
	//자유게시판 게시글 읽는 핸들러
	@RequestMapping("/vt_freeContent")//메뉴탭에서 선택한경우
	public ModelAndView vt_freeContent(HttpServletRequest request, 
			HttpServletResponse response)throws Exception{
		
		
		int num = Integer.parseInt(request.getParameter("num")); //디비속 글번호		
		
		String pageNum = request.getParameter("pageNum");		//현재페이지
		String number = request.getParameter("number");			//화면의 표시될 글번호
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);
		BoardDataBean dto = boardDao.getArticle(num);			//디비에서 해당글의 내용을 가져와서
		
		
		request.setAttribute("number", number);					//페이지로 넘김
		request.setAttribute("pageNum", pageNum);				//페이지로 넘김
		request.setAttribute("dto", dto);						//내용도 넘김
		
		if(!dto.getId().equals(
				(String)request.getSession().getAttribute("memId"))){
			boardDao.addCount(num);
		}
				
		
		return new ModelAndView("/vt_board/vt_freeContent");
	}//vt_freeContent
	
	//자유게시판 게시글 읽는 핸들러
	@RequestMapping("/vt_freeWriteForm")
	public ModelAndView vt_freeWriteForm(HttpServletRequest request, 
			HttpServletResponse response)throws Exception{
		
		
		/*int num = 0;*/
		String pageNum = request.getParameter("pageNum");
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);
		if(pageNum == null){
			pageNum = "1";
		}
					
		String center = "/vtFrame/vt_sideMenuForm"; 
		String menu = "/vt_board/vt_freeWriteForm";
		String word = "/vt_board/word/free";
		
		/*request.setAttribute("num", num);*/
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("word",word);
		request.setAttribute("menu",menu);
		request.setAttribute("center",center);
		return new ModelAndView("/vtFrame/vtFrame");
	}//vt_mainboard
	
	
	//게시판 글쓰기 처리핸들러
	@RequestMapping("/vt_freeWritePro")
	public ModelAndView vt_freeWritePro(HttpServletRequest request, 
			HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		BoardDataBean bdto = new BoardDataBean();
		
		bdto.setId(request.getParameter("id"));
		bdto.setNickname(request.getParameter("nickname"));
		bdto.setSubject(request.getParameter("subject"));
		bdto.setReadcount(0);
		String content = request.getParameter("content");
		
		bdto.setContent(Util.toJS(content));
		bdto.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		int result = boardDao.insertArticle(bdto);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		
		return new ModelAndView("/vt_board/processing/vt_freeWritePro");
	}//vt_freeWritePro
	
	
	//수정 핸들러
	@RequestMapping("/vt_freeModifyForm")
	public ModelAndView vt_freeModifyForm(HttpServletRequest request, 
			HttpServletResponse response)throws Exception{
		//해당 글의 번호를 받아와 가져온다.
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDataBean bdto = boardDao.getArticle(num);
				
		String center = "/vtFrame/vt_sideMenuForm"; 
		String menu = "/vt_board/vt_freeModifyForm";
		String word = "/vt_board/word/free";
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);
		request.setAttribute("bdto", bdto);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		request.setAttribute("word",word);
		request.setAttribute("menu",menu);
		request.setAttribute("center",center);
		
		return new ModelAndView("/vtFrame/vtFrame");
	}//vt_freeModifyForm
	
	//수정 핸들러
	@RequestMapping("/vt_freeModifyPro")
	public ModelAndView vt_freeModifyPro(HttpServletRequest request, 
			HttpServletResponse response)throws Exception{		
		request.setCharacterEncoding("utf-8");
		
		BoardDataBean bdto = new BoardDataBean();
		
		bdto.setNum(Integer.parseInt(request.getParameter("num")));
		bdto.setSubject(request.getParameter("subject"));
		String content = request.getParameter("content");
		
		bdto.setContent(Util.toJS(content));
		bdto.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		String pageNum = request.getParameter("pageNum");
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);
		int result = boardDao.modifyArticle(bdto);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return new ModelAndView("/vt_board/processing/vt_freeModifyPro");
	}//vt_freeModifyForm
	
	@RequestMapping("/vt_freeDeletePro")
	public ModelAndView vt_freeDeletePro(HttpServletRequest request, 
			HttpServletResponse response){		
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		int result = boardDao.deleteArticle(num);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return new ModelAndView("/vt_board/processing/vt_freeDeletePro");
	}//vt_freeModifyForm
	
	//자유 게시판 검색
	@RequestMapping("/board_search")
	public ModelAndView board_sub(HttpServletRequest request,HttpServletResponse response){
		List<BoardDataBean> list = null;
		String searchword = request.getParameter("msg");
		String pageNum = request.getParameter("pageNum");
		String type = request.getParameter("type");
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);		
		String center = "/vtFrame/vt_sideMenuForm";
		String menu = "/vt_board/vt_freeboard";
		String word = "/vt_board/word/free";
		int search = 1;
		
		String msg = "%"+searchword+"%";
		int pageSize = 10;		// 페이지 크기
		int pageBlock = 10;			
		int currentPage = 0;	// 현재 페이지
		int pageCount = 0;		// 전체 페이지 수
		
		int start = 0;			//(블럭)시작 페이지
		int end = 0;			//(블럭)끝 페이지
		
		if(pageNum == null){
			pageNum = "1";
		}
		
		int articleCount = 0;	//검색된 글의 수
		
		if(type.equals("sub")){
			articleCount = boardDao.BoardsubCount(msg);
		}
		else if(type.equals("content")){
			articleCount = boardDao.BoardcontentCount(msg);
		}
		else if(type.equals("nick")){
			articleCount = boardDao.BoardnickCount(msg);						
		}
		
		if(articleCount == 0){			
			request.setAttribute("pageCount", 1);
			request.setAttribute("articleCount", articleCount);	
	
		}
		
		else{			
			//페이지 공식 구하기 
			currentPage = Integer.parseInt(pageNum);
			start =(currentPage - 1) * pageSize + 1;
			end = start + pageSize - 1;
			
			
			
			SearchDataBean sdto = new SearchDataBean();
			sdto.setStart(start);
			sdto.setEnd(end);
			
			
			if(type.equals("sub")){
				sdto.setSub(msg);
				list = boardDao.BoardsubSearch(sdto);
				
			}
			else if(type.equals("content")){
				sdto.setContent(msg);
				list = boardDao.BoardcontentSearch(sdto);
			}
			else if(type.equals("nick")){
				sdto.setNick(msg);
				list = boardDao.BoardnickSearch(sdto);
			}			
			//페이지 수 값 구하기
			pageCount = articleCount/pageBlock;
			if(articleCount%pageBlock!=0){
				pageCount+=1;
			}
			request.setAttribute("list", list);
			request.setAttribute("count", articleCount);			
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("pageCount", pageCount);			
		}
		
		request.setAttribute("center", center);
		request.setAttribute("menu", menu);
		request.setAttribute("word", word);
		request.setAttribute("pageNum", pageNum);	
		request.setAttribute("search", search);
		request.setAttribute("type", type);
		request.setAttribute("searchword", searchword);
		
		return new ModelAndView("/vtFrame/vtFrame");
	}
	
	//자유게시판 게시글 읽는 핸들러
	@RequestMapping("/vt_commentlist")//메뉴탭에서 선택한경우
	public ModelAndView vt_freereplylist(HttpServletRequest request, 
			HttpServletResponse response)throws Exception{
		
		int num = Integer.parseInt(request.getParameter("num"));
		//넘어온 num으로 reply 테이블을 검색
		//테이블의 데이터를 list로 받음
		//list를 넘겨 c:foreach로 뿌림		
		List<CommentDataBean> clist = commentDao.getComments(num);
		//=boardDao.getArticles(map);
		request.setAttribute("clist", clist);
		int commentcount = commentDao.getCommentNum(num);
		request.setAttribute("commentcount", commentcount);
		return new ModelAndView("/vt_board/vt_comment");
	}//vt_freeContent
	
	
	@RequestMapping("/vt_writeComment")
	public ModelAndView vt_writeComment(HttpServletRequest request, 
			HttpServletResponse response)throws Exception{
		
		int num = Integer.parseInt(request.getParameter("num"));
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		
		CommentDataBean cdto = new CommentDataBean();
		//코멘트 insert
		String nick = memberDao.getNick(id);
		
		
		cdto.setNum(num);
		cdto.setNick(nick);
		cdto.setContent(Util.toJS(content));
		cdto.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		commentDao.writeComment(cdto);	//코멘트 삽입
		
		List<CommentDataBean> clist = commentDao.getComments(num);
		int commentcount = commentDao.getCommentNum(num);
		request.setAttribute("commentcount", commentcount);
		
		
		request.setAttribute("clist", clist);
		return new ModelAndView("/vt_board/vt_comment");
	}//vt_freeContent
	@RequestMapping("/vt_deleteComment")
	public ModelAndView vt_deleteComment(HttpServletRequest request, 
			HttpServletResponse response)throws Exception{
		int num = Integer.parseInt(request.getParameter("num"));
		int comment_id = Integer.parseInt(request.getParameter("comment_id"));
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);
		commentDao.deletComment(comment_id);
		
		List<CommentDataBean> clist = commentDao.getComments(num);
		int commentcount = commentDao.getCommentNum(num);
		request.setAttribute("commentcount", commentcount);
		
		
		request.setAttribute("clist", clist);
		return new ModelAndView("/vt_board/vt_comment");
	}//vt_freeContent
}	
