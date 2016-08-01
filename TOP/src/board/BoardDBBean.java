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
	public int check(int num, String passwd) {
		
		return 0;
	}

	@Override
	public int modifyArticle(BoardDataBean dto) {
		
		return 0;
	}

	
	@Override
	public int deletArticle(int num) {
			int result = 0;
		
		BoardDataBean dto = getArticle(num);
		
		int count = SqlMapClient.getSession().selectOne("Board.replyCheck",dto);	
		
		if(count!=0){
			//답글이 있으므로 삭제 안됨
			result = -1;
		}
		else{
			//답글이 없으므로 삭제 가능
			
			SqlMapClient.getSession().update("Board.deleteReply", dto);
			
						
			
			result = SqlMapClient.getSession().delete("Board.deleteArticle", num);		
		}		
		return result;
		
	}
}
