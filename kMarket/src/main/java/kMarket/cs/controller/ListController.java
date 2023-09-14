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

@WebServlet("/cs/board/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String type ="list";
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("type", type);
		logger.debug("cate : "+cate );
		logger.debug("type : "+type);
		
		RequestDispatcher dispatcher = null;
		if(group.equals("faq")) {
			 dispatcher = req.getRequestDispatcher("/cs/board/faqList.jsp");
		}else {
			dispatcher = req.getRequestDispatcher("/cs/board/list.jsp");
		}
	
		dispatcher.forward(req, resp);
		
	}
	
}
