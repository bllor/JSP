<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="org.apache.catalina.manager.util.SessionUtils"%>
<%@page import="kr.co.jboard1.db.sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

	String title= request.getParameter("title");
	String content= request.getParameter("content");
	String file = request.getParameter("file");
	String writer= request.getParameter("writer");
	String regip = request.getRemoteAddr();
	
	ArticleDTO dto = new ArticleDTO();
	
	dto.setTitle(title);
	dto.setContent(content);
	dto.setWriter(writer);
	dto.setRegip(regip);
	
	ArticleDAO dao = new ArticleDAO();
	dao.insertArticle(dto);
	
	
	response.sendRedirect("/Jboard1/list.jsp");
%>