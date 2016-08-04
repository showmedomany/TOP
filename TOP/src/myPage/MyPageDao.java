package myPage;

import java.util.List;
import member.MemberDataBean;

public interface MyPageDao {
	public int routineInfoIdCheck(String id);
	public RoutineInfoDataBean getStartEndDate(String id);
	public List<MemberRoutineDataBean> getWeekExerciseSchedule(String id);
	public List<ExerciseDataBean> getExerciseNames(int partId);
	public ExerciseDataBean getExeriseInfo(String name);
	public RegisterDataBean getRegisterData(String id);
	public InbodyDataBean getInbodyData(String id);
	public MemberDataBean getMemberData(String id);
	
	/* 회원정보수정 */
	public int updateMember(MemberDataBean mdto);
	public int memberDelete(String id);
	
}
