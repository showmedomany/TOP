package chat;

public interface RequestDao {
	//매개변수로 입력된 아이피가 테이블에 있는지 검색
	public int checkIp(String ip);
	//입력받은 RequestDataBean으로 요청테이블에 데이터 삽입
	public int insertRequest(RequestDataBean rdto);
	//상담이 끝나면 RequestDataBean을 지움
}
