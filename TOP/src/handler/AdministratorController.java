package handler;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import administrator.AdminDao;
import exercise.ExerciseDao;
import member.MemberDataBean;
import myPage.RegisterDataBean;


@Controller
public class AdministratorController {
	
	@Resource(name="adminDao")
	private AdminDao adminDao;
	
	@Resource(name="exerciseDao")
	private ExerciseDao exerciseDao;
	
	//관리자 페이지 기본
	@RequestMapping("/administratorPage")
	public ModelAndView administratorPage
	(HttpServletRequest request,HttpServletResponse response){
		String center = "vt_admin_centerContent";
		request.setAttribute("center", center);		
		return new ModelAndView("/vt_administrator/vt_administrator");
	}//
	
	@RequestMapping("/memberSearch")
	public ModelAndView memberSearch
	(HttpServletRequest request,HttpServletResponse response){	
		
		List<MemberDataBean> memberDataList = new ArrayList<MemberDataBean>();
		int pageSize = 10;		// 페이지 크기
		int pageBlock = 10;			
		int currentPage = 0;	// 현재 페이지
		int pageCount = 0;		// 전체 페이지 수
		int start = 0;			//(블럭)시작 페이지
		int end = 0;			//(블럭)끝 페이지
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		request.setAttribute("pageNum", pageNum);
		
		//회원의  수
		int articleCount = adminDao.getMemberDataCount();		
		
		//회원이 없을때 
		if(articleCount == 0){			
			request.setAttribute("pageCount", 1);
			request.setAttribute("articleCount", articleCount);				
		//회원이 있을때	
		}else{			
			//페이지 공식 구하기 
			currentPage = Integer.parseInt(pageNum);
			start = (currentPage - 1) * pageSize + 1;
			end = start + pageSize - 1;			
			//페이지 수 값 구하기
			pageCount = articleCount/pageBlock;
			if(articleCount%pageBlock!=0){
				pageCount+=1;
			}			
			
			Map<String, Integer> startEndPage = new HashMap<String, Integer>();
			startEndPage.put("start", start);
			startEndPage.put("end", end);		
			memberDataList = adminDao.getMemberList(startEndPage);		
			
			request.setAttribute("memberDataList", memberDataList);
			request.setAttribute("articleCount", articleCount);			
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("pageCount", pageCount);				
		}
		String center = "vt_memberSearch";	
		request.setAttribute("center", center);		
		return new ModelAndView("/vt_administrator/vt_administrator");
	}//
	
