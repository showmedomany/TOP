package chat;

import java.util.List;

import mybatis.SqlMapClient;

public class ChatDBBean implements ChatDao {

	@Override
	public int checkIp(String ip) {
		
		return SqlMapClient.getSession().selectOne("Chat.checkIp", ip);
	}

	@Override
	public int insertRequest(RequestDataBean rdto) {
		
		return SqlMapClient.getSession().insert("Chat.insertRequest", rdto);
	}

	@Override
	public int insertChat(ChatDataBean cdto) {
		
		return SqlMapClient.getSession().insert("Chat.insertChat",cdto);
	}

	@Override
	public List<ChatDataBean> getChat(String ip) {
		
		return SqlMapClient.getSession().selectList("Chat.getChat", ip);
	}

	@Override
	public int searchRequest() {
		
		return SqlMapClient.getSession().selectOne("Chat.searchRequest");
	}

	@Override
	public List<RequestDataBean> getRequest() {
		
		return SqlMapClient.getSession().selectList("Chat.getRequest");
	}

}
