package comment;

import java.util.List;

import mybatis.SqlMapClient;

public class CommentDBBean implements CommentDao {

	@Override
	public List<CommentDataBean> getComments(int num) {		
		return SqlMapClient.getSession().selectList("Comment.getComments", num);
	}

	@Override
	public int writeComment(CommentDataBean cdto) {
		
		return SqlMapClient.getSession().insert("Comment.writeComment", cdto);
	}

}
