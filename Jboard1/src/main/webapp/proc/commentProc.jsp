<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String 	parent 	=request.getParameter("parent");
	String  content	=request.getParameter("content");
	String 	writer 	=request.getParameter("writer");
	String 	regip 	=request.getRemoteAddr();
	
	
	ArticleDAO dao = new ArticleDAO();
	ArticleDTO dto = new ArticleDTO();
	
	dto.setParent(parent);
	dto.setContent(content);
	dto.setWriter(writer);
	dto.setRegip(request.getRemoteAddr());
	
	//댓글 입력6
	dao.insertComment(dto);
	
	//댓글 카운트 수정
	dao.updateArticleForCommentPlus(parent);

	response.sendRedirect("/Jboard1/view.jsp?no="+parent);
%>