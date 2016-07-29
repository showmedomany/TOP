package handler;

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
		
		int pageSize = 5;
		int pageBlock = 5;
			
		//글의 개수를 가져오는 변수
		//진짜 db에 있는 글을 가져와 증가시켜라
		String pageNum = null;				//넘어오는 페이지
				
		int count = boardDao.getCount();			//글의 총 갯수
		int currentPage = 0;				//현재 페이지
		int start = 0;						//게시판에서 맨 윗글
		int end = 0;						//게시판에서 맨 아랫글
		int number = 0;						//게시판의 글 번호
		
		int pageCount = 0;					//페이지들의 총 갯수
		int startPage = 0;					//밑에 표시될 페이지의 시작
		int endPage = 0;					//밑에 표시될 페이지의 끝
	
		pageNum = request.getParameter("pageNum");
		
		if(pageNum == null){
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);		//받아온 페이지를 현재페이지로
		
		/*게시판의 시작글과 끝글*/
		start = (currentPage - 1) * pageSize + 1;	// 5번 페이지 본다면 (5 - 1) * 10+1 => 41
		end = start + pageSize - 1;					// (41 + 10) - 1 => 50;		

		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		
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
	
}	
