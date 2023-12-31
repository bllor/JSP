package kr.co.farmstory2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.UserService;



@WebServlet("/user/login.do")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	UserService service = UserService.getInstance();

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//컨텍스트 경로(/Farmstory2) 전역 변수 (모든 컨트롤러에 선언)
	private String ctxPath;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// 컨텍스트 경로(/Farmstory2)구하기(최초 1번, 모든 컨트롤러에 정의)
		ctxPath =config.getServletContext().getContextPath();
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String success = req.getParameter("success");
		req.setAttribute("success", success);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user/login.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String pass = req.getParameter("pass");
		
		UserDTO user = service.selectUser(uid, pass);
		logger.debug("user :"+user);
		req.setAttribute("user", user);
		
		if(user != null) {
			logger.info("");
			// 현재 세션 구하기
			HttpSession session = req.getSession();
			
			// 사용자 세션 설정
			session.setAttribute("sessUser", user);
			
			// 컨텍스트 경로 전역변수를 이용한 리다이렉트
			resp.sendRedirect(ctxPath);
		}else {
			// 컨텍스트 경로 전역변수를 이용한 리다이렉트
			resp.sendRedirect(ctxPath+"/user/login.do?success=100");
		}
		
		
	}
	
}
