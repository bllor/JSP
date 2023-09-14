package kMarket.cs.controller;

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

import kMarket.cs.dto.CSDTO;
import kMarket.cs.dto.FileDTO;
import kMarket.cs.service.CumtomerService;
import kMarket.cs.service.FileService;

@WebServlet("/cs/notice/write.do")
public class ContentNoticeWriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	CumtomerService cService = CumtomerService.INSTANCE;
	FileService fService = FileService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/notice/write.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//파일 업로드
		String path = cService.getPath(req, "/upload");
		logger.debug("path : "+path);
		
		
		MultipartRequest mr = cService.uploadfile(req, path);
		
		 
		String writer = mr.getParameter("writer");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String oName = mr.getOriginalFileName("file");
		String cCate = mr.getParameter("cCate");
		String regip = req.getRemoteAddr();
		
		logger.debug("writer : "+writer);
		logger.debug("title : "+title);
		logger.debug("content : "+content);
		logger.debug("cCate : "+cCate);
		
		CSDTO dto = new CSDTO();
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setFile(oName);
		dto.setcCate(cCate);
		dto.setRegip(regip);
		int no  = cService.insertArticle(dto);
		logger.debug("no : "+no);
		
		
		//파일명 수정 및 파일 테이블
			if(oName!=null) {
			
			String sName = cService.renameToFile(req, oName, path);
			FileDTO filedto = new FileDTO();
			filedto.setAno(no);
			filedto.setOfile(oName);
			filedto.setSfile(sName);
			fService.insertFile(filedto);
			
			}
		
		resp.sendRedirect("/kMarket/cs/notice/list.do");
		
	}
	
}
