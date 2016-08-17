package handler;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import administrator.AdminDao;
import administrator.SearchAdminDataBean;
import member.MemberDao;
import member.MemberDataBean;
import myPage.MemberRoutineDataBean;
import myPage.RegisterDataBean;
import myPage.RoutineInfoDataBean;


@Controller
public class AdministratorController {
	
	@Resource(name="adminDao")
	private AdminDao adminDao;
	
	@Resource(name="memberDao")
	private MemberDao memberDao;
	
	//관리자 페이지 기본
	@RequestMapping("/administratorPage")
	public ModelAndView administratorPage
	(HttpServletRequest request,HttpServletResponse response){
		//관리자 페이지 메인은 검색폼으로
		
		String center = "vt_admin_centerContent";
		request.setAttribute("center", center);
		
		return new ModelAndView("/vt_administrator/vt_administrator");
	}//
	
	@RequestMapping("/admin_input")
	public ModelAndView admin_input
	(HttpServletRequest request, HttpServletResponse response){
		String center = "vt_admin_inputForm";
		request.setAttribute("center", center);
		return new ModelAndView("/vt_administrator/vt_administrator");
	}
	@RequestMapping("/admin_mailcheck")
	public ModelAndView admin_mailcheck
	(HttpServletRequest request, HttpServletResponse response){
		String email = null;	
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		int checkmail = 0;
		
		if(!email1.equals("") && !email2.equals("")){
			if(email2.equals("0")){
				//직접입력
				email = email1;
			}
			else{
				//선택입력
				email = email1 + "@" + email2;
			}
		}
		//이프문으로 묶어서 이메일 있나 없나 검사 먼저
		//있으면 이미 가입된 이메일입니다 경고창
		//없으면 메일전송
		
		int emailcheck = memberDao.checkEmail(email);
		
		if(emailcheck!=0){
			checkmail = 1;
		}
		request.setAttribute("checkmail", checkmail);
		return new ModelAndView("/vt_administrator/processing/admin_mailcheck");
	}
	@RequestMapping("/admin_inputPro.do")
	public ModelAndView admin_inputPro
	(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//메인으로 돌아가야하므로 센터 컨텐트로 설정
		request.setCharacterEncoding("utf-8");
		
		MemberDataBean mdto = new MemberDataBean();
		
		mdto.setAuthority_id(2);
		mdto.setId(request.getParameter("id"));
		mdto.setPasswd(request.getParameter("passwd"));
		mdto.setName(request.getParameter("name"));
		mdto.setNickname(request.getParameter("nickname"));
				
		String zipcode = null;
		String zipcode1 = request.getParameter("zipcode1");
		String zipcode2 = request.getParameter("zipcode2");
		
		if(!zipcode1.equals("") && !zipcode2.equals("")){
			zipcode = zipcode1 + "-" + zipcode2;
		}
		mdto.setZipcode(zipcode);
		
		String address = null;
		String adr = request.getParameter("adr");
		String detail = request.getParameter("detail_adr");
		
		if(!adr.equals("") && !detail.equals("")){
			address = adr + "|" + detail;
		}
		mdto.setAddress(address);
	
		String tel = null;
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		
		if(!tel1.equals("")
				&& !tel2.equals("") 
				&& !tel3.equals("")){
			tel = tel1 + "-" + tel2 + "-" + tel3;
		}
		
		mdto.setPhone(tel);
	
		String email = null;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		
		if(!email1.equals("") && !email2.equals("")){
			if(email2.equals("0")){
				//직접입력
				email = email1;
			}
			else{
				//선택입력
				email = email1 + "@" + email2;
			}
		}
		
		mdto.setEmail(email);
		
		memberDao.insertMember(mdto);
		/*160817 03:47수정: 회원등록하고 완료후 관리자페이지(회원검색)으로 가도록 수정 */
		String center = "processing/admin_inputcheck";
		request.setAttribute("center", center);
	
		return new ModelAndView("/vt_administrator/vt_administrator");
	}
	
	
	
	
	
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
		
		/* 그냥 출력인지 검색인지 구별 */
		request.setAttribute("searchChoice", "search");
			
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {	
			e.printStackTrace();
		}
		
		String searchMeans = request.getParameter("searchMeans");
		String searchMessage  = request.getParameter("searchMessage");
		
		
		
		
		
		
		
		
		
		int pageSize = 10;		// 페이지 크기
		int pageBlock = 5;			
		int currentPage = 0;	// 현재 페이지
		int pageCount = 0;		// 전체 페이지 수
		int start = 0;			//(블럭)시작 페이지
		int end = 0;			//(블럭)끝 페이지
		
		String searchPageNum = request.getParameter("searchPageNum");	
		if(searchPageNum == null){
			searchPageNum = "1";
		}
		request.setAttribute("searchPageNum", searchPageNum);
		
