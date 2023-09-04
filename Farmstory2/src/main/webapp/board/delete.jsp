<%@page import="kr.co.farmstory2.dao.ArticleDAO"%>
<%@page import="kr.co.farmstory2.dto.ArticleDTO"%>
<%@ page  contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	
	String no = request.getParameter("no");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	
	ArticleDTO dto = new ArticleDTO();
	ArticleDAO dao = new ArticleDAO();
	
	dao.deleteArticle(no);
	
	response.sendRedirect("/Farmstory1/board/list.jsp?group="+group+"&cate="+cate);
%>