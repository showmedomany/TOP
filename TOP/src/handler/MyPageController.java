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

import member.MemberDao;
import member.MemberDataBean;
import myPage.ExerciseDataBean;
import myPage.InbodyDataBean;
import myPage.MemberRoutineDataBean;
import myPage.MyPageDao;
import myPage.RegisterDataBean;
import myPage.Routine;
import myPage.RoutineInfoDataBean;

@Controller
public class MyPageController {
	@Resource(name="myPageDao")
	private MyPageDao myPageDao;
	
	@Resource(name="memberDao")
	private MemberDao memberDao;
	
	@RequestMapping("/myPageView")
	public ModelAndView myPageView(HttpServletRequest request,HttpServletResponse response){		
		
		String top = "/vtFrame/vt_topForm";
		String center = "centerPayment";
		String bottom = "/vtFrame/vt_bottomForm";
		request.setAttribute("top", top);
		request.setAttribute("center", center);	
		request.setAttribute("bottom", bottom); 
		return new ModelAndView("/vt_member/myPageView");
	}
	
	/*
	@RequestMapping("/myPageView")
	public ModelAndView myPageView
	(HttpServletRequest request,HttpServletResponse response){	
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}
		String choice = request.getParameter("choice");		
		String myPageSubject = null;
		String id = (String) request.getSession().getAttribute("memId");
		String center = "/vt_member/vt_myPageView";
		if(choice==null){// 처음 들어왔을 경우 // 			
			choice = "0";
		}
		switch(Integer.parseInt(choice)){
		case 0://센터 결제정보/인바디 이동
			myPageSubject = "vt_centerPaymentInfo";
			RegisterDataBean registerData = myPageDao.getRegisterData(id);
			InbodyDataBean inbodyData = myPageDao.getInbodyData(id);
			
			request.setAttribute("registerData", registerData);	
			request.setAttribute("inbodyData", inbodyData);
			
			break;
		case 1:	//참조운동정보 이동
			myPageSubject = "vt_ex_routine";
			List<MemberRoutineDataBean> WeekScheduleList = new ArrayList<MemberRoutineDataBean>();				
			
			int checkResult = myPageDao.routineInfoIdCheck(id);		
			request.setAttribute("checkResult", checkResult);
			if(checkResult==1){
				RoutineInfoDataBean StartEndDateData = myPageDao.getStartEndDate(id);
				WeekScheduleList = myPageDao.getWeekExerciseSchedule(id);				
				request.setAttribute("StartEndDateData", StartEndDateData);
				request.setAttribute("WeekScheduleList", WeekScheduleList);
			}			
			break;
		case 2://달성률 이동
			myPageSubject = "vt_achievementRate";
			break;
		case 3://회원정보
			myPageSubject = "vt_passwdCheck";
			request.setAttribute("choice", "modify");			
			break;
		case 4://회원탈퇴
			myPageSubject = "vt_passwdCheck";
			request.setAttribute("choice", "delete");
			break;
		}
		
		
		request.setAttribute("id", id);
		request.setAttribute("myPageSubject", myPageSubject);	
		request.setAttribute("center", center);	
		
		return new ModelAndView("/vtFrame/vtFrame");
	}//
	*/
	
