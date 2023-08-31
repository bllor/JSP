package kr.co.jboard2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.service.ArticleService;



@WebServlet("/view.do")
public class ViewController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	ArticleService service = ArticleService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
		logger.debug(no);
		
		ArticleDTO article = service.selectArticle(no);
		req.setAttribute("article", article);
		
		List<ArticleDTO> comments = service.selectComments(no);
		req.setAttribute("comments", comments);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view.jsp");
		dispatcher.forward(req, resp);
		
		
		
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String no = req.getParameter("no");
	String parent =req.getParameter("parent");
	String writer =req.getParameter("writer");
	String content =req.getParameter("content");
	String regip =req.getRemoteAddr();
	
	logger.debug(no);
	logger.debug(parent);
	logger.debug(writer);
	logger.debug(content);
	
	ArticleDTO dto = new ArticleDTO();
	dto.setParent(parent);
	dto.setContent(content);
	dto.setWriter(writer);
	dto.setRegip(regip);
	service.insertComment(dto);
	service.updateArticleForCommentPlus(no);
	
	resp.sendRedirect("/Jboard2/view.do?no="+no);
		
	}
	
}
