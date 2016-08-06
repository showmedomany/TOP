package noticeboard;

import java.util.List;
import java.util.Map;

import board.SearchDataBean;
import mybatis.SqlMapClient;

public class NoticeBoardDBBean implements NoticeBoardDao {

	/* 공지사항 */ 
	@Override
	public List<NoticeBoardDataBean> getNoticeBoardList(Map<String, Integer> startEndPage) {		
		return SqlMapClient.getSession().selectList("NoticeBoard.getNoticeBoardList", startEndPage);
	}
	@Override
	public int getNoticeArticleCount() {		
		return SqlMapClient.getSession().selectOne("NoticeBoard.getNoticeArticleCount");
	}
	@Override
	public void setNoticeReadcountPlus(int num) {
		SqlMapClient.getSession().update("NoticeBoard.setNoticeReadcountPlus", num);
	}
	@Override
	public NoticeBoardDataBean getNoticeArticle(int num) {		
		return SqlMapClient.getSession().selectOne("NoticeBoard.getNoticeArticle", num);
	}
	@Override
	public int insertNoticeArticle(Map<String, String> writeContent) {
		return SqlMapClient.getSession().insert("NoticeBoard.insertNoticeArticle", writeContent);
	}	
	@Override
	public int updateNoticeArticle(NoticeBoardDataBean noticeBoardData) {		
		return SqlMapClient.getSession().update("NoticeBoard.updateNoticeArticle", noticeBoardData);		
	}
	@Override
	public int deleteNoticeArticle(int num) {		
		return SqlMapClient.getSession().delete("NoticeBoard.deleteNoticeArticle", num);
	}
	
	@Override
	public List<NoticeBoardDataBean> searhSubGetList(SearchDataBean sdto) {		
		return SqlMapClient.getSession().selectList("NoticeBoard.searhSubGetList",sdto);
	}
	@Override
	public List<NoticeBoardDataBean> searhContentGetList(SearchDataBean sdto) {
		return SqlMapClient.getSession().selectList("NoticeBoard.searhContentGetList",sdto);
	}
	@Override
	public List<NoticeBoardDataBean> searhNickGetList(SearchDataBean sdto) {
		return SqlMapClient.getSession().selectList("NoticeBoard.searhNickGetList",sdto);
	}
	
	@Override
	public int NoticeSubCount(String msg) {
		return SqlMapClient.getSession().selectOne("NoticeBoard.subCount",msg);
	}
	@Override
	public int NoticeContentCount(String msg) {
		
		return SqlMapClient.getSession().selectOne("NoticeBoard.contentCount",msg);
	}
	@Override
	public int NoticeNickCount(String msg) {
		
		return SqlMapClient.getSession().selectOne("NoticeBoard.nickCount",msg);
	}

}
