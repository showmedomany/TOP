package chat;

import java.util.List;

public interface ChatDao {
	public int checkIp(String ip);
	public int insertRequest(RequestDataBean rdto);
	public int insertChat(ChatDataBean cdto);
	public List<ChatDataBean> getChat(String ip);
	public List<RequestDataBean> getRequest();
	public int searchRequest();
	public int responseChat(String ip);
	public int exitChat(String ip);
	
	
	//public int testchat(String ip);
}