	@RequestMapping("/memberSearchView")
	public ModelAndView memberSearchView
	(HttpServletRequest request,HttpServletResponse response){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}
		request.setAttribute("id", request.getParameter("id"));
		request.setAttribute("name", request.getParameter("name"));
		request.setAttribute("nickname", request.getParameter("nickname"));
		request.setAttribute("phone", request.getParameter("phone"));
		request.setAttribute("zipcode", request.getParameter("zipcode"));
		request.setAttribute("address", request.getParameter("address"));
		request.setAttribute("email", request.getParameter("email"));
		request.setAttribute("join_date", request.getParameter("join_date"));		
		return new ModelAndView("/vt_administrator/memberSearchView");
	}//
	
	@RequestMapping("/memberSearchResult")
	public ModelAndView memberSearchResult
	(HttpServletRequest request,HttpServletResponse response){	
			
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {	
			e.printStackTrace();
		}	
		
		request.setAttribute("pageNum", "0");
		
		String searchMeans = request.getParameter("searchMeans");
		String searchMessage  = request.getParameter("searchMessage");
		int articleCount = 0;
		if(searchMeans.equals("name")){
			articleCount = adminDao.getNameSearchCount(searchMessage);
		}else if(searchMeans.equals("id")){
			articleCount = adminDao.getIdSearchCount(searchMessage);
		}else if(searchMeans.equals("nickname")){
			articleCount = adminDao.getNickNameSearchCount(searchMessage);
		}	
			
		List<MemberDataBean> memberDataList = new ArrayList<MemberDataBean>();
		
		if(searchMeans.equals("name")){
			memberDataList = adminDao.getMemberSearchNameList(searchMessage);		
		}else if(searchMeans.equals("id")){
			memberDataList = adminDao.getMemberSearchIdList(searchMessage);		
		}else if(searchMeans.equals("nickname")){
			memberDataList = adminDao.getMemberSearchNickNameList(searchMessage);		
		}	
		request.setAttribute("articleCount", articleCount);
		request.setAttribute("memberDataList", memberDataList);
	
		String center = "vt_memberSearch";	
		request.setAttribute("center", center);		
		return new ModelAndView("/vt_administrator/vt_administrator");
	}//
	
	
	//관리자페이지-센터등록
	@RequestMapping("/centerInsert")
	public ModelAndView myPageInsertInbody
	(HttpServletRequest request,HttpServletResponse response){
		int choice = Integer.parseInt(request.getParameter("choice"));
		
		
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
			
			//여기서 데이터가 들어간다고 예를 들자
			String id = "kajika";
			request.setAttribute("id", id);
			
			break;
		}
		
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
						
			 Calendar calendar = Calendar.getInstance();
			 int year = calendar.get(calendar.YEAR);
			 request.setAttribute("year", year); 
			
			resultRegister = adminDao.getUserRegisterCheck(userId);			
			//피트니스 정보가 있을 경우
			if(resultRegister != 0){
				//유저 피트니스 정보 가지고 오기
				RegisterDataBean registerData = adminDao.getUserRegister(userId);				
				request.setAttribute("registerData", registerData);		
				
				SimpleDateFormat format = null; 
				
				format = new SimpleDateFormat("yyyy");
				int start_year = Integer.parseInt(format.format(registerData.getStart_date()));
				int end_year = Integer.parseInt(format.format(registerData.getEnd_date()));
				request.setAttribute("start_year", start_year);
				request.setAttribute("end_year", end_year);
				
				//윤달 검사
				String start_leapYear = "false";
				String end_leapYear = "false";
				if((0==(start_year%4) && 0 !=(start_year%100)) || 0 == start_year%400){
					start_leapYear = "true";
				}else{
					start_leapYear = "false";
				}				
				if((0==(end_year%4) && 0 !=(end_year%100)) || 0 == end_year%400){
					end_leapYear = "true";
				}else{
					end_leapYear = "false";
				}
				
				request.setAttribute("start_leapYear", start_leapYear);
				request.setAttribute("end_leapYear", end_leapYear);
				
				format = new SimpleDateFormat("MM");
				String start_month = format.format(registerData.getStart_date());
				request.setAttribute("start_month", start_month);
				String end_month = format.format(registerData.getEnd_date());
				request.setAttribute("end_month", end_month);
				
				format = new SimpleDateFormat("dd");
				String start_day = format.format(registerData.getStart_date());
				request.setAttribute("start_day", start_day);
				String end_day = format.format(registerData.getEnd_date());
				request.setAttribute("end_day", end_day);				
				
			//피트니스 정보가 없을 경우
			}else if(resultRegister == 0){				
				
				
			}
			//트레이너 정보 가지고 오기
			List<String> trainerIdList = adminDao.getTrainerIdList();
			request.setAttribute("trainerIdList", trainerIdList);
			
			request.setAttribute("resultRegister", resultRegister);
			request.setAttribute("memberData", memberData);
		}		
		return new ModelAndView("/vt_administrator/userSearchText");	}	
	
	//다른월 선택시 바뀐 일수 출력하기
	@RequestMapping("/selectDayText_start")
	public ModelAndView selectDayText_start
	(HttpServletRequest request,HttpServletResponse response){			
		int start_month = Integer.parseInt(request.getParameter("start_month"));
		String start_leapYear = request.getParameter("start_leapYear");			
		
		request.setAttribute("start_month", start_month);
		request.setAttribute("start_leapYear", start_leapYear);
		return new ModelAndView("/vt_administrator/selectDayText_start");
	}//
	@RequestMapping("/selectDayText_end")
	public ModelAndView selectDayText_end
	(HttpServletRequest request,HttpServletResponse response){			
		int end_month = Integer.parseInt(request.getParameter("end_month"));
		String end_leapYear = request.getParameter("end_leapYear");			
		
		request.setAttribute("end_month", end_month);
		request.setAttribute("end_leapYear", end_leapYear);
		return new ModelAndView("/vt_administrator/selectDayText_end");
	}
	@RequestMapping("/fitnessInsertProcess")
	public ModelAndView fitnessInsertProcess
	(HttpServletRequest request,HttpServletResponse response){		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}		
		
		String timetamp =" 00:00:00.0";
		
		String id = request.getParameter("id");
		int exp_date = Integer.parseInt(request.getParameter("exp_date"));
		Timestamp start = Timestamp.valueOf(request.getParameter("start")+timetamp);
		Timestamp end = Timestamp.valueOf(request.getParameter("end")+timetamp);
		String isGX = request.getParameter("isGX");
		String isPT = request.getParameter("isPT");
		int PTCount = Integer.parseInt(request.getParameter("PTCount"));
		String trainer = request.getParameter("trainer");
		
		RegisterDataBean registerData = new RegisterDataBean();
		registerData.setId(id);
		registerData.setExp_date(exp_date);
		registerData.setStart_date(start);
		registerData.setEnd_date(end);
		registerData.setGx_check(isGX);
		registerData.setPt_check(isPT);
		registerData.setPt_count(PTCount);
		registerData.setTrainer_id(trainer);
		
		String saveType = request.getParameter("saveType");
		if(saveType.equals("update")){			
			int result = adminDao.updateFitnessInfo(registerData);
			request.setAttribute("result", result);	
			
		}else if(saveType.equals("insert")){
			int result = adminDao.insertFitnessInfo(registerData);
			request.setAttribute("result", result);
		}		
		return new ModelAndView("/vt_administrator/fitnessDBInsertResultText");
	}
	
	@RequestMapping("/selectPart")
	public ModelAndView selectPart
	(HttpServletRequest request,HttpServletResponse response){		
		String day = request.getParameter("day");
		
		switch (day) {
		case "1":
			day = "월";
			break;
		case "2":
			day = "화";		
			break;
		case "3":
			day = "수";
			break;
		case "4":
			day = "목";
			break;
		case "5":
			day = "금";
			break;
		case "6":
			day = "토";
			break;
		case "7":
			day = "일";
			break;
		default:
			break;
		}
		request.setAttribute("day", day);
		return new ModelAndView("/vt_administrator/vt_selectPartForm");
	}
	
	@RequestMapping("/selectExe")
	public ModelAndView selectExe
	(HttpServletRequest request,HttpServletResponse response){		
		Integer part_id = Integer.parseInt(request.getParameter("part_id"));
		
		//가슴으로 vt_ex_part를 검색해서 부위 id를 검색한다.
		//해당 부위 아이디로 운동테이블을 검색하여 결과를 리스트로 받는다.
		//리스트를 보낸다.
		
		List<Map<String, Object>> list = exerciseDao.selectExerciseList(part_id);
		
		System.out.println("????????????????????");
		
		request.setAttribute("part_id", part_id);
		request.setAttribute("list", list);
		
		
		return new ModelAndView("/vt_administrator/vt_selectExerciseForm");
	}
}



