package administrator;

import java.util.List;
import java.util.Map;

import member.MemberDataBean;
import myPage.RegisterDataBean;
import mybatis.SqlMapClient;

public class AdminDBBean implements AdminDao {
	
	@Override
	public int insertFitnessUserSearchIDCheck(String id) {
		return SqlMapClient.getSession().selectOne("Admin.insertFitnessUserSearchIDCheck", id);
	}
	@Override
	public RegisterDataBean insertFitnessUserSearchID(String id) {
		return SqlMapClient.getSession().selectOne("Admin.insertFitnessUserSearchID", id);
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
	@Override
	public List<MemberDataBean> getMemberSearchNameList(String searchMessage) {
		return SqlMapClient.getSession().selectList("Admin.getMemberSearchNameList", searchMessage);
	}
	@Override
	public List<MemberDataBean> getMemberSearchIdList(String searchMessage) {
		return SqlMapClient.getSession().selectList("Admin.getMemberSearchIdList", searchMessage);
	}
	@Override
	public List<MemberDataBean> getMemberSearchNickNameList(String searchMessage) {
		return SqlMapClient.getSession().selectList("Admin.getMemberSearchNickNameList", searchMessage);
	}
	
	/* 인바디 정보 등록 확인 */
	@Override
	public int getInbodyCheck(String id) {		
		return SqlMapClient.getSession().selectOne("Admin.getInbodyCheck", id);
	}

	
	
	
	
	
	
	
	
	
}
