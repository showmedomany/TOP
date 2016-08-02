package chat;

import java.util.List;

public interface ChatDao {
	public int checkIp(String ip);
	public int insertRequest(RequestDataBean rdto);
	public int insertChat(ChatDataBean cdto);
	public List<ChatDataBean> getChat(String ip);
}
