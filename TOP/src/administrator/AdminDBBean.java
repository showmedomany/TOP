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
import mybatis.SqlMapClient;

public class AdminDBBean implements AdminDao {
	
	@Override
	public int insertFitnessUserSearchIDCheck(String id) {
		return SqlMapClient.getSession().selectOne("Admin.insertFitnessUserSearchIDCheck", id);
	}
	@Override
	public RegisterDataBean insertFitnessUserSearchID(String id) {
		return SqlMapClient.getSession().selectOne("Admin.insertFitnessUserSearchID", id);
	}
	
	@Override
	public int getFitnessStartYear() {		
		return SqlMapClient.getSession().selectOne("Admin.getFitnessStartYear");
	}
	/*
	@Override
	public List<String> getTrainerIdList() {		
		return SqlMapClient.getSession().selectList("Admin.getTrainerIdList");
	}
	*/
	@Override
	public int updateFitnessInfo(RegisterDataBean registerData) {		
		return SqlMapClient.getSession().update("Admin.updateFitnessInfo", registerData);
	}
	@Override
	public int insertFitnessInfo(RegisterDataBean registerData) {		
		return SqlMapClient.getSession().update("Admin.insertFitnessInfo", registerData);
	}
	
	@Override
	public int getMemberDataCount() {		
		return SqlMapClient.getSession().selectOne("Admin.getMemberDataCount");
	}
	@Override
	public List<MemberDataBean> getMemberList(Map<String, Integer> startEndPage) {		
		return SqlMapClient.getSession().selectList("Admin.getMemberList", startEndPage);
	}
	@Override
	public int getNameSearchCount(String searchMessage) {
		return SqlMapClient.getSession().selectOne("Admin.getNameSearchCount", searchMessage);
	}
	@Override
	public int getIdSearchCount(String searchMessage) {
		return SqlMapClient.getSession().selectOne("Admin.getIdSearchCount", searchMessage);
	}
	@Override
	public int getNickNameSearchCount(String searchMessage) {
		return SqlMapClient.getSession().selectOne("Admin.getNickNameSearchCount", searchMessage);
	}
	@Override
	public List<MemberDataBean> getMemberSearchNameList(String searchMessage) {
		return SqlMapClient.getSession().selectList("Admin.getMemberSearchNameList", searchMessage);
	}
	@Override
	public List<MemberDataBean> getMemberSearchIdList(String searchMessage) {
		return SqlMapClient.getSession().selectList("Admin.getMemberSearchIdList", searchMessage);
	}
	@Override
	public List<MemberDataBean> getMemberSearchNickNameList(String searchMessage) {
		return SqlMapClient.getSession().selectList("Admin.getMemberSearchNickNameList", searchMessage);
	}
	
	/* 인바디 정보 등록 확인 */
	@Override
	public int getInbodyCheck(String id) {		
		return SqlMapClient.getSession().selectOne("Admin.getInbodyCheck", id);
	}
	
	/* 검색한 아이디 인바디 정보 반환 */
	@Override
	public InbodyDataBean getInbodyData(String id) {
		return SqlMapClient.getSession().selectOne("Admin.getInbodyData", id);
	}
	
	/* 인바디 수정 */
	@Override
	public int updateInbodyInfo(InbodyDataBean inbodyData){
		return SqlMapClient.getSession().insert("Admin.updateInbodyInfo", inbodyData);
	}
	
	/* 인바디 저장 */
	@Override
	public int insertInbodyInfo(InbodyDataBean inbodyData){
		return SqlMapClient.getSession().insert("Admin.insertInbodyInfo", inbodyData);
	}

	@Override
	public int insertScheduleUserSearchIDCheck(String id) {
		return SqlMapClient.getSession().selectOne("Admin.insertScheduleUserSearchIDCheck", id);
	}
	
	@Override
	public RoutineInfoDataBean insertScheduleUserSearchID(String id) {
		return SqlMapClient.getSession().selectOne("Admin.insertScheduleUserSearchID", id);
	}
	
	@Override
	public int updateScheduleInfo(RoutineInfoDataBean scheduleData) {		
		return SqlMapClient.getSession().update("Admin.updateScheduleInfo", scheduleData);
	}
	
	@Override
	public int insertScheduleInfo(RoutineInfoDataBean scheduleData) {		
		return SqlMapClient.getSession().update("Admin.insertScheduleInfo", scheduleData);
	}
	
	public List<PartDataBean> selectExPartList(Map<String, Object> param) {
		return SqlMapClient.getSession().selectList("Admin.selectExPartList", param);
	}
		
	public List<MemberRoutineDataBean> selectMemberRoutineList(Map<String, Object> param) {
		return SqlMapClient.getSession().selectList("Admin.selectMemberRoutineList", param);
	}
	
	public int deleteMemberRoutine(Map<String, Object> param) {
		return SqlMapClient.getSession().insert("Admin.deleteMemberRoutine", param);
	}
	
	public int insertMemberRoutine(Map<String, Object> param) {
		return SqlMapClient.getSession().insert("Admin.insertMemberRoutine", param);
	}
	
	public List<ExerciseDataBean> selectExerciseList(Map<String, Object> param) {
		return SqlMapClient.getSession().selectList("Admin.selectExerciseList", param);
	}
	
}
