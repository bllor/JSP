package kr.co.farmstory2.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.FileDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.FileService;


@WebServlet("/board/fileDownload.do")
public class FileDownloadController extends HttpServlet {


	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private FileService fService = FileService.INSTANCE;
	private ArticleService aService = ArticleService.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fno = req.getParameter("fno");
		logger.debug("fno : "+fno);
		
		//파일 조회
		FileDTO dto = fService.selectFile(fno);
		
		//파일 다운로드
		aService.downloadfile(req, resp, dto);
	
		
	}

	
	
}
