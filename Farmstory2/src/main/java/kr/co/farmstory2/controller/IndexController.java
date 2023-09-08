package kr.co.farmstory2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//시작페이지 index.jsp가 없기 때문에 기본 주소("")에 대한 매핑을 추가
//main 페이지가 index페이지인데 index.jsp로 들어갈 수 없으므로 기존 페이지에 매핑을 함
@WebServlet(value={"", "/index.do"})
public class IndexController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		dispatcher.forward(req, resp);
	}
	
}
