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

	@Override
	public int getCommentNum(int num) {
		
		return SqlMapClient.getSession().selectOne("Comment.getCommentNum", num);
	}

	@Override
	public int deletComment(int comment_id) {
		return SqlMapClient.getSession().delete("Comment.deleteComment", comment_id);
	}

}
