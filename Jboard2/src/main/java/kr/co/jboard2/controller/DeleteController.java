package kr.co.jboard2.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.service.ArticleService;
import kr.co.jboard2.service.FileService;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService aService = ArticleService.INSTANCE;
	private FileService fService = FileService.INSTANCE;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	//글번호 수신	
	String no = req.getParameter("no");
	logger.debug("no : "+no);
	
	
	
	//파일 삭제(DB)-sql에서 파일이 article테이블을 참조하므로 파일 먼저 삭제해야지 글을 삭제할 수 있다.
	int result = fService.deleteFile(no);
	
	//글+댓글 삭제
			aService.deleteArticle(no);
	
	//파일삭제(Directory)-폴더에 파일이 존재하지 않으면 에러가 발생할 수 있으므로 파일의 유무를 확인한다.
	//파일을 삭제할 때 executeUpdate에서 int값이 발생하는데,
	//int가 1이면 파일이 삭제되었다는 것이고, 0이면 파일이 없다는 것이므로 int값의 유무로 파일의 유무를 확인할 수 있다.
	//sName이 directory의 파일명이므로, 파일을 지울 때 용이하다.
	//deleteFile을 할 때 파일 명을 받는 것이 가장 좋다.
	if(result>0) {
		String path = aService.getFilePath(req);
		
		File file = new File(path+"/"+"파일명");
		
		if(file.exists()) {
			file.delete();
		}
	}
	
	
	
	
	resp.sendRedirect("/Jboard2/list.do");
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
}
