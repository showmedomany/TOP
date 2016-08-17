package administrator;


import java.util.List;
import java.util.Map;

import member.MemberDataBean;
import myPage.ExerciseDataBean;
import myPage.InbodyDataBean;
import myPage.MemberRoutineDataBean;
import myPage.PartDataBean;
import myPage.RegisterDataBean;
import myPage.RoutineInfoDataBean;

public interface AdminDao {
	public int insertFitnessUserSearchIDCheck(String id);	
	public RegisterDataBean insertFitnessUserSearchID(String id);
	
	//public int getFitnessStartYear();	
	//public List<String> getTrainerIdList();
	public int updateFitnessInfo(RegisterDataBean registerData);
	public int insertFitnessInfo(RegisterDataBean registerData);
	
	
	public int getMemberDataCount();
	public List<MemberDataBean> getMemberList(Map<String, Integer> startEndPage);
	
	public int getNameSearchCount(String searchMessage);
	public int getIdSearchCount(String searchMessage);
	public int getNickNameSearchCount(String searchMessage);
	
	
	public List<MemberDataBean> getMemberSearchNameList(String searchMessage);
	public List<MemberDataBean> getMemberSearchIdList(String searchMessage);
	public List<MemberDataBean> getMemberSearchNickNameList(String searchMessage);

	/* 인바디 등록확인 */
	public int getInbodyCheck(String id);
	/* 검색한 아이디 인바디 정보 반환 */
	public InbodyDataBean getInbodyData(String id);
	/* 인바디 수정 */
	public int updateInbodyInfo(InbodyDataBean inbodyData);
	/* 인바디 저장 */
	public int insertInbodyInfo(InbodyDataBean inbodyData);
	
	public int insertScheduleUserSearchIDCheck(String id);	
	public RoutineInfoDataBean insertScheduleUserSearchID(String id);
	public int updateScheduleInfo(RoutineInfoDataBean scheduleData);
	public int insertScheduleInfo(RoutineInfoDataBean scheduleData);
	
	public List<PartDataBean> selectExPartList(Map<String, Object> param);
	public List<ExerciseDataBean> selectExerciseList(Map<String, Object> param);
	
	public List<MemberRoutineDataBean> selectMemberRoutineList(Map<String, Object> param);
	public int insertMemberRoutine(Map<String, Object> param);
	public int deleteMemberRoutine(Map<String, Object> param);
	
}
