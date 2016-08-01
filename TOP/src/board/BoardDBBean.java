package board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

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
}
