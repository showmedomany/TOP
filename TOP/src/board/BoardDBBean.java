package board;

import java.util.List;
import java.util.Map;

import mybatis.SqlMapClient;

public class BoardDBBean implements BoardDao {


	public int getCount(){
		return SqlMapClient.getSession().selectOne("Board.getCount");
	}	
	public List<BoardDataBean> getArticles(Map<String, Integer> map){		
		return SqlMapClient.getSession().selectList("Board.getArticles", map);
	}
	@Override
	public int insertArticle(BoardDataBean dto) {
		
		return SqlMapClient.getSession().insert("Board.insertArticle",dto);
	}

	@Override
	public BoardDataBean getArticle(int num) {		
		return SqlMapClient.getSession().selectOne("Board.getArticle", num);
	}

	@Override
	public void addCount(int num) {		
		 SqlMapClient.getSession().update("Board.addCount",num);
	}
	

	@Override
	public int modifyArticle(BoardDataBean dto) {
		
		return SqlMapClient.getSession().update("Board.modifyArticle",dto);
	}

	
	@Override
	public int deleteArticle(int num) {		
			
		return SqlMapClient.getSession().delete("Board.deleteArticle", num);
		
	}
	
	
	
	/* 공지사항 */ 
	@Override
	public List<NoticeBoardDataBean> getNoticeBoardList(Map<String, Integer> startEndPage) {		
		return SqlMapClient.getSession().selectList("Board.getNoticeBoardList", startEndPage);
	}
	@Override
	public int getNoticeArticleCount() {		
		return SqlMapClient.getSession().selectOne("Board.getNoticeArticleCount");
	}
	@Override
	public void setNoticeReadcountPlus(int num) {
		SqlMapClient.getSession().update("Board.setNoticeReadcountPlus", num);
	}
	@Override
	public NoticeBoardDataBean getNoticeArticle(int num) {		
		return SqlMapClient.getSession().selectOne("Board.getNoticeArticle", num);
	}
	@Override
	public int insertNoticeArticle(Map<String, String> writeContent) {
		return SqlMapClient.getSession().insert("Board.insertNoticeArticle", writeContent);
	}	
	@Override
	public int updateNoticeArticle(NoticeBoardDataBean noticeBoardData) {		
		return SqlMapClient.getSession().update("Board.updateNoticeArticle", noticeBoardData);		
	}
	@Override
	public int deleteNoticeArticle(int num) {		
		return SqlMapClient.getSession().delete("Board.deleteNoticeArticle", num);
	}
	
	@Override
	public List<NoticeBoardDataBean> searhSubGetList(SearchDataBean sdto) {		
		return SqlMapClient.getSession().selectList("Board.searhSubGetList",sdto);
	}
	@Override
	public List<NoticeBoardDataBean> searhContentGetList(SearchDataBean sdto) {
		return SqlMapClient.getSession().selectList("Board.searhContentGetList",sdto);
	}
	@Override
	public List<NoticeBoardDataBean> searhNickGetList(SearchDataBean sdto) {
		return SqlMapClient.getSession().selectList("Board.searhNickGetList",sdto);
	}
	/*
	@Override
	public List<NoticeBoardDataBean> searhSubGetList(String msg) {		
		return SqlMapClient.getSession().selectList("Board.searhSubGetList",msg);
	}
	@Override
	public List<NoticeBoardDataBean> searhContentGetList(String msg) {
		return SqlMapClient.getSession().selectList("Board.searhContentGetList",msg);
	}
	@Override
	public List<NoticeBoardDataBean> searhNickGetList(String msg) {
		return SqlMapClient.getSession().selectList("Board.searhNickGetList",msg);
	}
	*/
	
	@Override
	public int subCount(String msg) {
		return SqlMapClient.getSession().selectOne("Board.subCount",msg);
	}
	@Override
	public int contentCount(String msg) {
		
		return SqlMapClient.getSession().selectOne("Board.contentCount",msg);
	}
	@Override
	public int nickCount(String msg) {
		
		return SqlMapClient.getSession().selectOne("Board.nickCount",msg);
	}
}
