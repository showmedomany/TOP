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

import member.MemberDataBean;
import myPage.ExerciseDataBean;
import myPage.InbodyDataBean;
import myPage.MemberRoutineDataBean;
import myPage.MyPageDao;
import myPage.RegisterDataBean;
import myPage.RoutineInfoDataBean;

@Controller
public class MyPageController {
	@Resource(name="myPageDao")
	private MyPageDao myPageDao;
	
	@RequestMapping("/myPageView")
	public ModelAndView myPageView
	(HttpServletRequest request,HttpServletResponse response){	
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}
		String choice = request.getParameter("choice");		
		String myPageSuject = null;
		String id = (String) request.getSession().getAttribute("memId");
		String center = "/vt_member/vt_myPageView";
		if(choice==null){// 처음 들어왔을 경우 // 			
			choice = "0";
		}
		switch(Integer.parseInt(choice)){
		case 0://센터 결제정보/인바디 이동
			myPageSuject = "vt_centerPaymentInfo";
			RegisterDataBean registerData = myPageDao.getRegisterData(id);
			InbodyDataBean inbodyData = myPageDao.getInbodyData(id);
			
			request.setAttribute("registerData", registerData);	
			request.setAttribute("inbodyData", inbodyData);
			
			break;
		case 1:	//참조운동정보 이동
			myPageSuject = "vt_ex_routine";
			List<MemberRoutineDataBean> WeekScheduleList = new ArrayList<MemberRoutineDataBean>();				
			
			RoutineInfoDataBean StartEndDateData = myPageDao.getStartEndDate(id);
			WeekScheduleList = myPageDao.getWeekExerciseSchedule(id);	
			
			request.setAttribute("StartEndDateData", StartEndDateData);
			request.setAttribute("WeekScheduleList", WeekScheduleList);
			break;
		case 2://달성률 이동
			myPageSuject = "vt_achievementRate";
			break;
		case 3://회원정보
			myPageSuject = "vt_memberInfoView";
			MemberDataBean memberData = myPageDao.getMemberData(id);
			request.setAttribute("memberData", memberData);
			break;
		case 4://회원탈퇴
			myPageSuject = "vt_memberOut";
			break;
		}
		
		
		request.setAttribute("id", id);
		request.setAttribute("myPageSuject", myPageSuject);	
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
