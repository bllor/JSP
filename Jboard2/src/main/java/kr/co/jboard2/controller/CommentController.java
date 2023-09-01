package kr.co.jboard2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;
import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.service.ArticleService;

@WebServlet("/comment.do")
public class CommentController extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	ArticleService service = ArticleService.INSTANCE;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//삭제할 때와 수정할 때 get을 사용할 것 같으므로, jsonData에서 구분을 한다.
		String kind = req.getParameter("kind");
		String no = req.getParameter("no");
		int result = 0;
		switch(kind) {
		case "REMOVE":
			result = service.deleteComment(no);
			break;
		}
	
		//JSON출력
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		resp.getWriter().print(json);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String parent =req.getParameter("parent");
		String writer =req.getParameter("writer");
		String content =req.getParameter("content");
		String regip =req.getRemoteAddr();
		
		
		logger.debug("parent :"+parent);
		logger.debug("writer :"+writer);
		logger.debug("content :"+content);
		
		ArticleDTO dto = new ArticleDTO();
		dto.setParent(parent);
		dto.setContent(content);
		dto.setWriter(writer);
		dto.setRegip(regip);
		
		//댓글입력
		int no =service.insertComment(dto);
		logger.debug("insertCommentNo :"+no);
		
		//댓글 카운터 수정
		service.updateArticleForCommentPlus(parent);
		
		/*
		 //리다이렉트는 폼전송용
		resp.sendRedirect("/Jboard2/view.do?no="+parent);
		ajax로 요청을 했으므로 json으로 보내야함
		*/
		
		//Json 출력(Ajax 요청)
		JsonObject json = new JsonObject();
		json.addProperty("no", no);
		resp.getWriter().print(json);
		
		
	}
}
