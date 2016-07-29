package chat;

import java.util.List;

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

	@Override
	public int insertChet(ChatDataBean cdto) {
		
		return SqlMapClient.getSession().insert("Rq.insertChat", cdto);
	}

	@Override
	public List<ChatDataBean> getChat(String ip) {		
		return SqlMapClient.getSession().selectList("Rq.getChat", ip);
	}

}
