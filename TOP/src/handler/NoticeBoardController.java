package handler;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.SearchDataBean;
import noticeboard.NoticeBoardDao;
import noticeboard.NoticeBoardDataBean;

@Controller
public class NoticeBoardController {
	
	@Resource(name = "noticeboardDao")
	private NoticeBoardDao noticeboardDao;
	
	//공지사항 컨트롤러	
	@RequestMapping("/noticeBoard")
	public ModelAndView noticeBoard
	(HttpServletRequest request,HttpServletResponse response){		
		List<NoticeBoardDataBean> noticeBoardDataList = new ArrayList<NoticeBoardDataBean>();	
		
		int pageSize = 10;		// 페이지 크기
		int pageBlock = 5;			
		int currentPage = 0;	// 현재 페이지
		int pageCount = 0;		// 전체 페이지 수
		int start = 0;			//(블럭)게시글 맨 윗글
		int end = 0;			//(블럭)게시글 맨 아래
		int number = 0;
		int startPage = 0;
		int endPage = 0;
		
		String word = "/vt_board/word/notice";
		String menu = "/vt_board/vt_noticeboard";		
		String center = "/vtFrame/vt_sideMenuForm";
		String top = "/vtFrame/changeimages/coimage";
		
		//페이지 템플릿	
	
				
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		request.setAttribute("pageNum", pageNum);
		
		//게시글 수
		int articleCount = noticeboardDao.getNoticeArticleCount();	//공지사항 총 글 갯수
		
		
		
		if(articleCount != 0){			
			//페이지 공식 구하기 
			currentPage = Integer.parseInt(pageNum); //받아온 페이지를 현재 페이지로
			start = (currentPage - 1) * pageSize + 1; //(블럭)게시글 맨 윗글
			end = start + pageSize - 1;				 //(블럭)게시글 맨 아래글
			number = articleCount - (currentPage -1) * pageSize;	//왼쪽에 나열된 글 번호
		
		    //페이지들의 총 갯수 
        	pageCount = articleCount / pageSize 
              + (articleCount % pageSize>0 ? 1 : 0);
		    //밑에 표시될 페이지의 시작 
	        startPage = (currentPage / pageBlock) * pageBlock + 1;
	        //         (현재 페이지/나열될 페이지수) * 나열될 페이지수 + 1;
	        
	        if(currentPage % pageBlock == 0) startPage -= pageBlock;
	        
	                //밑에 표시될 페이지의 끝 
	        endPage = startPage + pageBlock -1;
	               //표시 시작 페이지 + 나열될 페이지수 -1;
	        
	        if(endPage > pageCount) endPage = pageCount;
	        
			/*
			//페이지 수 값 구하기
			pageCount = articleCount/pageBlock;
			if(articleCount%pageBlock!=0){
				pageCount+=1;
			}
			*/
			//게시글 가져오기
			Map<String, Integer> startEndPage = new HashMap<String, Integer>();
			startEndPage.put("start", start);
			startEndPage.put("end", end);		
			noticeBoardDataList = noticeboardDao.getNoticeBoardList(startEndPage);		
			
			request.setAttribute("noticeBoardDataList", noticeBoardDataList);
						
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("pageCount", pageCount);	
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("number", number);
			
		}
		request.setAttribute("articleCount", articleCount);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("word",word);
		request.setAttribute("menu",menu);
		request.setAttribute("center",center);
		request.setAttribute("top", top);
		return new ModelAndView("/vtFrame/vtFrame");
	}
	
	@RequestMapping("/noticeBoardContent")
	public ModelAndView noticeBoardContent
	(HttpServletRequest request,HttpServletResponse response){			
		int num = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", num);
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null){
			pageNum = "1";
		}
		
		request.setAttribute("pageNum", pageNum);		
		
		NoticeBoardDataBean noticeBoardData = noticeboardDao.getNoticeArticle(num);
		
		//조회수 증가 / 아이디 검사
		String memId = (String) request.getSession().getAttribute("memId");
		request.setAttribute("memId", memId);
		if(noticeBoardData.getId().equals(memId) == false){			
			noticeboardDao.setNoticeReadcountPlus(num);
		}		
		
