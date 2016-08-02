package administrator;


import java.util.List;
import java.util.Map;

import member.MemberDataBean;
import myPage.RegisterDataBean;

public interface AdminDao {
	public int insertFitnessUserSearchIDCheck(String searchMsg);
	public int insertFitnessUserSearchNickNameCheck(String searchMsg);
	public int insertFitnessUserSearchEmailCheck(String searchMsg);
	
	public MemberDataBean insertFitnessUserSearchID(String searchMsg);
	public MemberDataBean insertFitnessUserSearchNickName(String searchMsg);
	public MemberDataBean insertFitnessUserSearchEmail(String searchMsg);
	
	public int getUserRegisterCheck(String userId);
	public RegisterDataBean getUserRegister(String userId);
	
	public int getFitnessStartYear();
	public List<String> getTrainerIdList();
	

	
	
}
