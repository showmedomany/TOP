package member;

public interface MemberDao {
	public int checkMember(String id);					//회원이 있는지 검색
	public int loginMember(String id, String passwd);	//checkMember로 검색후 입력받은 passwd를 비교
	public MemberDataBean getMember(String id);			//해당 회원의 Data가져오기
	public int getAuthority_id(String id);
	//public int insertMember(MemberDataBean mdto);		//회원의 Data를 토대로 회원가입
	//public int modifyMember(MemberDataBean mdto);		//회원의 Data를 토대로 회원정보수정
}
