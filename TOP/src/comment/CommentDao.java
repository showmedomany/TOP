package comment;

import java.util.List;

public interface CommentDao {
	public List<CommentDataBean> getComments(int num); //자유게시판리스트에 뿌려줄 게시글
	public int writeComment(CommentDataBean cdto);	//코멘트 작성
	public int getCommentNum(int num);
}
