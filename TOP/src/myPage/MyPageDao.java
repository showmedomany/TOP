package myPage;

import java.util.List;
import java.util.Map;

import member.MemberDataBean;

public interface MyPageDao {
	public int routineInfoIdCheck(String id);
	public RoutineInfoDataBean getUesrRoutineInfoData(String id);
	public List<MemberRoutineDataBean> getUserMemberRoutineList(int routineinfo_id);
	public List<RoutineDataBean> getRoutineData(String id);
	public List<ExerciseDataBean> getExerciseNames();
	
	public List<ExerciseDataBean> getExerciseNames(int partId);
	public ExerciseDataBean getExeriseInfo(String name);
	public RegisterDataBean getRegisterData(String id);
	public InbodyDataBean getInbodyData(String id);
	public MemberDataBean getMemberData(String id);
	
	/*인바디 휘트니스 루틴 등록확인*/
	public UserChecksDataBean uesrChecks(String id);
	
	/* 회원정보수정 */
	public int updateMember(MemberDataBean mdto);
	public int memberDelete(String id);
	
}
