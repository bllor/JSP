package kr.co.farmstory2.controller.market;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.ProductService;

@WebServlet("/market/list.do")
public class ListController extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService aService = ArticleService.getInstance();
	private ProductService pService = ProductService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//현재 세션 가져오기
		HttpSession session = req.getSession();
		UserDTO sessUser = (UserDTO)session.getAttribute("sessUser");
		
		
		String pg = req.getParameter("pg");
		String type = req.getParameter("type");
		
		if(type==null) {
			type ="0";
		}
		
		//현재 페이지 번호
		int currentPage = aService.getCurrentPage(pg);
		
		//전체 게시물 개수
		int total = pService.selectCountProductsTotal(type);
		
		//마지막 페이지 번호
		int lastPageNum = aService.getLastPageNum(total);
		
		//페이지 그룹 start, end 번호
		int[] result = aService.getPageGroupNum(currentPage, lastPageNum);
		
		//페이지 시작 번호
		int pageStartNum = aService.getPageStartNum(total, currentPage);
		
		//시작 인덱스
		int start = aService.getStartNum(currentPage);
		
		//글조회
		List<ProductDTO> products = pService.selectProducts(type,start);
		logger.debug("products : "+products);
		if(sessUser != null) {
			
			req.setAttribute("products", products);
			req.setAttribute("total", total);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("lastPageNum", lastPageNum);
			req.setAttribute("pageGroupStart", result[0]);
			req.setAttribute("pageGroupEnd", result[1]);
			req.setAttribute("pageStartNum", pageStartNum+1);
			req.setAttribute("type", type);
			
			//보내기
			RequestDispatcher dispatcher = req.getRequestDispatcher("/market/list.jsp");
			dispatcher.forward(req, resp);
		}else {
			resp.sendRedirect("/Farmstory2/user/login.do?success=101");
		}
		
		
		
		
		
	}
	
}
