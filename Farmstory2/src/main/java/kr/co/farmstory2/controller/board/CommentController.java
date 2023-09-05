package kr.co.farmstory2.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.service.ArticleService;

@WebServlet("/board/comment.do")
public class CommentController extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/view.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String no = req.getParameter("no");
		String writer = req.getParameter("uid");
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String content = req.getParameter("content");
		String regip = req.getRemoteAddr();
		
		logger.debug("no : "+no);
		logger.debug("uid : "+writer);
		logger.debug("group : "+group);
		logger.debug("cate : "+cate);
		logger.debug("content : "+content);
		
		ArticleDTO dto = new ArticleDTO();
		dto.setParent(no);
		dto.setWriter(writer);
		dto.setCate(cate);
		dto.setContent(content);
		dto.setRegip(regip);
		
		service.insertComment(dto);
		
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		resp.sendRedirect("/Farmstory2/board/view.do?group="+group+"&cate="+cate+"&no="+no);
		
		
		
	}
	
}
