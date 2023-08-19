<%@page import="kr.Farmstory1.dao.ArticleDAO"%>
<%@page import="kr.Farmstory1.dao.UserDAO"%>
<%@page import="kr.Farmstory1.dto.ArticleDTO"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String parent = request.getParameter("parent");
	String cate = request.getParameter("cate");
	String group = request.getParameter("group");
	
	ArticleDTO dto = new ArticleDTO();
	dto.setNo(no);
	
	ArticleDAO dao = new ArticleDAO();
	dao.deleteComment(no);
	
	dao.updateAticleForCommentMinus(parent);

	response.sendRedirect("/Farmstory1/board/view.jsp?no="+parent+"&group="+group+"&cate="+cate);
%>