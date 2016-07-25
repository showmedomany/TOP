package myPage;

import mybatis.SqlMapClient;

public class MyPageDBBean implements MyPageDao {
	
	@Override
	public RoutineInfoDataBean getStartEndDate(String id) {
		return SqlMapClient.getSession().selectOne("MyPage.getStartEndDate", id); 
	}

}
