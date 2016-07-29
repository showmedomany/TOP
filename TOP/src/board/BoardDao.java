package board;

import java.util.List;
import java.util.Map;

public interface BoardDao {
	
	public int getCount();
	List<BoardDataBean> getArticles(Map<String, Integer> map);
}
