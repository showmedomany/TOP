package chat;

import mybatis.SqlMapClient;

public class RequestDBBean implements RequestDao {

	@Override
	public int checkIp(String ip) {
		
		return SqlMapClient.getSession().selectOne("Rq.checkIp", ip);
	}

	@Override
	public int insertRequest(RequestDataBean rdto) {
		
		return SqlMapClient.getSession().insert("Rq.insertRequest", rdto);
	}

}
