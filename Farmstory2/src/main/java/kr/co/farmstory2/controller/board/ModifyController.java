package kr.co.farmstory2.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.FileDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.FileService;


@WebServlet("/board/modify.do")
public class ModifyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	ArticleService aService = ArticleService.getInstance();
	FileService fService = FileService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		logger.debug("no : "+no);
		logger.debug("group : "+group);
		logger.debug("cate : "+cate);
		
		ArticleDTO article = aService.selectArticle(no);
		
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("article", article);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		MultipartRequest mr = aService.uploadfile(req);
		
		String group = mr.getParameter("group");
		String cate = mr.getParameter("cate");
		
		String no = mr.getParameter("no");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String oName = mr.getOriginalFileName("file");//새로운 파일명
		logger.debug("file : "+oName);
		String ofile = mr.getParameter("ofile");//기존 파일명
		int file =0;
		if(oName!=null||ofile!=null) {
			//oName이 null이 아니거나 ofile이 null이 아닌 경우,
			//file이 있는 것이므로 1이 되어야 한다.
			file = 1;
		}
		String test ="파일 insert";
		
		
		logger.debug("PNo: "+no);
		logger.debug("Ptitle : "+title);
		logger.debug("Pcontent : "+content);
		
		logger.debug("ofile : "+ofile);
		logger.debug("oName : "+oName);
		ArticleDTO dto = new ArticleDTO();
		
		dto.setNo(no);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setFile(file);
		logger.debug("dto : "+dto.toString());
		aService.updateArticle(dto);
		
		
		//파일 테이블 insert
		if(oName!=null) {
			logger.debug(test);
		
			String sName = aService.renameTOFile(req, oName);
			FileDTO filedto = new FileDTO();
			filedto.setAno(no);
			filedto.setOfile(oName);
			filedto.setSfile(sName);
			fService.updateFile(filedto);
		
		}
	
		resp.sendRedirect("/Farmstory2/board/view.do?group="+group+"&cate="+cate+"&no="+no);
		
	}
	
	
	
}