	@RequestMapping("/centerPayment")
	public ModelAndView centerPayment(HttpServletRequest request,HttpServletResponse response){	
		
		String top = "/vtFrame/vt_topForm";
		String center = "centerPayment";	
		request.setAttribute("top", top);
		request.setAttribute("center", center);	
		return new ModelAndView("/vt_member/myPageView");
	}
	@RequestMapping("/fitnessInfo")
	public ModelAndView fitnessInfo(HttpServletRequest request,HttpServletResponse response){
		
		String id = (String) request.getSession().getAttribute("memId");
		request.setAttribute("id", id);
		
		RegisterDataBean registerData = myPageDao.getRegisterData(id);
		request.setAttribute("registerData", registerData);
		
		String top = "/vtFrame/vt_topForm";
		String center = "fitnessInfo";		
		request.setAttribute("top", top);
		request.setAttribute("center", center);	
		return new ModelAndView("/vt_member/myPageView");
	}
	@RequestMapping("/inbodyInfo")
	public ModelAndView inbodyInfo(HttpServletRequest request,HttpServletResponse response){	
		
		String id = (String) request.getSession().getAttribute("memId");
		request.setAttribute("id", id);
		
		InbodyDataBean inbodyData = myPageDao.getInbodyData(id);
		request.setAttribute("inbodyData", inbodyData);
		
		String top = "/vtFrame/vt_topForm";
		String center = "inbodyInfo";
		request.setAttribute("top", top);
		request.setAttribute("center", center);	
		return new ModelAndView("/vt_member/myPageView");
	}
	@RequestMapping("/exerciseRoutine")
	public ModelAndView exerciseRoutine(HttpServletRequest request,HttpServletResponse response){	
		
		String id = (String) request.getSession().getAttribute("memId");
		request.setAttribute("id", id);
		
		int checkResult = myPageDao.routineInfoIdCheck(id);		
		request.setAttribute("checkResult", checkResult);
		
		if(checkResult==1){
			RoutineInfoDataBean uesrRoutineInfoData = myPageDao.getUesrRoutineInfoData(id);
			request.setAttribute("uesrRoutineInfoData", uesrRoutineInfoData);
			
			
			List<Routine> exeriselistRoutine = new ArrayList<Routine>();	
			exeriselistRoutine = myPageDao.getExerciseNames(id);
			
			
			for(int i=0; i<exeriselistRoutine.size(); i++){
				System.out.print(exeriselistRoutine.get(i).getDay());
				System.out.print(exeriselistRoutine.get(i).getExercise_id());
				System.out.println(exeriselistRoutine.get(i).getPart_name());
				
			}
			
			
			
			
			
			int routineinfo_id = uesrRoutineInfoData.getRoutineinfo_id();
			List<MemberRoutineDataBean> userMemberRoutineList = new ArrayList<MemberRoutineDataBean>();
			userMemberRoutineList = myPageDao.getUserMemberRoutineList(routineinfo_id);
			request.setAttribute("userMemberRoutineList", userMemberRoutineList);			
			List<Integer> exerciseIds = new ArrayList<Integer>();
			
			List<ExerciseDataBean> exeriselist = new ArrayList<ExerciseDataBean>();		
			exeriselist = myPageDao.getExerciseNames();
			
			
			
			
			
			
			
			
			
			for(int i=0; i<userMemberRoutineList.size(); i++){				
				exerciseIds.add(userMemberRoutineList.get(i).getExercise_id());			
			}
			
			request.setAttribute("exerciseIds", exerciseIds);
			request.setAttribute("exeriselist", exeriselist);			
			/* test */
			//for(int i=0; i<exerciseIds.size(); i++){
			//	System.out.println(exerciseIds.get(i));
			//}			
			
			
			//여기서 가지고 올껀 운동 루팅 해당 아이디꺼를 전부 가지고 와야한다!!
			//그래 가지고오자!
			
		}
		
		
		/*
		List<MemberRoutineDataBean> WeekScheduleList = new ArrayList<MemberRoutineDataBean>();
		
		
		if(checkResult==1){
			RoutineInfoDataBean StartEndDateData = myPageDao.getStartEndDate(id);
			WeekScheduleList = myPageDao.getWeekExerciseSchedule(id);				
			request.setAttribute("StartEndDateData", StartEndDateData);
			request.setAttribute("WeekScheduleList", WeekScheduleList);
		}		
		
		
		*/
		String top = "/vtFrame/vt_topForm";
		String center = "exerciseRoutine";
		request.setAttribute("top", top);
		request.setAttribute("center", center);	
		return new ModelAndView("/vt_member/myPageView");
	}
	@RequestMapping("/memberModify")
	public ModelAndView memberModify(HttpServletRequest request,HttpServletResponse response){	
		
		String top = "/vtFrame/vt_topForm";
		String center = "memberModify";
		request.setAttribute("top", top);
		request.setAttribute("center", center);	
		return new ModelAndView("/vt_member/myPageView");
	}
	
