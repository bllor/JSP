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

import kMarket.cs.dto.CsArticleDTO;
import kMarket.cs.dto.FileDTO;
import kMarket.cs.service.CsArticleService;
import kMarket.cs.service.FileService;

@WebServlet("/cs/board/write.do")
public class WriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	CsArticleService aService = CsArticleService.INSTANCE;
	FileService fService = FileService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String type = "write";
		
		logger.debug("group : "+group);
		logger.debug("cate : "+cate);
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("type", type);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/board/write.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//파일 업로드
				String path = aService.getPath(req, "/upload");
				logger.debug("path : "+path);
				
				
				MultipartRequest mr = aService.uploadfile(req, path);
				
				 
				String writer = mr.getParameter("writer");
				String title = mr.getParameter("title");
				String content = mr.getParameter("content");
				String oName = mr.getOriginalFileName("file");
				String cate = mr.getParameter("cate");
				String group = mr.getParameter("group");
				String type = mr.getParameter("type");
				String regip = req.getRemoteAddr();
				
				logger.debug("writer : "+writer);
				logger.debug("title : "+title);
				logger.debug("content : "+content);
				logger.debug("cate : "+cate);
				logger.debug("group : "+group);
				logger.debug("type : "+type);
				
				CsArticleDTO dto = new CsArticleDTO();
				dto.setWriter(writer);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setFile(oName);
				dto.setCate(cate);
				dto.setRegip(regip);
				int no  = aService.insertArticle(dto);
				logger.debug("no : "+no);
				
				
				//파일명 수정 및 파일 테이블
					if(oName!=null) {
					
					String sName = aService.renameToFile(req, oName, path);
					FileDTO filedto = new FileDTO();
					filedto.setAno(no);
					filedto.setOfile(oName);
					filedto.setSfile(sName);
					fService.insertFile(filedto);
					
					}
				
				resp.sendRedirect("/kMarket/cs/board/list.do?group="+group+"&type="+type+"&cate="+cate);
		
	}
	
}
