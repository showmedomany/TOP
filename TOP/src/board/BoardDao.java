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
	
	/*공지사항 검색*/
	public List<NoticeBoardDataBean> searhSubGetList(SearchDataBean sdto);
	public List<NoticeBoardDataBean> searhContentGetList(SearchDataBean sdto);
	public List<NoticeBoardDataBean> searhNickGetList(SearchDataBean sdto);
	/*
	public List<NoticeBoardDataBean> searhSubGetList(String msg);
	public List<NoticeBoardDataBean> searhContentGetList(String msg);
	public List<NoticeBoardDataBean> searhNickGetList(String msg);
	*/
	/*검색 전체 글수*/
	public int subCount(String msg);
	public int contentCount(String msg);
	public int nickCount(String msg);
}
