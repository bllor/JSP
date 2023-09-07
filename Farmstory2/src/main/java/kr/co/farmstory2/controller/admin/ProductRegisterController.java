package kr.co.farmstory2.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;

import kr.co.farmstory2.dao.ProductDAO;
import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.ProductService;


@WebServlet("/admin/productRegister.do")
public class ProductRegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ProductService pService = ProductService.INSTANCE;
	private ArticleService aService = ArticleService.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/productRegister.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		MultipartRequest mr = aService.uploadfile(req);
		String path = aService.getFilePath(req);
		
		logger.debug("path : "+path);
		logger.debug("mr : "+mr.toString());
		
		
		String productName = mr.getParameter("productName");
		String type        = mr.getParameter("type");
		String price       = mr.getParameter("price");
		String delivery    = mr.getParameter("delivery");
		String stock       = mr.getParameter("stock");
		String thumb1      = mr.getOriginalFileName("thumb1");
		String thumb2      = mr.getOriginalFileName("thumb2");
		String thumb3      = mr.getOriginalFileName("thumb3");
		String seller      = mr.getParameter("seller");
		String etc         = mr.getParameter("etc");
		
		logger.debug("thumb1 : "+thumb1);
		logger.debug("thumb2 : "+thumb2);
		logger.debug("thumb3 : "+thumb3);
		
		ProductDTO dto = new ProductDTO();
		
		dto.setpName(productName);
		dto.setType(type);
		dto.setPrice(price);
		dto.setDelivery(delivery);
		dto.setStock(stock);
		dto.setThumb1ForRename(thumb1);
		dto.setThumb2ForRename(thumb2);
		dto.setThumb3ForRename(thumb3);
		dto.setSeller(seller);
		dto.setEtc(etc);
		
		/*
		ProductDTO dto = new ProductDTO(path);
		path의 경로에 
		*/
		
		logger.debug("dto : "+dto);
		//pService.insertProduct(dto);
		
		
		//resp.sendRedirect("/Farmstory2/admin/productList.do");
		
	}
	
}
