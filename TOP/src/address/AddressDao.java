package address;

public interface AddressDao {
	public int checkAddress(String adr);			//주소가 있는지 확인
	public AddressDataBean getAddress(String adr);	//해당 주소로 검색
}
