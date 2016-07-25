package member;

import mybatis.SqlMapClient;

public class MemberDBBean implements MemberDao {

	@Override
	public int checkMember(String id) {				
		return SqlMapClient.getSession().selectOne("Member.checkMember",id);
	}

	@Override
	public int loginMember(String id, String passwd) {
		int result;
		int check = checkMember(id);
		
		if(check != 0){
			MemberDataBean mdto = getMember(id);
			
			if(mdto.getPasswd().equals(passwd)){
				result = 1;
			}
			else{
				result = -1;
			}
		}
		else{
			result = 0;
		}		
		return result;
	}

	@Override
	public MemberDataBean getMember(String id) {		
		return SqlMapClient.getSession().selectOne("Member.getMember", id);
	}

	@Override
	public int getAuthority_id(String id) {		
		MemberDataBean mdto = getMember(id);
		return mdto.getAuthority_id();
	}

	@Override
	public int insertMember(MemberDataBean mdto) {		
		return SqlMapClient.getSession().insert("Member.insertMember",mdto);		
	}
}
