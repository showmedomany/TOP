package administrator;


import java.util.List;
import java.util.Map;

import member.MemberDataBean;
import myPage.RegisterDataBean;

public interface AdminDao {
	public int insertFitnessUserSearchIDCheck(String id);	
	public RegisterDataBean insertFitnessUserSearchID(String id);
	
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

	
	/* 인바디 등록확인 */
	public int getInbodyCheck(String id);
	
}
