package kr.co.farmstory2.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.ArticleService;


@WebServlet("/board/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//현재 세션 가져오기
		HttpSession session = req.getSession();
		UserDTO sessUser = (UserDTO)session.getAttribute("sessUser");
		
		//데이터 수신
		String pg = req.getParameter("pg");
		String group= req.getParameter("group");
		String cate= req.getParameter("cate");

		//현재 페이지 번호
		int currentPage = service.getCurrentPage(pg);
		
		//전체 게시물 개수
		int total = service.selectCountTotal(cate);
		
		//마지막 페이지 번호
		int lastPageNum = service.getLastPageNum(total);
		
		//페이지 그룹 start, end 번호
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);
		
		//페이지 시작 번호
		int pageStartNum = service.getPageStartNum(total, currentPage);
		
		//시작 인덱스
		int start = service.getStartNum(currentPage);
		
		//글조회
		List<ArticleDTO> articles = service.selectArticles(cate,start);
		
		if(sessUser != null) {
			
			req.setAttribute("articles", articles);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("lastPageNum", lastPageNum);
			req.setAttribute("pageGroupStart", result[0]);
			req.setAttribute("pageGroupEnd", result[1]);
			req.setAttribute("pageStartNum", pageStartNum+1);
			req.setAttribute("cate", cate);
			req.setAttribute("group", group);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/board/list.jsp");
			dispatcher.forward(req, resp);
			
		}else {
			resp.sendRedirect("/Farmstory2/user/login.do?success=101");
		}
		
		
	}
	
	
	
}
