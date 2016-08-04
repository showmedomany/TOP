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

	
	
}