		int articleCount = 0;
		if(searchMeans.equals("name")){
			articleCount = adminDao.getNameSearchCount("%"+searchMessage+"%");
		}else if(searchMeans.equals("id")){
			articleCount = adminDao.getIdSearchCount("%"+searchMessage+"%");
		}else if(searchMeans.equals("nickname")){
			articleCount = adminDao.getNickNameSearchCount("%"+searchMessage+"%");
		}	
		
		System.out.println("TEST2");
		/*이 아래로 에러가 있음 */
		
		//검색결과가 없을때
		if(articleCount==0){
			request.setAttribute("pageCount", 1);
			request.setAttribute("articleCount", articleCount);
			
		//검색결과가 있을때
		}else{
			//페이지 공식 구하기 
			currentPage = Integer.parseInt(searchPageNum);
			start = (currentPage - 1) * pageSize + 1;
			end = start + pageSize - 1;
			//페이지 수 값 구하기
			pageCount = articleCount/pageSize + (articleCount%pageSize > 0 ? 1 : 0);
			int startPage = ( currentPage / pageBlock ) * pageBlock + 1 ;
			if(currentPage % pageBlock == 0){
				startPage -= pageBlock;
			}
			int endPage = startPage + pageBlock - 1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
			
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
			/*
			Map<String, Integer> startEndPage = new HashMap<String, Integer>();
			startEndPage.put("start", start);
			startEndPage.put("end", end);		
			memberDataList = adminDao.getMemberList(startEndPage);
			*/
			List<MemberDataBean> memberDataList = new ArrayList<MemberDataBean>();
			SearchAdminDataBean searchAdminData = new SearchAdminDataBean();	
			searchAdminData.setStart(start);
			searchAdminData.setEnd(end);
			
			System.out.println("TEST3");
			
			if(searchMeans.equals("name")){
				searchAdminData.setName("%"+searchMessage+"%");
				memberDataList = adminDao.getMemberSearchNameList(searchAdminData);		
			}else if(searchMeans.equals("id")){
				searchAdminData.setId("%"+searchMessage+"%");
				memberDataList = adminDao.getMemberSearchNameList(searchAdminData);		
			}else if(searchMeans.equals("nickname")){
				searchAdminData.setNickname("%"+searchMessage+"%");
				memberDataList = adminDao.getMemberSearchNameList(searchAdminData);		
			}	
			
			for(int i=0; i<memberDataList.size(); i++){
				memberDataList.get(i).getName();
			}
			
			request.setAttribute("searchMessage", searchMessage);
			
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
	
	@RequestMapping("/insertFitnessUserSearch")	
	public ModelAndView insertFitnessUserSearch
	(HttpServletRequest request,HttpServletResponse response){		
		
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
		
		
		request.setAttribute("id", id);		//아이디를 넘겨준다
		request.setAttribute("idCheckResult", idCheckResult);//register 검색 결과가 없는경우를 알려준다.
		
		request.setAttribute("startYear", startYear);
		request.setAttribute("startMonth", startMonth);
		request.setAttribute("startDay", startDay);
		
		request.setAttribute("endYear", endYear);
		request.setAttribute("endMonth", endMonth);
		request.setAttribute("endDay", endDay);
		
		request.setAttribute("start_leapYear", start_leapYear);	

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
	
	
	
	@RequestMapping("/insertScheduleUserSearch")	
	public ModelAndView insertScheduleUserSearch
	(HttpServletRequest request,HttpServletResponse response) throws Exception{	
		
		String id = request.getParameter("id");
		
		/* 휘트니스 등록했는지 조사 */
		int fitnessIdCheckResult = adminDao.insertFitnessUserSearchIDCheck(id);
		request.setAttribute("fitnessIdCheckResult", fitnessIdCheckResult);
		/* 휘트니스 등록했는지 안했는지에 따라서 스케줄 작성을 허용하는지 막는 if문 */
		if(fitnessIdCheckResult==0){
			
		}else{
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy");		//있는경우 데이터의 년도포멧을 yyyy로 바꿈		
			
			int idCheckResult = adminDao.insertScheduleUserSearchIDCheck(id);
					
			int startYear = 0;		//시작 년도변수
			String startMonth = null;		//시작 월 변수
			String startDay = null;		//시작 일 변수
	
			int endYear = 0;		//종료 년도변수
			String endMonth = null;		//종료 월 변수
			String endDay = null;			//종료 일 변수
			
			int exTerm = 1;				//운동기간				
			
			String start_leapYear = "false";			//시작년도의 윤달이 있는지 없는지
			
			if(idCheckResult ==0){			
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
				
				exTerm = 1;
			}
			//아이디 검색했을때 결과값이 있을경우
			else{
				
				RoutineInfoDataBean routineData = adminDao.insertScheduleUserSearchID(id);
				request.setAttribute("routineData", routineData);		
				
				startYear = Integer.parseInt(format.format(routineData.getStart_date()));	//해당 회원의 시작년도
				endYear = Integer.parseInt(format.format(routineData.getEnd_date()));		//해당 회원의 종료년도
							
				format = new SimpleDateFormat("MM");
				startMonth = format.format(routineData.getStart_date());			
				endMonth = format.format(routineData.getEnd_date());
						
				format = new SimpleDateFormat("dd");
				startDay = format.format(routineData.getStart_date());			
				endDay = format.format(routineData.getEnd_date());
							
				
				format = new SimpleDateFormat("yyyyMMdd");
				String start = String.valueOf(startYear)+startMonth+startDay;
				String end = String.valueOf(endYear)+endMonth+endDay;
				
				Date startDate = format.parse(start);
				Date endDate = format.parse(end);
				
				long term = endDate.getTime() - startDate.getTime();
				exTerm = (int)(term/(24*60*60*1000));			
				exTerm = exTerm/30;			
			}		
			
			//윤달 검사
			if((0==(startYear%4) && 0 !=(startYear%100)) || 0 == startYear%400){
				start_leapYear = "true";
			}
			
			request.setAttribute("id", id);
			request.setAttribute("idCheckResult", idCheckResult);
			request.setAttribute("exPartList", adminDao.selectExPartList(null));
			request.setAttribute("startYear", startYear);
			request.setAttribute("startMonth", startMonth);
			request.setAttribute("startDay", startDay);
			request.setAttribute("endYear", endYear);
			request.setAttribute("endMonth", endMonth);
			request.setAttribute("endDay", endDay);
			request.setAttribute("exTerm", exTerm);
			request.setAttribute("start_leapYear", start_leapYear);
		}
		
		return new ModelAndView("/vt_administrator/processing/insertScheduleUserSearch");
		
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
			adminDao.updateFitnessInfo(registerData);
			request.setAttribute("result", "2");	
		}
		return new ModelAndView("/vt_administrator/processing/DBInsertResultText");
	}
	
	
	
	@RequestMapping("/scheduleInsertProcess")
	public ModelAndView scheduleInsertProcess
	(HttpServletRequest request,HttpServletResponse response){		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}		
		
		String timetamp =" 00:00:00.0";
		
		
		int routineinfo_id = 0;
		if(request.getParameter("routineinfo_id") != null) {
			Integer.parseInt(request.getParameter("routineinfo_id"));
		}
		String id = request.getParameter("id");
		String sex = request.getParameter("sex");	
		Timestamp start = Timestamp.valueOf(request.getParameter("start")+timetamp);
		Timestamp end = Timestamp.valueOf(request.getParameter("end")+timetamp);
		String routineType = request.getParameter("routineType");
		
		RoutineInfoDataBean routineData = new RoutineInfoDataBean();
		routineData.setRoutineinfo_id(routineinfo_id);
		routineData.setId(id);
		routineData.setSex(sex);
		routineData.setStart_date(start);
		routineData.setEnd_date(end);
		routineData.setRoutine_type(routineType);
		
		int idCheckResult = adminDao.insertScheduleUserSearchIDCheck(id);
		request.setAttribute("idCheckResult", idCheckResult);
		
		if(idCheckResult==0){
			int result = adminDao.insertScheduleInfo(routineData);
			request.setAttribute("result", result);		
		}else if(idCheckResult!=0){
			int result = adminDao.updateScheduleInfo(routineData);
			request.setAttribute("result", result);	
		}
		return new ModelAndView("/vt_administrator/processing/DBInsertResultText");
	}
	
