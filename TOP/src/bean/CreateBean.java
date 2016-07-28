package bean;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import address.AddressDBBean;
import address.AddressDao;
import board.BoardDBBean;
import board.BoardDao;
import member.MemberDBBean;
import member.MemberDao;
import myPage.MyPageDBBean;
import myPage.MyPageDao;



@Configuration
public class CreateBean {
	
	@Bean
	public ViewResolver viewResolver() throws ClassNotFoundException{
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		Class<?> viewClass = Class.forName("org.springframework.web.servlet.view.JstlView");
		viewResolver.setViewClass(viewClass);
		viewResolver.setSuffix(".jsp");
		
		return viewResolver;		
	}
	
	@Bean
	public MemberDao memberDao(){
		//Controller.java에서 사용할 DBd의 Bean이름
		//@Resource(name = "memberDao") <---얘때문에 씀
		//private MemberDao memberDao;
		return new MemberDBBean();
	}
	@Bean
	public AddressDao adrDao(){
		return new AddressDBBean();
	}
	
	@Bean
	public MyPageDao myPageDao(){
		return new MyPageDBBean();
	}

	@Bean
	public BoardDao boardDao(){		
		return new BoardDBBean();
	}
	
	/*
	//DAO
	@Bean
	public MemberDao memberDao(){
		//Controller.java에서 사용할 DBd의 Bean이름
		//@Resource(name = "memberDao") <---얘때문에 씀
		//private MemberDao memberDao;
		return new MemberDBBean();
	}
	
	
	@Bean
	public MemberDao memberDao(){
		return new LogonDBBean();
	}
	
	*/
	/*이제 얘 안씀
	//DataSource
	@Bean
	public DataSource dataSource(){
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		dataSource.setUsername("khpm");
		dataSource.setPassword("khpm");
		dataSource.setInitialSize(10);
		dataSource.setMaxWait(3000);
		dataSource.setMaxActive(10);
		return dataSource;
	}
	
	//JdbcMemberDao
	@Bean
	public BoardDao boardDao(){
		BoardDBBean boardDao = new BoardDBBean();
		boardDao.setDataSource(dataSource());
		return boardDao;
	}
	
	@Bean
	public MemberDao memberDao(){
		LogonDBBean memberDao = new LogonDBBean();
		memberDao.setDataSource(dataSource());
		return memberDao;
	}
	*/
}