	/* 사용안함 나중에 삭제
	@RequestMapping("/myPagePartSchedulePrint")
	public ModelAndView myPagePartSchedulePrint
	(HttpServletRequest request,HttpServletResponse response){		
		//마이페이지 부위별 출력	
		
		int partId = Integer.parseInt(request.getParameter("partId"));
		
		List<ExerciseDataBean> exeriselist = new ArrayList<ExerciseDataBean>();		
		exeriselist = myPageDao.getExerciseNames(partId);
		request.setAttribute("partId", partId);
		request.setAttribute("exeriselist", exeriselist);		
		return new ModelAndView("/vt_member/processing/routinePartText");
	}//		
	*/
	
	
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
		return new ModelAndView("/vt_member/processing/routineExeriseInfoText");
	}//
	
	
	
	
	//회원 수정
	
	@RequestMapping("/memberModifyPro")
	public ModelAndView memberModifyPro
	(HttpServletRequest request,HttpServletResponse response){		
		//운동 상세정보 출력	
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}
		
	
		/* -------------- */		
		MemberDataBean mdto = new MemberDataBean();	
		
		mdto.setId((String)request.getSession().getAttribute("memId"));
		mdto.setPasswd(request.getParameter("passwd"));		
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
		
		int updateResult = myPageDao.updateMember(mdto);
		
		request.setAttribute("updateResult", updateResult);
		
		
		String myPageSubject = "processing/memberModifyPro";
		String center = "/vt_member/vt_myPageView";
		
		request.setAttribute("myPageSubject", myPageSubject);	
		request.setAttribute("center", center);	
		return new ModelAndView("/vtFrame/vtFrame");
	}//
	@RequestMapping("/passwdCheckPro")
	public ModelAndView passwdCheckPro
	(HttpServletRequest request,HttpServletResponse response){		
		String choice = request.getParameter("choice");
		String passwd = request.getParameter("passwd");		
		
		String id = (String)request.getSession().getAttribute("memId");		
		int passwdCheck = memberDao.loginMember(id, passwd);
		request.setAttribute("passwdCheck", passwdCheck);	
		
		if(passwdCheck==1){
			if(choice.equals("modify")){
				String myPageSubject = "vt_memberModify";
				String center = "/vt_member/vt_myPageView";		
				MemberDataBean memberData = myPageDao.getMemberData(id);			
				request.setAttribute("myPageSubject", myPageSubject);	
				request.setAttribute("center", center);
				request.setAttribute("memberData", memberData);
			}else if(choice.equals("delete")){
				String myPageSubject = "vt_memberDelete";
				String center = "/vt_member/vt_myPageView";			
				request.setAttribute("myPageSubject", myPageSubject);	
				request.setAttribute("center", center);	
			}		
			return new ModelAndView("/vtFrame/vtFrame");
		}else{
			String myPageSubject = "processing/passwdCheckPro";
			String center = "/vt_member/vt_myPageView";			
			request.setAttribute("myPageSubject", myPageSubject);	
			request.setAttribute("center", center);	
			return new ModelAndView("/vtFrame/vtFrame");
		}
	}//
	@RequestMapping("/memberDelete")
	public ModelAndView memberDelete
	(HttpServletRequest request,HttpServletResponse response){		
		String id = (String)request.getSession().getAttribute("memId");
		int deleteResult = myPageDao.memberDelete(id);
		request.setAttribute("deleteResult", deleteResult);
		
		String myPageSubject = "processing/memberDeletePro";
		String center = "/vt_member/vt_myPageView";			
		request.setAttribute("myPageSubject", myPageSubject);	
		request.setAttribute("center", center);	
		return new ModelAndView("/vtFrame/vtFrame");
	}//
	
}