		request.setAttribute("noticeBoardData", noticeBoardData);		
		return new ModelAndView("/vt_board/vt_noticeBoardContent");
	}
	
	@RequestMapping("/noticeBoardWriteForm")
	public ModelAndView adminNoticeBoardWrite
	(HttpServletRequest request,HttpServletResponse response){		
		
		String center = "/vtFrame/vt_sideMenuForm";
		String menu = "/vt_board/vt_noticeBoardWriteForm";
		String word = "/vt_board/word/notice";		
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);
		request.setAttribute("menu", menu);
		request.setAttribute("word", word);
		request.setAttribute("center", center);
	
		return new ModelAndView("/vtFrame/vtFrame");
	}
	//공지사항 글작성 후 데이터 처리
	@RequestMapping("/noticeBoardWritePro")
	public ModelAndView noticeBoardWritePro
	(HttpServletRequest request,HttpServletResponse response){	
		
		String center = "/vtFrame/vt_sideMenuForm";
		String menu = "/vt_board/processing/vt_noticeBoardWritePro";
		String word = "/vt_board/word/notice";
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);
		request.setAttribute("menu", menu);
		request.setAttribute("word", word);
		request.setAttribute("center", center);
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		Map<String, String> writeContent = new HashMap<String, String>();		
		writeContent.put("id", ((String) request.getSession().getAttribute("memId")));
		writeContent.put("subject", subject);
		writeContent.put("content", content);
		
		int insertArticleResult = noticeboardDao.insertNoticeArticle(writeContent);		
		request.setAttribute("insertArticleResult", insertArticleResult);
		
		return new ModelAndView("/vtFrame/vtFrame");
	}

	//공지사항 글수정
	@RequestMapping("/noticeBoardModifyForm")
	public ModelAndView noticeBoardModifyForm
	(HttpServletRequest request,HttpServletResponse response){		
		
		String center = "/vtFrame/vt_sideMenuForm";
		String menu = "/vt_board/vt_noticeBoardModifyForm";
		String word = "/vt_board/word/notice";
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("menu", menu);
		request.setAttribute("word", word);
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}
		
		int num = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", num);
		
		String pageNum = request.getParameter("pageNum");
		request.setAttribute("pageNum", pageNum);
		
		NoticeBoardDataBean noticeBoardData = noticeboardDao.getNoticeArticle(num);		
		request.setAttribute("noticeBoardData", noticeBoardData);
		
		return new ModelAndView("/vtFrame/vtFrame");
	}
	

	//공지사항 글수정 pro
	@RequestMapping("/noticeBoardModifyPro")
	public ModelAndView noticeBoardModifyPro
	(HttpServletRequest request,HttpServletResponse response){	
		
		String center = "/vtFrame/vt_sideMenuForm";
		String menu = "/vt_board/processing/vt_noticeBoardModifyPro";
		String word = "/vt_board/word/notice";
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("menu", menu);
		request.setAttribute("word", word);
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}
		
		int num = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", num);
		
		String pageNum = request.getParameter("pageNum");
		request.setAttribute("pageNum", pageNum);
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");		
		
		NoticeBoardDataBean noticeBoardData = new NoticeBoardDataBean();
		noticeBoardData.setSubject(subject);
		noticeBoardData.setContent(content);
		noticeBoardData.setNum(num);	
		
		int updateArticleResult = noticeboardDao.updateNoticeArticle(noticeBoardData);
		request.setAttribute("updateArticleResult", updateArticleResult);
					
		return new ModelAndView("/vtFrame/vtFrame");
	}
	
	//공지사항 글삭제 pro
	@RequestMapping("/noticeBoardDeletePro")
	public ModelAndView noticeBoardDeletePro
	(HttpServletRequest request,HttpServletResponse response){		
		
		String center = "/vtFrame/vt_sideMenuForm";
		String menu = "/vt_board/processing/vt_noticeBoardDeletePro";
		String word = "/vt_board/word/notice";
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("menu", menu);
		request.setAttribute("word", word);		
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}
		
		int num = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", num);
		
		String pageNum = request.getParameter("pageNum");
		request.setAttribute("pageNum", pageNum);	
		
		int deleteArticleResult = noticeboardDao.deleteNoticeArticle(num);
		request.setAttribute("deleteArticleResult", deleteArticleResult);
		
		return new ModelAndView("/vtFrame/vtFrame");
	}	
	
	//공지사항 게시판 검색
	@RequestMapping("/notice_search")
	public ModelAndView notice_sub(HttpServletRequest request,HttpServletResponse response){
		
		List<NoticeBoardDataBean> noticeBoardDataList = new ArrayList<NoticeBoardDataBean>();
		
		String searchword = request.getParameter("msg");
		String pageNum = request.getParameter("pageNum");
		String type = request.getParameter("type");
				
		String center = "/vtFrame/vt_sideMenuForm";
		String menu = "/vt_board/vt_noticeboard";
		String word = "/vt_board/word/notice";
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);
		int search = 1;
		
		String msg = "%"+searchword+"%";
		int pageSize = 10;		// 페이지 크기
		int pageBlock = 10;			
		int currentPage = 0;	// 현재 페이지
		int pageCount = 0;		// 전체 페이지 수
		
		int start = 0;			//(블럭)시작 페이지
		int end = 0;			//(블럭)끝 페이지
		
		
		int articleCount = 0;
		
		if(pageNum == null){
			pageNum = "1";
		}
		
		
		//어떤종류의 검색인지
		//검색할 text
		
		if(type.equals("sub")){
			articleCount = noticeboardDao.NoticeSubCount(msg);
		}
		else if(type.equals("content")){
			articleCount = noticeboardDao.NoticeContentCount(msg);
		}
		else if(type.equals("nick")){
			articleCount = noticeboardDao.NoticeNickCount(msg);						
		}
		
		
		
		//게시글이 없을때
		if(articleCount == 0){			
			request.setAttribute("pageCount", 1);
			request.setAttribute("articleCount", articleCount);	
		//게시글이 있을때	
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
				noticeBoardDataList = noticeboardDao.searhSubGetList(sdto);
				
			}
			else if(type.equals("content")){
				sdto.setContent(msg);
				noticeBoardDataList = noticeboardDao.searhContentGetList(sdto);
			}
			else if(type.equals("nick")){
				sdto.setNick(msg);
				noticeBoardDataList = noticeboardDao.searhNickGetList(sdto);	
			}			
			//페이지 수 값 구하기
			pageCount = articleCount/pageBlock;
			if(articleCount%pageBlock!=0){
				pageCount+=1;
			}
			request.setAttribute("noticeBoardDataList", noticeBoardDataList);
			request.setAttribute("articleCount", articleCount);			
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
}
