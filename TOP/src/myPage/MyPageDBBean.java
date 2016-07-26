package myPage;

import java.util.List;

import mybatis.SqlMapClient;

public class MyPageDBBean implements MyPageDao {
	
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
	
}
