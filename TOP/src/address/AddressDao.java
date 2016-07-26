package address;

import java.util.List;

public interface AddressDao {
	public int checkAddress(String adr);			//주소가 있는지 확인
	public List<AddressDataBean> getAddress(String adr);	//해당 주소로 검색
	public int serchadr(String area);  // zip DB 가져오기 	
}
