package noticeboard;

import java.util.List;
import java.util.Map;

import board.SearchDataBean;

public interface NoticeBoardDao {
	
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
	
	/*검색 전체 글수*/
	public int NoticeSubCount(String msg);
	public int NoticeContentCount(String msg);
	public int NoticeNickCount(String msg);
}	
