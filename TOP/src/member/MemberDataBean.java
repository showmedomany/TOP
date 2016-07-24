package member;

public class MemberDataBean {
	
	private int authority_id;
	private String id;
	private String passwd;
	private String name;
	private String nickname;
	private String phone;
	private String zipcode;
	private String address;
	private String email;
	private String join_date;
	public int getAuthority_id() {
		return authority_id;
	}
	public String getId() {
		return id;
	}
	public String getPasswd() {
		return passwd;
	}
	public String getName() {
		return name;
	}
	public String getNickname() {
		return nickname;
	}
	public String getPhone() {
		return phone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public String getAddress() {
		return address;
	}
	public String getEmail() {
		return email;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setAuthority_id(int authority_id) {
		this.authority_id = authority_id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	
}
