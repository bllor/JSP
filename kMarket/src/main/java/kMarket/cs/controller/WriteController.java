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

@WebServlet("/cs/board/write.do")
public class WriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
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
}
