package myPage;

import java.util.List;
import java.util.Map;

import member.MemberDataBean;
import mybatis.SqlMapClient;

public class MyPageDBBean implements MyPageDao {
	@Override
	public int routineInfoIdCheck(String id) {	
		return SqlMapClient.getSession().selectOne("MyPage.routineInfoIdCheck", id);
	}	
	@Override
	public RoutineInfoDataBean getUesrRoutineInfoData(String id) {
		return SqlMapClient.getSession().selectOne("MyPage.getUesrRoutineInfoData", id); 
	}
	@Override
	public List<MemberRoutineDataBean> getUserMemberRoutineList(int routineinfo_id){
		return SqlMapClient.getSession().selectList("MyPage.getUserMemberRoutineList", routineinfo_id);
	}
	@Override
	public List<RoutineDataBean> getRoutineData(String id) {		
		return SqlMapClient.getSession().selectList("MyPage.getRoutineData", id);
	}
	@Override
	public List<ExerciseDataBean> getExerciseNames() {		
		return SqlMapClient.getSession().selectList("MyPage.getExerciseAllNames");
	}
	
	/* 인바디 휘트니스 루틴 등록확인 */
	public UserChecksDataBean uesrChecks(String id){
		return SqlMapClient.getSession().selectOne("MyPage.uesrChecks", id);
	}
	
	

	
	@Override
	public List<ExerciseDataBean> getExerciseNames(int partId) {		
		return SqlMapClient.getSession().selectList("MyPage.getExerciseNames", partId);
	}
	@Override
	public ExerciseDataBean getExeriseInfo(String name) {	
		return SqlMapClient.getSession().selectOne("MyPage.getExeriseInfo", name);
	}
	@Override
	public RegisterDataBean getRegisterData(String id) {
		return SqlMapClient.getSession().selectOne("MyPage.getRegisterData", id);
	}
	
	/*입력받은 아이디로 Data를 가져오는 쿼리문*/
	@Override
	public MemberDataBean getMemberData(String id) {
		return SqlMapClient.getSession().selectOne("MyPage.getMemberData", id);
	}
	@Override
	public int updateMember(MemberDataBean mdto) {
		return SqlMapClient.getSession().update("MyPage.updateMember", mdto);
	}
	@Override
	public int memberDelete(String id) {		
		return SqlMapClient.getSession().delete("MyPage.memberDelete", id);
	}
	
}