	@RequestMapping("/exerciseOption")
	public ModelAndView exerciseOption(@RequestParam Map<String, Object> param, HttpServletRequest request) {
		request.setAttribute("exerciseList", adminDao.selectExerciseList(param));
		return new ModelAndView("/vt_administrator/processing/exerciseOption");
	}
	
	@RequestMapping("/insertMemberRoutine")
	public ModelAndView insertMemberRoutine(@RequestParam Map<String, Object> param, HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		String id = (String) param.get("id");
		String memberRoutineListStr = (String) param.get("memberRoutineList");
		int result = 0;
		RoutineInfoDataBean routineData = adminDao.insertScheduleUserSearchID(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("routineinfo_id", routineData.getRoutineinfo_id());
		adminDao.deleteMemberRoutine(map);
		
		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>> memberRoutineList = mapper.readValue(memberRoutineListStr, new TypeReference<List<Map<String, Object>>>(){});
		
		for (Map<String, Object> memberRoutineItem : memberRoutineList) {
			memberRoutineItem.put("routineinfo_id", routineData.getRoutineinfo_id());
			result = adminDao.insertMemberRoutine(memberRoutineItem);
		}
		
		request.setAttribute("result", result);
		return new ModelAndView("/vt_administrator/processing/DBInsertResultText");
	}
	
	@RequestMapping("/selectMemberRoutineList")
	public @ResponseBody List<MemberRoutineDataBean> selectMemberRoutineList(@RequestParam Map<String, Object> param) {
		return adminDao.selectMemberRoutineList(param);
	}
}



