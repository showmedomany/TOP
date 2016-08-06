package bean;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import address.AddressDBBean;
import address.AddressDao;
import administrator.AdminDBBean;
import administrator.AdminDao;
import board.BoardDBBean;
import board.BoardDao;
import chat.ChatDBBean;
import chat.ChatDao;
import comment.CommentDBBean;
import comment.CommentDao;
import exercise.ExerciseDBBean;
import exercise.ExerciseDao;
import member.MemberDBBean;
import member.MemberDao;
import myPage.MyPageDBBean;
import myPage.MyPageDao;
import noticeboard.NoticeBoardDBBean;
import noticeboard.NoticeBoardDao;



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
	@Bean
	public CommentDao commentDao(){
		return new CommentDBBean();
	}
	@Bean
	public NoticeBoardDao noticeboardDao(){		
		return new NoticeBoardDBBean();
	}
	@Bean
	public AdminDao adminDao(){
		return new AdminDBBean();
	}
	
	@Bean
	public ChatDao chatDao(){
		return new ChatDBBean();
	}
	
	@Bean
	public ExerciseDao exerciseDao(){
		return new ExerciseDBBean();
	}
}