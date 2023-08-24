package controller.user1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.User1DTO;
import service.User1service;

@WebServlet("/user1/register.do")
public class RegisterController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	private User1service service = new User1service();
	
	public void init(ServletConfig config) throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 RequestDispatcher dispather = request.getRequestDispatcher("/user1/register.jsp");
		 dispather.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//request.setCharacterEncoding("UTF-8");
		//수신하기 전에 매번 처리해야 하지만 필터처리를 함
		String uid = request.getParameter("uid");
		String name = request.getParameter("name");
		String hp = request.getParameter("hp");
		String age = request.getParameter("age");
//		try {} catch (Exception e) {}
		//try catch는 다오가 진행
		
		User1DTO dto = new User1DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAge(age);
		
		service.insertUser1(dto);
		
		response.sendRedirect("/Ch10/user1/list.do");
	
	}

}
