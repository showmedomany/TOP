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
	@Override
	public int updateFitnessInfo(RegisterDataBean registerData) {		
		return SqlMapClient.getSession().update("Admin.updateFitnessInfo", registerData);
	}
	@Override
	public int insertFitnessInfo(RegisterDataBean registerData) {		
		return SqlMapClient.getSession().update("Admin.insertFitnessInfo", registerData);
	}
	@Override
	public int getMemberDataCount() {		
		return SqlMapClient.getSession().selectOne("Admin.getMemberDataCount");
	}
	@Override
	public List<MemberDataBean> getMemberList(Map<String, Integer> startEndPage) {		
		return SqlMapClient.getSession().selectList("Admin.getMemberList", startEndPage);
	}
	@Override
	public int getNameSearchCount(String searchMessage) {
		return SqlMapClient.getSession().selectOne("Admin.getNameSearchCount", searchMessage);
	}
	@Override
	public int getIdSearchCount(String searchMessage) {
		return SqlMapClient.getSession().selectOne("Admin.getIdSearchCount", searchMessage);
	}
	@Override
	public int getNickNameSearchCount(String searchMessage) {
		return SqlMapClient.getSession().selectOne("Admin.getNickNameSearchCount", searchMessage);
	}
	/*
	@Override
	public List<MemberDataBean> getMemberSearchNameList(Map<String, String> startEndPage) {
		return SqlMapClient.getSession().selectList("Admin.getMemberSearchNameList", startEndPage);
	}
	@Override
	public List<MemberDataBean> getMemberSearchIdList(Map<String, String> startEndPage) {
		return SqlMapClient.getSession().selectList("Admin.getMemberSearchIdList", startEndPage);
	}
	@Override
	public List<MemberDataBean> getMemberSearchNickNameList(Map<String, String> startEndPage) {
		return SqlMapClient.getSession().selectList("Admin.getMemberSearchNickNameList", startEndPage);
	}
	*/
	@Override
	public List<MemberDataBean> getMemberSearchNameList(String searchMessage) {
		return SqlMapClient.getSession().selectList("Admin.getMemberSearchNameList", searchMessage);
	}
	@Override
	public List<MemberDataBean> getMemberSearchIdList(String searchMessage) {
		return null;
	}
	@Override
	public List<MemberDataBean> getMemberSearchNickNameList(String searchMessage) {
		return null;
	}

	
	
	
	
	
	
	
	
	
}
