package comment;

import java.util.List;

public interface CommentDao {
	List<CommentDataBean> getComments(int num); //자유게시판리스트에 뿌려줄 게시글	
}
