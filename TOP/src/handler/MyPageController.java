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

import member.MemberDao;
import member.MemberDataBean;
import myPage.ExerciseDataBean;
import myPage.MyPageDao;
import myPage.RegisterDataBean;
import myPage.RoutineDataBean;
import myPage.RoutineInfoDataBean;
import myPage.UserChecksDataBean;

@Controller
public class MyPageController {
	@Resource(name="myPageDao")
	private MyPageDao myPageDao;
	
	@Resource(name="memberDao")
	private MemberDao memberDao;
	
	@RequestMapping("/myPageView")
	public ModelAndView myPageView(HttpServletRequest request,HttpServletResponse response){		
		
		String id = (String) request.getSession().getAttribute("memId");
		request.setAttribute("id", id);		
		
		MemberDataBean memberData = new MemberDataBean();
		memberData = memberDao.getMember(id);
		request.setAttribute("memberData", memberData);	
		
		UserChecksDataBean userCheckResult = myPageDao.uesrChecks(id);
		request.setAttribute("userCheckResult", userCheckResult);			
		
		String top = "/vtFrame/vt_topForm";
		String center = "centerPayment";
		String bottom = "/vtFrame/vt_bottomForm";
		request.setAttribute("top", top);
		request.setAttribute("center", center);	
		request.setAttribute("bottom", bottom); 
		return new ModelAndView("/vt_member/myPageView");
	}	
	
	@RequestMapping("/centerPayment")
	public ModelAndView centerPayment(HttpServletRequest request,HttpServletResponse response){	
		
		String id = (String) request.getSession().getAttribute("memId");
		request.setAttribute("id", id);		
		
		MemberDataBean memberData = new MemberDataBean();
		memberData = memberDao.getMember(id);
		request.setAttribute("memberData", memberData);	
		
		UserChecksDataBean userCheckResult = myPageDao.uesrChecks(id);
		request.setAttribute("userCheckResult", userCheckResult);		
		
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
	
	@RequestMapping("/exerciseRoutine")
	public ModelAndView exerciseRoutine(HttpServletRequest request,HttpServletResponse response){	
		
		String id = (String) request.getSession().getAttribute("memId");
		request.setAttribute("id", id);
		
		/* 해당아이디 루틴정보 검색 없으면 0 아니면 0이 아닌값*/
		int checkResult = myPageDao.routineInfoIdCheck(id);		
		request.setAttribute("checkResult", checkResult);
		
		if(checkResult==1){
			/* 루틴 시작일과 종료일 가지고 오기 */
			RoutineInfoDataBean uesrRoutineInfoData = myPageDao.getUesrRoutineInfoData(id);
			request.setAttribute("uesrRoutineInfoData", uesrRoutineInfoData);			
			
			/* 운동부위, 요일, 운동이름 가지고 오기 */
			List<RoutineDataBean> exeriselistRoutine = new ArrayList<RoutineDataBean>();	
			exeriselistRoutine = myPageDao.getRoutineData(id);
			request.setAttribute("exeriselistRoutine", exeriselistRoutine);
			
			/* test print
			for(int i=0; i<exeriselistRoutine.size(); i++){
				System.out.print(exeriselistRoutine.get(i).getDay());
				System.out.print(exeriselistRoutine.get(i).getPart_name());
				System.out.println(exeriselistRoutine.get(i).getName());				
			}*/
		}		
			
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
		
		String id = (String) request.getSession().getAttribute("memId");
		request.setAttribute("id", id);
		
		MemberDataBean memberData = new MemberDataBean();
		memberData = memberDao.getMember(id);
		request.setAttribute("memberData", memberData);
		
		
		request.setAttribute("top", top);
		request.setAttribute("center", center);	
		return new ModelAndView("/vt_member/myPageView");
	}
	
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
		
		
				
		String top = "/vtFrame/vt_topForm";
		String center = "processing/memberModifyPro";
		
		request.setAttribute("top", top);
		request.setAttribute("center", center);	
		return new ModelAndView("/vt_member/myPageView");
	}//
	
	@RequestMapping("/memberDelete")
	public ModelAndView memberDelete
	(HttpServletRequest request,HttpServletResponse response){		
		String id = (String)request.getSession().getAttribute("memId");
		int deleteResult = myPageDao.memberDelete(id);
		request.setAttribute("deleteResult", deleteResult);
		
		String top = "/vtFrame/vt_topForm";
		String center = "processing/memberDeletePro";
		
		request.setAttribute("top", top);
		request.setAttribute("center", center);	
		return new ModelAndView("/vt_member/myPageView");
	}//
	
}
