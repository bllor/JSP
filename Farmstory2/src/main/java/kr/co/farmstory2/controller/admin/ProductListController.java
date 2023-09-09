package kr.co.farmstory2.controller.admin;

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

import kr.co.farmstory2.dao.ProductDAO;
import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.ProductService;


@WebServlet("/admin/productList.do")
public class ProductListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	ProductService pService = ProductService.INSTANCE;
	ArticleService aService = ArticleService.getInstance();
	ProductDAO dao = ProductDAO.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		UserDTO sessUser = (UserDTO)session.getAttribute("sessUser");
		logger.debug("sessUser: "+sessUser);
		
		String type = "0";
		String pg = req.getParameter("pg");
		
		//현재 페이지 번호
		int currentPage = aService.getCurrentPage(pg);
		logger.debug("currentPage : "+currentPage);
		//전체 게시물 개수
		int total = pService.selectCountProductsTotal(type);
		logger.debug("total	 : "+total);
		
		//마지막 페이지 번호
		int lastPageNum = aService.getLastPageNum(total);
		logger.debug("lastPageNum : "+lastPageNum);

		//페이지 그룹 start, end 번호
		int[] result = aService.getPageGroupNum(currentPage, lastPageNum);
		logger.debug("pageGroupStart: "+result[0]);
		logger.debug("pageGroupEnd : "+result[1]);

		//페이지 시작 번호
		int pageStartNum = aService.getPageStartNum(total, currentPage);
		logger.debug("PageStartNum : "+pageStartNum);

		//시작 인덱스
		int start = aService.getStartNum(currentPage);
		logger.debug("start: "+start);

		//글조회
		List<ProductDTO> products = pService.selectProducts(type, start);
		if(sessUser!=null) {
			req.setAttribute("products", products);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("lastPageNum", lastPageNum);
			req.setAttribute("pageGroupStart", result[0]);
			req.setAttribute("pageGroupEnd", result[1]);
			req.setAttribute("pageStartNum", pageStartNum+1);
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/productList.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	
}
