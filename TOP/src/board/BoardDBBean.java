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
	
	/*자유게시판검색시검색된항목수*/
	@Override
	public int BoardsubCount(String msg) {
		return SqlMapClient.getSession().selectOne("Board.BoardsubCount",msg);
	}
	@Override
	public int BoardcontentCount(String msg) {
		return SqlMapClient.getSession().selectOne("Board.BoardcontentCount",msg);
	}
	@Override
	public int BoardnickCount(String msg) {
		return SqlMapClient.getSession().selectOne("Board.BoardnickCount",msg);
	}
	
	/*자유게시판 검색*/
	@Override
	public List<BoardDataBean> BoardsubSearch(SearchDataBean sdto) {
		return SqlMapClient.getSession().selectList("Board.BoardsubSearch",sdto);
	}
	@Override
	public List<BoardDataBean> BoardcontentSearch(SearchDataBean sdto) {
		return SqlMapClient.getSession().selectList("Board.BoardcontentSearch",sdto);
	}
	@Override
	public List<BoardDataBean> BoardnickSearch(SearchDataBean sdto) {
		return SqlMapClient.getSession().selectList("Board.BoardnickSearch",sdto);
	}
}
