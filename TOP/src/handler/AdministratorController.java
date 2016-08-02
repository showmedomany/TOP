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
				
				//트레이너 정보 가지고 오기
				List<String> trainerIdList = adminDao.getTrainerIdList();
				request.setAttribute("trainerIdList", trainerIdList);
				
			//피트니스 정보가 없을 경우
			}else if(resultRegister == 0){				
				
				
			}
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
		int start_month = Integer.parseInt(request.getParameter("end_month"));
		String start_leapYear = request.getParameter("end_leapYear");			
		
		request.setAttribute("end_month", start_month);
		request.setAttribute("end_leapYear", start_leapYear);
		return new ModelAndView("/vt_administrator/selectDayText_end");
	}
	@RequestMapping("/vt_fitnessInsertPro")
	public ModelAndView vt_fitnessInsertPro
	(HttpServletRequest request,HttpServletResponse response){			
		
		String top = "vt_admin_topForm";
		String center = "vt_admin_centerContent";
		String administratorPage = "vt_fitnessInsert";
		
		//String exp_date = request.getParameter("exp_date");
		//System.out.println("exp_date : " + exp_date);
		return null;
		
		
		
		
		
		
		
		
		//request.setAttribute("top", top);
		//request.setAttribute("center", center);
		//request.setAttribute("administratorPage", administratorPage);
		//return new ModelAndView("/vt_administrator/vt_administrator");
	}//
	
	
	
}



