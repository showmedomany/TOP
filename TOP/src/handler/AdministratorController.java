package handler;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import administrator.AdminDao;
import member.MemberDataBean;
import myPage.RegisterDataBean;


@Controller
public class AdministratorController {
	
	@Resource(name="adminDao")
	private AdminDao adminDao;
	
	//관리자 페이지 기본
	@RequestMapping("/administratorPage")
	public ModelAndView administratorPage
	(HttpServletRequest request,HttpServletResponse response){		
		
		String top = "vt_admin_topForm";
		String center = "vt_admin_centerContent";	
		
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		
		return new ModelAndView("/vt_administrator/vt_administrator");
	}//
	
	
	//관리자페이지-센터등록
	@RequestMapping("/centerInsert")
	public ModelAndView myPageInsertInbody
	(HttpServletRequest request,HttpServletResponse response){
		int choice = Integer.parseInt(request.getParameter("choice"));
		
		String top = "vt_admin_topForm";
		String center = "vt_centerInsert";
		String administratorPage = null;
		
		switch(choice){
		case 0:
			administratorPage = "vt_fitnessInsert";
			//int start_year = adminDao.getFitnessStartYear();
			break;
		case 1:
			administratorPage = "vt_inbodyInsert";
			break;
		case 2:
			administratorPage = "vt_scheduleInsert";
			break;
		}
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("administratorPage", administratorPage);		
		
		return new ModelAndView("/vt_administrator/vt_administrator");
	}//인바디 저장하기 컨트롤러
	
	@RequestMapping("/insertFitnessUserSearch")
	public ModelAndView insertFitnessUserSearch
	(HttpServletRequest request,HttpServletResponse response){		
		
		String searchMsg = request.getParameter("searchMsg");//검색할 내용
		String searchMeans = request.getParameter("searchMeans");//검색할 방법 아이디, 닉네임, 이메일
		MemberDataBean memberData = null;
		int result = 0;
		int resultRegister = 0;
		//ID NickName email
		if(searchMeans.equals("ID")){
			result = adminDao.insertFitnessUserSearchIDCheck(searchMsg);					
			if(result != 0){
				memberData = adminDao.insertFitnessUserSearchID(searchMsg);				
			}
		}else if(searchMeans.equals("NickName")){
			result = adminDao.insertFitnessUserSearchNickNameCheck(searchMsg);
			if(result != 0){
				memberData = adminDao.insertFitnessUserSearchNickName(searchMsg);
			}
		}else if(searchMeans.equals("email")){
			result = adminDao.insertFitnessUserSearchEmailCheck(searchMsg);
			if(result != 0){
				memberData = adminDao.insertFitnessUserSearchEmail(searchMsg);
			}
		}		
		request.setAttribute("result", result);
		//찾은 아이디가 있으면 피트니스 정보 가지고 오기/넣기
		if(result != 0 ){
			String userId = memberData.getId();
						
			resultRegister = adminDao.getUserRegisterCheck(userId);
			
			//피트니스 정보가 있을 경우
			if(resultRegister != 0){
				//유저 피트니스 정보 가지고 오기
				RegisterDataBean registerData = adminDao.getUserRegister(userId);				
				request.setAttribute("registerData", registerData);		
				
				SimpleDateFormat format = null; 
				
				format = new SimpleDateFormat("yyyy");
				int start_year = Integer.parseInt(format.format(registerData.getStart_date()));
				request.setAttribute("start_year", start_year);
				
				//윤달 검사
				String leapYear = "false";
				if((0==(start_year%4) && 0 !=(start_year%100)) || 0 == start_year%400){
					leapYear = "true";
				}else{
					leapYear = "false";
				}
				System.out.println("Start leapYear :" + leapYear);
				request.setAttribute("leapYear", leapYear);
				
				format = new SimpleDateFormat("MM");
				String start_month = format.format(registerData.getStart_date());
				request.setAttribute("start_month", start_month);
				
				format = new SimpleDateFormat("dd");
				String start_day = format.format(registerData.getStart_date());
				request.setAttribute("start_day", start_day);
				
				//트레이너 정보 가지고 오기
				List<String> trainerIdList = adminDao.getTrainerIdList();
				request.setAttribute("trainerIdList", trainerIdList);
				
			//피트니스 정보가 없을 경우
			}else if(resultRegister == 0){				
				
				
			}
			request.setAttribute("resultRegister", resultRegister);
			request.setAttribute("memberData", memberData);
		}		
		return new ModelAndView("/vt_administrator/userSearchText");
	}//
	
