<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no 		= request.getParameter("no");
	String title 	= request.getParameter("title");
	String content	= request.getParameter("content");
	String file  	= request.getParameter("file");
	String regip 	= request.getRemoteAddr();
	
	
	ArticleDAO dao = new ArticleDAO();
	ArticleDTO dto = new ArticleDTO();
	dto.setNo(no);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setRegip(regip);
	dao.updateArticle(dto);
	
	response.sendRedirect("/Jboard1/view.jsp?no="+no);
	
	
%>