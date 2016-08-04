package myPage;

import java.util.List;

import member.MemberDataBean;
import mybatis.SqlMapClient;

public class MyPageDBBean implements MyPageDao {
	@Override
	public int routineInfoIdCheck(String id) {	
		return SqlMapClient.getSession().selectOne("MyPage.routineInfoIdCheck", id);
	}	
	@Override
	public RoutineInfoDataBean getStartEndDate(String id) {
		return SqlMapClient.getSession().selectOne("MyPage.getStartEndDate", id); 
	}
	public List<MemberRoutineDataBean> getWeekExerciseSchedule(String id){
		return SqlMapClient.getSession().selectList("MyPage.getWeekExerciseSchedule", id);	
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
	@Override
	public InbodyDataBean getInbodyData(String id) {
		return SqlMapClient.getSession().selectOne("MyPage.getInbodyData", id);
	}
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
