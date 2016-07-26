package myPage;

import java.util.List;

public interface MyPageDao {
	public RoutineInfoDataBean getStartEndDate(String id);
	public List<MemberRoutineDataBean> getWeekExerciseSchedule(String id);
	public List<ExerciseDataBean> getExerciseNames(int partId);
	public ExerciseDataBean getExeriseInfo(String name);
	public RegisterDataBean getRegisterData(String id);
	public InbodyDataBean getInbodyData(String id);
}
