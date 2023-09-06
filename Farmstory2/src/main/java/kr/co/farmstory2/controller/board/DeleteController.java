package kr.co.farmstory2.controller.board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.FileService;

@WebServlet("/board/delete.do")
public class DeleteController extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService aService = ArticleService.getInstance();
	private FileService fService = FileService.INSTANCE;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	String no = req.getParameter("no");
	String group = req.getParameter("group");
	String cate = req.getParameter("cate");

	logger.debug("no : "+no);
	logger.debug("group : "+group);
	logger.debug("cate : "+cate);
	
	//파일 삭제(DB) - SQL에서 파일이 ARTICLE 테이블을 참조하므로 파일 먼저 삭제해야지 글을 삭제할 수 있다.
	List<String> snames = fService.deleteFile(no);
	
	//글+댓글 삭제
	aService.deleteArticle(no);
	
	//파일 삭제
	if(!snames.isEmpty()) {
		String path = aService.getFilePath(req);
		for(String sname : snames) {
			
			File file = new File(path+"/"+sname);
			
			if(file.exists()) {
				file.delete();
				}
			}
		
		}
		resp.sendRedirect("/Farmstory2/board/list.do?group="+group+"&cate="+cate);
	
	
	}
	
}
