package handler;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDao;
import board.FAQDataBean;

@Controller
public class FAQController {
	
	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	@RequestMapping("/vt_FAQ")
	public ModelAndView vt_FAQ(HttpServletRequest request, 
			HttpServletResponse response){
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);
		
		List<FAQDataBean> faqDataList = new ArrayList<FAQDataBean>();
		String center = "/vtFrame/vt_sideMenuForm"; 
		String menu = "/vt_board/vt_FAQ";
		String word = "/vt_board/word/FNQ";
		
		int pageSize = 10;		// 페이지 크기		
		int currentPage = 0;	// 현재 페이지
		int pageCount = 0;		// 전체 페이지 수
		int start = 0;			//(블럭)시작 페이지
		int end = 0;			//(블럭)끝 페이지
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("0")){
			pageNum = "1";
		}
		request.setAttribute("pageNum", pageNum);		
		int faqCount = boardDao.getFaqCount();			
		
		if(faqCount == 0){			
			request.setAttribute("pageCount", 1);
			request.setAttribute("faqCount", faqCount);			
			request.setAttribute("center", center);
			request.setAttribute("menu", menu);	
		}else{
			//페이지 공식 구하기 
			currentPage = Integer.parseInt(pageNum);
			start = (currentPage - 1) * pageSize + 1;
			end = start + pageSize - 1;		
			
			//페이지 수 값 구하기
			pageCount = faqCount/10;
			if(faqCount%10!=0){
				pageCount+=1;
			}
			
			//해당 페이지 start ~ end 만큼 표시하기
			Map<String, Integer> startEndPage = new HashMap<String, Integer>();
			startEndPage.put("start", start);
			startEndPage.put("end", end);		
			faqDataList = boardDao.getFaqDataList(startEndPage);		
			
			request.setAttribute("faqDataList", faqDataList);
			request.setAttribute("articleCount", faqCount);			
			request.setAttribute("pageSize", pageSize);		
			request.setAttribute("pageCount", pageCount);
			
		}
		request.setAttribute("word",word);
		request.setAttribute("menu",menu);
		request.setAttribute("center",center);
		
		request.setAttribute("search", "0");
		return new ModelAndView("/vtFrame/vtFrame");
	}
	@RequestMapping("/vt_FAQSearch")
	public ModelAndView vt_FAQSearch(HttpServletRequest request, 
			HttpServletResponse response){		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String top = "/vtFrame/changeimages/coimage";
		request.setAttribute("top", top);
		String selectOption = request.getParameter("selectOption");		
		String msg = request.getParameter("msg");	
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("0")){
			pageNum = "1";
		}
		request.setAttribute("pageNum", pageNum);		
		
		List<FAQDataBean> faqDataList = new ArrayList<FAQDataBean>();
		String center = "/vtFrame/vt_sideMenuForm"; 
		String menu = "/vt_board/vt_FAQ";
		String word = "/vt_board/word/FNQ";
		request.setAttribute("word",word);
		request.setAttribute("menu",menu);
		request.setAttribute("center",center);
		
		int pageSize = 10;		// 페이지 크기			
		int currentPage = 0;	// 현재 페이지
		int pageCount = 0;		// 전체 페이지 수
		int start = 0;			//(블럭)시작 페이지
		int end = 0;			//(블럭)끝 페이지		
		
		if(selectOption.equals("all")){			
			int faqCount = boardDao.getFaqSearchCount(("%"+msg+"%"));			
			if(faqCount == 0){			
				request.setAttribute("pageCount", 1);
				request.setAttribute("faqCount", faqCount);				
			}else{
				//페이지 공식 구하기 
				currentPage = Integer.parseInt(pageNum);
				start = (currentPage - 1) * pageSize + 1;
				end = start + pageSize - 1;				
				
				//페이지 수 값 구하기
				pageCount = faqCount/10;
				if(faqCount%10!=0){
					pageCount+=1;
				}
				
				//해당 페이지 start ~ end 만큼 표시하기
				Map<String, String> startEndPageAll = new HashMap<String, String>();
				startEndPageAll.put("start", start+"");
				startEndPageAll.put("end", end+"");
				startEndPageAll.put("msg", "%"+msg+"%");
				faqDataList = boardDao.getFaqDataListAll(startEndPageAll);				
				
				request.setAttribute("faqDataList", faqDataList);
				request.setAttribute("faqCount", faqCount);			
				request.setAttribute("pageSize", pageSize);			
				request.setAttribute("pageCount", pageCount);
			}		
		}else{			
			Map<String, String> map = new HashMap<String, String>();
			map.put("selectOption", selectOption);
			map.put("msg", "%"+msg+"%");
			
			int faqCount = boardDao.getFaqSelectSearchCount(map);
			
			if(faqCount == 0){			
				request.setAttribute("pageCount", 1);
				request.setAttribute("faqCount", faqCount);				
			}else{
				//페이지 공식 구하기 
				currentPage = Integer.parseInt(pageNum);
				start = (currentPage - 1) * pageSize + 1;
				end = start + pageSize - 1;				
				
				//페이지 수 값 구하기
				pageCount = faqCount/10;
				if(faqCount%10!=0){
					pageCount+=1;
				}
				map.clear();
				map.put("start", start+"");
				map.put("end", end+"");
				map.put("msg", "%"+msg+"%");
				map.put("selectOption", selectOption);
				faqDataList = boardDao.getFaqDataSelectList(map);
				request.setAttribute("faqDataList", faqDataList);
			}
		}
			
			
			
		
		request.setAttribute("search", "1");
		request.setAttribute("selectOption", selectOption);
		request.setAttribute("msg", msg);
		return new ModelAndView("/vtFrame/vtFrame");
	
	}
	

}
