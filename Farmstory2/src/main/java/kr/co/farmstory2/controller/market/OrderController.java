package kr.co.farmstory2.controller.market;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/market/order.do")
public class OrderController extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String thumb2=req.getParameter("thumb2");
		String pName=req.getParameter("pName");
		String pNo=req.getParameter("pNo");
		String type=req.getParameter("type");
		String delivery=req.getParameter("delivery");
		String price=req.getParameter("price");
		String count=req.getParameter("count");
		String total=req.getParameter("total");
		String finalPrice = req.getParameter("final");
		
		req.setAttribute("thumb2", thumb2);
		req.setAttribute("pName", pName);
		req.setAttribute("pNo", pNo);
		req.setAttribute("type", type);
		req.setAttribute("delivery", delivery);
		req.setAttribute("price", price);
		req.setAttribute("count", count);
		req.setAttribute("total", total);
		req.setAttribute("finalPrice", finalPrice);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/market/order.jsp");
		dispatcher.forward(req, resp);
	}
}
