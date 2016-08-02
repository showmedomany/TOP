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
	
	/*공지사항*/
	public List<NoticeBoardDataBean> getNoticeBoardList(Map<String, Integer> startEndPage);	
	public int getNoticeArticleCount();
	public void setNoticeReadcountPlus(int num);
	public NoticeBoardDataBean getNoticeArticle(int num);
	public int insertNoticeArticle(Map<String, String> writeContent);
	public int updateNoticeArticle(NoticeBoardDataBean noticeBoardData);
	public int deleteNoticeArticle(int num);
}
