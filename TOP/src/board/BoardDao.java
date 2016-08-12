package board;

import java.util.List;
import java.util.Map;



public interface BoardDao {
	public int getCount();	//자유게시판 글 개수
	List<BoardDataBean> getArticles(Map<String, Integer> map); //자유게시판리스트에 뿌려줄 게시글	
	public int insertArticle(BoardDataBean dto);	//자유게시글 작성
	public BoardDataBean getArticle(int num);	//선택된 게시글 보기
	public void addCount(int num);				//자유게시판 조회수
	public int modifyArticle(BoardDataBean dto);	//자유게시판 수정
	public int deleteArticle (int num);			//자유게시판 삭제
	/*자유게시판 검색*/
	public List<BoardDataBean> BoardsubSearch(SearchDataBean sdto);	//자유게시판 제목검색시 리스트에 뿌려줄 게시글
	public List<BoardDataBean> BoardcontentSearch(SearchDataBean sdto);	//자유게시판 내용검색시 리스트에 뿌려줄 게시글
	public List<BoardDataBean> BoardnickSearch(SearchDataBean sdto);	//자유게시판 내용검색시 리스트에 뿌려줄 게시글
	/*자유게시판 검색글수*/
	public int BoardsubCount(String msg);	//자유게시판 제목검색글수
	public int BoardcontentCount(String msg);	//자유게시판 내용검색글수
	public int BoardnickCount(String msg);	//자유게시판 닉네임 검색글수
	
	
	
	
	
	/* faq 게시판 */
	public int getFaqCount();
	public List<FAQDataBean> getFaqDataList(Map<String, Integer> startEndPage);
	public int getFaqSearchCount(String msg);
	public List<FAQDataBean> getFaqDataListAll(Map<String, String> startEndPageAll);
	public int getFaqMemberCount(String msg);
	
	
	
	public int getFaqSelectSearchCount(Map<String, String> map);
	public List<FAQDataBean> getFaqDataSelectList(Map<String, String> map);

}
