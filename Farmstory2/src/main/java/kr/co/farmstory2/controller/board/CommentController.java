package kr.co.farmstory2.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.service.ArticleService;

@WebServlet("/board/comment.do")
public class CommentController extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String kind = req.getParameter("kind");
		String no = req.getParameter("no");
		String content = req.getParameter("content");
		
		logger.debug("no : "+no);
		logger.debug("content : "+content);
		int result = 0;
		switch(kind) {
		case"REMOVE":
			result = service.deleteComment(no);
			break;
		case"MODIFY":
			result = service.updateComment(no,content);
		
		}
		logger.debug("Result : "+result);
		//Json 출력
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		resp.getWriter().print(json);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String parent = req.getParameter("parent");
		String writer = req.getParameter("writer");
		String cate = req.getParameter("cate");
		String content = req.getParameter("content");
		String regip = req.getRemoteAddr();
		
		logger.debug("no : "+parent);
		logger.debug("writer : "+writer);
		logger.debug("cate : "+cate);
		logger.debug("content : "+content);
		
		ArticleDTO dto = new ArticleDTO();
		dto.setParent(parent);
		dto.setWriter(writer);
		dto.setCate(cate);
		dto.setContent(content);
		dto.setRegip(regip);
		
		int no  = service.insertComment(dto);
		
		//Json 출력(ajax 요청)
		JsonObject json = new JsonObject();
		json.addProperty("no", no);
		resp.getWriter().print(json);
		
		
	}
	
}
