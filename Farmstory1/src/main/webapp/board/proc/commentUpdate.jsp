<%@page import="kr.Farmstory1.dao.ArticleDAO"%>
<%@page import="kr.Farmstory1.dto.ArticleDTO"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no = request.getParameter("no");
	String parent = request.getParameter("parent");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String content = request.getParameter("content");
	
	ArticleDTO dto = new ArticleDTO();
	dto.setNo(no);
	dto.setParent(parent);
	dto.setContent(content);
	
	ArticleDAO dao = new ArticleDAO();
	
	dao.updateComment(no, content);
	
	response.sendRedirect("/Farmstory1/board/view.jsp?group="+group+"&cate="+cate+"&no="+parent);


%>