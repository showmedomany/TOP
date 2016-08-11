package handler;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import administrator.AdminDao;
import member.MemberDataBean;
import myPage.InbodyDataBean;
import myPage.RegisterDataBean;


@Controller
public class AdministratorController {
	
	@Resource(name="adminDao")
	private AdminDao adminDao;
	
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
		int pageBlock = 5;			
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
			//pageCount = articleCount/pageBlock;
			pageCount = articleCount/pageSize + (articleCount%pageSize > 0 ? 1 : 0);
			int startPage = ( currentPage / pageBlock ) * pageBlock + 1 ;
			if(currentPage % pageBlock == 0){
				startPage -= pageBlock;
			}
			int endPage = startPage + pageBlock - 1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
			/*if(articleCount%pageBlock!=0){
				pageCount+=1;
			}*/			
			
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
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
		return new ModelAndView("/vt_administrator/processing/memberSearchView");
	}//
	
	@RequestMapping("/memberSearchResult")
	public ModelAndView memberSearchResult
	(HttpServletRequest request,HttpServletResponse response){	
			
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {	
			e.printStackTrace();
		}
		
		String searchMeans = request.getParameter("searchMeans");
		String searchMessage  = request.getParameter("searchMessage");		
		
		request.setAttribute("pageNum", "0");
		
		request.setAttribute("searchMessage", searchMessage);
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
	
	@RequestMapping("/insertFitnessUserSearch")	
	public ModelAndView insertFitnessUserSearch
	(HttpServletRequest request,HttpServletResponse response){		
		/*
		이 핸들러로 들어오는 경우는 2가지 register데이터가 있는지 없는지
		없는 경우는 년도를 현재 년도로 맞추고 현재 년도로 윤달 계산
		있는 경우는 데이터에 있는 년도로 맞추고 데이터의 년도로 윤달 계산
		*/		
		SimpleDateFormat format = new SimpleDateFormat("yyyy");		//있는경우 데이터의 년도포멧을 yyyy로 바꿈
		
		String id = request.getParameter("id");			//검색할 아이디
		
		int startYear = 0;		//시작 년도변수
		String startMonth = null;		//시작 월 변수
		String startDay = null;		//시작 일 변수

		int endYear = 0;		//종료 년도변수
		String endMonth = null;		//종료 월 변수
		String endDay = null;			//종료 일 변수
		
		String start_leapYear = "false";			//시작년도의 윤달이 있는지 없는지
		
		int idCheckResult = adminDao.insertFitnessUserSearchIDCheck(id);	//register에 있나 검색
				
		if(idCheckResult ==0){
			//센터등록 안한 회원
			//피트니스 시작 날짜을 오늘시간으로 맞춤
			//Calendar calendar = Calendar.getInstance();			//없는경우 현재 년도 계산위한 calendar함수
			Calendar calendar = new GregorianCalendar(Locale.KOREA);
			
			startYear = calendar.get(calendar.YEAR);
			startMonth = String.valueOf(calendar.get(calendar.MONTH)+1);
			startDay = String.valueOf(calendar.get(calendar.DAY_OF_MONTH));
			
			//끝날짜는 비워둠
			//첫 등록은 한달이 디폴트값
			
			calendar.setTime(new Date());//현재시간을 세팅하고
			calendar.add(Calendar.DAY_OF_YEAR, 30);//한달을 더하고 한달의 기준은 30일			
			
			endYear = calendar.get(calendar.YEAR);
			endMonth = String.valueOf(calendar.get(calendar.MONTH)+1);
			endDay = String.valueOf(calendar.get(calendar.DAY_OF_MONTH));
		}
		else{
			//센터등록 했던 회원
			RegisterDataBean registerData = adminDao.insertFitnessUserSearchID(id);	//해당회원의 register정보 가져옴
			startYear = Integer.parseInt(format.format(registerData.getStart_date()));	//해당 회원의 시작년도
			endYear = Integer.parseInt(format.format(registerData.getEnd_date()));		//해당 회원의 종료년도
			
			format = new SimpleDateFormat("MM");
			startMonth = format.format(registerData.getStart_date());			
			endMonth = format.format(registerData.getEnd_date());			
			
			format = new SimpleDateFormat("dd");
			startDay = format.format(registerData.getStart_date());			
			endDay = format.format(registerData.getEnd_date());	
			
			request.setAttribute("registerData", registerData);
		}		
		
		//윤달 검사
		if((0==(startYear%4) && 0 !=(startYear%100)) || 0 == startYear%400){
			start_leapYear = "true";
		}
		
		
		//트레이너의 리스트를 받아온다 
		//List<String> trainerIdList = adminDao.getTrainerIdList();
		
		
		request.setAttribute("id", id);		//아이디를 넘겨준다
		request.setAttribute("idCheckResult", idCheckResult);//register 검색 결과가 없는경우를 알려준다.
		
		request.setAttribute("startYear", startYear);
		request.setAttribute("startMonth", startMonth);
		request.setAttribute("startDay", startDay);
		
		request.setAttribute("endYear", endYear);
		request.setAttribute("endMonth", endMonth);
		request.setAttribute("endDay", endDay);
		
		request.setAttribute("start_leapYear", start_leapYear);		
		
		//request.setAttribute("trainerIdList", trainerIdList);

		return new ModelAndView("/vt_administrator/processing/insertFitnessUserSearch");		
	}
	
	@RequestMapping("/selectDayText_start")
	public ModelAndView selectDayText_start
	(HttpServletRequest request,HttpServletResponse response){			
		int startMonth = Integer.parseInt(request.getParameter("start_month"));
		String start_leapYear = request.getParameter("start_leapYear");	
		request.setAttribute("startMonth", startMonth);
		request.setAttribute("start_leapYear", start_leapYear);
		return new ModelAndView("/vt_administrator/processing/selectDayText_start");
	}
	/*
	@RequestMapping("/selectDayText_end")
	public ModelAndView selectDayText_end
	(HttpServletRequest request,HttpServletResponse response){			
		int endMonth = Integer.parseInt(request.getParameter("end_month"));
		String end_leapYear = request.getParameter("end_leapYear");			
		
		request.setAttribute("endMonth", endMonth);
		request.setAttribute("end_leapYear", end_leapYear);
		return new ModelAndView("/vt_administrator/processing/selectDayText_end");
	}
	*/
	
	@RequestMapping("/expirechange")
	public ModelAndView expirechange
	(HttpServletRequest request,HttpServletResponse response){			
		String year = request.getParameter("year");		
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		return new ModelAndView("/vt_administrator/processing/expirechange");
	}
	@RequestMapping("/insertInbodyUserSearch")	
	public ModelAndView insertInbodyUserSearch
	(HttpServletRequest request,HttpServletResponse response){		
		
		Calendar calendar = Calendar.getInstance();
		int thisYear = calendar.get(calendar.YEAR);
		int thisMonth = calendar.get(calendar.MONTH)+1;//month 는 0부터 시작함... !!!!?
		int today = calendar.get(calendar.DAY_OF_MONTH);		
		request.setAttribute("thisYear", thisYear);
		request.setAttribute("thisMonth", thisMonth);
		request.setAttribute("today", today);
		
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		
		int inbodyCheckResult = adminDao.getInbodyCheck(id);
		request.setAttribute("inbodyCheckResult", inbodyCheckResult);
		
		if(inbodyCheckResult!=0){
			InbodyDataBean inbodyData = adminDao.getInbodyData(id);
			request.setAttribute("inbodyData", inbodyData);	
			
			SimpleDateFormat format = null;
			
			format = new SimpleDateFormat("yyyy");
			int start_year = Integer.parseInt(format.format(inbodyData.getCheck_date()));			
			request.setAttribute("start_year", start_year);
			
			String start_leapYear = "false";		
			if((0==(start_year%4) && 0 !=(start_year%100)) || 0 == start_year%400){
				start_leapYear = "true";
			}else{
				start_leapYear = "false";
			}
			request.setAttribute("start_leapYear", start_leapYear);
			
			format = new SimpleDateFormat("MM");
			String start_month = format.format(inbodyData.getCheck_date());
			request.setAttribute("start_month", start_month);			
			
			format = new SimpleDateFormat("dd");
			String start_day = format.format(inbodyData.getCheck_date());
			request.setAttribute("start_day", start_day);			
		}else{
			String start_leapYear = "false";			
			if((0==(thisYear%4) && 0 !=(thisYear%100)) || 0 == thisYear%400){
				start_leapYear = "true";
			}else{
				start_leapYear = "false";
			}
			request.setAttribute("start_leapYear", start_leapYear);			
		}
		return new ModelAndView("/vt_administrator/processing/insertInbodyUserSearch");		
	}
	
	//다른월 선택시 바뀐 일수 출력하기
	
	
	
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
		//String trainer = request.getParameter("trainer");
		
		RegisterDataBean registerData = new RegisterDataBean();
		registerData.setId(id);
		registerData.setExp_date(exp_date);
		registerData.setStart_date(start);
		registerData.setEnd_date(end);
		registerData.setGx_check(isGX);
		registerData.setPt_check(isPT);
		registerData.setPt_count(PTCount);
		//registerData.setTrainer_id(trainer);
		
		int idCheckResult = adminDao.insertFitnessUserSearchIDCheck(id);
		request.setAttribute("idCheckResult", idCheckResult);
		//System.out.println(idCheckResult);
		
		if(idCheckResult==0){
			int result = adminDao.insertFitnessInfo(registerData);
			request.setAttribute("result", result);		
		}else if(idCheckResult!=0){
			int result = adminDao.updateFitnessInfo(registerData);
			request.setAttribute("result", result);	
		}
		return new ModelAndView("/vt_administrator/processing/DBInsertResultText");
	}
	
	@RequestMapping("/inbodyInsertProcess")
	public ModelAndView inbodyInsertProcess
	(HttpServletRequest request,HttpServletResponse response){		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}		
		
		String timetamp =" 00:00:00.0";
		
		String id = request.getParameter("id");
		int age = Integer.parseInt(request.getParameter("age"));
		String sex = request.getParameter("sex");
		int height = Integer.parseInt(request.getParameter("height"));
		int weight = Integer.parseInt(request.getParameter("weight"));
		int bmi = Integer.parseInt(request.getParameter("bmi"));
		Timestamp check_date = Timestamp.valueOf(request.getParameter("check_date")+timetamp);
				
		InbodyDataBean inbodyData = new InbodyDataBean();
		inbodyData.setId(id);
		inbodyData.setAge(age);
		inbodyData.setSex(sex);
		inbodyData.setHeight(height);
		inbodyData.setWeight(weight);
		inbodyData.setBmi(bmi);
		inbodyData.setCheck_date(check_date);
		
		
		int inbodyCheckResult = adminDao.getInbodyCheck(id);
		request.setAttribute("inbodyCheckResult", inbodyCheckResult);
		//System.out.println(inbodyCheckResult);
		
		if(inbodyCheckResult==0){
			int result = adminDao.insertInbodyInfo(inbodyData);
			request.setAttribute("result", result);		
		}else if(inbodyCheckResult!=0){
			int result = adminDao.updateInbodyInfo(inbodyData);
			request.setAttribute("result", result);	
		}		
			
		return new ModelAndView("/vt_administrator/processing/DBInsertResultText");
	}	
}



