package board;

import java.util.List;
import java.util.Map;

public interface BoardDao {
	public int getCount();
	List<BoardDataBean> getArticles(Map<String, Integer> map);	
	public int insertArticle(BoardDataBean dto);	
	public BoardDataBean getArticle(int num);
	public void addCount(int num);	
	public int modifyArticle(BoardDataBean dto);
	public int deleteArticle (int num);
}
