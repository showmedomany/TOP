package address;

import java.util.List;

import mybatis.SqlMapClient;

public class AddressDBBean implements AddressDao {

	@Override
	public int checkAddress(String adr) {
		String name = null;
		String dong = null;
		if(adr != null){
			if(adr.indexOf("동",adr.length()-1)==adr.length()-1
					||adr.indexOf("면",adr.length()-1)==adr.length()-1
					||adr.indexOf("읍",adr.length()-1)==adr.length()-1){
				
				name =adr.substring(0,adr.length()-1);
				dong =adr.substring(adr.length()-1,adr.length());
				adr = name + "%" + dong;				
			}
			else {
				adr = "%" + adr + "%";				
			}
			
		}
		return SqlMapClient.getSession().selectOne("Address.checkAddress", adr);
	}

	@Override
	public List<AddressDataBean> getAddress(String adr) {
		
		//Vector<ZipcodeBean> vdto = new Vector<ZipcodeBean>();
		List<AddressDataBean> alist = null;
		String name = null;
		String dong = null;
		if(adr != null){
			if(adr.indexOf("동",adr.length()-1)==adr.length()-1
					||adr.indexOf("면",adr.length()-1)==adr.length()-1
					||adr.indexOf("읍",adr.length()-1)==adr.length()-1){
				
				name =adr.substring(0,adr.length()-1);
				dong =adr.substring(adr.length()-1,adr.length());
				adr = name + "%" + dong;				
			}
			else {
				adr = "%" + adr + "%";				
			}
			
			alist = SqlMapClient.getSession().selectList("Address.getAddress", adr);
			
		}		
		
		return alist;
		
		
	}

	@Override
	public int serchadr(String area) {
		// TODO Auto-generated method stub
		return 0;
	}

}
