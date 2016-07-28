package board;

import mybatis.SqlMapClient;

public class BoardDBBean implements BoardDao {

	@Override
	public int insertArticle(BoardDataBean dto) {
		
		return SqlMapClient.getSession().insert("Board.insertArticle",dto);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
