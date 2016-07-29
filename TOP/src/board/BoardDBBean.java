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
}
