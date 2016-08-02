package administrator;

import java.util.List;
import java.util.Map;

import member.MemberDataBean;
import myPage.RegisterDataBean;
import mybatis.SqlMapClient;

public class AdminDBBean implements AdminDao {
	
	@Override
	public int insertFitnessUserSearchIDCheck(String searchMsg) {
		return SqlMapClient.getSession().selectOne("Admin.insertFitnessUserSearchIDCheck", searchMsg);
	}
	@Override
	public int insertFitnessUserSearchNickNameCheck(String searchMsg) {
		return SqlMapClient.getSession().selectOne("Admin.insertFitnessUserSearchNickNameCheck", searchMsg);
	}
	@Override
	public int insertFitnessUserSearchEmailCheck(String searchMsg) {
		return SqlMapClient.getSession().selectOne("Admin.insertFitnessUserSearchEmailCheck", searchMsg);
	}
	
	

	@Override
	public MemberDataBean insertFitnessUserSearchID(String searchMsg) {
		return SqlMapClient.getSession().selectOne("Admin.insertFitnessUserSearchID", searchMsg);
	}
	@Override
	public MemberDataBean insertFitnessUserSearchNickName(String searchMsg) {
		return SqlMapClient.getSession().selectOne("Admin.insertFitnessUserSearchNickName", searchMsg);
	}
	@Override
	public MemberDataBean insertFitnessUserSearchEmail(String searchMsg) {
		return SqlMapClient.getSession().selectOne("Admin.insertFitnessUserSearchEmail", searchMsg);
	}
	
	
	
	@Override
	public int getUserRegisterCheck(String userId) {		
		return SqlMapClient.getSession().selectOne("Admin.getUserRegisterCheck", userId);
	}	
	@Override
	public RegisterDataBean getUserRegister(String userId) {		
		return SqlMapClient.getSession().selectOne("Admin.getUserRegister", userId);
	}
	
	
	@Override
	public int getFitnessStartYear() {		
		return SqlMapClient.getSession().selectOne("Admin.getFitnessStartYear");
	}	
	@Override
	public List<String> getTrainerIdList() {		
		return SqlMapClient.getSession().selectList("Admin.getTrainerIdList");
	}
	
	
	
	
	
	
	
	
	
}