	//다른월 선택시 바뀐 일수 출력하기
	@RequestMapping("/selectDayText")
	public ModelAndView selectDayText
	(HttpServletRequest request,HttpServletResponse response){			
		int start_month = Integer.parseInt(request.getParameter("start_month"));
		String leapYear = request.getParameter("leapYear");
		
		System.out.println("start_month : " +start_month);
		System.out.println("leapYear : " +leapYear);
		
		request.setAttribute("start_month", start_month);
		request.setAttribute("leapYear", leapYear);
		return new ModelAndView("/vt_administrator/selectDayText");
	}//
	
	// 공지사항 게시판 //	
	
	/*
	
	//공지사항 글 읽기
	@RequestMapping("/noticeBoardContent")
	public ModelAndView noticeBoardContent
	(HttpServletRequest request,HttpServletResponse response){	
		
		String top = null;
		String bottom = null;	
		String center = null;
		
		int authority_id = -1;
		if(request.getSession().getAttribute("authority_id")!=null){
			authority_id = (Integer) request.getSession().getAttribute("authority_id");
		}	
		
		if(authority_id==1){
			top = "vt_admin_topForm";
			center = "vt_noticeBoard";				
			request.setAttribute("top", top);
			request.setAttribute("center", center);
		}else{				
			top = "vt_topForm";		
			bottom = "vt_bottomForm";
			center = "/vt_administrator/vt_noticeBoard";	
			request.setAttribute("top", top);
			request.setAttribute("center", center);
			request.setAttribute("bottom", bottom);				
		}		
		
		String adminBoardPage = "vt_noticeBoardContent";
		request.setAttribute("adminBoardPage", adminBoardPage);
		
		int num = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", num);
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		request.setAttribute("pageNum", pageNum);
		
		NoticeBoardDataBean noticeBoardData = adminDao.getArticle(num);
		
		//조회수 증가 / 아이디 검사
		String memId = (String) request.getSession().getAttribute("memId");
		request.setAttribute("memId", memId);
		//System.out.println("id: " + id);
		//System.out.println("noticeBoardData.getId() : " + noticeBoardData.getId());
		if(noticeBoardData.getId().equals(memId) == false){
			adminDao.setReadcountPlus(num);
		}	
		
		
		List<NoticeBoardDataBean> noticeBoardDataList = new ArrayList<NoticeBoardDataBean>();
		
		int pageSize = 10;		// 페이지 크기
		int pageBlock = 10;			
		int currentPage = 0;	// 현재 페이지
		int pageCount = 0;		// 전체 페이지 수
		int start = 0;			//(블럭)시작 페이지
		int end = 0;			//(블럭)끝 페이지		
		
		//게시글 수
		int articleCount = adminDao.getArticleCount();
		System.out.println("articleCount : " + articleCount);			
				
		//페이지 공식 구하기 
		currentPage = Integer.parseInt(pageNum);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		System.out.println("start: " +start);
		System.out.println("end: " + end);
		
		//페이지 수 값 구하기
		pageCount = articleCount/pageBlock;
		if(articleCount%pageBlock!=0){
			pageCount+=1;
		}
		System.out.println("pageCount: " + pageCount);
		
		//해당 페이지 start ~ end 만큼 표시하기
		Map<String, Integer> startEndPage = new HashMap<String, Integer>();
		startEndPage.put("start", start);
		startEndPage.put("end", end);		
		noticeBoardDataList = adminDao.getNoticeBoardList(startEndPage);		
		
		request.setAttribute("noticeBoardDataList", noticeBoardDataList);
		request.setAttribute("articleCount", articleCount);			
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("pageCount", pageCount);
		
		
			
		request.setAttribute("noticeBoardData", noticeBoardData);		
		request.setAttribute("authority_id", authority_id);
		if(authority_id==1){
			return new ModelAndView("/vt_administrator/vt_administrator");
		}else{
			return new ModelAndView("/vtFrame/vtFrame");
		}
	}//

	/*
	@RequestMapping("/noticeBoardWriteForm")
	public ModelAndView adminNoticeBoardWrite
	(HttpServletRequest request,HttpServletResponse response){		
		
		String top = "vt_admin_topForm";
		String center = "vt_noticeBoard";
		String adminBoardPage = "vt_noticeBoardWriteForm";
		
		
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("adminBoardPage", adminBoardPage);
		return new ModelAndView("/vt_administrator/vt_administrator");
	}//
	*/
	/*
	//공지사항 글작성 후 데이터 처리
	@RequestMapping("/noticeBoardWritePro")
	public ModelAndView noticeBoardWritePro
	(HttpServletRequest request,HttpServletResponse response){		
		String top = "vt_admin_topForm";
		String center = "vt_noticeBoard";
		String adminBoardPage = "vt_noticeBoardWritePro";
		
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
		
		int insertArticleResult = adminDao.insertArticle(writeContent);
		
		request.setAttribute("insertArticleResult", insertArticleResult);
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("adminBoardPage", adminBoardPage);
		return new ModelAndView("/vt_administrator/vt_administrator");
	}//
	*/
	/*
	
	//공지사항 글수정
	@RequestMapping("/noticeBoardModifyForm")
	public ModelAndView noticeBoardModifyForm
	(HttpServletRequest request,HttpServletResponse response){		
		String top = "vt_admin_topForm";
		String center = "vt_noticeBoard";
		String adminBoardPage = "vt_noticeBoardModifyForm";
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}
		
		int num = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", num);
		
		String pageNum = request.getParameter("pageNum");
		
		NoticeBoardDataBean noticeBoardData = adminDao.getArticle(num);
		
		request.setAttribute("noticeBoardData", noticeBoardData);
		request.setAttribute("pageNum", pageNum);	
		
		
		request.setAttribute("top", top);
		request.setAttribute("center", center);
		request.setAttribute("adminBoardPage", adminBoardPage);
		return new ModelAndView("/vt_administrator/vt_administrator");
	}//
	*/
	/*
	//공지사항 글수정 pro
		@RequestMapping("/noticeBoardModifyPro")
		public ModelAndView noticeBoardModifyPro
		(HttpServletRequest request,HttpServletResponse response){		
			String top = "vt_admin_topForm";
			String center = "vt_noticeBoard";
			String adminBoardPage = "vt_noticeBoardModifyPro";
			
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
			
			int updateArticleResult = adminDao.updateArticle(noticeBoardData);
			request.setAttribute("updateArticleResult", updateArticleResult);
						
			request.setAttribute("top", top);
			request.setAttribute("center", center);
			request.setAttribute("adminBoardPage", adminBoardPage);
			return new ModelAndView("/vt_administrator/vt_administrator");
		}
		*/
		/*
		//공지사항 글삭제 pro
		@RequestMapping("/noticeBoardDeletePro")
		public ModelAndView noticeBoardDeletePro
		(HttpServletRequest request,HttpServletResponse response){		
			String top = "vt_admin_topForm";
			String center = "vt_noticeBoard";
			String adminBoardPage = "vt_noticeBoardDeletePro";
			
			try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {			
				e.printStackTrace();
			}
			
			int num = Integer.parseInt(request.getParameter("num"));
			request.setAttribute("num", num);
			
			String pageNum = request.getParameter("pageNum");
			request.setAttribute("pageNum", pageNum);	
			
			int deleteArticleResult = adminDao.deleteArticle(num);
			request.setAttribute("deleteArticleResult", deleteArticleResult);			
						
			request.setAttribute("top", top);
			request.setAttribute("center", center);
			request.setAttribute("adminBoardPage", adminBoardPage);
			return new ModelAndView("/vt_administrator/vt_administrator");
		}	
		*/
}



