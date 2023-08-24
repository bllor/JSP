<%@page import="kr.Farmstory1.dao.OrderDAO"%>
<%@page import="kr.Farmstory1.dto.OrderDTO"%>
<%@ page  contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String orderProduct = request.getParameter("orderProduct");
	String orderCount = request.getParameter("orderCount");
	String orderDelivery = request.getParameter("orderDelivery");
	String orderPrice = request.getParameter("orderPrice");
	String orderTotal = request.getParameter("orderTotal");
	String orderUser = request.getParameter("orderUser");
	String receiver = request.getParameter("receiver");
	String hp    = request.getParameter("hp");
	String zip   = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String etc   = request.getParameter("etc");
	
	OrderDTO dto = new OrderDTO();
	dto.setOrderProduct(orderProduct);
	dto.setOrderCount(orderCount);
	dto.setOrderDelivery(orderDelivery);
	dto.setOrderPrice(orderPrice);
	dto.setOrderTotal(orderTotal);
	dto.setReceiver(receiver);
	dto.setHp(hp);
	dto.setZip(zip);
	dto.setAddr1(addr1);
	dto.setAddr2(addr2);
	dto.setOrderEtc(etc);
	dto.setOrderUser(orderUser);
	
	OrderDAO dao = new OrderDAO();
	dao.insertOrder(dto);
	
	response.sendRedirect("/Farmstory1/market/list.jsp");
%>