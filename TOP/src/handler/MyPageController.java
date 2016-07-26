package handler;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import myPage.ExerciseDataBean;
import myPage.MemberRoutineDataBean;
import myPage.MyPageDao;
import myPage.RoutineInfoDataBean;

@Controller
public class MyPageController {
	@Resource(name="myPageDao")
	private MyPageDao myPageDao;
	
	@RequestMapping("/myPageView")
	public ModelAndView myPageView
	(HttpServletRequest request,HttpServletResponse response){		
		//마이페이지
		List<MemberRoutineDataBean> WeekScheduleList = new ArrayList<MemberRoutineDataBean>();
		String center = "/vt_member/vt_myPageView";		
		
		String choice = request.getParameter("choice");		
		String myPageSuject = null;
		String id = (String) request.getSession().getAttribute("memId");
		
		if(choice==null){
			myPageSuject = "vt_centerPaymentInfo";
		}else{
			switch(Integer.parseInt(choice)){
			case 0:
				myPageSuject = "vt_centerPaymentInfo";
				break;
			case 1:
				myPageSuject = "vt_ex_routine";
				RoutineInfoDataBean StartEndDateData = myPageDao.getStartEndDate(id);
				WeekScheduleList = myPageDao.getWeekExerciseSchedule(id);
				request.setAttribute("myPageSuject", myPageSuject);	
				request.setAttribute("id", id);
				request.setAttribute("StartEndDateData", StartEndDateData);
				request.setAttribute("WeekScheduleList", WeekScheduleList);
				break;
			case 2:
				myPageSuject = "vt_achievementRate";
				break;
			case 3:
				myPageSuject = "vt_memberInfo";
				break;
			case 4:
				myPageSuject = "vt_memberOut";
				break;
			}
		}
		request.setAttribute("center", center);			
		return new ModelAndView("/vtFrame/vtFrame");
	}//
	
	@RequestMapping("/myPagePartSchedulePrint")
	public ModelAndView myPagePartSchedulePrint
	(HttpServletRequest request,HttpServletResponse response){		
		//마이페이지 부위별 출력	
		
		int partId = Integer.parseInt(request.getParameter("partId"));
		
		List<ExerciseDataBean> exeriselist = new ArrayList<ExerciseDataBean>();		
		exeriselist = myPageDao.getExerciseNames(partId);
		request.setAttribute("partId", partId);
		request.setAttribute("exeriselist", exeriselist);		
		return new ModelAndView("/vt_member/vt_ex_routine_partPrint");
	}//
	
	
	@RequestMapping("/myPageExeriseInfoPrint")
	public ModelAndView myPageExeriseInfoPrint
	(HttpServletRequest request,HttpServletResponse response){		
		//운동 상세정보 출력	
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}		
		String name = request.getParameter("name");		
		ExerciseDataBean exeriseInfoData = myPageDao.getExeriseInfo(name);		
		request.setAttribute("exeriseInfoData", exeriseInfoData);
		return new ModelAndView("/vt_member/vt_ex_routine_exeriseInfoPrint");
	}//
}
